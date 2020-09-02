open Printf;;

let () = 
    printf ".intel_syntax noprefix\n";
    printf ".globl main\n";

    printf "main:\n";
    printf "mov rax, %s\n" Sys.argv.(1);
    printf "        ret\n";;
