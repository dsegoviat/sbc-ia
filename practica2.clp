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
    (single-slot sol
;+      (comment "Indica en qué momento del dia la vivienda recibe impacto de la luz solar")
        (type SYMBOL)
        (allowed-values manana tarde todo-el-dia)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot parking
;+      (comment "Booleano que indica si la vivienda incluye plaza de parking")
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
    (single-slot altura-maxima
;+      (comment "Número que indica el piso más alto del edificio en caso de ser un piso.")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot amueblado
;+      (comment "Booleano que indica si la vivienda está amueblada")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot Y
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot altura
;+      (comment "Altura del piso")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot piscina-comunitaria
;+      (comment "Booleano que indica si la vivienda tiene piscina comunitaria con acceso a ella")
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
    (single-slot X
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot tipo
        (type SYMBOL)
        (allowed-values piso duplex unifamiliar)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot dormitorios-simples
;+      (comment "Número de dormitorios simples de la vivienda")
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
    (single-slot ascensor
;+      (comment "Booleano que indica si tiene ascensor en caso de que el tipo de vivienda sea: piso. En caso contrario, este slot no contiene información útil.")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot precio
;+      (comment "Precio mensual")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot localizacion-servicio
;+      (comment "Localización del servicio")
        (type INSTANCE)
;+      (allowed-classes Coordenadas)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot dormitorios-dobles
;+      (comment "Número de dormitorios dobles de la vivienda")
        (type INTEGER)
        (default 0)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot adaptada-mobilidad-reducida
;+      (comment "Booleano que indica si la casa esta adaptada para personas con mobilidad reducida")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot electrodomesticos
;+      (comment "Booleano que indica si la vivienda incluye electrodomésticos")
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
    (single-slot terraza
;+      (comment "Booleano que indica si la vivienda tiene terraza")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot mascotas-permitidas
;+      (comment "Booleano que indica si las mascotas están prohibidas en esta vivienda")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot localizacion
;+      (comment "Localización de la vivienda (coordenadas X e Y)")
        (type INSTANCE)
;+      (allowed-classes Coordenadas)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot area
;+      (comment "Superfície en metros cuadrados de la vivienda")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot tipo-servicio
;+      (comment "Tipo de servicio que se ofrece en una ciudad. Puede ser de tipo:\n- Centro médico\n- Colegio\n- Supermercado\n- Hipermercado\n- Zona verde\n- Discoteca\n- Transporte público\n- Gimnasio\n- Biblioteca\n- Restaurante")
        (type SYMBOL)
        (allowed-values centro-medico colegio supermercado hipermercado zona-verde discoteca transporte-publico gimnasio biblioteca restaurante)
;+      (cardinality 1 1)
        (create-accessor read-write)))

(defclass Vivienda "Clase encargada de almacenar toda la información útil de una vivienda que se utilizará para contrastar con las preferencias del usuario"
    (is-a USER)
    (role concrete)
    (single-slot adaptada-mobilidad-reducida
;+      (comment "Booleano que indica si la casa esta adaptada para personas con mobilidad reducida")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot precio
;+      (comment "Precio mensual")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot sol
;+      (comment "Indica en qué momento del dia la vivienda recibe impacto de la luz solar")
        (type SYMBOL)
        (allowed-values manana tarde todo-el-dia)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot altura
;+      (comment "Altura del piso")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot electrodomesticos
;+      (comment "Booleano que indica si la vivienda incluye electrodomésticos")
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
    (single-slot piscina-comunitaria
;+      (comment "Booleano que indica si la vivienda tiene piscina comunitaria con acceso a ella")
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
    (single-slot buenas-vistas
;+      (comment "Booleano que indica si la vivienda tiene vistas")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot mascotas-permitidas
;+      (comment "Booleano que indica si las mascotas están prohibidas en esta vivienda")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot localizacion
;+      (comment "Localización de la vivienda (coordenadas X e Y)")
        (type INSTANCE)
;+      (allowed-classes Coordenadas)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot parking
;+      (comment "Booleano que indica si la vivienda incluye plaza de parking")
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
    (single-slot dormitorios-dobles
;+      (comment "Número de dormitorios dobles de la vivienda")
        (type INTEGER)
        (default 0)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot area
;+      (comment "Superfície en metros cuadrados de la vivienda")
        (type FLOAT)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot tipo
        (type SYMBOL)
        (allowed-values piso duplex unifamiliar)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot dormitorios-simples
;+      (comment "Número de dormitorios simples de la vivienda")
        (type INTEGER)
        (default 0)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot altura-maxima
;+      (comment "Número que indica el piso más alto del edificio en caso de ser un piso.")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot amueblado
;+      (comment "Booleano que indica si la vivienda está amueblada")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot aire-acondicionado
;+      (comment "Booleano que indica si la vivienda tiene aire acondicionado")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot ascensor
;+      (comment "Booleano que indica si tiene ascensor en caso de que el tipo de vivienda sea: piso. En caso contrario, este slot no contiene información útil.")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 0 1)
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

(defclass Servicio "Clase que se encarga de almacenar la posición y el tipo de servicio que se ofrece en una población"
    (is-a USER)
    (role concrete)
    (single-slot localizacion-servicio
;+      (comment "Localización del servicio")
        (type INSTANCE)
;+      (allowed-classes Coordenadas)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot tipo-servicio
;+      (comment "Tipo de servicio que se ofrece en una ciudad. Puede ser de tipo:\n- Centro médico\n- Colegio\n- Supermercado\n- Hipermercado\n- Zona verde\n- Discoteca\n- Transporte público\n- Gimnasio\n- Biblioteca\n- Restaurante")
        (type SYMBOL)
        (allowed-values centro-medico colegio supermercado hipermercado zona-verde discoteca transporte-publico gimnasio biblioteca restaurante)
;+      (cardinality 1 1)
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

    ([ontologia_Class10] of  Vivienda

    (adaptada-mobilidad-reducida FALSE)
    (aire-acondicionado TRUE)
    (altura 3)
    (altura-maxima 8)
    (amueblado TRUE)
    (area 300.0)
    (ascensor TRUE)
    (balcon TRUE)
    (buenas-vistas TRUE)
    (calefaccion TRUE)
    (dormitorios-dobles 1)
    (dormitorios-simples 3)
    (electrodomesticos TRUE)
    (localizacion [ontologia_Class11])
    (mascotas-permitidas TRUE)
    (parking TRUE)
    (piscina-comunitaria FALSE)
    (precio 500.0)
    (sol manana)
    (terraza TRUE)
    (tipo piso))

    ([ontologia_Class10016] of  Vivienda

        (adaptada-mobilidad-reducida FALSE)
        (aire-acondicionado FALSE)
        (altura 12)
        (altura-maxima 12)
        (amueblado TRUE)
        (area 300.0)
        (ascensor TRUE)
        (balcon TRUE)
        (buenas-vistas TRUE)
        (calefaccion TRUE)
        (dormitorios-dobles 2)
        (dormitorios-simples 2)
        (electrodomesticos TRUE)
        (localizacion [ontologia_Class10018])
        (mascotas-permitidas TRUE)
        (parking FALSE)
        (piscina-comunitaria TRUE)
        (precio 400.0)
        (sol todo-el-dia)
        (terraza FALSE)
        (tipo duplex))

    ([ontologia_Class10018] of  Coordenadas

        (X 0)
        (Y 12))

    ([ontologia_Class10019] of  Vivienda

        (adaptada-mobilidad-reducida FALSE)
        (aire-acondicionado FALSE)
        (altura 10)
        (altura-maxima 10)
        (amueblado FALSE)
        (area 400.0)
        (ascensor FALSE)
        (balcon TRUE)
        (buenas-vistas TRUE)
        (calefaccion FALSE)
        (dormitorios-dobles 1)
        (dormitorios-simples 5)
        (electrodomesticos TRUE)
        (localizacion [ontologia_Class10020])
        (mascotas-permitidas FALSE)
        (parking TRUE)
        (piscina-comunitaria TRUE)
        (precio 800.0)
        (sol todo-el-dia)
        (terraza TRUE)
        (tipo piso))

    ([ontologia_Class10020] of  Coordenadas

        (X 2)
        (Y 32))

    ([ontologia_Class11] of  Coordenadas

        (X 12)
        (Y 84))

    ([ontologia_Class12] of  Vivienda

        (adaptada-mobilidad-reducida FALSE)
        (aire-acondicionado FALSE)
        (altura -1)
        (altura-maxima 10)
        (amueblado FALSE)
        (area 200.0)
        (ascensor FALSE)
        (balcon FALSE)
        (buenas-vistas FALSE)
        (calefaccion TRUE)
        (dormitorios-dobles 1)
        (dormitorios-simples 2)
        (electrodomesticos FALSE)
        (localizacion [ontologia_Class13])
        (mascotas-permitidas TRUE)
        (parking FALSE)
        (piscina-comunitaria TRUE)
        (precio 150.0)
        (terraza TRUE)
        (tipo piso))

    ([ontologia_Class13] of  Coordenadas

        (X 22)
        (Y 92))

    ([ontologia_Class14] of  Vivienda

        (adaptada-mobilidad-reducida TRUE)
        (aire-acondicionado TRUE)
        (amueblado TRUE)
        (area 600.0)
        (ascensor FALSE)
        (balcon FALSE)
        (buenas-vistas TRUE)
        (calefaccion TRUE)
        (dormitorios-dobles 5)
        (dormitorios-simples 4)
        (electrodomesticos TRUE)
        (localizacion [ontologia_Class15])
        (mascotas-permitidas FALSE)
        (parking TRUE)
        (piscina-comunitaria TRUE)
        (precio 2500.0)
        (sol todo-el-dia)
        (terraza FALSE)
        (tipo unifamiliar))

    ([ontologia_Class15] of  Coordenadas

        (X 15)
        (Y 24))

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

        (adaptada-mobilidad-reducida TRUE)
        (aire-acondicionado TRUE)
        (altura 1)
        (altura-maxima 10)
        (amueblado TRUE)
        (area 200.0)
        (ascensor TRUE)
        (balcon FALSE)
        (buenas-vistas FALSE)
        (calefaccion TRUE)
        (dormitorios-dobles 2)
        (dormitorios-simples 3)
        (electrodomesticos FALSE)
        (localizacion [ontologia_Class16])
        (mascotas-permitidas FALSE)
        (parking FALSE)
        (piscina-comunitaria FALSE)
        (precio 300.0)
        (sol manana)
        (terraza FALSE)
        (tipo duplex))

    ([ontologia_Class20] of  Vivienda

        (adaptada-mobilidad-reducida TRUE)
        (aire-acondicionado TRUE)
        (amueblado TRUE)
        (altura 8)
        (altura-maxima 10)
        (area 500.0)
        (ascensor FALSE)
        (balcon TRUE)
        (buenas-vistas TRUE)
        (calefaccion TRUE)
        (dormitorios-dobles 3)
        (dormitorios-simples 6)
        (electrodomesticos TRUE)
        (localizacion [ontologia_Class17])
        (mascotas-permitidas TRUE)
        (parking TRUE)
        (piscina-comunitaria TRUE)
        (precio 2000.0)
        (sol todo-el-dia)
        (terraza TRUE)
        (tipo piso))

    ([ontologia_Class21] of  Vivienda

        (adaptada-mobilidad-reducida FALSE)
        (aire-acondicionado FALSE)
        (amueblado TRUE)
        (altura 0)
        (altura-maxima 2)
        (area 75.0)
        (balcon TRUE)
        (buenas-vistas FALSE)
        (calefaccion TRUE)
        (dormitorios-dobles 1)
        (dormitorios-simples 1)
        (electrodomesticos FALSE)
        (localizacion [ontologia_Class18])
        (mascotas-permitidas TRUE)
        (parking FALSE)
        (piscina-comunitaria FALSE)
        (precio 100.0)
        (sol todo-el-dia)
        (terraza TRUE)
        (tipo duplex))

    ([ontologia_Class5] of  Vivienda

        (adaptada-mobilidad-reducida TRUE)
        (aire-acondicionado TRUE)
        (altura 5)
        (altura-maxima 5)
        (amueblado TRUE)
        (area 300.0)
        (ascensor TRUE)
        (balcon TRUE)
        (buenas-vistas TRUE)
        (calefaccion TRUE)
        (dormitorios-dobles 1)
        (dormitorios-simples 3)
        (electrodomesticos TRUE)
        (localizacion [ontologia_Class6])
        (mascotas-permitidas TRUE)
        (parking TRUE)
        (piscina-comunitaria FALSE)
        (precio 1000.0)
        (sol tarde)
        (terraza TRUE)
        (tipo duplex))

    ([ontologia_Class6] of  Coordenadas

        (X 10)
        (Y 12))

    ([ontologia_Class7] of  Vivienda

        (adaptada-mobilidad-reducida FALSE)
        (aire-acondicionado FALSE)
        (altura 9)
        (altura-maxima 10)
        (amueblado FALSE)
        (area 25.0)
        (ascensor TRUE)
        (balcon FALSE)
        (buenas-vistas FALSE)
        (calefaccion TRUE)
        (dormitorios-dobles 0)
        (dormitorios-simples 1)
        (electrodomesticos FALSE)
        (localizacion [ontologia_Class8])
        (mascotas-permitidas TRUE)
        (parking FALSE)
        (piscina-comunitaria FALSE)
        (precio 50.0)
        (terraza FALSE)
        (tipo piso))

    ([ontologia_Class8] of  Coordenadas

        (X 86)
        (Y 33))

    ([ontologia_v2_Class10021] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10022])
        (tipo-servicio centro-medico))

    ([ontologia_v2_Class10022] of  Coordenadas

        (X 37)
        (Y 22))

    ([ontologia_v2_Class10023] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10024])
        (tipo-servicio discoteca))

    ([ontologia_v2_Class10024] of  Coordenadas

        (X 85)
        (Y 30))

    ([ontologia_v2_Class10025] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10028])
        (tipo-servicio supermercado))

    ([ontologia_v2_Class10026] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10027])
        (tipo-servicio colegio))

    ([ontologia_v2_Class10027] of  Coordenadas

        (X 0)
        (Y 8))

    ([ontologia_v2_Class10028] of  Coordenadas

        (X 15)
        (Y 16))

    ([ontologia_v2_Class10029] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10030])
        (tipo-servicio hipermercado))

    ([ontologia_v2_Class10030] of  Coordenadas

        (X 31)
        (Y 76))

    ([ontologia_v2_Class10031] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10032])
        (tipo-servicio zona-verde))

    ([ontologia_v2_Class10032] of  Coordenadas

        (X 21)
        (Y 56))

    ([ontologia_v2_Class10033] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10034])
        (tipo-servicio transporte-publico))

    ([ontologia_v2_Class10034] of  Coordenadas

        (X 74)
        (Y 25))

    ([ontologia_v2_Class10035] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10036])
        (tipo-servicio gimnasio))

    ([ontologia_v2_Class10036] of  Coordenadas

        (X 65)
        (Y 13))

    ([ontologia_v2_Class10037] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10038])
        (tipo-servicio biblioteca))

    ([ontologia_v2_Class10038] of  Coordenadas

        (X 75)
        (Y 32))

    ([ontologia_v2_Class10039] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10040])
        (tipo-servicio restaurante))

    ([ontologia_v2_Class10040] of  Coordenadas

        (X 43)
        (Y 75))

    ([ontologia_v2_Class10041] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10042])
        (tipo-servicio centro-medico))

    ([ontologia_v2_Class10042] of  Coordenadas

        (X 67)
        (Y 32))

    ([ontologia_v2_Class10043] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10044])
        (tipo-servicio colegio))

    ([ontologia_v2_Class10044] of  Coordenadas

        (X 73)
        (Y 22))

    ([ontologia_v2_Class10045] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10046])
        (tipo-servicio supermercado))

    ([ontologia_v2_Class10046] of  Coordenadas

        (X 70)
        (Y 24))

    ([ontologia_v2_Class10047] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10048])
        (tipo-servicio hipermercado))

    ([ontologia_v2_Class10048] of  Coordenadas

        (X 76)
        (Y 31))

    ([ontologia_v2_Class10049] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10050])
        (tipo-servicio zona-verde))

    ([ontologia_v2_Class10050] of  Coordenadas

        (X 52)
        (Y 31))

    ([ontologia_v2_Class10051] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10052])
        (tipo-servicio discoteca))

    ([ontologia_v2_Class10052] of  Coordenadas

        (X 46)
        (Y 21))

    ([ontologia_v2_Class10053] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10054])
        (tipo-servicio transporte-publico))

    ([ontologia_v2_Class10054] of  Coordenadas

        (X 25)
        (Y 74))

    ([ontologia_v2_Class10055] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10056])
        (tipo-servicio gimnasio))

    ([ontologia_v2_Class10056] of  Coordenadas

        (X 33)
        (Y 94))

    ([ontologia_v2_Class10057] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10058])
        (tipo-servicio biblioteca))

    ([ontologia_v2_Class10058] of  Coordenadas

        (X 12)
        (Y 54))

    ([ontologia_v2_Class10059] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10060])
        (tipo-servicio restaurante))

    ([ontologia_v2_Class10060] of  Coordenadas

        (X 67)
        (Y 13))

    ([ontologia_v2_Class10061] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10062])
        (tipo-servicio supermercado))

    ([ontologia_v2_Class10062] of  Coordenadas

        (X 41)
        (Y 18))

    ([ontologia_v2_Class10063] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10064])
        (tipo-servicio hipermercado))

    ([ontologia_v2_Class10064] of  Coordenadas

        (X 10)
        (Y 13))

    ([ontologia_v2_Class10065] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10066])
        (tipo-servicio zona-verde))

    ([ontologia_v2_Class10066] of  Coordenadas

        (X 15)
        (Y 10))

    ([ontologia_v2_Class10067] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10068])
        (tipo-servicio transporte-publico))

    ([ontologia_v2_Class10068] of  Coordenadas

        (X 50)
        (Y 2))

    ([ontologia_v2_Class10069] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10070])
        (tipo-servicio transporte-publico))

    ([ontologia_v2_Class10070] of  Coordenadas

        (X 90)
        (Y 12))

    ([ontologia_v2_Class10071] of  Servicio

        (localizacion-servicio [ontologia_v2_Class10072])
        (tipo-servicio transporte-publico))

    ([ontologia_v2_Class10072] of  Coordenadas

        (X 1)
        (Y 10))

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
    (slot amueblado (type SYMBOL)
        (allowed-values FALSE TRUE))
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
    (slot ascensor (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot adaptada-mobilidad-reducida (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot altura (type INTEGER))
    (slot parking (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot sol (type SYMBOL)
        (allowed-values manana tarde todo-el-dia))
    (slot mascotas-permitidas (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot ninos (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot jovenes (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot estudiantes (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot trabajadores (type SYMBOL)
        (allowed-values FALSE TRUE))
    (slot jubilados (type SYMBOL)
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

;; Lista de servicios que el usuario necesita cerca
(deftemplate MAIN::lista-servicios-cerca
    (multislot servicios (type SYMBOL)
        (allowed-values centro-medico colegio supermercado hipermercado zona-verde discoteca transporte-publico gimnasio biblioteca restaurante))
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

;; Devuelve TRUE si y sólo si tiene sentido que tuviera ascensor, aunque no lo tenga (piso o duplex)
(defmessage-handler MAIN::Vivienda puede-tener-ascensor ()
    (or (eq ?self:tipo piso) (eq ?self:tipo duplex))
)

;; Obtiene la altura en string
(defmessage-handler MAIN::Vivienda get-indicador-altura ()
    (if (eq ?self:altura 0) then
        "Entresuelo"
    else (if (< ?self:altura 0) then
        "Bajos"
        else
            (str-cat ?self:altura " / " ?self:altura-maxima)
        )
    )
)

;; Imprime los datos de una Vivienda
(defmessage-handler MAIN::Vivienda imprimir ()
	(printout t "Localización: ")
    (send ?self:localizacion imprimir)
    (format t "%nPrecio: %f" ?self:precio)
    (format t "%nSuperficie: %f" ?self:area)
    (format t "%nTipo de vivienda: %s" ?self:tipo)
    (if (neq ?self:tipo unifamiliar) then
        (format t "%nAltura: %s" (send ?self get-indicador-altura))
    )
    (format t "%nDormitorios dobles: %d" ?self:dormitorios-dobles)
    (format t "%nDormitorios simples: %d" ?self:dormitorios-simples)
    (format t "%nTerraza: %s" ?self:terraza)
    (format t "%nBalcón: %s" ?self:balcon)
    (format t "%nSoleado: %s" (upcase ?self:sol))
    (format t "%nAmueblado: %s" ?self:amueblado)
    (format t "%nElectrodomesticos: %s" ?self:electrodomesticos)
    (format t "%nAire acondicionado: %s" ?self:aire-acondicionado)
    (format t "%nCalefacción: %s" ?self:calefaccion)
    (format t "%nPiscina: %s" ?self:piscina-comunitaria)
    (if (eq TRUE (send ?self puede-tener-ascensor)) then
        (format t "%nAscensor: %s" ?self:ascensor)
    )
    (format t "%nAdaptada para mobilidad reducida: %s" ?self:adaptada-mobilidad-reducida)
    (format t "%nAcepta mascotas: %s" ?self:mascotas-permitidas)
    (format t "%nParking incluído: %s" ?self:parking)
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

;;; Retorna la distancia euclidiana entre la vivienda y el servicio
(deffunction MAIN::euclidian-distance (?vivienda ?servicio)
    (bind ?coordenadas-vivienda (send ?vivienda get-localizacion))
    (bind ?coordenadas-servicio (send ?servicio get-localizacion-servicio))
    (bind ?xa (send ?coordenadas-vivienda get-X))
    (bind ?ya (send ?coordenadas-vivienda get-Y))
    (bind ?xb (send ?coordenadas-servicio get-X))
    (bind ?yb (send ?coordenadas-servicio get-Y))
    (bind ?xsub (- ?xb ?xa))
    (bind ?ysub (- ?yb ?ya))
    (sqrt (+ (* ?xsub ?xsub) (* ?ysub ?ysub)))
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

(defrule recopilacion::preguntar-terraza-balcon "Pregunta si el usuario quiere terraza o balcón"
    (declare (salience -4))
    ?usuario <- (usuario)
    (not (terraza-balcon-preguntado))
    =>
    (bind ?terraza (pregunta-si-no "¿Quiere terraza obligatoriamente?"))
    (bind ?balcon (pregunta-si-no "¿Quiere balcón obligatoriamente?"))
    (modify ?usuario (terraza ?terraza) (balcon ?balcon))
    (assert (terraza-balcon-preguntado))
)

(defrule recopilacion::preguntar-amueblado-electrodomesticos "Pregunta si el usuario quiere la vivienda amueblada o con electrodomesticos"
    (declare (salience -5))
    ?usuario <- (usuario)
    (not (amueblado-electrodomesticos-preguntado))
    =>
    (bind ?amueblado (pregunta-si-no "¿Necesita que la vivienda esté amueblada?"))
    (bind ?electrodomesticos (pregunta-si-no "¿Necesita la vivienda con electrodomesticos?"))
    (modify ?usuario (amueblado ?amueblado) (electrodomesticos ?electrodomesticos))
    (assert (amueblado-electrodomesticos-preguntado))
)

(defrule recopilacion::preguntar-calefaccion-aire-acondicionado "Pregunta si el usuario quiere la vivienda con calefaccion o con aire acondicionado"
    (declare (salience -6))
    ?usuario <- (usuario)
    (not (calefaccion-aire-acondicionado-preguntado))
    =>
    (bind ?calefaccion (pregunta-si-no "¿Necesita que la vivienda tenga calefacción?"))
    (bind ?aire-acondicionado (pregunta-si-no "¿Necesita la vivienda con aire acondicionado?"))
    (modify ?usuario (calefaccion ?calefaccion) (aire-acondicionado ?aire-acondicionado))
    (assert (calefaccion-aire-acondicionado-preguntado))
)

(defrule recopilacion::preguntar-piscina-comunitaria "Pregunta si el usuario quiere una vivienda con acceso a la piscina comunitaria"
    (declare (salience -7))
    ?usuario <- (usuario)
    (not (piscina-comunitaria-preguntado))
    =>
    (bind ?piscina-comunitaria (pregunta-si-no "¿Quiere que la vivienda tenga piscina comunitaria o propia?"))
    (modify ?usuario (piscina-comunitaria ?piscina-comunitaria))
    (assert (piscina-comunitaria-preguntado))
)

(defrule recopilacion::preguntar-adaptada-mobilidad-reducida "Pregunta si el usuario tiene mobilidad reducida"
    (declare (salience -8))
    ?usuario <- (usuario)
    (not (adaptada-mobilidad-reducida-preguntado))
    =>
    (bind ?adaptada-mobilidad-reducida (pregunta-si-no "¿Alguno de los ocupantes tiene mobilidad reducida?"))
    (modify ?usuario (adaptada-mobilidad-reducida ?adaptada-mobilidad-reducida) (ascensor ?adaptada-mobilidad-reducida))
    (assert (adaptada-mobilidad-reducida-preguntado))
)

;; Sólo si no tiene mobilidad reducida (en ese caso necesitará ascensor)
(defrule recopilacion::preguntar-ascensor "Pregunta si el usuario quiere ascensor para las viviendas de más de 1 planta"
    (declare (salience -9))
    (adaptada-mobilidad-reducida-preguntado)
    ?usuario <- (usuario (adaptada-mobilidad-reducida ?adaptada-mobilidad-reducida))
    (not (ascensor-preguntado))
    (test (eq FALSE ?adaptada-mobilidad-reducida))
    =>
    (bind ?ascensor (pregunta-si-no "En caso de que la vivienda tenga más de 1 planta, ¿quiere que tenga ascensor?"))
    (modify ?usuario (ascensor ?ascensor))
    (assert (ascensor-preguntado))
)

(defrule recopilacion::preguntar-mascotas-permitidas "Pregunta si el usuario tiene mascotas o tiene pensado tenerlas"
    (declare (salience -10))
    ?usuario <- (usuario)
    (not (mascotas-permitidas-preguntado))
    =>
    (bind ?mascotas-permitidas (pregunta-si-no "¿Tiene mascotas o tiene pensado tenerlas en el futuro?"))
    (modify ?usuario (mascotas-permitidas ?mascotas-permitidas))
    (assert (mascotas-permitidas-preguntado))
)

(defrule recopilacion::preguntar-parking "Pregunta si el usuario tiene coche y quiere parking"
    (declare (salience -11))
    ?usuario <- (usuario)
    (not (parking-preguntado))
    =>
    (bind ?parking (pregunta-si-no "¿Le gustaría disponer de parking en el mismo edificio de su vivienda?"))
    (modify ?usuario (parking ?parking))
    (assert (parking-preguntado))
)

;; SERVICIOS CERCANOS

(defrule recopilacion::crea-lista-servicios-cerca "Se crea una lista de servicios cercanos requeridos por el usuario"
    (not (lista-servicios-cerca))
    =>
    (assert (lista-servicios-cerca))
)

(defrule recopilacion::preguntar-servicios-cerca "Pregunta qué servicios necesita el usuario que estén cerca"
    (declare (salience -12))
    (not (servicios-preguntado))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    =>
    (bind ?necesita-servicios (pregunta-si-no "¿Necesita algún servicio cercano a la vivienda?"))
    (if (eq TRUE ?necesita-servicios) then
        (bind ?formatos (create$ centro-medico colegio supermercado hipermercado zona-verde discoteca 
            transporte-publico gimnasio biblioteca restaurante))
        (bind $?lista-servicios-cercanos (pregunta-multi "¿Requiere que alguno de los siguientes servicios esté cerca de la vivienda?" ?formatos))
        (bind ?servicios-requeridos (create$ ))
        (progn$ (?i $?lista-servicios-cercanos)
            (bind ?servicios-requeridos (insert$ ?servicios-requeridos (+ 1 (length$ ?servicios-requeridos)) (nth$ ?i ?formatos)))
        )
        (modify ?hecho-servicios (servicios ?servicios-requeridos))
    )
    (assert (servicios-preguntado))
)

(defrule recopilacion::preguntar-grupos-edades "Pregunta qué tipos de ocupantes habrá en la vivienda"
    (declare (salience -13))
    ?usuario <- (usuario)
    (not (grupos-edades-preguntado))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    =>
    (bind ?ninos (pregunta-si-no "¿Habrá niños en la vivienda?"))
    (bind ?trabajadores (pregunta-si-no "¿Alguno de los ocupantes trabaja?"))
    (bind ?estudiantes (pregunta-si-no "¿Alguno de los ocupantes estudia?"))
    (bind ?jovenes (pregunta-si-no "¿Hay algun ocupante entre 20 y a 30 años?"))
    (bind ?jubilados (pregunta-si-no "¿Hay algun ocupante mayor a 60 años?"))
    (modify ?usuario (ninos ?ninos) (trabajadores ?trabajadores) (estudiantes ?estudiantes) (jovenes ?jovenes) (jubilados ?jubilados))
    (assert (grupos-edades-preguntado))
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

;; TERRAZA O BALCÓN

(defrule procesado::descartar-terraza-balcon "No se cumplen las restricciones de terraza o balcón"
    ?u <- (usuario (terraza ?terraza) (balcon ?balcon))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha pedido terraza y no la tiene o ha pedido balcón y no lo tiene
    (test (eq TRUE (or (and (eq TRUE ?terraza) (not (send ?v get-terraza))) (and (eq TRUE ?balcon) (not (send ?v get-balcon))))))
    (not (filtrar-terraza-balcon ?rec))
    =>
    (send ?rec parcialmente-recomendable "No se cumplen las restricciones de terraza o balcón")
    (assert (filtrar-terraza-balcon ?rec))
)

(defrule procesado::terraza-balcon-muy-recomendable "Tiene balcón o terraza aunque no lo haya pedido"
    (declare (salience -1))
    ?u <- (usuario (terraza ?terraza) (balcon ?balcon))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; No ha pedido terraza o balcón pero tiene balcón o terraza igualmente
    (test (eq TRUE (or (and (eq FALSE ?terraza) (eq TRUE (send ?v get-terraza))) (and (eq FALSE ?balcon) (eq TRUE (send ?v get-balcon))))))
    (not (filtrar-terraza-balcon ?rec))
    =>
    (send ?rec muy-recomendable "Tiene balcón o terraza aunque no lo haya pedido")
    (assert (filtrar-terraza-balcon ?rec))
)

;; AMUEBLADO O ELECTRODOMÉSTICOS

(defrule procesado::descartar-amueblado-electrodomesticos "No se cumplen las restricciones de amueblado o electrodomesticos"
    ?u <- (usuario (amueblado ?amueblado) (electrodomesticos ?electrodomesticos))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha pedido amueblado y no lo está o ha pedido electrodomesticos y no los tiene
    (test (eq TRUE (or (and (eq TRUE ?amueblado) (not (send ?v get-amueblado))) (and (eq TRUE ?electrodomesticos) (not (send ?v get-electrodomesticos))))))
    (not (filtrar-amueblado-electrodomesticos ?rec))
    =>
    (send ?rec parcialmente-recomendable "No se cumplen las restricciones de amueblado o electrodomesticos")
    (assert (filtrar-amueblado-electrodomesticos ?rec))
)

(defrule procesado::amueblado-electrodomesticos-muy-recomendable "Tiene electrodomesticos o está amueblada aunque no lo haya pedido"
    (declare (salience -1))
    ?u <- (usuario (amueblado ?amueblado) (electrodomesticos ?electrodomesticos))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; No ha pedido que esté amueblado o tenga electrodomesticos pero los tiene
    (test (eq TRUE (or (and (eq FALSE ?amueblado) (eq TRUE (send ?v get-amueblado))) (and (eq FALSE ?electrodomesticos) (eq TRUE (send ?v get-electrodomesticos))))))
    (not (filtrar-amueblado-electrodomesticos ?rec))
    =>
    (send ?rec muy-recomendable "Tiene electrodomesticos o está amueblada aunque no lo haya pedido")
    (assert (filtrar-amueblado-electrodomesticos ?rec))
)

;; CALEFACCIÓN O AIRE ACONDICIONADO

(defrule procesado::descartar-calefaccion-aire-acondicionado "No se cumplen las restricciones de calefacción o aire acondicionado"
    ?u <- (usuario (calefaccion ?calefaccion) (aire-acondicionado ?aire-acondicionado))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha pedido calefacción y no tiene o ha pedido aire acondicionado y no tiene
    (test (eq TRUE (or (and (eq TRUE ?calefaccion) (not (send ?v get-calefaccion))) (and (eq TRUE ?aire-acondicionado) (not (send ?v get-aire-acondicionado))))))
    (not (filtrar-calefaccion-aire-acondicionado ?rec))
    =>
    (send ?rec parcialmente-recomendable "No se cumplen las restricciones de calefacción o aire acondicionado")
    (assert (filtrar-calefaccion-aire-acondicionado ?rec))
)

(defrule procesado::calefaccion-aire-acondicionado-muy-recomendable "Tiene calefacción o aire acondicionado aunque no lo haya pedido"
    (declare (salience -1))
    ?u <- (usuario (calefaccion ?calefaccion) (aire-acondicionado ?aire-acondicionado))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; No ha pedido que tenga calefacción o aire acondicionado pero los tiene
    (test (eq TRUE (or (and (eq FALSE ?calefaccion) (eq TRUE (send ?v get-calefaccion))) (and (eq FALSE ?aire-acondicionado) (eq TRUE (send ?v get-aire-acondicionado))))))
    (not (filtrar-calefaccion-aire-acondicionado ?rec))
    =>
    (send ?rec muy-recomendable "Tiene calefacción o aire acondicionado aunque no lo haya pedido")
    (assert (filtrar-calefaccion-aire-acondicionado ?rec))
)

;; PISCINA COMUNITARIA

(defrule procesado::descartar-piscina-comunitaria "No se cumple la restricción de acceso a la piscina comunitaria o piscina propia"
    ?u <- (usuario (piscina-comunitaria ?piscina-comunitaria))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha pedido acceso a la piscina comunitaria y no lo tiene
    (test (eq TRUE (and (eq TRUE ?piscina-comunitaria) (not (send ?v get-piscina-comunitaria)))))
    (not (filtrar-piscina-comunitaria ?rec))
    =>
    (send ?rec parcialmente-recomendable "No tiene piscina")
    (assert (filtrar-piscina-comunitaria ?rec))
)

(defrule procesado::piscina-comunitaria-muy-recomendable "Tiene acceso a la piscina comunitaria aunque no lo haya pedido"
    (declare (salience -1))
    ?u <- (usuario (piscina-comunitaria ?piscina-comunitaria))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; No ha pedido acceso a la piscina comunitaria pero lo tiene
    (test (eq TRUE (and (eq FALSE ?piscina-comunitaria) (eq TRUE (send ?v get-piscina-comunitaria)))))
    (not (filtrar-piscina-comunitaria ?rec))
    =>
    (send ?rec muy-recomendable "Tiene piscina aunque no lo haya pedido")
    (assert (filtrar-piscina-comunitaria ?rec))
)

;; ASCENSOR

(defrule procesado::descartar-ascensor "No se cumple la restricción de ascensor"
    ?u <- (usuario (ascensor ?ascensor) (adaptada-mobilidad-reducida ?adaptada-mobilidad-reducida))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (send ?v puede-tener-ascensor)))
    ;; Ha pedido ascensor y no lo tiene
    (test (eq TRUE (and (eq TRUE ?ascensor) (not (send ?v get-ascensor)))))
    (not (filtrar-ascensor ?rec))
    =>
    (if (eq TRUE ?adaptada-mobilidad-reducida) then
        (assert (invalida ?rec))
    else
        (send ?rec parcialmente-recomendable "No tiene ascensor")
    ) 
    (assert (filtrar-ascensor ?rec))
)

(defrule procesado::ascensor-muy-recomendable "Tiene ascensor aunque no lo haya pedido"
    (declare (salience -1))
    ?u <- (usuario (ascensor ?ascensor))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (send ?v puede-tener-ascensor)))
    ;; No ha pedido ascensor pero lo tiene
    (test (eq TRUE (and (eq FALSE ?ascensor) (eq TRUE (send ?v get-ascensor)))))
    (not (filtrar-ascensor ?rec))
    =>
    (send ?rec muy-recomendable "Tiene ascensor aunque no lo haya pedido")
    (assert (filtrar-ascensor ?rec))
)

;; MOBILIDAD REDUCIDA

(defrule procesado::descartar-mobilidad-reducida "No cumple la restricción de mobilidad reducida"
    ?u <- (usuario (adaptada-mobilidad-reducida ?adaptada-mobilidad-reducida))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha pedido que la vivienda esté adaptada a mobilidad reducida y no lo está
    (test (eq TRUE (and (eq TRUE ?adaptada-mobilidad-reducida) (not (send ?v get-adaptada-mobilidad-reducida)))))
    (not (filtrar-adaptada-mobilidad-reducida ?rec))
    =>
    (send ?rec parcialmente-recomendable "No está adaptada para mobilidad reducida")
    (assert (filtrar-adaptada-mobilidad-reducida ?rec))
)

;; MASCOTAS

(defrule procesado::descartar-mascotas-permitidas "No se cumple la restricción de mascotas permitidas, por lo tanto se descarta la vivienda automáticamente"
    ?u <- (usuario (mascotas-permitidas ?mascotas-permitidas))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha indicado que tiene o tendrá mascotas y la vivienda no las permite
    (test (eq TRUE (and (eq TRUE ?mascotas-permitidas) (not (send ?v get-mascotas-permitidas)))))
    (not (filtrar-mascotas-permitidas ?rec))
    =>
    (assert (invalida ?rec))
    (assert (filtrar-mascotas-permitidas ?rec))
)

(defrule procesado::mascotas-permitidas-muy-recomendable "La vivienda permite el acceso a las mascotas aunque no lo haya solicitado"
    (declare (salience -1))
    ?u <- (usuario (mascotas-permitidas ?mascotas-permitidas))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; No tiene mascotas ni tiene pensado tenerlas pero la vivienda las permite
    (test (eq TRUE (and (eq FALSE ?mascotas-permitidas) (eq TRUE (send ?v get-mascotas-permitidas)))))
    (not (filtrar-mascotas-permitidasa ?rec))
    =>
    (send ?rec muy-recomendable "Permite el acceso a las mascotas aunque no lo haya solicitado")
    (assert (filtrar-mascotas-permitidas ?rec))
)

;; PARKING

(defrule procesado::descartar-parking "No cumple las restricción de parking"
    ?u <- (usuario (parking ?parking))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    ;; Ha pedido que la vivienda incluya parking pero no lo incluye
    (test (eq TRUE (and (eq TRUE ?parking) (not (send ?v get-parking)))))
    (not (filtrar-parking ?rec))
    =>
    (send ?rec parcialmente-recomendable "No tiene parking")
    (assert (filtrar-parking ?rec))
)

;; VIVIENDA SOLEADA

(defrule procesado::soleado-muy-recomendable "La vivienda es soleada todo el día"
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq (send ?v get-sol) todo-el-dia))
    (not (filtrar-soleado ?rec))
    =>
    (send ?rec muy-recomendable "La vivienda es soleada todo el día")
    (assert (filtrar-soleado ?rec))
)

;; ÁTICO

(defrule procesado::atico-muy-recomendable "La vivienda es un ático"
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq (send ?v get-altura-maxima) (send ?v get-altura)))
    (test (neq (send ?v get-tipo) unifamiliar))
    (not (filtrar-atico ?rec))
    =>
    (send ?rec muy-recomendable "La vivienda es un ático")
    (assert (filtrar-atico ?rec))
)

;; BUENAS VISTAS

(defrule procesado::buenas-vistas-muy-recomendable "La vivienda tiene buenas vistas"
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (test (eq TRUE (send ?v get-buenas-vistas)))
    (not (filtrar-vistas ?rec))
    =>
    (send ?rec muy-recomendable "La vivienda tiene buenas vistas")
    (assert (filtrar-vistas ?rec))
)

;; SERVICIOS CERCANOS

(deffunction procesado::hay-servicio-cercano (?vivienda ?tipo-servicio)
    (bind $?servicios (find-all-instances ((?inst Servicio)) (eq ?inst:tipo-servicio ?tipo-servicio)))
    (progn$ (?servicio $?servicios)
        (bind ?dist (funcall euclidian-distance ?vivienda ?servicio))
        (if (< ?dist 40) then
            (return TRUE)
        )
    )
    (return FALSE)
)

(defrule procesado::filtrar-servicios-cercanos "Se filtran las recomendaciones con servicios requeridos cerca de la vivienda"
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-distancia-servicios ?rec))
    =>
    ;; Para cada servicio requerido buscamos si hay algun servicio de ese mismo tipo que esté a distancia cercana (40)
    ;; Si no hay ninguno de ese tipo a distancia cercana pero sí a distancia media (100) entonces lo añadimos como parcialmente recomendable
    ;; En otro caso invalidamos la recomendación ya que todas las instancias de servicio de ese tipo están lejos (> 100)
    (progn$ (?servicio-req $?lista-servicios-cercanos)
        (bind $?servicios (find-all-instances ((?inst Servicio)) (eq ?inst:tipo-servicio ?servicio-req)))
        (bind ?cercano-encontrado FALSE)
        (bind ?mediano-encontrado FALSE)
        (progn$ (?servicio $?servicios)
            (bind ?dist (funcall euclidian-distance ?v ?servicio))
            (if (< ?dist 40) then
                (bind ?cercano-encontrado TRUE)
                (break)
            else
                (if (< ?dist 100) then
                    (bind ?mediano-encontrado TRUE)
                )
            )
        )
        (if (eq FALSE ?cercano-encontrado) then
            (if (eq FALSE ?mediano-encontrado) then
                (assert (invalida ?rec)) ;; Todos los servicios de este tipo son lejanos
            else
                (send ?rec parcialmente-recomendable (str-cat "El servicio " ?servicio-req " está a distancia media"))
            )
        )
    )
    (assert (filtrar-distancia-servicios ?rec))
)

(defrule procesado::jovenes-discoteca "Es recomendable que haya discotecas cercanas para los jóvenes"
    ?u <- (usuario (jovenes ?jovenes))
    (test (eq TRUE ?jovenes))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-jovenes-discoteca ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ discoteca $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v discoteca)))
    =>
    (send ?rec muy-recomendable "Hay cerca una o más discotecas")
    (assert (filtrar-jovenes-discoteca ?rec))
)

