!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:16:21'!
test01MarsRoverStartsInTheCenterFacingNorth
	| marsRover |
	marsRover _ MarsRover new.
	
	self assert: 0@0 equals: marsRover position.
	self assert: 'N' equals: marsRover orientation.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:16:56'!
test02MovingMarsRoverForwardChangesThePositionCorrectly
	| marsRover |
	marsRover _ MarsRover new.
	marsRover move: 'f'.
	
	self assert: 0@1 equals: marsRover position.
	self assert: 'N' equals: marsRover orientation.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:20:31'!
test03MovingMarsRoverBackwardsChangesThePositionCorrectly
	| marsRover |
	marsRover _ MarsRover new.
	marsRover move: 'b'.
	
	self assert: 0@-1 equals: marsRover position.
	self assert: 'N' equals: marsRover orientation.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:17:37'!
test04MarsRoverOrientationIsEastWhenRotatedRightOnStart
	| marsRover |
	marsRover _ MarsRover new.
	marsRover move: 'r'.
	
	self assert: 0@0 equals: marsRover position.
	self assert: 'E' equals: marsRover orientation.
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:20:09'!
test05MarsRoverOrientationIsWestWhenRotatedLeftOnStart
	| marsRover |
	marsRover _ MarsRover new.
	marsRover move: 'l'.
	
	self assert: 0@0 equals: marsRover position.
	self assert: 'W' equals: marsRover orientation.
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:24:18'!
test06MarsRoverOrientationIsSouthWhenRotated2TimesInTheSameDirectionOnStart
	| marsRover |
	marsRover _ MarsRover new.
	2 timesRepeat: [marsRover move: 'l'.].
	
	self assert: 0@0 equals: marsRover position.
	self assert: 'S' equals: marsRover orientation.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'hola' stamp: 'FR 5/29/2022 23:33:20'!
initialize
	position _ MarsRoverPosition at: 0@0.
	orientation _ MarsRoverOrientation at: 'N'.! !

!MarsRover methodsFor: 'hola' stamp: 'FR 5/29/2022 23:44:47'!
move: aString
	(aString = 'f' or: aString = 'b') ifTrue: [
		"position _ position + (0@1)."
		position moveTowards: aString].
	(aString = 'l' or: aString = 'r') ifTrue: [
		orientation _ 'W'].
	aString = 'r' ifTrue: [
		orientation _ 'E'].
	aString = 'b' ifTrue: [
		position _ position + (0@-1).].! !

!MarsRover methodsFor: 'hola' stamp: 'FR 5/29/2022 23:38:52'!
orientation
	^orientation value.! !

!MarsRover methodsFor: 'hola' stamp: 'FR 5/29/2022 23:38:40'!
position
	^position value.! !


!classDefinition: #MarsRoverOrientation category: 'MarsRover'!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: 'orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientation methodsFor: 'private' stamp: 'FR 5/29/2022 23:35:49'!
towards: anOrientationAsCharacter.
	orientation _ anOrientationAsCharacter.! !

!MarsRoverOrientation methodsFor: 'private' stamp: 'FR 5/29/2022 23:39:05'!
value
	^orientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientation class' category: 'MarsRover'!
MarsRoverOrientation class
	instanceVariableNames: ''!

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:36:01'!
at: anOrientationAsCharacter
	^ self new towards: anOrientationAsCharacter.! !


!classDefinition: #MarsRoverPosition category: 'MarsRover'!
Object subclass: #MarsRoverPosition
	instanceVariableNames: 'point'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverPosition methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:38:05'!
mmm: aStartingPosition
	point _ aStartingPosition.! !

!MarsRoverPosition methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:39:15'!
value
	^ point.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPosition class' category: 'MarsRover'!
MarsRoverPosition class
	instanceVariableNames: ''!

!MarsRoverPosition class methodsFor: 'as yet unclassified' stamp: 'FR 5/29/2022 23:37:12'!
at: aStartingPoint
	^ self new mmm: aStartingPoint.! !
