!classDefinition: #MarsRoverTest category: 'MarsRoverExercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'MBM 6/1/2022 20:11:01'!
test01MarsRoverFacingNorthEndsFacingEastWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'E' equals: marsRover orientation.
	! !

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'MBM 6/1/2022 20:11:09'!
test02MarsRoverFacingEastEndsFacingSouthWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'S' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'MBM 6/1/2022 20:11:15'!
test03MarsRoverFacingSouthEndsFacingWestWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'W' equals: marsRover orientation.! !

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'MBM 6/1/2022 20:11:19'!
test04MarsRoverFacingWestEndsFacingNorthWhenRotatedRight
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'r'.
	self assert: 'N' equals: marsRover orientation.! !


!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'MBM 6/1/2022 20:11:23'!
test05MarsRoverFacingNorthEndsFacingWestWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'W' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'MBM 6/1/2022 20:11:27'!
test06MarsRoverFacingWestEndsFacingSouthWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'S' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'MBM 6/1/2022 20:11:31'!
test07MarsRoverFacingSouthEndsFacingEastWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'E' equals: marsRover orientation.
	
	! !

!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'MBM 6/1/2022 20:11:35'!
test08MarsRoverFacingEastEndsFacingNorthWhenRotatedLeft
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'l'.
	self assert: 'N' equals: marsRover orientation.
	! !


!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'MBM 6/1/2022 20:11:39'!
test09MarsRoverFacingNorthAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: 0@1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'MBM 6/1/2022 20:10:37'!
test10MarsRoverFacingEastAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: 1@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'MBM 6/1/2022 20:18:30'!
test11MarsRoverFacingSouthAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: 0@-1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'MBM 6/1/2022 20:18:48'!
test12MarsRoverFacingWestAtOriginMovesForwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'f'.
	self assert: -1@0 equals: marsRover position.
	
	! !


!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'MBM 6/1/2022 20:20:00'!
test13MarsRoverFacingNorthAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: 0@-1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'MBM 6/1/2022 20:22:12'!
test14MarsRoverFacingEastAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: -1@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'MBM 6/1/2022 20:24:02'!
test15MarsRoverFacingSouthAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: 0@1 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'MBM 6/1/2022 20:24:54'!
test16MarsRoverFacingWestAtOriginMovesBackwardsCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	marsRover processAStringOfCommands: 'b'.
	self assert: 1@0 equals: marsRover position.
	
	! !


!MarsRoverTest methodsFor: '17 invalid command' stamp: 'MBM 6/2/2022 00:06:54'!
test17CanNotSendInvalidCommandToMarsRover
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	self
		should: [	marsRover processAStringOfCommands: '#']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: MarsRoverCommand invalidCommandErrorDescription equals: anError messageText ]! !


!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'MBM 6/1/2022 22:04:46'!
test18MarsRoverFacingNorthAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: 0@2 equals: marsRover position.! !

!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'MBM 6/1/2022 22:02:20'!
test19MarsRoverFacingEastAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: 2@0 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'MBM 6/1/2022 22:02:55'!
test20MarsRoverFacingSouthAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: 0@-2 equals: marsRover position.
	
	! !

!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'MBM 6/1/2022 22:03:39'!
test21MarsRoverFacingWestAtOriginMovesForwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'f'].
	self assert: -2@0 equals: marsRover position.
	
	! !


!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'MBM 6/1/2022 22:05:24'!
test22MarsRoverFacingNorthAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'N'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: 0@-2 equals: marsRover position.! !

!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'MBM 6/1/2022 22:06:48'!
test23MarsRoverFacingEastAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'E'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: -2@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'MBM 6/1/2022 22:07:09'!
test24MarsRoverFacingSouthAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'S'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: 0@2 equals: marsRover position.! !

!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'MBM 6/1/2022 22:07:26'!
test25MarsRoverFacingWestAtOriginMovesBackwardsMultipleTimesCorrectly
	| marsRover |
	marsRover _ MarsRover atPosition: 0@0 facingTowards: 'W'.
	
	2 timesRepeat: [marsRover processAStringOfCommands: 'b'].
	self assert: 2@0 equals: marsRover position.! !


