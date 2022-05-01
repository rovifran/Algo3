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

!CustomerBookTest methodsFor: 'aux' stamp: 'FR 5/1/2022 18:27:41'!
assertErrorMessage: anErrorMessage withNumberOfCustomers: aNumberOfCustomers of: aCustomerBook

	self assert: anErrorMessage messageText = CustomerBook customerCanNotBeEmptyErrorMessage. 
	self assert: aCustomerBook numberOfCustomers = aNumberOfCustomers ! !

!CustomerBookTest methodsFor: 'aux' stamp: 'FR 5/1/2022 17:53:19'!
assertNumberOfCustomers: total active: numberOfActive suspended: numberOfSuspended of: aCustomerBook.

	self assert: numberOfActive equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspended equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: total equals: aCustomerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'aux' stamp: 'FR 5/1/2022 17:11:52'!
assertSizeOfCustomerBook: aNumberOfCustomers with: aName in: aCustomerBook
	self assert: ( ( aCustomerBook numberOfCustomers = aNumberOfCustomers ) and: ( aCustomerBook includesCustomerNamed: aName ) ).
! !

!CustomerBookTest methodsFor: 'aux' stamp: 'Fr 4/30/2022 18:56:28'!
createCustomerBookWith: aName
	^CustomerBook new addCustomerNamed: aName .! !

!CustomerBookTest methodsFor: 'aux' stamp: 'FR 5/1/2022 17:03:56'!
createCustomerBookWithSuspended: aName
	
	| customerBook |
	customerBook  := self createCustomerBookWith: aName.
	customerBook suspendCustomerNamed: aName.
	^customerBook! !

!CustomerBookTest methodsFor: 'aux' stamp: 'FR 5/1/2022 18:41:37'!
executionTimeInMilliseconds: aClosure lessThan: numberOfMilliseconds

	^( aClosure millisecondsToRun ) < ( numberOfMilliseconds * millisecond )
	! !


!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 18:41:49'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assert: (self executionTimeInMilliseconds: [ CustomerBook new addCustomerNamed: 'John Lennon' ] lessThan: 50) 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 18:41:55'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWith: paulMcCartney. 
	
	self assert: (self executionTimeInMilliseconds: [ customerBook removeCustomerNamed: paulMcCartney ] lessThan: 100 )
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 18:40:29'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
	customerBook := CustomerBook new.
	
	self should: [ customerBook addCustomerNamed: ''.] raise: Error withExceptionDo: [ :anErrorMessage | 
			self assertErrorMessage: anErrorMessage withNumberOfCustomers: 0 of: customerBook ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 18:30:21'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := self createCustomerBookWith: johnLennon.
	
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney'. ] raise: NotFound withExceptionDo:
		[ :anErrorMessage |  self assertSizeOfCustomerBook: 1 with: johnLennon in: customerBook  ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 17:54:11'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithSuspended: paulMcCartney.
	
	self assertNumberOfCustomers: 1 active: 0 suspended: 1 of: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 17:54:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook  := self createCustomerBookWithSuspended: paulMcCartney .
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfCustomers: 0 active: 0 suspended: 0 of: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney) not.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 18:39:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWith: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr'. ] raise: CantSuspend withExceptionDo:
		[:anError | self assertSizeOfCustomerBook: 1 with: johnLennon in: customerBook  ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FR 5/1/2022 18:39:06'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithSuspended: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: johnLennon. ] raise: CantSuspend withExceptionDo:
		[:anError | self assertSizeOfCustomerBook: 1 with: johnLennon in: customerBook  ]! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'FR 5/1/2022 18:01:06'!
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
