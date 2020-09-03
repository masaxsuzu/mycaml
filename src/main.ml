open Printf
open Sys
open Lexing
open Yacc_lex
open Yacc_parse

let gen p =
  printf ".intel_syntax noprefix\n" ;
  printf ".globl main\n" ;
  printf "main:\n" ;
  printf "mov rax, %d\n" p ;
  printf "        ret\n"

let p = program lex (from_string argv.(1))

let () = gen p