!MarsRoverTest methodsFor: '26 multiple commands in one string' stamp: 'MBM 6/1/2022 22:19:05'!
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

!MarsRover methodsFor: 'private' stamp: 'MBM 6/2/2022 00:35:26'!
faceTowards: aString
	orientation _ MarsRoverOrientation with: aString.! !

!MarsRover methodsFor: 'private' stamp: 'MBM 6/2/2022 00:35:22'!
initializeAtPosition: aPoint facingTowards: aString
	position _ aPoint.
	self faceTowards: aString.! !

!MarsRover methodsFor: 'private' stamp: 'MBM 6/1/2022 23:26:56'!
moveTowards: aPoint
	position _ position + aPoint.! !


!MarsRover methodsFor: 'public' stamp: 'MBM 6/2/2022 00:36:07'!
orientation
	^orientation representation! !

!MarsRover methodsFor: 'public' stamp: 'MBM 6/1/2022 20:13:02'!
position
	^position.! !

!MarsRover methodsFor: 'public' stamp: 'MBM 6/2/2022 01:07:49'!
processAStringOfCommands: aStringOfCommands 
	aStringOfCommands do: [ :aChar | (MarsRoverCommand with: aChar)	 beExcutedBy: self ].! !


!MarsRover methodsFor: 'command - private' stamp: 'MBM 6/2/2022 00:51:45'!
moveBackwards
	orientation moveBackwards: self.! !

!MarsRover methodsFor: 'command - private' stamp: 'MBM 6/2/2022 00:54:58'!
moveForwards
	orientation moveForwards: self.! !

!MarsRover methodsFor: 'command - private' stamp: 'MBM 6/2/2022 00:57:51'!
rotateLeft
	orientation rotateLeft: self.! !

!MarsRover methodsFor: 'command - private' stamp: 'MBM 6/2/2022 00:58:03'!
rotateRight
	orientation rotateRight: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'MBM 6/1/2022 19:56:11'!
atPosition: aPoint facingTowards: aString
	^self new initializeAtPosition: aPoint facingTowards: aString ! !


!classDefinition: #MarsRoverCommand category: 'MarsRoverExercise'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverCommand methodsFor: 'public' stamp: 'MBM 6/2/2022 00:48:33'!
beExcutedBy: aMarsRover	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRoverExercise'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'instance creation - private' stamp: 'MBM 6/2/2022 00:04:20'!
character
	self subclassResponsibility.! !

!MarsRoverCommand class methodsFor: 'instance creation - private' stamp: 'MBM 6/1/2022 23:57:08'!
with: aChar
	self subclasses detect: [ :aSubclass | aSubclass canInstantiateWith: aChar] ifFound: [ :aSubclass | ^aSubclass new ] ifNone: [ self error: self invalidCommandErrorDescription ].! !


!MarsRoverCommand class methodsFor: 'public' stamp: 'MBM 6/1/2022 23:43:48'!
canInstantiateWith: aChar
	self subclassResponsibility.! !


!MarsRoverCommand class methodsFor: 'errors' stamp: 'MBM 6/1/2022 23:43:13'!
invalidCommandErrorDescription
	^'An invalid command was found.'! !


!classDefinition: #MarsRoverCommandBackwards category: 'MarsRoverExercise'!
MarsRoverCommand subclass: #MarsRoverCommandBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverCommandBackwards methodsFor: 'public' stamp: 'MBM 6/2/2022 01:07:02'!
beExcutedBy: aMarsRover	
	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommandBackwards class' category: 'MarsRoverExercise'!
MarsRoverCommandBackwards class
	instanceVariableNames: ''!

!MarsRoverCommandBackwards class methodsFor: 'instance creation - private' stamp: 'MBM 6/1/2022 23:49:48'!
character
	^$b! !


!MarsRoverCommandBackwards class methodsFor: 'public' stamp: 'MBM 6/1/2022 23:49:59'!
canInstantiateWith: aChar
	^self character = aChar.! !


!classDefinition: #MarsRoverCommandForwards category: 'MarsRoverExercise'!
MarsRoverCommand subclass: #MarsRoverCommandForwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverCommandForwards methodsFor: 'public' stamp: 'MBM 6/2/2022 01:07:06'!
beExcutedBy: aMarsRover		
	aMarsRover moveForwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommandForwards class' category: 'MarsRoverExercise'!
