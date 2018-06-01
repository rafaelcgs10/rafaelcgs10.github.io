Require Import Arith List Arith.Even Omega.

(** Lembre-se: Search/SearchAbout é seu amigo! *)

(** Um lema que pode ser útil *)
Lemma lt_le_dec : forall a b,  a < b -> a < Nat.pred b \/  a = Nat.pred b.
Proof.
  intros.
  apply le_lt_or_eq.
  omega. (** A tática omega é um procedimento de decisão para a arimética de Presburger: https://en.wikipedia.org/wiki/Presburger_arithmetic *)
  omeg
Qed.
 
Theorem div_euclidean : forall n m : nat, 0 < n -> exists r q, m = (q * n) + r /\ r < n.
