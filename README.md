## Assembly

Questa repository contiene le esercitazioni e gli esercizi fatti durante i tutorati in preparazione dell'esame pratico e architettura degli elaboratori.
La repository sarà pubblica.

## Convenzioni

- Variabili temporanee nei registri $t
- Non usare macro in questo esame come bgt, move, li... (usa le istruzioni base).
- Quando chiami una funzione e gestisci lo stack ricordati di fare lo store e il load delle istruzioni che vengono usate all'interno della funzione.
- Cerca di ottimizzare il codice in assembly risparmiando i registri dove è possibile.
- Ricordati alla fine del programma di inserire la syscall $v0 = 10 per terminare il programma.
- Se hai funzioni ricorsive o diverse dalle leaf ricordati di salvare anche gli argomenti e $ra nella gestione dello stack

## Istruzioni

- addi, add, sub
- bgt, slt
- srl, sll, srlv, sllv
- jal, j, jr
- and, andi, ori, or
- sw, lw

## Syscall MARS

> https://courses.missouristate.edu/KenVollmar/mars/Help/SyscallHelp.html
