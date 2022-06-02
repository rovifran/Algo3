!classDefinition: #MarsRoverTest category: 'MarsRoverExercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverAtOriginFacingNorth marsRoverAtOriginFacingEast marsRoverAtOriginFacingSouth marsRoverAtOriginFacingWest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'FR 6/2/2022 12:05:31'!
test01MarsRoverFacingNorthEndsFacingEastWhenRotatedRight
	
	marsRoverAtOriginFacingNorth processAStringOfCommands: 'r'.
	self assert: (marsRoverAtOriginFacingNorth isFacing: 'E')
	! !

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'FR 6/2/2022 12:06:14'!
test02MarsRoverFacingEastEndsFacingSouthWhenRotatedRight
	
	marsRoverAtOriginFacingEast processAStringOfCommands: 'r'.
	self assert: (marsRoverAtOriginFacingEast isFacing: 'S')
	
	! !

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'FR 6/2/2022 12:06:20'!
test03MarsRoverFacingSouthEndsFacingWestWhenRotatedRight
	
	marsRoverAtOriginFacingSouth processAStringOfCommands: 'r'.
	self assert: (marsRoverAtOriginFacingSouth isFacing: 'W')! !

!MarsRoverTest methodsFor: '01-04 rotate right' stamp: 'FR 6/2/2022 12:06:34'!
test04MarsRoverFacingWestEndsFacingNorthWhenRotatedRight
	
	marsRoverAtOriginFacingWest processAStringOfCommands: 'r'.
	self assert: (marsRoverAtOriginFacingWest isFacing: 'N')! !


!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'FR 6/2/2022 12:06:48'!
test05MarsRoverFacingNorthEndsFacingWestWhenRotatedLeft

	marsRoverAtOriginFacingNorth processAStringOfCommands: 'l'.
	self assert: (marsRoverAtOriginFacingNorth isFacing: 'W')
	
	! !

!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'FR 6/2/2022 12:07:11'!
test06MarsRoverFacingWestEndsFacingSouthWhenRotatedLeft
	
	marsRoverAtOriginFacingWest processAStringOfCommands: 'l'.
	self assert: (marsRoverAtOriginFacingWest isFacing: 'S')
	
	! !

!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'FR 6/2/2022 12:07:25'!
test07MarsRoverFacingSouthEndsFacingEastWhenRotatedLeft
	
	marsRoverAtOriginFacingSouth processAStringOfCommands: 'l'.
	self assert: (marsRoverAtOriginFacingSouth isFacing: 'E')
	
	! !

!MarsRoverTest methodsFor: '05-08 rotate left' stamp: 'FR 6/2/2022 12:07:37'!
test08MarsRoverFacingEastEndsFacingNorthWhenRotatedLeft
	
	marsRoverAtOriginFacingEast processAStringOfCommands: 'l'.
	self assert: (marsRoverAtOriginFacingEast isFacing: 'N')
	! !


!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'FR 6/2/2022 12:09:08'!
test09MarsRoverFacingNorthAtOriginMovesForwardsCorrectly
	
	marsRoverAtOriginFacingNorth processAStringOfCommands: 'f'.
	self assert: (marsRoverAtOriginFacingNorth isInPosition: (0@1)).
	
	! !

!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'FR 6/2/2022 12:10:35'!
test10MarsRoverFacingEastAtOriginMovesForwardsCorrectly
	
	marsRoverAtOriginFacingEast processAStringOfCommands: 'f'.
	self assert: (marsRoverAtOriginFacingEast isInPosition: (1@0)). 
	
	! !

!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'FR 6/2/2022 12:11:04'!
test11MarsRoverFacingSouthAtOriginMovesForwardsCorrectly
	
	marsRoverAtOriginFacingSouth processAStringOfCommands: 'f'.
	self assert: (marsRoverAtOriginFacingSouth isInPosition: (0@-1))
	
	! !

