(deffacts datos  
    	(numero_magico 21)
	(lista 5 3 8 14 7)

)


(defrule sumar
?f1 <- (lista $?a ?b ?c $?d)
?res <- (?b + ?c)
=>
(retract ?f1)
(assert (lista ?res $?a $?d)))


(defrule fin
    (declare (salience 99))
    (numero_magico ?m)
        (test (= ?m ?xa))
        (test (= ?y ?ya))
        (test (= ?p 1))
    =>
    (printout t crlf "Llegada al almacen con caja" crlf)
    (halt)
)