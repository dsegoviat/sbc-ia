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
	(single-slot X
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))
	(single-slot Y
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))

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

		(Location [ontologia_Class16])
		(Price 200.0))

	([ontologia_Class20] of  Vivienda

		(Location [ontologia_Class17])
		(Price 500.0))

	([ontologia_Class21] of  Vivienda

		(Location [ontologia_Class18])
		(Price 1000.0))
)

;;-------------------------------------------------------------------------------------------------------------
;;                      MAIN
;;-------------------------------------------------------------------------------------------------------------

(defmodule MAIN (export ?ALL))

;;-------------------------------------------------------------------------------------------------------------
;;                      TEMPLATES
;;-------------------------------------------------------------------------------------------------------------

(deftemplate usuario
	(slot precio-minimo (type INTEGER))
	(slot precio-maximo (type INTEGER))
)

;;-------------------------------------------------------------------------------------------------------------
;;                      MENSAJES
;;-------------------------------------------------------------------------------------------------------------

;; Imprime las coordendas (X, Y)
(defmessage-handler Coordinates imprimir ()
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

(defrule comienzo "regla inicial"
	(initial-fact)
	=>
	(printout t crlf)
	(printout t "--------------------------------------------------------------" crlf)
	(printout t "------------ Sistema de Recomendacion de Viviendas -----------" crlf)
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
	?u <- (usuario ?minimo ?maximo)
	=>
;TODO	()
)