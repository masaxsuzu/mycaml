open Printf;;

let gen(s) =
    printf ".intel_syntax noprefix\n";
    printf ".globl main\n";

    printf "main:\n";
    printf "mov rax, %s\n" s;
    printf "        ret\n";;

let () = gen Sys.argv.(1);;
