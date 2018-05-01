(*** Exercício de Programação Funcional**)

(** Defina um programa que compute o antecessor do antecessor de um dado número n **)

Definition minustwo (n : nat) : nat.
  Admitted.

(** Teste a função minustwo **)

Example test_minustwo_1 : minustwo 4 = 2.
  Admitted.

Example test_minustwo_2 : minustwo 1 = 0.
  Admitted.

Example test_minustwo_3 : minustwo 0 = 0.
  Admitted.

(** Defina uma função que some 2 **)

Definition plustwo (n : nat) : nat.
  Admitted.

(** Teste a função plustwo **)

Example test_plustwo_1 : plustwo 2 = 4.
  Admitted.

Example test_plustwo_2 : minustwo 0 = 2.
  Admitted.

(** Defina o tipo fruta (morango, uva e laranja) **)

(** Defina o tipo salada, onde uma salada é formada pela combinação de até três frutas **)