(defrule procesado::ninos-colegio "Es recomendable que haya colegios cercanos para los niños"
    ?u <- (usuario (ninos ?ninos))
    (test (eq TRUE ?ninos))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-ninos-colegio ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ colegio $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v colegio)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más colegios")
    (assert (filtrar-ninos-colegio ?rec))
)

(defrule procesado::ninos-jubilados-zonas-verdes "Es recomendable que haya zonas verdes cercanas para los niños y jubilados"
    ?u <- (usuario (ninos ?ninos) (jubilados ?jubilados))
    (test (or (eq TRUE ?ninos) (eq TRUE ?jubilados)))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-ninos-jubilados-zonas-verdes ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ zona-verde $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v zona-verde)))
    =>
    (send ?rec muy-recomendable "Hay cerca una o más zonas verdes")
    (assert (filtrar-ninos-jubilados-zonas-verdes ?rec))
)

(defrule procesado::trabajadores-estudiantes-transporte "Es recomendable que haya transporte público cercanos para trabajadores y estudiantes"
    ?u <- (usuario (trabajadores ?trabajadores) (estudiantes ?estudiantes))
    (test (or (eq TRUE ?trabajadores) (eq TRUE ?estudiantes)))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-trabajadores-estudiantes-transporte ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ transporte-publico $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v transporte-publico)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más servicios de transporte público")
    (assert (filtrar-trabajadores-estudiantes-transporte ?rec))
)