MarsRoverCommandForwards class
	instanceVariableNames: ''!

!MarsRoverCommandForwards class methodsFor: 'instance creation - private' stamp: 'MBM 6/1/2022 23:50:48'!
character
	^$f! !


!MarsRoverCommandForwards class methodsFor: 'public' stamp: 'MBM 6/1/2022 23:50:55'!
canInstantiateWith: aChar
	^self character = aChar.! !


!classDefinition: #MarsRoverCommandLeft category: 'MarsRoverExercise'!
MarsRoverCommand subclass: #MarsRoverCommandLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverCommandLeft methodsFor: 'public' stamp: 'MBM 6/2/2022 01:07:10'!
beExcutedBy: aMarsRover		
	aMarsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommandLeft class' category: 'MarsRoverExercise'!
MarsRoverCommandLeft class
	instanceVariableNames: ''!

!MarsRoverCommandLeft class methodsFor: 'instance creation - private' stamp: 'MBM 6/1/2022 23:51:03'!
character
	^$l! !


!MarsRoverCommandLeft class methodsFor: 'public' stamp: 'MBM 6/1/2022 23:51:08'!
canInstantiateWith: aChar
	^self character = aChar.! !


!classDefinition: #MarsRoverCommandRight category: 'MarsRoverExercise'!
MarsRoverCommand subclass: #MarsRoverCommandRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverCommandRight methodsFor: 'public' stamp: 'MBM 6/2/2022 01:07:14'!
beExcutedBy: aMarsRover
	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommandRight class' category: 'MarsRoverExercise'!
MarsRoverCommandRight class
	instanceVariableNames: ''!

!MarsRoverCommandRight class methodsFor: 'instance creation - private' stamp: 'MBM 6/1/2022 23:51:14'!
character
	^$r! !


!MarsRoverCommandRight class methodsFor: 'public' stamp: 'MBM 6/1/2022 23:51:19'!
canInstantiateWith: aChar
	^self character = aChar.! !


!classDefinition: #MarsRoverOrientation category: 'MarsRoverExercise'!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: 'symbol direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverOrientation methodsFor: 'public' stamp: 'MBM 6/2/2022 00:49:43'!
moveBackwards: aMarsRover
	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'public' stamp: 'MBM 6/2/2022 00:52:55'!
moveForwards: aMarsRover
	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'public' stamp: 'MBM 6/2/2022 01:00:31'!
representation
	^symbol asString! !

!MarsRoverOrientation methodsFor: 'public' stamp: 'MBM 6/2/2022 01:12:00'!
rotateLeft: aMarsRover
	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'public' stamp: 'MBM 6/2/2022 01:12:04'!
rotateRight: aMarsRover
	self subclassResponsibility ! !


!MarsRoverOrientation methodsFor: 'instance creation - private' stamp: 'MBM 6/2/2022 00:37:03'!
initialize
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientation class' category: 'MarsRoverExercise'!
MarsRoverOrientation class
	instanceVariableNames: ''!

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:32:23'!
canInstantiateWith: aString
	self subclassResponsibility ! !

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:18:11'!
invalidOrientationErrorDescription
	^'invalid orientation'! !

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:38:08'!
with: aString
	self subclasses detect: [ :aSubclass | aSubclass canInstantiateWith: aString] ifFound: [ :aSubclass | ^aSubclass new ] ifNone: [ self error: self invalidOrientationErrorDescription ].! !


!classDefinition: #MarsRoverOrientationEast category: 'MarsRoverExercise'!
MarsRoverOrientation subclass: #MarsRoverOrientationEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverOrientationEast methodsFor: 'instance creation - private' stamp: 'MBM 6/2/2022 01:00:31'!
initialize
	symbol _ #E.
	direction _ (1@0).! !


!MarsRoverOrientationEast methodsFor: 'public' stamp: 'MBM 6/2/2022 00:49:43'!
moveBackwards: aMarsRover
	aMarsRover moveTowards: direction negated! !

!MarsRoverOrientationEast methodsFor: 'public' stamp: 'MBM 6/2/2022 00:52:47'!
moveForwards: aMarsRover
	aMarsRover moveTowards: direction! !

