!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'cantidadDePolillas cantidadDeHuevos cantidadDeOrugas'!

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 18:55:33'!
restarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:11:42'!
restarUnaPolilla
	cantidadDePolillas := cantidadDePolillas  - 1.! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/25/2022 18:02:46'!
retrocederAlInicioDeLosTiempos
	cantidadDeHuevos _ Dictionary new.
	#('Ornella' 'Oriana' 'Polly' 'Lara') do: [:nombreDePolilla | cantidadDeHuevos at: nombreDePolilla put: 0.].
	cantidadDeOrugas  := 0.
	cantidadDePolillas := 0.! !

!Habitat class methodsFor: 'acciones' stamp: 'FR 4/25/2022 18:36:55'!
sumarUnHuevoDeLara
	| cantidadActual |.
	cantidadActual := cantidadDeHuevos at: 'Lara'.
	cantidadDeHuevos at: 'Lara' put: (cantidadActual + 1).! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:35:06'!
sumarUnHuevoDeOriana
	| cantidadActual |.
	cantidadActual := cantidadDeHuevos at: 'Oriana'.
	cantidadDeHuevos at: 'Oriana' put: (cantidadActual + 1).! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:36:11'!
sumarUnHuevoDeOrnella
	| cantidadActual |.
	cantidadActual := cantidadDeHuevos at: 'Ornella'.
	cantidadDeHuevos at: 'Ornella' put: (cantidadActual + 1).! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:37:20'!
sumarUnHuevoDePolly
	| cantidadActual |.
	cantidadActual := cantidadDeHuevos at: 'Polly'.
	cantidadDeHuevos at: 'Polly' put: (cantidadActual + 1).! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 18:55:33'!
sumarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !

!Habitat class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:05:00'!
sumarUnaPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !


!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 20:44:05'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^cantidadDeHuevos at: 'Lara'.! !

!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 20:29:58'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^(cantidadDeHuevos at: 'Oriana') + (cantidadDeHuevos at: 'Ornella').! !

!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 20:29:31'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^(cantidadDeHuevos at: 'Oriana') + (cantidadDeHuevos at: 'Ornella').! !

!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 20:25:53'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevos at: 'Polly'.! !

!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 20:13:19'!
cantidadDeHuevosDeAvispas
	| cantidadesDeHuevos sum |
	cantidadesDeHuevos _ cantidadDeHuevos values.
	sum _ 0.
	cantidadesDeHuevos do: [ :anInteger | sum _ sum + anInteger ]. 
	^sum! !

!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 18:55:33'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!Habitat class methodsFor: 'cantidades' stamp: 'MBM 4/22/2022 19:05:33'!
cantidadDePolillas
	^cantidadDePolillas! !


!Habitat class methodsFor: 'sucesos' stamp: 'MBM 4/22/2022 21:48:57'!
laraRobaUnHuevo
	| nombresAvispas nombreAvispaConHuevos huevosAvispaConHuevos |
	nombresAvispas _ cantidadDeHuevos keys.
	nombreAvispaConHuevos _ nombresAvispas detect: [:nombreAvispa | ((cantidadDeHuevos at: nombreAvispa) > 0) and: ('Lara' isNotEqualTo: nombreAvispa )].
	huevosAvispaConHuevos _ cantidadDeHuevos at: nombreAvispaConHuevos.
	cantidadDeHuevos at: nombreAvispaConHuevos put: (huevosAvispaConHuevos - 1).! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'FR 4/25/2022 18:38:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDePolillas := 0.
	cantidadDeHuevos := ((Dictionary new) add: ('Lara'->0); add: ('Oriana'->0); add: ('Ornella'->0); add: ('Polly'->0); yourself).
	cantidadDeOrugas := 0.! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: ''!

!LaAvispaLara class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 21:38:05'!
intentarReproducirse
	self verSiHayHuevosDeOtrasAvispas ifTrue: [
		Habitat laraRobaUnHuevo.
		Habitat sumarUnHuevoDeLara.
	]! !

!LaAvispaLara class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 20:50:21'!
verSiHayHuevosDeOtrasAvispas
	^(Habitat cantidadDeHuevosDeAvispas) - (Habitat cantidadDeHuevosConLaFirmaGeneticaDeLara) > 0.! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: ''!

!LaAvispaOriana class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:37:37'!
intentarReproducirse
	Habitat cantidadDeOrugas > 0 ifTrue: [
		Habitat restarUnaOruga.
		Habitat sumarUnHuevoDeOriana .
	]! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOrnella class' category: 'AvispasYAbejasParte2'!
LaAvispaOrnella class
	instanceVariableNames: ''!

!LaAvispaOrnella class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:37:54'!
intentarReproducirse
	Habitat cantidadDeOrugas > 0 ifTrue: [
		Habitat restarUnaOruga.
		Habitat sumarUnHuevoDeOrnella.
	]! !


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: ''!

!LaAvispaPolly class methodsFor: 'acciones' stamp: 'MBM 4/22/2022 19:38:06'!
intentarReproducirse
	Habitat cantidadDePolillas > 0 ifTrue: [
		Habitat restarUnaPolilla.
		Habitat sumarUnHuevoDePolly.
	]! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MBM 4/22/2022 20:33:17'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MBM 4/22/2022 20:33:17'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MBM 4/22/2022 20:33:17'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'MBM 4/22/2022 20:33:17'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'MBM 4/22/2022 20:33:17'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MBM 4/22/2022 21:44:45'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes. 
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MBM 4/22/2022 20:32:59'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MBM 4/22/2022 20:33:17'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'MBM 4/22/2022 20:33:05'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 20:43:45'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:41:39'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 20:28:57'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 20:27:01'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/21/2022 19:53:24'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:41:29'!
hacerQueElHabitatTengaLosRecursosSuficientes
	2 timesRepeat: [
		self habitat  sumarUnaPolilla.
		self habitat sumarUnaOruga.
	].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 20:32:17'!
laAvispaLara
	^LaAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/21/2022 19:55:42'!
laAvispaOriana
	^LaAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/21/2022 20:53:29'!
laAvispaOrnella
	^LaAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 20:33:17'!
laAvispaPolly
	^LaAvispaPolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:42:07'!
queElHabitatTengaDosOrugasMas
	2 timesRepeat: [self habitat sumarUnaOruga].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:42:15'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat: [self habitat sumarUnaPolilla.].
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:42:21'!
queElHabitatTengaUnaOrugaMas
	self habitat sumarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:42:28'!
queElHabitatTengaUnaPolillaMas
	self habitat sumarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MBM 4/22/2022 19:42:34'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederAlInicioDeLosTiempos.! !

Habitat initializeAfterFileIn!