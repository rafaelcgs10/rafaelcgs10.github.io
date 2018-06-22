(** Considere a seguinte definição de árvore binária *)
Inductive btree (X : Type) : Type :=
  | leaf : btree X 
  | node : X -> btree X -> btree X -> btree X.

Arguments leaf {X}.
Arguments node {X} _ _.

(** 1) [1 ponto] Definição uma função map para a árvore binária *)
Fixpoint mapBtree {X Y : Type} (f : X -> Y) (t : btree X) : btree Y :=
  match t with
  | leaf         => leaf
  | node x t1 t2 => node (f x) (mapBtree f t1) (mapBtree f t2)
  end.

(** Os testes não contam pontos, apenas verificam se você fez besteira *)
Example testMapBtree1 : mapBtree (plus 1) leaf = leaf. 
Proof.
  reflexivity.
Qed.

Example testMapBtree2 : mapBtree (plus 2) (node 2 leaf leaf) = node 4 leaf leaf.
Proof.
  reflexivity.
Qed.

(** 2) [1 ponto] Implemente uma função que conta quantos elementos há numa btree *)
Fixpoint countBtree {X : Type} (t : btree X) : nat :=
  match t with
  | leaf => 0
  | node x t1 t2 => 1 + (countBtree t1) + (countBtree t2)            
  end.                                       

Example testCountBtree1 :  countBtree (leaf : btree nat) = 0.
Proof.
  reflexivity.
Qed.

Example testCountBtree2 :  countBtree (node 1 leaf leaf) = 1.
Proof.
  reflexivity.
Qed.
             
(** 3) [1 ponto] Prove o seguinte teorema sobre mapBtree e countBtree *)
Theorem same_number : forall X Y : Type, forall t : btree X, forall f : X -> Y, countBtree t = countBtree (mapBtree f t).
Proof.
  intros.
  induction t.
  reflexivity.
  simpl.
  rewrite IHt1.
  rewrite IHt2.
  reflexivity.
Qed.
  
(** Considere a seguinte definição de app para btree *)
Fixpoint appBtree {X : Type} (t1 t2 : btree X) : btree X :=
  match t1 with
  | leaf      => t2
  | node x t1' t2' => node x t1' (appBtree t2' t2)
  end.

(** Veja como appBtree funciona *)
Definition myT1 := node 1 (node 2 leaf leaf) (node 3 leaf leaf).
Definition myT2 := node 4 (node 5 leaf leaf) (node 6 leaf leaf).

Compute appBtree myT1 myT2.

(** 4) [1 ponto] Prove o seguinte teorema sobre mapBtree e appBtree *)
Theorem mapApp : forall X Y : Type, forall t1 t2 : btree X, forall f : X -> Y, appBtree (mapBtree f t1) (mapBtree f t2) = mapBtree f (appBtree t1 t2).
Proof.
  intros.
  induction t1.
  - reflexivity.
  - simpl. rewrite <- IHt1_2.
    reflexivity.
Qed.

Require Import List.
Import ListNotations.


(** 5) [1 ponto] Prove o seguinte teorema sobre rev de listas*)
(** Dica: rev_involutive e f_equal podem ajudar *)
Theorem rev_exercise1 : forall (l l' : list nat),
     l = rev l' ->
     l' = rev l.
Proof.
  intros.
  rewrite <- rev_involutive at 1.
  apply f_equal.
  symmetry.
  assumption.
Qed.

(** 6) [1 ponto] Prove este exercício do doit3. Os teoremas necessários já estão no espaço de nome.
 Utilize Search para encontra-los. PS: Não utilize o teorema PeanoNat.Nat.add_comm ou outro equivalente
a esta questão. *)
Theorem plus_comm : forall n m : nat, n + m = m + n.
Proof.
  intros n.
  induction n as [| n' IHn'].
  - intros m.
    induction m as [| m' IHm'].
      + simpl. reflexivity.
      + simpl. Search plus. rewrite <- plus_n_O. reflexivity.
  - intros m.
    induction m as [| m' IHm'].
      + simpl. rewrite <- plus_n_O. reflexivity.
      + simpl. rewrite <- IHm'. simpl. rewrite <- plus_n_Sm. reflexivity.
Qed.

Require Import Arith.
Definition square n := n * n.

(** 7) [0.5 ponto] Prove que o construtor node é injetivo*)
Theorem node_injective : forall X : Type, forall n m : X, forall t1 t2 t1' t2' : btree X , node n t1 t2 = node m t1' t2' -> n = m /\ t1 = t1' /\ t2 = t2'.
Proof.
  intros.
  inversion H.
  split.
  reflexivity.
  split.
  reflexivity.
  reflexivity.
Qed.

(** 8) [1 ponto] Prove a seguinte implicação *)
Theorem  implication_massacration : forall P Q R T K S : Prop, (P -> Q) -> (Q -> R) -> (R -> S) -> (S -> T) -> (T -> K) -> P -> K.
  intros.
  apply H3.
  apply H2.
  apply H1.
  apply H0.
  apply H.
  assumption.
Qed.



(** 9) [1 ponto] Prove este exercício do doit12. *) 
(** Prove that "[P] holds for all [x]" implies "there is no [x] for
    which [P] does not hold."  (Hint: [destruct H as [x E]] works on
    existential assumptions!)  *)
Theorem dist_not_exists : forall (X:Type) (P : X -> Prop),
  (forall x, P x) -> ~ (exists x, ~ P x).
Proof.
  intros.
  unfold not.
  intros.
  destruct H0.
  apply H0 in H.
  assumption.
Qed.
 
(** 10) [0.5 ponto] Prove este exercício do doit11. *) 
Theorem not_implies_our_not : forall (P:Prop),
  ~ P -> (forall (Q:Prop), P -> Q).
Proof.
  intros.
  apply H in H0.
  inversion H0.
Qed.
 

(** 11) [1 ponto] Prove este existencial *)
Theorem whatM : forall m, (exists x, 3 + m = x) -> (exists x,x = 4 + m).
Proof.
  intros.
  destruct H.
  exists (1 + x).
  rewrite <- H.
  rewrite -> plus_assoc. 
  simpl.
  reflexivity.
Qed.