(defrule procesado::estudiantes-biblioteca "Es recomendable que haya bibliotecas cercanos para los estudiantes"
    ?u <- (usuario (estudiantes ?estudiantes))
    (test (eq TRUE ?estudiantes))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-estudiantes-biblioteca ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ biblioteca $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v biblioteca)))
    =>
    (send ?rec muy-recomendable "Hay cerca una o más bibliotecas")
    (assert (filtrar-estudiantes-biblioteca ?rec))
)

(defrule procesado::jubilados-medico "Es recomendable que haya centros médicos cercanos para los jubilados"
    ?u <- (usuario (jubilados ?jubilados))
    (test (eq TRUE ?jubilados))
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-jubilados-medico ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ centro-medico $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v centro-medico)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más centros médicos")
    (assert (filtrar-jubilados-medico ?rec))
)

(defrule procesado::matrimonio-hipermercado "Es recomendable que haya hipermercados cercanos para los matrimonios"
    ?u <- (usuario (dormitorios-dobles ?dormitorios-dobles))
    (test (eq TRUE (> ?dormitorios-dobles 0))) ;; Suponemos que si necesitan un dormitorio doble hay un matrimonio
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-matrimonio-hipermercado ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ hipermercado $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v hipermercado)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más hipermercados")
    (assert (filtrar-matrimonio-hipermercado ?rec))
)

