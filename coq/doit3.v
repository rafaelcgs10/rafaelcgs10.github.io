Require Import aula3 aula4 aula5.

(** **** Exercise: 2 stars, recommended (basic_induction)  *)
(** Prove the following using induction. You might need previously
    proven results. *)

Theorem mult_0_r : forall n:nat,
  n * 0 = 0.
Proof.
Admitted.

Theorem plus_n_Sm : forall n m : nat,
  S (n + m) = n + (S m).
Proof.
Admitted.

Theorem plus_comm : forall n m : nat, n + m = m + n.
Proof.
Admitted.

Theorem plus_assoc : forall n m p : nat,
  n + (m + p) = (n + m) + p.
Proof.
Admitted.

Fixpoint double (n:nat) :=
  match n with
  | O => O
  | S n' => S (S (double n'))
  end.

(** Use induction to prove this simple fact about [double]: *)

Lemma double_plus : forall n, double n = n + n .
Proof.
Admitted.

(** **** Exercise: 2 stars, optional (evenb_S)  *)
(** One inconvenient aspect of our definition of [evenb n] is the
    recursive call on [n - 2]. This makes proofs about [evenb n]
    harder when done by induction on [n], since we may need an
    induction hypothesis about [n - 2]. The following lemma gives an
    alternative characterization of [evenb (S n)] that works better
    with induction: *)

Theorem evenb_S : forall n : nat,
  evenb (S n) = negb (evenb n).
Proof.
Admitted.