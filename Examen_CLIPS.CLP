
(deffacts datos  
    	(numero_magico 21)
	(lista 5 3 8 14 7)
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
(assert (lista $?a $?d ( / ?b ?c) ))
)

(defrule restar
 ?f1 <- (lista ?a $?b ?c $?d )
 (test (> ?a ?c))
 (test (= (- ?a ?c) 6))
=>
 
(retract ?f1)
(assert (lista $?b $?d (- ?a ?c) ))
)

(defrule sumar
 ?f1 <- (lista ?a ?b $?c $?d )
 
=>
 
(retract ?f1)
(assert (lista (+ ?a ?b) ))
)


(defrule fin
    (declare (salience 99))
    (lista $?a )
    (numero_magico ?m)
        (test (= ?m ?a))
    =>
    (printout t crlf "Obtenemos el numero mágico" crlf)
    (halt)
)