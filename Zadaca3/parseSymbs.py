def _parse_symbols(self):
    # Inicijalizacija predefiniranih oznaka.
    self._init_symbols()
    # Prvo parsiramo deklaracije oznaka. Npr. "(LOOP)".'
    self._added_labels = []
    self._label_pos = {}
    self._while_cnt = 0
    self._while_plus = 0
    self._num_vars = 16
    self._iter_lines(self._parse_labels)
    # Na kraju parsiramo varijable i reference na oznake te ih pretvaramo u
    # konstante. Npr. "@SCREEN" pretvaramo u "@16384" ili "@END" kojemu je
    # oznaka "(END)" bila u trecoj liniji pretvaramo u "@3".
    self._iter_lines(self._parse_macros)
    self._iter_lines(self._parse_variables)
   
     
# Svaka oznaka mora biti sadrzana unutar oblih zagrada. Npr. "(LOOP)". Svaka
# oznaka koju procitamo treba zapamtiti broj linije u kojoj se nalazi i biti
# izbrisana iz nje. Koristimo dictionary _labels.
def _parse_labels(self, line, p, o):
    if line[0] == "(":
        if line[1:].split(")")[1] != "":
            self._flag = False
            self._line = o
            self._errm = "Invalid label"
        label = line[1:].split(")")[0]
        if len(label) == 0:
            self._flag = False
            self._line = o
            self._errm = "Invalid label"
        else:
            self._labels[label] = str(p + self._while_plus)
            self._label_pos[label]= p
            self._added_labels.append(label)
        return ""
    elif line[:6] == "$WHILE":
        label = "WHILE_START{}".format(self._while_cnt)
        self._labels[label] = str(p + self._while_plus)
        self._label_pos[label]= p
        self._added_labels.append(label)  
        variable = line.split("(")
        variable = variable[1].strip(")")
        if variable.isdigit():
            step1 = "@" + variable
        else:
            step1 = self._parse_variables(("@" + variable),p,o)
        step2 = "D = M;"
        step3 = "@WHILE_END{}".format(self._while_cnt)
        step4 = "D; JEQ"
        steps = [step1,step2,step3,step4]
        self._while_cnt += 1
        self._while_plus += 3
        return steps
    elif line == "$END":
        label = "WHILE_END{}".format(self._while_cnt-1)
        step1 = "@WHILE_START{}".format(self._while_cnt-1)
        self._label_pos[label]= p
        self._while_cnt -= 1
        step2 = "0; JMP"
        steps = [step1,step2]
        self._while_plus += 1
        self._labels[label] = str(p + self._while_plus+1)
        self._added_labels.append(label)  
        return steps
    else:
        return line
        

# Svaki poziv na varijablu ili oznaku je oblika "@NAZIV", gdje naziv nije broj.
# Prvo provjeriti oznake ("_labels"), a potom varijable ("_vars"). Varijablama
# dodjeljujemo memorijske adrese pocevsi od 16. Ova funkcija nikad ne vraca
# prazan string!
def _parse_variables(self, line, p, o):
    if line[0] != "@":
        return line
    
    l = line[1:]
    
    if l.isdigit():
        return line
    
    if l in self._labels:
        return "@" + self._labels[l]
    
    if l not in self._variables:
        self._variables[l] = str(self._num_vars)
        self._num_vars += 1
    return "@" + self._variables[l]

def _parse_macros(self, line, p, o):
    if line[0] != "$":
        return line
    l = line[1:]
    l = l.split("(")
    l[1] = l[1].strip(")")
    l[1] = l[1].split(",")
    if l[0] == "MV":
        if l[1][0].isdigit():
            step1 = "@" + l[1][0]
        else:
            l_num = self._parse_variables(("@" + l[1][0]),p,o)
            step1 = l_num
        step2 = "D=M;"
        if l[1][1].isdigit():
            step3 = "@" + l[1][1]
        else:
            l_num = self._parse_variables(("@" + l[1][1]),p,o)
            step3 = l_num
        step4 = "M=D;"
        steps = [step1,step2,step3,step4]
        for added in self._added_labels:
            if self._label_pos[added] > p:
                self._labels[added] = str(int(self._labels[added]) + len(steps) - 1)
        return steps  
    elif l[0] == "SWP":
        if l[1][0].isdigit():
            step1 = "@" + l[1][0]
        else:
            l_num = self._parse_variables(("@" + l[1][0]),p,o)
            step1 = l_num
        step2 = "D=M;"
        step_help =  self._parse_variables(("@" + "help"),p,o)
        step3 = "M=D;"
        if l[1][1].isdigit():
            step4 = "@" + l[1][1]
        else:
            l_num = self._parse_variables(("@" + l[1][1]),p,o)
            step4 = l_num
        step5 = "D=M;"
        step6 = step1
        step7 = "M=D;"
        step8 = step_help
        step9 = "D=M;"
        step10 = step4
        step11 = "M=D;"
        steps = [step1,step2,step_help,step3,step4,step5,step6,step7,step8,step9,step10,step11]
        for added in self._added_labels:
            if self._label_pos[added] > p:
                self._labels[added] = str(int(self._labels[added]) + len(steps) - 1)
        return steps
    elif l[0] == "SUM":
        if l[1][0].isdigit():
            step1 = "@" + l[1][0]
        else:
            l_num = self._parse_variables("@"+l[1][0],p,o)
            step1 = l_num
        step2 = "D=M;"
        if l[1][1].isdigit():
            step3 = "@" + l[1][1]
        else:
            l_num = self._parse_variables("@"+l[1][1],p,o)
            step3 = l_num
        step4 = "D=D+M;"
        if l[1][2].isdigit():
            step5 = "@" + l[1][2]
        else:
            l_num = self._parse_variables("@"+l[1][2],p,o)
            step5 = l_num
        step6 = "M=D;"
        steps = [step1,step2,step3,step4,step5,step6]
        for added in self._added_labels:
            if self._label_pos[added] > p:
                self._labels[added] = str(int(self._labels[added]) + len(steps) - 1)
        return steps
        
        
        
            

 
# Inicijalizacija predefiniranih oznaka.
def _init_symbols(self):
    self._labels = {
        "SCREEN" : "16384",
        "KBD" : "24576",
        "SP" : "0",
        "LCL" : "1",
        "ARG" : "2",
        "THIS" : "3",
        "THAT" : "4"
    }
    
    for i in range(0, 16):
        self._labels["R" + str(i)] = str(i)