!MarsRoverOrientationEast methodsFor: 'public' stamp: 'MBM 6/2/2022 00:56:27'!
rotateLeft: aMarsRover
	^aMarsRover faceTowards: 'N'! !

!MarsRoverOrientationEast methodsFor: 'public' stamp: 'MBM 6/2/2022 00:58:20'!
rotateRight: aMarsRover
	^aMarsRover faceTowards: 'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationEast class' category: 'MarsRoverExercise'!
MarsRoverOrientationEast class
	instanceVariableNames: ''!

!MarsRoverOrientationEast class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:32:33'!
canInstantiateWith: aString
	^#E = aString asSymbol! !


!classDefinition: #MarsRoverOrientationNorth category: 'MarsRoverExercise'!
MarsRoverOrientation subclass: #MarsRoverOrientationNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverOrientationNorth methodsFor: 'instance creation - private' stamp: 'MBM 6/2/2022 01:00:31'!
initialize
	symbol _ #N.
	direction _ (0@1).! !


!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:53:26'!
moveBackwards: aMarsRover
	aMarsRover moveTowards: direction negated! !

!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:53:10'!
moveForwards: aMarsRover
	aMarsRover moveTowards: direction ! !

!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:56:10'!
rotateLeft: aMarsRover
	^aMarsRover faceTowards: 'W'! !

!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:58:29'!
rotateRight: aMarsRover
	^aMarsRover faceTowards: 'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationNorth class' category: 'MarsRoverExercise'!
MarsRoverOrientationNorth class
	instanceVariableNames: ''!

!MarsRoverOrientationNorth class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:32:39'!
canInstantiateWith: aString
	^#N = aString asSymbol! !


!classDefinition: #MarsRoverOrientationSouth category: 'MarsRoverExercise'!
MarsRoverOrientation subclass: #MarsRoverOrientationSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverOrientationSouth methodsFor: 'instance creation - private' stamp: 'MBM 6/2/2022 01:00:31'!
initialize
	symbol _ #S.
	direction _ (0@-1).! !


!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:49:43'!
moveBackwards: aMarsRover
	aMarsRover moveTowards: direction negated! !

!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:53:36'!
moveForwards: aMarsRover
	aMarsRover moveTowards: direction! !

!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:56:33'!
rotateLeft: aMarsRover
	^aMarsRover faceTowards: 'E'! !

!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'MBM 6/2/2022 00:58:39'!
rotateRight: aMarsRover
	^aMarsRover faceTowards: 'W'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationSouth class' category: 'MarsRoverExercise'!
MarsRoverOrientationSouth class
	instanceVariableNames: ''!

!MarsRoverOrientationSouth class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:32:45'!
canInstantiateWith: aString
	^#S = aString asSymbol! !


!classDefinition: #MarsRoverOrientationWest category: 'MarsRoverExercise'!
MarsRoverOrientation subclass: #MarsRoverOrientationWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverOrientationWest methodsFor: 'instance creation - private' stamp: 'MBM 6/2/2022 01:00:31'!
initialize
	symbol _ #W.
	direction _ (-1@0).! !


!MarsRoverOrientationWest methodsFor: 'public' stamp: 'MBM 6/2/2022 00:49:43'!
moveBackwards: aMarsRover
	aMarsRover moveTowards: direction negated! !

!MarsRoverOrientationWest methodsFor: 'public' stamp: 'MBM 6/2/2022 00:53:47'!
moveForwards: aMarsRover
	aMarsRover moveTowards: direction! !

!MarsRoverOrientationWest methodsFor: 'public' stamp: 'MBM 6/2/2022 00:56:41'!
rotateLeft: aMarsRover
	^aMarsRover faceTowards: 'S'! !

!MarsRoverOrientationWest methodsFor: 'public' stamp: 'MBM 6/2/2022 00:58:49'!
rotateRight: aMarsRover
	^aMarsRover faceTowards: 'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationWest class' category: 'MarsRoverExercise'!
MarsRoverOrientationWest class
	instanceVariableNames: ''!

!MarsRoverOrientationWest class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:32:51'!
canInstantiateWith: aString
	^#W = aString asSymbol! !
