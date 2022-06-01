!classDefinition: #MarsRoverTest category: 'MarsRoverExercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 19:48:11'!
test01SendingOneForwardCommandMakesMarsRoverMoveForwardsOneTime
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'f'.
	self assert: 0@1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 19:48:04'!
test02SendingOneForwardCommandMoreThanOnceMakesMarsRoverMoveForwardsThatAmountOfTimes
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	2 timesRepeat: [marsRover processCommands: 'f'].
	self assert: 0@2 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 20:02:21'!
test03SendingMoreThanOneForwardCommandMakesMarsRoverMoveForwardsThatAmountOfTimes
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'ff'.
	self assert: 0@2 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 19:56:34'!
test04SendingThreeForwardCommandsMakesMarsRoverMoveForwardsThreeTimes
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'fff'.
	self assert: 0@3 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 20:04:00'!
test05
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'b'.
	self assert: 0@-1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 20:10:22'!
test06
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	2 timesRepeat: [marsRover processCommands: 'b'.].
	self assert: 0@-2 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 20:35:19'!
test07
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'bb'.
	self assert: 0@-2 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 20:40:32'!
test08
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'fb'.
	self assert: 0@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 21:00:05'!
test09
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'l'.
	self assert: 'W' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 5/31/2022 21:00:15'!
test10
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processCommands: 'r'.
	self assert: 'E' equals: marsRover orientation.
	
	! !


!classDefinition: #MarsRover category: 'MarsRoverExercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'private' stamp: 'MBM 5/31/2022 20:53:11'!
m1: aPoint

	position _ position + aPoint.! !


!MarsRover methodsFor: '1' stamp: 'MBM 5/31/2022 19:29:07'!
initializeAtPosition: aPoint facingTowards: aString 
	position := aPoint.
	orientation := aString.! !

!MarsRover methodsFor: '1' stamp: 'MBM 5/31/2022 21:00:55'!
orientation
	^orientation.! !

!MarsRover methodsFor: '1' stamp: 'MBM 5/31/2022 19:43:50'!
position
	^position.! !

!MarsRover methodsFor: '1' stamp: 'MBM 5/31/2022 21:03:34'!
processCommands: aString
	aString do: [ :aChar | 
		aChar = $b ifTrue: [self m1: (0@-1)].
		aChar = $f ifTrue: [self m1: (0@1)].
		aChar = $l ifTrue: [orientation _ 'W'].
		aChar = $r ifTrue: [orientation _ 'E'] ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'MBM 5/31/2022 19:25:46'!
atPosition: aPoint facingTowards: aString 
	^self new initializeAtPosition: aPoint facingTowards: aString ! !
