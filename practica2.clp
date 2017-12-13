;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------
;;
;;                PRÁCTICA 2 IA: SBC
;;
;; Alumnos: David Segovia Tomàs
;;			Miriam Vall Rovira 
;;          Carlos Lázaro Costa
;; Cuatrimestre: 2017-18 Q1
;;
;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------
;;                    ONTOLOGIA
;;-------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------------------------------------
;;                    CLASES
;;-------------------------------------------------------------------------------------------------------------

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot price
;+		(comment "Precio mensual")
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot location
;+		(comment "Localización de la vivienda (coordenadas X e Y)")
		(type INSTANCE)
;+		(allowed-classes Coordenadas)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Y
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot X
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Vivienda "Clase encargada de almacenar toda la información útil de una vivienda que se utilizará para contrastar con las preferencias del usuario"
	(is-a USER)
	(role concrete)
	(single-slot price
;+		(comment "Precio mensual")
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot location
;+		(comment "Localización de la vivienda (coordenadas X e Y)")
		(type INSTANCE)
;+		(allowed-classes Coordenadas)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Coordenadas "Clase coordenadas que contiene información sobre los ejes X e Y de otra clase."
	(is-a USER)
	(role concrete)
	(single-slot Y
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot X
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Recomendacion
	(is-a USER)
	(role concrete)
	(single-slot vivienda
		(type INSTANCE)
;+		(allowed-classes Vivienda)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot justificacion
		(type STRING)
		(create-accessor read-write)))

;;-------------------------------------------------------------------------------------------------------------
;;                      INSTANCIAS
;;-------------------------------------------------------------------------------------------------------------

(definstances coordenadas
	([ontologia_Class16] of  Coordenadas

	(X 20)
	(Y 30))

	([ontologia_Class17] of  Coordenadas

		(X 50)
		(Y 50))

	([ontologia_Class18] of  Coordenadas

		(X 99)
		(Y 88))
)

(definstances viviendas
	([ontologia_Class19] of  Vivienda

		(location [ontologia_Class16])
		(price 200.0))

	([ontologia_Class20] of  Vivienda

		(location [ontologia_Class17])
		(price 500.0))

	([ontologia_Class21] of  Vivienda

		(location [ontologia_Class18])
		(price 1000.0))
)

;;-------------------------------------------------------------------------------------------------------------
;;                      MAIN
;;-------------------------------------------------------------------------------------------------------------

;(defmodule MAIN (export ?ALL))

;;-------------------------------------------------------------------------------------------------------------
;;                      TEMPLATES
;;-------------------------------------------------------------------------------------------------------------

;; Preferencias del usuario
(deftemplate usuario
	(slot precio-minimo (type INTEGER))
	(slot precio-maximo (type INTEGER))
)

;; Lista de recomendaciones sin orden
(deftemplate lista-rec
	(multislot recomendaciones (type INSTANCE))
;+	(allowed-classes Recomendacion)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      MENSAJES
;;-------------------------------------------------------------------------------------------------------------

;; Imprime las coordendas (X, Y)
(defmessage-handler Coordenadas imprimir ()
	(format t "(%s, %s)" ?self:X ?self:Y)
)

;; Imprime los datos de una Vivienda
(defmessage-handler Vivienda imprimir ()
	(printout t "-----------------------------------" crlf)
	(format t "Location: %s %n" (send ?self:location imprimir))
	(format t "Precio: %s" ?self:price)
	(format t "Formato: %s" (class ?self))
	(printout t "-----------------------------------" crlf)
	(printout t crlf)
)

;; Imprime los datos de una Recomendacion
(defmessage-handler Recomendacion imprimir ()
	(send ?self:vivienda imprimir)
	(printout t ?self:justificacion)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      FUNCIONES
;;-------------------------------------------------------------------------------------------------------------

;;; Funcion para hacer una pregunta con respuesta cualquiera
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?respuesta (read))
	(while (not (lexemep ?respuesta)) do
		(format t "%s " ?pregunta)
		(bind ?respuesta (read))
    )
	?respuesta
)

;;; Funcion para hacer una pregunta general con una serie de respuestas admitidas
(deffunction pregunta-opciones (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)
   
;;; Funcion para hacer una pregunta de tipo si/no
(deffunction pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction pregunta-numerica (?pregunta ?rangini)
	(format t "%s [Mínimo %d] " ?pregunta ?rangini)
	(bind ?respuesta (read))
	(while (not(>= ?respuesta ?rangini)) do
		(format t "%s [Mínimo %d] " ?pregunta ?rangini)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction pregunta-numerica-rango (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer pregunta con indice de respuestas posibles
(deffunction pregunta-indice (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica-rango "Escoge una opción:" 1 (length$ ?valores-posibles)))
	?respuesta
)

;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los números separados por un espacio: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros) 
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valores-posibles))))
            then 
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        ) 
    )
    ?lista
)

;;-------------------------------------------------------------------------------------------------------------
;;                      REGLAS
;;-------------------------------------------------------------------------------------------------------------

;; GENERACIÓN DE RECOMENDACIONES

(defrule crea-lista-recomendaciones "crea una lista de recomendaciones"
	(not (lista-rec))
	=>
	(assert (lista-rec))
)

(defrule add-recomendacion "Añade una recomendación a la lista de recomendaciones"
	?rec <- (object (is-a Recomendacion))
	?hecho <- (lista-rec (recomendaciones $?lista))
	(test (not (member$ ?rec $?lista)))
	=>
	(bind $?lista (insert$ $?lista (+ 1 (length$ $?lista)) ?rec))
	(modify ?hecho (recomendaciones $?lista))
)

; FIXME
(defrule add-viviendas "Se añaden todas las viviendas, luego se filtran"
	(not (viviendas-added))
	=>
	(bind $?lista (find-all-instances ((?inst Vivienda)) TRUE))
	(progn$ (?i ?lista)
		(make-instance (gensym) of Recomendacion (vivienda ?i) (justificacion "justificacion"))
		(retract ?i)
	)
	(assert viviendas-added)
)

;; MAIN

(defrule comienzo "regla inicial"
	(initial-fact)
	=>
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "------------ Sistema de Recomendación de Viviendas -----------" crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t crlf)
	(assert (inicio))
)

(defrule preguntar-precio "pregunta el rango de precios que le interesa al usuario"
	(inicio)
	=>
	(bind ?minimo (pregunta-numerica "Escoge el precio mínimo:" 1))
	(bind ?maximo (pregunta-numerica "Escoge el precio máximo:" ?minimo))
	(assert (usuario (precio-minimo ?minimo) (precio-maximo ?maximo)))
)

(defrule mostrar-viviendas "muestra las viviendas recomendadas"
	(inicio)
	?u <- (usuario (precio-minimo ?minimo) (precio-maximo ?maximo))
	(lista-rec (recomendaciones $?lista))
	=>
	(printout t crlf)
	(printout t "Todas las posibles recomendaciones: " crlf)
	(printout t "----------------------------------- " crlf)
	; TODO
	(progn$ (?v $?lista)
		(send ?v imprimir)
	)
	(printout t crlf)
)