!MarsRoverTest methodsFor: '09-12 moving forwards' stamp: 'FR 6/2/2022 12:11:22'!
test12MarsRoverFacingWestAtOriginMovesForwardsCorrectly

	marsRoverAtOriginFacingWest processAStringOfCommands: 'f'.
	self assert: (marsRoverAtOriginFacingWest isInPosition: (-1@0))
	
	! !


!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'FR 6/2/2022 12:17:25'!
test13MarsRoverFacingNorthAtOriginMovesBackwardsCorrectly
	
	marsRoverAtOriginFacingNorth processAStringOfCommands: 'b'.
	self assert: (marsRoverAtOriginFacingNorth isInPosition: (0@-1))
	
	! !

!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'FR 6/2/2022 12:17:56'!
test14MarsRoverFacingEastAtOriginMovesBackwardsCorrectly
	
	marsRoverAtOriginFacingEast processAStringOfCommands: 'b'.
	self assert: (marsRoverAtOriginFacingEast isInPosition: (-1@0))
	
	! !

!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'FR 6/2/2022 12:22:37'!
test15MarsRoverFacingSouthAtOriginMovesBackwardsCorrectly
	
	marsRoverAtOriginFacingSouth processAStringOfCommands: 'b'.
	self assert: (marsRoverAtOriginFacingSouth isInPosition: (0@1))
	
	! !

!MarsRoverTest methodsFor: '13-16 moving backwards' stamp: 'FR 6/2/2022 12:23:59'!
test16MarsRoverFacingWestAtOriginMovesBackwardsCorrectly
	
	marsRoverAtOriginFacingWest processAStringOfCommands: 'b'.
	self assert: (marsRoverAtOriginFacingWest isInPosition: (1@0))
	
	! !


!MarsRoverTest methodsFor: '17 invalid command' stamp: 'FR 6/2/2022 12:28:56'!
test17CanNotSendInvalidCommandToMarsRover
	
	self
		should: [	marsRoverAtOriginFacingNorth processAStringOfCommands: '#']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: MarsRoverCommand invalidCommandErrorDescription equals: anError messageText ]! !


!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'FR 6/2/2022 12:29:23'!
test18MarsRoverFacingNorthAtOriginMovesForwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingNorth processAStringOfCommands: 'f'].
	self assert: (marsRoverAtOriginFacingNorth isInPosition: (0@2))! !

!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'FR 6/2/2022 12:29:54'!
test19MarsRoverFacingEastAtOriginMovesForwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingEast processAStringOfCommands: 'f'].
	self assert: (marsRoverAtOriginFacingEast isInPosition: (2@0))
	
	! !

!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'FR 6/2/2022 12:30:57'!
test20MarsRoverFacingSouthAtOriginMovesForwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingSouth processAStringOfCommands: 'f'].
	self assert: (marsRoverAtOriginFacingSouth isInPosition: (0@-2))
	
	! !

!MarsRoverTest methodsFor: '18-21 many moving forwards' stamp: 'FR 6/2/2022 12:31:33'!
test21MarsRoverFacingWestAtOriginMovesForwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingWest processAStringOfCommands: 'f'].
	self assert: (marsRoverAtOriginFacingWest isInPosition: (-2@0)).
	
	! !


!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'FR 6/2/2022 12:32:04'!
test22MarsRoverFacingNorthAtOriginMovesBackwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingNorth processAStringOfCommands: 'b'].
	self assert: (marsRoverAtOriginFacingNorth isInPosition: (0@-2))! !

!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'FR 6/2/2022 12:32:28'!
test23MarsRoverFacingEastAtOriginMovesBackwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingEast processAStringOfCommands: 'b'].
	self assert: (marsRoverAtOriginFacingEast isInPosition: (-2@0))! !

!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'FR 6/2/2022 12:33:30'!
test24MarsRoverFacingSouthAtOriginMovesBackwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingSouth processAStringOfCommands: 'b'].
	self assert: (marsRoverAtOriginFacingSouth isInPosition: (0@2))! !

