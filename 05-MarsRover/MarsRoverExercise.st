!classDefinition: #MarsRoverTest category: 'MarsRoverExercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:01'!
test01MarsRoverFacingNorthEndsFacingEastWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'E' equals: marsRover orientation.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:09'!
test02MarsRoverFacingEastEndsFacingSouthWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'S' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:15'!
test03MarsRoverFacingSouthEndsFacingWestWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'W' equals: marsRover orientation.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:19'!
test04MarsRoverFacingWestEndsFacingNorthWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'N' equals: marsRover orientation.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:23'!
test05MarsRoverFacingNorthEndsFacingWestWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'W' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:27'!
test06MarsRoverFacingWestEndsFacingSouthWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'S' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:31'!
test07MarsRoverFacingSouthEndsFacingEastWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'E' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:35'!
test08MarsRoverFacingEastEndsFacingNorthWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'N' equals: marsRover orientation.
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:11:39'!
test09MarsRoverFacingNorthAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: 0@1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:10:37'!
test10MarsRoverFacingEastAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: 1@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:18:30'!
test11MarsRoverFacingSouthAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: 0@-1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:18:48'!
test12MarsRoverFacingWestAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: -1@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:20:00'!
test13MarsRoverFacingNorthAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: 0@-1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:22:12'!
test14MarsRoverFacingEastAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: -1@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:24:02'!
test15MarsRoverFacingSouthAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: 0@1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:24:54'!
test16MarsRoverFacingWestAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: 1@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 20:34:23'!
test17CanNotSendInvalidCommandToMarsRover
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	self
		should: [	marsRover processAStringOfCommands: '#']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: MarsRover invalidCommandErrorDescription equals: anError messageText ]! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:04:46'!
test18MarsRoverFacingNorthAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: 0@2 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:02:20'!
test19MarsRoverFacingEastAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: 2@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:02:55'!
test20MarsRoverFacingSouthAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: 0@-2 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:03:39'!
test21MarsRoverFacingWestAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: -2@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:05:24'!
test22MarsRoverFacingNorthAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: 0@-2 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:06:48'!
test23MarsRoverFacingEastAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: -2@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:07:09'!
test24MarsRoverFacingSouthAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: 0@2 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:07:26'!
test25MarsRoverFacingWestAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: 2@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/1/2022 22:19:05'!
test26AStringWithMoreThanOneCommandIsProcessedCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'ffrb'.
	self assert: -1@2 equals: marsRover position.! !


!classDefinition: #MarsRover category: 'MarsRoverExercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'private' stamp: 'MBM 6/1/2022 20:12:53'!
initializeAtPosition: aPoint facingTowards: aString 
	position := aPoint.
	orientation := aString.! !


!MarsRover methodsFor: 'public' stamp: 'MBM 6/1/2022 20:12:53'!
orientation
	^orientation! !

!MarsRover methodsFor: 'public' stamp: 'MBM 6/1/2022 20:13:02'!
position
	^position.! !

!MarsRover methodsFor: 'public' stamp: 'MBM 6/1/2022 22:46:47'!
processACommand: aChar	
	aChar = $r ifTrue: [
		orientation = 'N' ifTrue: [^orientation _ 'E'].
		orientation = 'E' ifTrue: [^orientation _ 'S'].
		orientation = 'S' ifTrue: [^orientation _ 'W'].
		orientation = 'W' ifTrue: [^orientation _ 'N'].
	].
	aChar = $l ifTrue: [
		orientation = 'N' ifTrue: [^orientation _ 'W'].
		orientation = 'W' ifTrue: [^orientation _ 'S'].
		orientation = 'S' ifTrue: [^orientation _ 'E'].
		orientation = 'E' ifTrue: [^orientation _ 'N'].
	].
	aChar = $f ifTrue: [
		orientation = 'N' ifTrue: [^position _ position + (0@1)].
		orientation = 'E' ifTrue: [^position _ position + (1@0)].
		orientation = 'S' ifTrue: [^position _ position + (0@-1)].
		orientation = 'W' ifTrue: [^position _ position + (-1@0)].
	].
	aChar = $b ifTrue: [
		orientation = 'N' ifTrue: [^position _ position + (0@-1)].
		orientation = 'E' ifTrue: [^position _ position + (-1@0)].
		orientation = 'S' ifTrue: [^position _ position + (0@1)].
		orientation = 'W' ifTrue: [^position _ position + (1@0)].
	].
	self error: self class invalidCommandErrorDescription.! !

!MarsRover methodsFor: 'public' stamp: 'MBM 6/1/2022 22:46:28'!
processAStringOfCommands: aStringOfCommands 
	aStringOfCommands do: [ :aChar | self processACommand: aChar	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'MBM 6/1/2022 19:56:11'!
atPosition: aPoint facingTowards: aString
	^self new initializeAtPosition: aPoint facingTowards: aString ! !


!MarsRover class methodsFor: 'errors' stamp: 'MBM 6/1/2022 22:57:44'!
invalidCommandErrorDescription
	^'An invalid command was found.'! !
