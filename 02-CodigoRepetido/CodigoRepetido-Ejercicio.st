!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 18:56:28'!
createCustomerBookWith: aName
	^CustomerBook new addCustomerNamed: aName .! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 20:59:01'!
executionTime: aClosure lessThan: numberOfMilliseconds

	^( aClosure millisecondsToRun ) < ( numberOfMilliseconds * millisecond )
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 21:01:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assert: (self executionTime: [ CustomerBook new addCustomerNamed: 'John Lennon' ] lessThan: 50) 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 21:00:02'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWith: paulMcCartney. 
	
	self assert: (self executionTime: [ customerBook removeCustomerNamed: paulMcCartney ] lessThan: 100 )
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 20:43:22'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
	customerBook := CustomerBook new.
	
	[ customerBook addCustomerNamed: ''.
	self fail ]
		ifError: [ :anErrorMessage | 
			self assert: anErrorMessage = ( 'Error: ' append: CustomerBook customerCanNotBeEmptyErrorMessage).
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 19:47:52'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := self createCustomerBookWith: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		ifError:
			[ self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Fr 4/30/2022 19:00:51'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWith: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2020 09:08:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 9/19/2018 17:57:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:31:22'!
addCustomerNamed: aName

	self nameIsEmpty: aName.
	self nameAlreadyExists: aName.
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:30:52'!
nameAlreadyExists: aName
	
	( self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:30:32'!
nameIsEmpty: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:33:56'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers .! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:34:41'!
removeCustomerNamed: aName

	active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [ ^NotFound signal .].].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:50:38'!
sendSignal: aSymbol

	self error: (aSymbol asMessage sendTo: self class).! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:51:02'!
signalCustomerAlreadyExists 

	self sendSignal: #customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:51:18'!
signalCustomerNameCannotBeEmpty 

	self sendSignal: #customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Fr 4/30/2022 20:45:59'!
suspendCustomerNamed: aName 
	
	suspended add: (active remove: aName ifAbsent: [^CantSuspend signal]).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'Fr 4/30/2022 20:41:48'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'Fr 4/30/2022 20:42:00'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