!MarsRoverTest methodsFor: '22-25 many moving backwards' stamp: 'FR 6/2/2022 12:34:08'!
test25MarsRoverFacingWestAtOriginMovesBackwardsMultipleTimesCorrectly
	
	2 timesRepeat: [marsRoverAtOriginFacingWest processAStringOfCommands: 'b'].
	self assert: (marsRoverAtOriginFacingWest isInPosition: (2@0))! !


!MarsRoverTest methodsFor: '26 multiple commands in one string' stamp: 'FR 6/2/2022 12:34:47'!
test26AStringWithMoreThanOneCommandIsProcessedCorrectly
	
	marsRoverAtOriginFacingNorth processAStringOfCommands: 'ffrb'.
	self assert: (marsRoverAtOriginFacingNorth isInPosition: (-1@2))! !


!MarsRoverTest methodsFor: 'setup' stamp: 'FR 6/2/2022 11:24:19'!
setUp
	| origin |
	origin _ 0@0.
	marsRoverAtOriginFacingNorth _ MarsRover atPosition: origin facingTowards: 'N'.
	marsRoverAtOriginFacingSouth _ MarsRover atPosition: origin facingTowards: 'S'.
	marsRoverAtOriginFacingEast _ MarsRover atPosition: origin facingTowards: 'E'.
	marsRoverAtOriginFacingWest _ MarsRover atPosition: origin facingTowards: 'W'.! !


!classDefinition: #MarsRover category: 'MarsRoverExercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'instance creation' stamp: 'FR 6/2/2022 12:48:55'!
initializeAtPosition: aPoint facingTowards: aString
	position _ aPoint.
	self faceTowards: (MarsRoverOrientation with: aString).! !


!MarsRover methodsFor: 'private' stamp: 'FR 6/2/2022 12:39:34'!
faceTowards: aMarsRoverOrientation
	orientation _ aMarsRoverOrientation ! !

!MarsRover methodsFor: 'private' stamp: 'MBM 6/1/2022 23:26:56'!
moveTowards: aPoint
	position _ position + aPoint.! !


!MarsRover methodsFor: 'public' stamp: 'FR 6/2/2022 12:04:33'!
isFacing: anOrientationAsString
	^orientation representation = anOrientationAsString.! !

!MarsRover methodsFor: 'public' stamp: 'FR 6/2/2022 12:08:21'!
isInPosition: aPoint
	^position = aPoint .! !

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

!MarsRover methodsFor: 'command - private' stamp: 'FR 6/2/2022 11:49:15'!
moveEast
	position _ position + (1@0).! !

!MarsRover methodsFor: 'command - private' stamp: 'MBM 6/2/2022 00:54:58'!
moveForwards
	orientation moveForwards: self.! !

!MarsRover methodsFor: 'command - private' stamp: 'FR 6/2/2022 11:52:04'!
moveNorth
	position _ position + (0@1)! !

!MarsRover methodsFor: 'command - private' stamp: 'FR 6/2/2022 11:58:57'!
moveSouth
	position _ position + (0@-1).! !

!MarsRover methodsFor: 'command - private' stamp: 'FR 6/2/2022 11:43:48'!
moveWest
	position _ position + (-1@0)! !

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

!MarsRoverCommand class methodsFor: 'instance creation - private' stamp: 'FR 6/2/2022 11:31:24'!
with: aChar
	self subclasses 
		detect: [ :aSubclass | aSubclass canInstantiateWith: aChar]
		ifFound: [ :aSubclass | ^aSubclass new ]
		ifNone: [ self error: self invalidCommandErrorDescription ].! !


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

!MarsRoverOrientation methodsFor: 'public' stamp: 'FR 6/2/2022 13:18:12'!
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

