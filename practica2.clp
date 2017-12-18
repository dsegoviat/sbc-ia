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
    (single-slot dormitorios-dobles
;+      (comment "Dormitorios dobles de la vivienda")
        (type INTEGER)
        (default 0)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot dormitorios-simples
;+      (comment "Dormitorios simples de la vivienda")
        (type INTEGER)
        (default 0)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot aire-acondicionado
;+      (comment "Booleano que indica si la vivienda tiene aire acondicionado")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot tipo
        (type SYMBOL)
        (allowed-values piso duplex unifamiliar)
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
        (allowed-values piso duplex unifamiliar)
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
    (single-slot dormitorios-dobles
;+      (comment "Dormitorios dobles de la vivienda")
        (type INTEGER)
        (default 0)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot dormitorios-simples
;+      (comment "Dormitorios simples de la vivienda")
        (type INTEGER)
        (default 0)
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
        (create-accessor read-write)))

(defclass Coordenadas "Clase coordenadas que contiene información sobre los ejes X e Y de otra clase"
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

(defclass Recomendacion "Clase para validar requerimientos y preferencias"
	(is-a USER)
	(role concrete)
	(single-slot vivienda
		(type INSTANCE)
;+		(allowed-classes Vivienda)
		(create-accessor read-write))
	(multislot caracteristicas-no-recomendables
        (type STRING)
        (create-accessor read-write))
    (multislot caracteristicas-muy-recomendables
        (type STRING)
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
        (dormitorios-dobles 1)
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
        (dormitorios-dobles 2)
        (dormitorios-simples 3)
        (piscina-comunitaria FALSE)
        (amueblado TRUE)
        (electrodomesticos TRUE)
        (calefaccion TRUE)
        (sol todo-el-dia)
        (tipo unifamiliar)
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
        (dormitorios-dobles 1)
        (dormitorios-simples 2)
        (piscina-comunitaria FALSE)
        (amueblado FALSE)
        (electrodomesticos FALSE)
        (calefaccion FALSE)
        (sol todo-el-dia)
        (tipo piso)
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
    (import generacion ?ALL)
    (export ?ALL)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      TEMPLATES
;;-------------------------------------------------------------------------------------------------------------

;; Preferencias del usuario
(deftemplate MAIN::usuario
	(slot precio-minimo (type INTEGER))
	(slot precio-maximo (type INTEGER))
    (slot precio-estricto (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot requiere-superficie (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot superficie-minima (type FLOAT))
    (slot personas (type INTEGER))
    (slot dormitorios-dobles (type INTEGER))
    (slot dormitorios-simples (type INTEGER))
    (slot aire-acondicionado (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot tipo (type SYMBOL)
        (allowed-values piso duplex unifamiliar))
    (slot electrodomesticos (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot terraza (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot piscina-comunitaria (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot calefaccion (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot balcon (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot buenas-vistas (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot altura (type INTEGER))
    (slot parking (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot sol (type SYMBOL)
        (allowed-values manana tarde todo-el-dia))
    (slot mascotas-permitidas (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot amueblado (type SYMBOL)
        (allowed-values FALSE TRUE))
)

;; Lista de recomendaciones sin orden que se procesan y todavía no han sido descartadas
(deftemplate MAIN::lista-validas
    (multislot recomendaciones (type INSTANCE))
;+  (allowed-classes Recomendacion)
)

;; Lista de recomendaciones sin orden que no son ni siquiera parcialmente adecuadas (más de 2 restricciones que no se cumplen)
;; Antes de mostrar los resultados se ordenará
(deftemplate MAIN::lista-descartadas
	(multislot recomendaciones (type INSTANCE))
;+	(allowed-classes Recomendacion)
)

;; Lista de recomendaciones clasificadas como adecuadas
;; Antes de mostrar los resultados se ordenará
(deftemplate MAIN::lista-adecuadas
    (multislot recomendaciones (type INSTANCE))
;+  (allowed-classes Recomendacion)
)

;; Lista de recomendaciones clasificadas como parcialmente adecuadas
;; Antes de mostrar los resultados se ordenará
(deftemplate MAIN::lista-parcialmente-adecuadas
    (multislot recomendaciones (type INSTANCE))
;+  (allowed-classes Recomendacion)
)

;; Lista de recomendaciones clasificadas como muy recomendables
;; Antes de mostrar los resultados se ordenará
(deftemplate MAIN::lista-muy-recomendables
    (multislot recomendaciones (type INSTANCE))
;+  (allowed-classes Recomendacion)
)

;;-------------------------------------------------------------------------------------------------------------
;;                      DEBUG
;;-------------------------------------------------------------------------------------------------------------

;;; Función para no volvernos locos
(deffunction MAIN::debug (?msg)
    (printout t "[DEBUG] " ?msg crlf)
)

;;; Función para no volvernos muy locos
(deffunction MAIN::debug-instance (?msg ?obj)
    (printout t "[DEBUG] " ?msg ":" crlf)
    (send ?obj imprimir)
)

;;; Función para no volvernos muy locos 3
(deffunction MAIN::debug-rec (?msg ?rec ?justificacion ?msg-obj ?obj)
    (printout t "[DEBUG] " ?msg crlf ?justificacion crlf)
    (printout t ?msg-obj ": " ?obj crlf)
    (send ?rec imprimir)
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
    (format t "%nPrecio: %f" ?self:precio)
    (format t "%nSuperficie: %f" ?self:area)
    (format t "%nDormitorios dobles: %d" ?self:dormitorios-dobles)
    (format t "%nDormitorios simples: %d" ?self:dormitorios-simples)
    (printout t crlf)
)

;; Imprime los datos de una Recomendacion
(defmessage-handler MAIN::Recomendacion imprimir ()
	(printout t "-----------------------------------" crlf)
    (send ?self:vivienda imprimir)
    (bind ?cantidad-no-recomendables (length$ ?self:caracteristicas-no-recomendables))
    (bind ?cantidad-muy-recomendables (length$ ?self:caracteristicas-muy-recomendables))
    (if (> ?cantidad-no-recomendables 0) then
        (printout t "Requisitos no cumplidos pero que podrían ser aceptables:" crlf)
        (progn$ (?caracteristica ?self:caracteristicas-no-recomendables)
            (printout t "- " ?caracteristica crlf)
        )
    )
    (if (> ?cantidad-muy-recomendables 0) then
        (printout t "Características positivas:" crlf)
        (progn$ (?caracteristica ?self:caracteristicas-muy-recomendables)
            (printout t "- " ?caracteristica crlf)
        )
    )
    (printout t "-----------------------------------" crlf)
)

;; Obtiene el precio de la vivienda recomendada
(defmessage-handler MAIN::Recomendacion get-precio ()
    (send ?self:vivienda get-precio)
)

;; Añade una característica muy recomendable
(defmessage-handler MAIN::Recomendacion muy-recomendable (?justificacion)
    (slot-insert$ ?self caracteristicas-muy-recomendables (+ (length$ ?self:caracteristicas-muy-recomendables) 1) ?justificacion)
)

;; Añade una característica no recomendable (requisito no satisfecho) y, en caso de que haya más de 2, invalida la recomendación
(defmessage-handler MAIN::Recomendacion parcialmente-recomendable (?justificacion)
    (bind ?cantidad (+ 1 (length$ ?self:caracteristicas-no-recomendables)))
    (slot-insert$ ?self caracteristicas-no-recomendables ?cantidad ?justificacion)
    (if (> ?cantidad 2) then
        (assert (invalida ?self))
    )
)

;; Obtiene el número de personas que pueden dormir en la vivienda recomendada
(defmessage-handler MAIN::Recomendacion get-personas ()
    (+ (send ?self:vivienda get-dormitorios-simples) (* 2 (send ?self:vivienda get-dormitorios-dobles)))
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

;;; Funcion para hacer una pregunta con respuesta numerica única
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini)
	(format t "%s [Mínimo %d] " ?pregunta ?rangini)
	(bind ?respuesta (read))
	(while (not(>= ?respuesta ?rangini)) do
		(format t "%s [Mínimo %d] " ?pregunta ?rangini)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer una pregunta con respuesta numerica única
(deffunction MAIN::pregunta-numerica-rango (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Funcion para hacer pregunta con índice de respuestas posibles
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

;;; Funcion para hacer una pregunta multi-respuesta con úndices
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

(defrule MAIN::comienzo "Regla inicial"
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

(defrule recopilacion::crear-usuario "Inicializa el usuario"
    (not (usuario))
    =>
    (assert (usuario))
)

(defrule recopilacion::preguntar-precio "Pregunta el rango de precios que le interesa al usuario"
    (declare (salience -1))
    ?usuario <- (usuario)
    (not (precio-preguntado))
    =>
    (bind ?minimo (pregunta-numerica "Escoge el precio mínimo:" 1))
    (bind ?maximo (pregunta-numerica "Escoge el precio máximo:" ?minimo))
    (bind ?precio-estricto (not (pregunta-si-no "¿Estarías dispuesto a pagar más si la oferta lo merece?")))
    (modify ?usuario (precio-minimo ?minimo) (precio-maximo ?maximo) (precio-estricto ?precio-estricto))
    (assert (precio-preguntado))
)

(defrule recopilacion::preguntar-superficie "Pregunta el mínimo de metros cuadradados de la vivienda"
    (declare (salience -2))
    ?usuario <- (usuario)
    (not (superficie-preguntada))
    =>
    (bind ?requiere-superficie (pregunta-si-no "¿Te gustaría indicar un mínimo de metros cuadrados?"))
    (bind ?superficie
        (if (eq TRUE ?requiere-superficie) then
            (pregunta-numerica "¿Cuántos metros cuadrados quieres como mínimo?" 1)
        else
            1
        )
    )
    (modify ?usuario (superficie-minima ?superficie) (requiere-superficie ?requiere-superficie))
    (assert (superficie-preguntada))
)

(defrule recopilacion::preguntar-habitaciones "Pregunta la cantidad de personas en casa y sus dormitorios"
    (declare (salience -3))
    ?usuario <- (usuario)
    (not (habitaciones-preguntadas))
    =>
    Cuántas personas habrá en casa? Mínimo número de dormitorios dobles?
    (bind ?personas (pregunta-numerica "¿Cuántas personas habrá en casa?" 1))
    (bind ?dormitorios-dobles (pregunta-numerica "¿Cuántos dormitorios dobles necesitas?" 0))
    (bind ?dormitorios-simples (- ?personas (* 2 ?dormitorios-dobles)))
    (modify ?usuario (personas ?personas) (dormitorios-dobles ?dormitorios-dobles) (dormitorios-simples ?dormitorios-simples))
    (assert (habitaciones-preguntadas))
)

(defrule recopilacion::pasar-modulo-procesado "Pasa al módulo de procesado de información"
    (declare (salience -100))
    =>
    (focus procesado)
)

;; PROCESADO DE INFORMACIÓN

(defrule procesado::crea-lista-validas "Se crea una lista de recomendaciones válidas"
    (not (lista-validas))
    =>
    (assert (lista-validas))
)

(defrule procesado::crea-lista-descartadas "Se crea una lista de recomendaciones descartadas"
    (not (lista-descartadas))
    =>
    (assert (lista-descartadas))
)

(defrule procesado::crear-recomendaciones "Se crean todas las recomendaciones a partir de las viviendas en la lista de recomendaciones válidas"
    (not (added-viviendas))
    =>
    (bind $?viviendas (find-all-instances ((?inst Vivienda)) TRUE))
    (progn$ (?curr $?viviendas)
        (make-instance (gensym) of Recomendacion (vivienda ?curr))
    )
    (assert (added-viviendas))
)

(defrule procesado::validar-recomendacion "Añade una recomendación válida a la lista de recomendaciones válidas"
    ?rec <- (object (is-a Recomendacion))
    ?hecho <- (lista-validas (recomendaciones $?validas))
    (test (not (member$ ?rec $?validas)))
    (not (invalida ?rec))
    =>
    (bind $?validas (insert$ $?validas (+ 1 (length$ $?validas)) ?rec))
    (modify ?hecho (recomendaciones $?validas))
)

(defrule procesado::descartar-recomendacion "Añade una recomendación no válida a la lista de recomendaciones descartadas"
    ?rec <- (object (is-a Recomendacion))
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
    ?hecho-descartadas <- (lista-descartadas (recomendaciones $?descartadas))
    (invalida ?rec)
    (test (member$ ?rec $?validas))
    (test (not (member$ ?rec $?descartadas)))
    =>
    ;; Añadir a la lista de descartadas
    (bind $?descartadas (insert$ $?descartadas (+ 1 (length$ $?descartadas)) ?rec))
    (modify ?hecho-descartadas (recomendaciones $?descartadas))

    ;; Borrar de la lista de válidas
    (bind $?validas (delete-member$ $?validas ?rec))
    (modify ?hecho-validas (recomendaciones $?validas))
)

;; PRECIO

(defrule procesado::precio-no-recomendable "El precio es demasiado caro"
    ?u <- (usuario (precio-minimo ?minimo) (precio-maximo ?maximo) (precio-estricto ?estricto))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; El precio es demasiado caro cuando es estricto y se pasa del máximo o bien cuando no es estricto pero supera el 30% del máximo
    (test (eq TRUE (or (and ?estricto (> (send ?v get-precio) ?maximo)) (and (not ?estricto) (> (send ?v get-precio) (* 1.3 ?maximo))))))
    (not (filtrar-precio ?rec))
    =>
    (assert (invalida ?rec))
    (assert (filtrar-precio ?rec))
)

(defrule procesado::precio-muy-recomendable "El precio es muy recomendable"
    ?u <- (usuario (precio-minimo ?minimo) (precio-maximo ?maximo) (precio-estricto ?estricto))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; El precio es bajo cuando es inferior a la mitad del rango
    (test (eq TRUE (<= (send ?v get-precio) (/ (+ ?maximo ?minimo) 2))))
    (not (filtrar-precio ?rec))
    =>
    (send ?rec muy-recomendable "Precio bajo")
    (assert (filtrar-precio ?rec))
)

(defrule procesado::precio-parcialmente-recomendable "El precio podría ser adecuado"
    ?u <- (usuario (precio-minimo ?minimo) (precio-maximo ?maximo) (precio-estricto ?estricto))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; El precio es parcialmente adecuado cuando no es estricto y siendo superior al máximo no supera un 30% del máximo
    (test (eq TRUE (and (not ?estricto) (> (send ?v get-precio) ?maximo) (<= (send ?v get-precio) (* 1.3 ?maximo)))))
    (not (filtrar-precio ?rec))
    =>
    (send ?rec parcialmente-recomendable "Precio un poco por encima del máximo")
    (assert (filtrar-precio ?rec))
)

;; SUPERFICIE

(defrule procesado::descartar-superficie "Los metros cuadrados no llegan al mínimo requerido"
    ?u <- (usuario (superficie-minima ?minimo))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (< (send ?v get-area) ?minimo)))
    (not (filtrar-superficie ?rec))
    =>
    (send ?rec parcialmente-recomendable "Los metros cuadrados no llegan al mínimo requerido")
    (assert (filtrar-superficie ?rec))
)

(defrule procesado::superficie-muy-recomendable "Los metros cuadrados superan el doble del mínimo requerido"
    ?u <- (usuario (superficie-minima ?minimo) (requiere-superficie ?requiere-superficie))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (>= (send ?v get-area) (* 2 ?minimo))))
    (test (eq TRUE ?requiere-superficie))
    (not (filtrar-superficie ?rec))
    =>
    (send ?rec muy-recomendable "Los metros cuadrados superan el doble del mínimo requerido")
    (assert (filtrar-superficie ?rec))
)

;; DORMITORIOS

(defrule procesado::descartar-dormitorios "Los dormitorios no llegan al mínimo requerido"
    ?u <- (usuario (personas ?personas) (dormitorios-dobles ?dormitorios-dobles) (dormitorios-simples ?dormitorios-simples))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (or (< (send ?v get-dormitorios-dobles) ?dormitorios-dobles) (< (send ?v get-dormitorios-simples) ?dormitorios-simples))))
    (not (filtrar-dormitorios ?rec))
    =>
    (assert (invalida ?rec))
    (assert (filtrar-dormitorios ?rec))
)

(defrule procesado::muchos-dormitorios "Hay 2 o más dormitorios adicionales a los requeridos"
    (declare (salience -1))
    ?u <- (usuario (personas ?personas) (dormitorios-dobles ?dormitorios-dobles) (dormitorios-simples ?dormitorios-simples))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (>= (+ (send ?v get-dormitorios-dobles) (send ?v get-dormitorios-simples)) (+ 2 (+ ?dormitorios-dobles ?dormitorios-simples)))))
    (not (invalida ?rec))
    (not (filtrar-dormitorios ?rec))
    =>
    (send ?rec muy-recomendable "Hay 2 o más dormitorios adicionales a los requeridos")
    (assert (filtrar-dormitorios ?rec))
)

(defrule procesado::pasar-modulo-generacion "Pasa al módulo de generación de resultados"
    (declare (salience -2))
    =>
    (focus generacion)
)

;; GENERACIÓN DE RESULTADOS

;; ORDENACIÓN
;; El criterio de ordenación es el siguiente (si hay empate se pasa al siguiente criterio):
;; 1- Por cantidad de personas que caben (dormitorios-simples + 2*dormitorios-dobles) descendentemente
;; 2- Por precio ascendentemente
;; 3- Por cantidad de características muy recomendables descendentemente
;; 4- Por cantidad de características no recomendables ascendentemente

(deffunction generacion::rec-compare (?a ?b)
    (bind ?criterio-personas (< (send ?a get-personas) (send ?b get-personas)))
    (if (eq ?criterio-personas 0) then
        (bind ?criterio-precio (> (send ?a get-precio) (send ?b get-precio)))
        (if (eq ?criterio-precio 0) then
            (bind ?criterio-muy-recomendable (< (send ?a get-caracteristicas-muy-recomendables) (send ?b get-caracteristicas-muy-recomendables)))
            (if (eq ?criterio-muy-recomendable 0) then
                (bind ?criterio-no-recomendable (> (send ?a get-caracteristicas-no-recomendables) (send ?b get-caracteristicas-no-recomendables)))
                ?criterio-no-recomendable
            else
                ?criterio-muy-recomendable
            )
        else
            ?criterio-precio
        )
    else
        ?criterio-personas
    )
)

(defrule generacion::ordenar-validas "Ordena las recomendaciones válidas"
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
    (test (eq TRUE (> (length$ $?validas) 0)))
    (not (lista-validas-ordenada))
    =>
    (bind ?validas-ordenadas (sort rec-compare $?validas))
    (modify ?hecho-validas (recomendaciones ?validas-ordenadas))
    (assert (lista-validas-ordenada))
)

(defrule generacion::ordenar-descartadas "Ordena las recomendaciones descartadas si no hay ninguna válida"
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
    ?hecho-descartadas <- (lista-descartadas (recomendaciones $?descartadas))
    (test (eq (length$ $?validas) 0))
    (not (lista-descartadas-ordenada))
    =>
    (bind ?descartadas-ordenadas (sort rec-compare $?descartadas))
    (modify ?hecho-descartadas (recomendaciones ?descartadas-ordenadas))
    (assert (lista-descartadas-ordenada))
)

;; ADECUADAS

(defrule generacion::crea-lista-adecuadas "Se crea una lista de recomendaciones adecuadas"
    (not (lista-adecuadas))
    =>
    (assert (lista-adecuadas))
)

(defrule generacion::crear-adecuada "Añade una recomendación válida a la lista de recomendaciones adecuadas"
    ?rec <- (object (is-a Recomendacion))
    ?hecho-adecuadas <- (lista-adecuadas (recomendaciones $?adecuadas))
    (test (not (member$ ?rec $?adecuadas)))
    (adecuada ?rec)
    =>
    ;; Añadir a la lista de adecuadas
    (bind $?adecuadas (insert$ $?adecuadas (+ 1 (length$ $?adecuadas)) ?rec))
    (modify ?hecho-adecuadas (recomendaciones $?adecuadas))
)

;; PARCIALMENTE ADECUADAS

(defrule generacion::crea-lista-parcialmente-adecuadas "Se crea una lista de recomendaciones parcialmente adecuadas"
    (not (lista-parcialmente-adecuadas))
    =>
    (assert (lista-parcialmente-adecuadas))
)

(defrule generacion::crear-parcialmente-adecuada "Añade una recomendación válida a la lista de recomendaciones parcialmente adecuadas"
    ?rec <- (object (is-a Recomendacion))
    ?hecho-parcialmente-adecuadas <- (lista-parcialmente-adecuadas (recomendaciones $?parcialmente-adecuadas))
    (test (not (member$ ?rec $?parcialmente-adecuadas)))
    (parcialmente-adecuada ?rec)
    =>
    ;; Añadir a la lista de parcialmente-adecuadas
    (bind $?parcialmente-adecuadas (insert$ $?parcialmente-adecuadas (+ 1 (length$ $?parcialmente-adecuadas)) ?rec))
    (modify ?hecho-parcialmente-adecuadas (recomendaciones $?parcialmente-adecuadas))
)

;; MUY RECOMENDABLES

(defrule generacion::crea-lista-muy-recomendables "Se crea una lista de recomendaciones muy recomendables"
    (not (lista-muy-recomendables))
    =>
    (assert (lista-muy-recomendables))
)

(defrule generacion::crear-muy-recomendable "Añade una recomendación válida a la lista de recomendaciones muy recomendables"
    ?rec <- (object (is-a Recomendacion))
    ?hecho-muy-recomendable <- (lista-muy-recomendables (recomendaciones $?muy-recomendables))
    (test (not (member$ ?rec $?muy-recomendables)))
    (muy-recomendable ?rec)
    =>
    ;; Añadir a la lista de muy-recomendables
    (bind $?muy-recomendables (insert$ $?muy-recomendables (+ 1 (length$ $?muy-recomendables)) ?rec))
    (modify ?hecho-muy-recomendable (recomendaciones $?muy-recomendables))
)

;; CLASIFICACIÓN

(defrule generacion::clasificar-validas "Clasifica ordenadamente las recomendaciones válidas en 'Muy recomendable', 'Adecuada' o 'Parcialmente adecuada'"
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
    (lista-validas-ordenada)
    (not (clasificadas))
    =>
    (progn$ (?rec $?validas)
        (bind ?cantidad-no-recomendables (length$ (send ?rec get-caracteristicas-no-recomendables)))
        (bind ?cantidad-muy-recomendables (length$ (send ?rec get-caracteristicas-muy-recomendables)))
        (if (> ?cantidad-no-recomendables 0) then
            (assert (parcialmente-adecuada ?rec))
        else
            (if (> ?cantidad-muy-recomendables 0) then
                (assert (muy-recomendable ?rec))
            else
                (assert (adecuada ?rec))
            )
        )
    )
    (assert (clasificadas))
)

(defrule generacion::pasar-modulo-presentacion "Pasa al módulo de presentación de resultados"
    (declare (salience -1))
    =>
    (focus presentacion)
)

;; PRESENTACIÓN DE RECOMENDACIONES

(defrule presentacion::mostrar-viviendas "Muestra las viviendas recomendadas válidas"
    ?hecho-muy-recomendable <- (lista-muy-recomendables (recomendaciones $?muy-recomendables))
    ?hecho-adecuadas <- (lista-adecuadas (recomendaciones $?adecuadas))
    ?hecho-parcialmente-adecuadas <- (lista-parcialmente-adecuadas (recomendaciones $?parcialmente-adecuadas))
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
    (test (eq TRUE (> (length$ $?validas) 0)))
    (not (fin))
	=>
    (printout t crlf "Estas son nuestras recomendaciones: " crlf)
    (if (> (length$ $?muy-recomendables) 0) then
        (printout t crlf "MUY RECOMENDABLES" crlf)
        (progn$ (?rec $?muy-recomendables)
            (send ?rec imprimir)
        )
    )
    (if (> (length$ $?adecuadas) 0) then
        (printout t crlf "ADECUADAS" crlf)
        (progn$ (?rec $?adecuadas)
            (send ?rec imprimir)
        )
    )
    (if (> (length$ $?parcialmente-adecuadas) 0) then
        (printout t crlf "PARCIALMENTE ADECUADAS" crlf)
        (progn$ (?rec $?parcialmente-adecuadas)
            (send ?rec imprimir)
        )
    )
    (assert (fin))
)

(defrule presentacion::mostrar-descartadas "Muestra las viviendas descartadas si no hay ninguna válida"
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
    ?hecho-descartadas <- (lista-descartadas (recomendaciones $?descartadas))
    (test (eq (length$ $?validas) 0))
    (lista-descartadas-ordenada)
    (not (fin))
    =>
    (printout t crlf "No tenemos ninguna recomendación que cumpla con los requisitos indicados." crlf
        "Aún así, quizás te puedan interesar algunas de estas viviendas:" crlf)
    (loop-for-count (?i 1 (min 5 (length$ $?descartadas))) do ;; Muestra como máximo 5
        (send (nth$ ?i $?descartadas) imprimir)
    )
    (assert (fin))
)