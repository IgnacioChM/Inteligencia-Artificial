(deffacts datos  
    	(numero_magico 21)
	(lista 5 3 8 14 7 solucion 0)

)


(defrule sumar
?f1 <- (lista $?a ?b ?c $?d solucion ?sol)
(bind ?aux (+ ?b ?c)
	(test (= 15 ?sol))
=>
(retract ?f1)
(assert (lista $?a $?d solucion (+ ?b ?c))))


(defrule fin
    (declare (salience 99))
    (lista $?a solucion ?sol)
    (numero_magico ?m)
        (test (= ?m ?sol))
    =>
    (printout t crlf "Obtenemos el numero mágico" crlf)
    (halt)
)