(defrule procesado::supermercado-cercano "Es recomendable que haya supermercado cercanos"
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-super ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ supermercado $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v supermercado)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más supermercados")
    (assert (filtrar-super ?rec))
)

(defrule procesado::gimnasio-cercano "Es recomendable que haya gimnasios cercanos"
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-gimnasio ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ gimnasio $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v gimnasio)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más gimnasios")
    (assert (filtrar-gimnasio ?rec))
)

(defrule procesado::restaurante-cercano "Es recomendable que haya restaurante cercanos"
    ?rec <- (object (is-a Recomendacion) (vivienda ?v))
    (not (filtrar-restaurante ?rec))
    ?hecho-servicios <- (lista-servicios-cerca (servicios $?lista-servicios-cercanos))
    (test (not (member$ restaurante $?lista-servicios-cercanos)))
    (test (eq TRUE (funcall hay-servicio-cercano ?v restaurante)))
    =>
    (send ?rec muy-recomendable "Hay cerca uno o más restaurantes")
    (assert (filtrar-restaurante ?rec))
)

(defrule procesado::pasar-modulo-generacion "Pasa al módulo de generación de resultados"
    (declare (salience -2))
    =>
    (focus generacion)
)

;; GENERACIÓN DE RESULTADOS

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

(defrule generacion::clasificar-validas "Clasifica las recomendaciones válidas en 'Muy recomendable', 'Adecuada' o 'Parcialmente adecuada'"
    ?hecho-validas <- (lista-validas (recomendaciones $?validas))
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

(defrule generacion::ordenar-adecuadas "Ordena las recomendaciones adecuadas"
    (clasificadas)
    ?hecho-adecuadas <- (lista-adecuadas (recomendaciones $?adecuadas))
    (test (eq TRUE (> (length$ $?adecuadas) 0)))
    (not (lista-adecuadas-ordenada))
    =>
    (bind ?adecuadas-ordenadas (sort rec-compare $?adecuadas))
    (modify ?hecho-adecuadas (recomendaciones ?adecuadas-ordenadas))
    (assert (lista-adecuadas-ordenada))
)

(defrule generacion::ordenar-parcialmente-adecuadas "Ordena las recomendaciones parcialmente adecuadas"
    (clasificadas)
    ?hecho-parcialmente-adecuadas <- (lista-parcialmente-adecuadas (recomendaciones $?parcialmente-adecuadas))
    (test (eq TRUE (> (length$ $?parcialmente-adecuadas) 0)))
    (not (lista-parcialmente-adecuadas-ordenada))
    =>
    (bind ?parcialmente-adecuadas-ordenadas (sort rec-compare $?parcialmente-adecuadas))
    (modify ?hecho-parcialmente-adecuadas (recomendaciones ?parcialmente-adecuadas-ordenadas))
    (assert (lista-parcialmente-adecuadas-ordenada))
)

(defrule generacion::ordenar-muy-recomendables "Ordena las recomendaciones muy recomendables"
    (clasificadas)
    ?hecho-muy-recomendables <- (lista-muy-recomendables (recomendaciones $?muy-recomendables))
    (test (eq TRUE (> (length$ $?muy-recomendables) 0)))
    (not (lista-muy-recomendables-ordenada))
    =>
    (bind ?muy-recomendables-ordenadas (sort rec-compare $?muy-recomendables))
    (modify ?hecho-muy-recomendables (recomendaciones ?muy-recomendables-ordenadas))
    (assert (lista-muy-recomendables-ordenada))
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