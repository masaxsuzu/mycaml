open Printf
open Sys
open Lexing
open Lexer
open Parser
open Ast

let rec gen ast =
  match ast with
  | Int i -> printf "  push %d\n" i
  | _ -> (
      ( match ast with
      | Add (x, y) -> eval x y ; printf "  add rax, rdi\n"
      | Sub (x, y) -> eval x y ; printf "  sub rax, rdi\n"
      | Mul (x, y) -> eval x y ; printf "  imul rax, rdi\n"
      | Div (x, y) -> eval x y ; printf "  cqo\n" ; printf "  idiv rdi\n"
      | _ -> () ) ;
      match ast with Int i -> () | _ -> printf "  push rax\n" )

and eval l r = gen l ; gen r ; printf "  pop rdi\n" ; printf "  pop rax\n"

and codegen p =
  printf ".intel_syntax noprefix\n" ;
  printf ".globl main\n" ;
  printf "main:\n" ;
  gen p ;
  printf "  pop rax\n" ;
  printf "  ret\n"

let p = program lex (from_string argv.(1))

let () = codegen p
