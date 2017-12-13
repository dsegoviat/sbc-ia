; Tue Dec 12 18:01:10 CET 2017
; 
;+ (version "3.4.8")
;+ (build "Build 629")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Price
;+		(comment "Precio mensual")
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Location
;+		(comment "Localización de la vivienda (coordenadas X e Y)")
		(type INSTANCE)
;+		(allowed-classes Coordinates)
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
	(single-slot Price
;+		(comment "Precio mensual")
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Location
;+		(comment "Localización de la vivienda (coordenadas X e Y)")
		(type INSTANCE)
;+		(allowed-classes Coordinates)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Coordinates "Clase coordenadas que contiene información sobre los ejes X e Y de otra clase."
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

; Tue Dec 12 18:01:10 CET 2017
; 
;+ (version "3.4.8")
;+ (build "Build 629")

([ontologia_Class16] of  Coordinates

	(X 20)
	(Y 30))

([ontologia_Class17] of  Coordinates

	(X 50)
	(Y 50))

([ontologia_Class18] of  Coordinates

	(X 99)
	(Y 88))

([ontologia_Class19] of  Vivienda

	(Location [ontologia_Class16])
	(Price 200.0))

([ontologia_Class20] of  Vivienda

	(Location [ontologia_Class17])
	(Price 500.0))

([ontologia_Class21] of  Vivienda

	(Location [ontologia_Class18])
	(Price 1000.0))
