Set Implicit Arguments.
Require Import List.
Import ListNotations.
Require Import Lia.

(* Bit *)

Inductive B : Type :=
  | O : B
  | I : B.

Definition And (x y : B) : B :=
match x with
  | O => O
  | I => y
end.

Definition Or (x y : B) : B :=
match x with
  | O => y
  | I => I
end.

Definition Not (x : B) : B :=
match x with
  | O => I
  | I => O
end.

Definition Add (x y c : B) : B :=
match x, y with
  | O, O => c
  | I, I => c
  | _, _ => Not c
end.

Definition Rem (x y c : B) : B :=
match x, y with
  | O, O => O
  | I, I => I
  | _, _ => c
end.


Lemma FirstA (X Y Z : B): 
  Or (And X (Not Y)) (Or (And (Not X) (Not Y)) (And (Not X) Y)) = Or (Not X) (Not Y).
Proof.
induction X.
  -simpl. induction Y.
    --simpl. reflexivity.
    --simpl. reflexivity.
  -simpl. induction Y.
    --simpl. reflexivity.
    --simpl. reflexivity.
Qed.

Lemma FirstB (X Y Z : B):
  And (Not (And (Not X) (And Y Z))) (And (Not (And X (And Y (Not Z)))) (And X (And (Not Y) Z))) = And X (And (Not Y) Z).
Proof.
induction X.
  -simpl. induction Y.
    --simpl. reflexivity.
    --simpl. induction Z.
      +simpl. reflexivity.
      +simpl. reflexivity.
  -simpl. induction Y.
    --simpl. reflexivity.
    --simpl. induction Z.
      +simpl. reflexivity.
      +simpl. reflexivity.
Qed.


(* List *)

Fixpoint AndL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => And x y :: AndL xs ys
end.

Fixpoint OrL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Or x y :: OrL xs ys
end.

Fixpoint NotL (x : list B) : list B :=
match x with
  | [] => []
  | x :: xs => Not x :: NotL xs
end.

Fixpoint AddLr (x y : list B) (c : B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Add x y c :: AddLr xs ys (Rem x y c)
end.

Definition AddL (x y : list B) : list B := rev (AddLr (rev x) (rev y) O).

Fixpoint IncLr (x : list B) (c : B) : list B :=
match x with
| [] => []
| x :: xs => Add x I c :: IncLr xs (Rem x I c)
end.

Definition IncL (x : list B) : list B := rev (IncLr (rev x) O).

(* ALU *)

Definition flag_zx (f : B) (x : list B) : list B :=
match f with
| I => repeat O (length x)
| O => x
end.

Definition flag_nx (f : B) (x : list B) : list B :=
match f with
| I => NotL x
| O => x
end.

Definition flag_f (f : B) (x y : list B) : list B :=
match f with
| I => AddL x y
| O => AndL x y
end.

Definition ALU (x y : list B) (zx nx zy ny f no : B) : list B := 
  flag_nx no (flag_f f (flag_nx nx (flag_zx zx x)) (flag_nx ny (flag_zx zy y))).

(* Teoremi *)

Lemma ALU_zero (x y : list B) :
  length x = length y -> ALU x y I O I O I O = repeat O (length x).
Proof. 
Abort.

Lemma ALU_minus_one (x y : list B) : 
  length x = length y -> ALU x y I I I O I O = repeat I (length x).
Proof. Abort.

Lemma ALU_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O O = x.
Proof. Abort.

Lemma ALU_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O O = y.
Proof. Abort.

Lemma ALU_Not_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O I = NotL x.
Proof. Abort.

Lemma ALU_Not_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O I = NotL y.
Proof. Abort.

Lemma ALU_Add (x y : list B) : 
  length x = length y -> ALU x y O O O O I O = AddL x y.
Proof. Abort.

(* DZ *)

Lemma ALU_And (x y : list B) : 
  length x = length y -> ALU x y O O O O O O = AndL x y.
Proof. 
  intros A.
  simpl. reflexivity.
Qed.

Lemma ALU_Or (x y : list B) : 
  length x = length y -> ALU x y O I O I O I = OrL x y.
Proof. 
  revert y.
  induction x; intros y A.
  - destruct y.
    --simpl. reflexivity.
    --simpl.  reflexivity.
  - destruct y.
    --simpl. reflexivity.
    --simpl. f_equal.
      + destruct a,b. 
         ++simpl. reflexivity.
         ++simpl. reflexivity.
         ++simpl. reflexivity.
         ++simpl. reflexivity.
      +apply IHx. simpl in A. apply eq_add_S in A. exact A.
Qed.

Lemma help1 (a b : nat): a = S b -> Nat.pred a = b.
Proof.
  intros A. induction b.
  -rewrite A. simpl. reflexivity.
  -rewrite A. simpl. reflexivity.
Qed.

Lemma help2 (a b : nat): S a = b -> a = Nat.pred b.
Proof.
  intros A. induction a.
  -rewrite <- A. simpl. reflexivity.
  -rewrite <- A. simpl. reflexivity.
Qed.


Lemma ALU_One (n : nat) (x y : list B) :
  length x = n /\ length y = n /\ n <> 0 -> ALU x y I I I I I I = repeat O (pred n) ++ [I].
Proof. 
  revert y.
  induction x;intros y [A1 [A2 A3]].
  -simpl. simpl in A1. rewrite <- A1. simpl. congruence.
  -simpl in A1. apply help2 in A1. simpl. rewrite A1,A2. rewrite <- (IHx (a :: y)).
Admitted.





