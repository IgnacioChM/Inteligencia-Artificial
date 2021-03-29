
(deffacts datos  
    	(numero_magico 21)
	(lista 5 3 8 14 7 solucion 0)

)


(defrule multiplicar
 ?f1 <- (lista $?a ?b ?c $?d )
 (test (= (* ?b ?c) 15))
=>
 
(retract ?f1)
(assert (lista $?a $?d (* ?b ?c) ))
)

(defrule dividir
 ?f1 <- (lista $?a ?b ?c $?d )
 (test (= (/ ?b ?c) 2))
=>
 
(retract ?f1)
(assert (lista $?a $?d (/ ?b ?c) ))
)


(defrule fin
    (declare (salience 99))
    (lista $?a solucion ?sol)
    (numero_magico ?m)
        (test (= ?m ?sol))
    =>
    (printout t crlf "Obtenemos el numero mágico" crlf)
    (halt)
)