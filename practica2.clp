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
    (single-slot altura
;+      (comment "Altura del piso")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot parking
;+      (comment "Booleano que indica si la vivienda incluye plaza de parking")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot Y
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot terraza
;+      (comment "Booleano que indica si la vivienda tiene terraza")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot X
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot balcon
;+      (comment "Booleano que indica si la vivienda tiene balcón")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot sol
;+      (comment "Indica en qué momento del dia la vivienda recibe impacto de la luz solar")
        (type SYMBOL)
        (allowed-values manana tarde todo-el-dia)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot mascotas-permitidas
;+      (comment "Booleano que indica si las mascotas están prohibidas en esta vivienda")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot amueblado
;+      (comment "Booleano que indica si la vivienda está amueblada")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (multislot habitaciones
;+      (comment "Dormitorios de la vivienda")
        (type SYMBOL)
        (allowed-values simple doble)
        (cardinality 1 ?VARIABLE)
        (create-accessor read-write))
    (single-slot aire-acondicionado
;+      (comment "Booleano que indica si la vivienda tiene aire acondicionado")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot tipo
        (type SYMBOL)
        (allowed-values flat duplex singlefamily)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot piscina-comunitaria
;+      (comment "Booleano que indica si la vivienda tiene piscina comunitaria con acceso a ella")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot calefaccion
;+      (comment "Booleano que indica si la vivienda tiene calefacción")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot buenas-vistas
;+      (comment "Booleano que indica si la vivienda tiene vistas")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot precio
;+      (comment "Precio mensual")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot localizacion
;+      (comment "Localización de la vivienda (coordenadas X e Y)")
        (type INSTANCE)
;+      (allowed-classes Coordenadas)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot electrodomesticos
;+      (comment "Booleano que indica si la vivienda incluye electrodomésticos")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot area
;+      (comment "Superfície en metros cuadrados de la vivienda")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write)))