!MarsRoverOrientation class methodsFor: 'as yet unclassified' stamp: 'FR 6/2/2022 11:33:18'!
with: aString
	self subclasses
		detect: [ :aSubclass | aSubclass canInstantiateWith: aString]
		ifFound: [ :aSubclass | ^aSubclass new ]
		ifNone: [ self error: self invalidOrientationErrorDescription ].! !


!classDefinition: #MarsRoverOrientationEast category: 'MarsRoverExercise'!
MarsRoverOrientation subclass: #MarsRoverOrientationEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRoverOrientationEast methodsFor: 'instance creation - private' stamp: 'FR 6/2/2022 11:58:15'!
initialize
	symbol _ #E.
	! !


!MarsRoverOrientationEast methodsFor: 'public' stamp: 'FR 6/2/2022 11:56:41'!
moveBackwards: aMarsRover
	aMarsRover moveWest.! !

!MarsRoverOrientationEast methodsFor: 'public' stamp: 'FR 6/2/2022 11:52:39'!
moveForwards: aMarsRover
	aMarsRover moveEast.! !

!MarsRoverOrientationEast methodsFor: 'public' stamp: 'FR 6/2/2022 13:19:18'!
rotateLeft: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationNorth new.! !

!MarsRoverOrientationEast methodsFor: 'public' stamp: 'FR 6/2/2022 13:19:22'!
rotateRight: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationSouth new.! !

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

!MarsRoverOrientationNorth methodsFor: 'instance creation - private' stamp: 'FR 6/2/2022 11:59:13'!
initialize
	symbol _ #N.! !


!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'FR 6/2/2022 11:56:56'!
moveBackwards: aMarsRover
	aMarsRover moveSouth.! !

!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'FR 6/2/2022 11:57:03'!
moveForwards: aMarsRover
	aMarsRover moveNorth.! !

!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'FR 6/2/2022 13:19:09'!
rotateLeft: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationWest new.! !

!MarsRoverOrientationNorth methodsFor: 'public' stamp: 'FR 6/2/2022 13:19:13'!
rotateRight: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationEast new.! !

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

!MarsRoverOrientationSouth methodsFor: 'instance creation - private' stamp: 'FR 6/2/2022 11:59:20'!
initialize
	symbol _ #S.! !


!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'FR 6/2/2022 11:57:14'!
moveBackwards: aMarsRover
	aMarsRover moveNorth ! !

!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'FR 6/2/2022 11:57:09'!
moveForwards: aMarsRover
	aMarsRover moveSouth.! !

!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'FR 6/2/2022 13:18:45'!
rotateLeft: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationEast new.! !

!MarsRoverOrientationSouth methodsFor: 'public' stamp: 'FR 6/2/2022 12:46:27'!
rotateRight: aMarsRover
	^aMarsRover faceTowards: MarsRoverOrientationWest new.! !

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

!MarsRoverOrientationWest methodsFor: 'instance creation - private' stamp: 'FR 6/2/2022 11:59:25'!
initialize
	symbol _ #W.! !


!MarsRoverOrientationWest methodsFor: 'public' stamp: 'FR 6/2/2022 11:57:22'!
moveBackwards: aMarsRover
	aMarsRover moveEast ! !

!MarsRoverOrientationWest methodsFor: 'public' stamp: 'FR 6/2/2022 11:44:04'!
moveForwards: aMarsRover
	aMarsRover moveWest! !

!MarsRoverOrientationWest methodsFor: 'public' stamp: 'FR 6/2/2022 13:18:53'!
rotateLeft: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationSouth new.! !

!MarsRoverOrientationWest methodsFor: 'public' stamp: 'FR 6/2/2022 13:18:59'!
rotateRight: aMarsRover
	aMarsRover faceTowards: MarsRoverOrientationNorth new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationWest class' category: 'MarsRoverExercise'!
MarsRoverOrientationWest class
	instanceVariableNames: ''!

!MarsRoverOrientationWest class methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 00:32:51'!
canInstantiateWith: aString
	^#W = aString asSymbol! !
