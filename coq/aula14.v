Require Import doit3 aula3.

Module MyIff.

Definition iff (P Q : Prop) := (P -> Q) /\ (Q -> P).

Notation "P <-> Q" := (iff P Q)
                      (at level 95, no associativity)
                      : type_scope.

End MyIff.

Theorem iff_sym : forall P Q : Prop,
  (P <-> Q) -> (Q <-> P).
Proof.
  intros P Q [HAB HBA].
  split.
  - (* -> *) apply HBA.
  - (* <- *) apply HAB.  Qed.

Lemma four_is_even : exists n : nat, 4 = n + n.
Proof.
  exists 2. 
  reflexivity.
Qed.

Theorem exists_example_2 : forall n,
  (exists m, n = 4 + m) ->
  (exists o, n = 2 + o).
Proof.
  intros n Hm.
  destruct Hm as [m H].
  exists (2 + m).
  apply H.  Qed.

Section MyEx.
   Inductive ex {A : Type} (P : A -> Prop) : Prop :=
    ex_intro : forall x : A, P x -> ex P. 
       
   Theorem exemple_ex : ex (fun n : nat => n = n).
     apply ex_intro with (x:=1).
     reflexivity.
    Qed.

Notation "'existss' x .. y , p" := (ex (fun x => .. (ex (fun y => p)) ..))
  (at level 200, x binder, right associativity,
   format "'[' 'existss' '/ ' x .. y , '/ ' p ']'").
   
   Theorem exemple_ex2 : existss n : nat, n = n.
     apply ex_intro with (x:=1).
     reflexivity.
   Qed.
End MyEx.

Example function_equality_ex2 :
  (fun x => plus x 1) = (fun x => plus 1 x).
Proof.
   (* Stuck *)
Abort.

Axiom functional_extensionality : forall {X Y: Type}
                                    {f g : X -> Y},
  (forall (x:X), f x = g x) -> f = g.
  
Example function_equality_ex2 :
  (fun x => plus x 1) = (fun x => plus 1 x).
Proof.
  apply functional_extensionality. intros x.
  apply plus_comm.
Qed.

Definition excluded_middle := forall P : Prop,
  P \/ ~ P.

Theorem restricted_excluded_middle : forall P b,
  (P <-> b = true) -> P \/ ~ P.
Proof.
  intros P [] H.
  - left. apply H. reflexivity.
  - right. unfold not. intros HP. apply H in HP as contra. inversion contra.
Qed.