(defclass Vivienda "Clase encargada de almacenar toda la información útil de una vivienda que se utilizará para contrastar con las preferencias del usuario"
    (is-a USER)
    (role concrete)
    (single-slot aire-acondicionado
;+      (comment "Booleano que indica si la vivienda tiene aire acondicionado")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot tipo
        (type SYMBOL)
        (allowed-values flat duplex singlefamily)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot electrodomesticos
;+      (comment "Booleano que indica si la vivienda incluye electrodomésticos")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot terraza
;+      (comment "Booleano que indica si la vivienda tiene terraza")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot piscina-comunitaria
;+      (comment "Booleano que indica si la vivienda tiene piscina comunitaria con acceso a ella")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot calefaccion
;+      (comment "Booleano que indica si la vivienda tiene calefacción")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot balcon
;+      (comment "Booleano que indica si la vivienda tiene balcón")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot buenas-vistas
;+      (comment "Booleano que indica si la vivienda tiene vistas")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot altura
;+      (comment "Altura del piso")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot parking
;+      (comment "Booleano que indica si la vivienda incluye plaza de parking")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot sol
;+      (comment "Indica en qué momento del dia la vivienda recibe impacto de la luz solar")
        (type SYMBOL)
        (allowed-values manana tarde todo-el-dia)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot mascotas-permitidas
;+      (comment "Booleano que indica si las mascotas están prohibidas en esta vivienda")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot area
;+      (comment "Superfície en metros cuadrados de la vivienda")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot amueblado
;+      (comment "Booleano que indica si la vivienda está amueblada")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (multislot habitaciones
;+      (comment "Dormitorios de la vivienda")
        (type SYMBOL)
        (allowed-values simple doble)
        (cardinality 1 ?VARIABLE)
        (create-accessor read-write))
    (single-slot precio
;+      (comment "Precio mensual")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot localizacion
;+      (comment "Localización de la vivienda (coordenadas X e Y)")
        (type INSTANCE)
;+      (allowed-classes Coordenadas)
;+      (cardinality 1 1)
        (create-accessor read-write)))

(defclass Coordenadas "Clase coordenadas que contiene información sobre los ejes X e Y de otra clase."
    (is-a USER)
    (role concrete)
    (single-slot Y
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot X
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Recomendacion
	(is-a USER)
	(role concrete)
	(single-slot vivienda
		(type INSTANCE)
;+		(allowed-classes Vivienda)
		(create-accessor read-write))
	(single-slot justificacion
		(type STRING)
		(create-accessor read-write))
	(single-slot requerimientos-no-cumplidos
		(type INTEGER)
		(default 0)
		(create-accessor read-write)))

;;-------------------------------------------------------------------------------------------------------------
;;                      INSTANCIAS
;;-------------------------------------------------------------------------------------------------------------

(definstances MAIN::instances
    ([ontologia_Class16] of  Coordenadas

        (X 20)
        (Y 30))

    ([ontologia_Class17] of  Coordenadas

        (X 50)
        (Y 50))

    ([ontologia_Class18] of  Coordenadas

        (X 99)
        (Y 88))

    ([ontologia_Class19] of  Vivienda

        (aire-acondicionado TRUE)
        (area 200.0)
        (balcon FALSE)
        (habitaciones doble)
        (piscina-comunitaria FALSE)
        (amueblado TRUE)
        (electrodomesticos FALSE)
        (calefaccion TRUE)
        (tipo duplex)
        (localizacion [ontologia_Class16])
        (parking FALSE)
        (mascotas-permitidas TRUE)
        (precio 200.0)
        (terraza FALSE)
        (buenas-vistas FALSE))

    ([ontologia_Class20] of  Vivienda

        (aire-acondicionado TRUE)
        (area 500.0)
        (balcon TRUE)
        (habitaciones doble doble simple simple simple)
        (piscina-comunitaria FALSE)
        (amueblado TRUE)
        (electrodomesticos TRUE)
        (calefaccion TRUE)
        (sol todo-el-dia)
        (tipo singlefamily)
        (localizacion [ontologia_Class17])
        (parking TRUE)
        (mascotas-permitidas FALSE)
        (precio 2000.0)
        (terraza TRUE)
        (buenas-vistas TRUE))

    ([ontologia_Class21] of  Vivienda

        (aire-acondicionado FALSE)
        (area 75.0)
        (balcon TRUE)
        (habitaciones simple doble simple)
        (piscina-comunitaria FALSE)
        (amueblado FALSE)
        (electrodomesticos FALSE)
        (calefaccion FALSE)
        (sol todo-el-dia)
        (tipo flat)
        (localizacion [ontologia_Class18])
        (parking FALSE)
        (mascotas-permitidas TRUE)
        (precio 100.0)
        (terraza TRUE)
        (buenas-vistas FALSE))
)

;;-------------------------------------------------------------------------------------------------------------
;;                      MODULES
;;-------------------------------------------------------------------------------------------------------------

(defmodule MAIN (export ?ALL))

;; Módulo de recopilación de los datos del usuario y sus preferencias
(defmodule recopilacion
    (import MAIN ?ALL)
    (export ?ALL)
)

;; Módulo de filtrado y procesado de la información
(defmodule procesado
    (import MAIN ?ALL)
    (import recopilacion deftemplate ?ALL)
    (export ?ALL)
)

;; Módulo de generacion de resultados
(defmodule generacion
    (import MAIN ?ALL)
    (export ?ALL)
)

;; Módulo de presentacion de resultados
(defmodule presentacion
    (import MAIN ?ALL)
    (export ?ALL)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      TEMPLATES
;;-------------------------------------------------------------------------------------------------------------

;; Preferencias del usuario
(deftemplate MAIN::usuario
	(slot precio-minimo (type INTEGER))
	(slot precio-maximo (type INTEGER))
)

;; Lista de recomendaciones sin orden
(deftemplate MAIN::lista-rec
	(multislot recomendaciones (type INSTANCE))
;+	(allowed-classes Recomendacion)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      MENSAJES
;;-------------------------------------------------------------------------------------------------------------

;; Imprime las coordendas (X, Y)
(defmessage-handler MAIN::Coordenadas imprimir ()
    (format t "(%d, %d)" ?self:X ?self:Y)
)

;; Imprime los datos de una Vivienda
(defmessage-handler MAIN::Vivienda imprimir ()
	(printout t "Localización: ")
    (send ?self:localizacion imprimir)
    (format t "%nPrecio: %f%n" ?self:precio)
)

;; Imprime los datos de una Recomendacion
(defmessage-handler MAIN::Recomendacion imprimir ()
	(printout t "-----------------------------------" crlf)
    (send ?self:vivienda imprimir)
    (format t "Justificación: %s%n" ?self:justificacion)
    (printout t "-----------------------------------" crlf)
    (printout t crlf)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      FUNCIONES
;;-------------------------------------------------------------------------------------------------------------

;;; Funcion para hacer una pregunta con respuesta cualquiera
(deffunction MAIN::pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?respuesta (read))
	(while (not (lexemep ?respuesta)) do
		(format t "%s " ?pregunta)
		(bind ?respuesta (read))
    )
	?respuesta
)

;;; Funcion para hacer una pregunta general con una serie de respuestas admitidas
(deffunction MAIN::pregunta-opciones (?question $?allowed-values)
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
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini)
	(format t "%s [Mínimo %d] " ?pregunta ?rangini)
	(bind ?respuesta (read))
	(while (not(>= ?respuesta ?rangini)) do
		(format t "%s [Mínimo %d] " ?pregunta ?rangini)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::pregunta-numerica-rango (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer pregunta con indice de respuestas posibles
(deffunction MAIN::pregunta-indice (?pregunta $?valores-posibles)
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
(deffunction MAIN::pregunta-multi (?pregunta $?valores-posibles)
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

;; MAIN

(defrule MAIN::comienzo "regla inicial"
    (initial-fact)
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t "------------ Sistema de Recomendación de Viviendas -----------" crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t crlf)
    (focus recopilacion)
)

;; RECOPILACION DE INFORMACIÓN

(defrule recopilacion::preguntar-precio "pregunta el rango de precios que le interesa al usuario"
    (not (usuario))
    =>
    (bind ?minimo (pregunta-numerica "Escoge el precio mínimo:" 1))
    (bind ?maximo (pregunta-numerica "Escoge el precio máximo:" ?minimo))
    (assert (usuario (precio-minimo ?minimo) (precio-maximo ?maximo)))
)

(defrule recopilacion::pasar_modulo_procesado "Pasa al modulo de procesado de información"
    (declare (salience -1))
    =>
    (focus procesado)
)

;; PROCESADO DE INFORMACIÓN

(defrule procesado::add-viviendas "Se añaden todas las viviendas, luego se filtran"
    (not (added-viviendas))
    =>
    (bind $?lista (find-all-instances ((?inst Vivienda)) TRUE))
    (progn$ (?curr ?lista)
        (make-instance (gensym) of Recomendacion (vivienda ?curr) (justificacion "justificacion"))
    )
    (assert (added-viviendas))
)

(defrule procesado::filtrar-precio "Elimina las recomendaciones que no cumplen el precio"
    (inicio)
    ?u <- (usuario (precio-minimo ?minimo) (precio-maximo ?maximo))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v) (requerimientos-no-cumplidos ?no-reqs))
    (test (or (> ?minimo (send ?v get-precio)) (< ?maximo (send ?v get-precio))))
    (not (filtrar-precio ?rec))
    =>
    (send ?rec put-requerimientos-no-cumplidos (+ 1 ?no-reqs))
    (if (eq 3 ?no-reqs) then
        (send ?rec delete)
    )
    (assert (filtrar-precio ?rec))
)

(defrule procesado::pasar_modulo_generacion "Pasa al modulo de generación de resultados"
    (declare (salience -1))
    =>
    (focus generacion)
)

;; GENERACIÓN DE RESULTADOS

(defrule generacion::crea-lista-recomendaciones "crea una lista de recomendaciones"
	(not (lista-rec))
	=>
	(assert (lista-rec))
)

(defrule generacion::add-recomendacion "Añade una recomendación a la lista de recomendaciones"
	?rec <- (object (is-a Recomendacion))
	?hecho <- (lista-rec (recomendaciones $?lista))
	(test (not (member$ ?rec $?lista)))
	=>
	(bind $?lista (insert$ $?lista (+ 1 (length$ $?lista)) ?rec))
	(modify ?hecho (recomendaciones $?lista))
)

(defrule procesado::pasar_modulo_presentacion "Pasa al modulo de presentación de resultados"
    (declare (salience -1))
    =>
    (focus presentacion)
)

;; PRESENTACIÓN DE RECOMENDACIONES

(defrule presentacion::mostrar-viviendas "muestra las viviendas recomendadas"
    (not (fin))
	=>
	(printout t crlf)
	(printout t "Estas son nuestras recomendaciones: " crlf crlf)
	(bind $?lista (find-all-instances ((?inst Recomendacion)) TRUE))
	(progn$ (?rec $?lista)
		(send ?rec imprimir)
	)
	(printout t crlf)
    (assert (fin))
)