!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FR 5/13/2022 21:31:16'!
test01FindingAPrefixInAnEmptyStackReturnsAnEmptyCollection
	| aStack aSentenceFinderByPrefix aPrefix |
	aStack _ OOStack new.
	aSentenceFinderByPrefix _ SentenceFinderByPrefix new.
	aPrefix _ ''
	
	self assert: (aSentenceFinderByPrefix find: '')! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'element previous numberId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'FR 5/13/2022 20:27:00'!
element
	^element.! !

!Node methodsFor: 'as yet unclassified' stamp: 'FR 5/13/2022 19:43:29'!
numberId
	^numberId.! !

!Node methodsFor: 'as yet unclassified' stamp: 'FR 5/13/2022 20:22:45'!
previous
	^previous.! !


!classDefinition: #FilledNode category: 'Stack-Exercise'!
Node subclass: #FilledNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledNode methodsFor: 'private' stamp: 'FR 5/13/2022 19:42:30'!
initializeWith: aString withPrevious: previousNode
	element _ aString.
	previous _ previousNode.
	numberId _ previousNode numberId + 1.
	! !


!classDefinition: #NullNode category: 'Stack-Exercise'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'private' stamp: 'FR 5/13/2022 20:26:41'!
element
	self error: OOStack stackEmptyErrorDescription.! !

!NullNode methodsFor: 'private' stamp: 'FR 5/13/2022 20:20:59'!
initialize
	element _ nil.
	previous _ self.
	numberId _ 0.! !

!NullNode methodsFor: 'private' stamp: 'FR 5/13/2022 20:22:11'!
initializeWith: aString withPrevious: previousNode
	element _ nil.
	previous _ self.
	numberId _ 0.! !

!NullNode methodsFor: 'private' stamp: 'FR 5/13/2022 20:24:11'!
previous
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'FR 5/13/2022 20:07:17'!
initialize
	topNode _ NullNode new.! !

!OOStack methodsFor: 'private' stamp: 'FR 5/13/2022 20:17:36'!
newTopNode: aNewNode
	topNode _ aNewNode.! !

!OOStack methodsFor: 'private' stamp: 'MBM 5/10/2022 20:01:49'!
stack
	^stack! !

!OOStack methodsFor: 'private' stamp: 'FR 5/13/2022 20:14:32'!
topNode
	^topNode! !


!OOStack methodsFor: 'public' stamp: 'FR 5/13/2022 20:18:22'!
isEmpty
	^self topNode isKindOf: NullNode.! !

!OOStack methodsFor: 'public' stamp: 'FR 5/13/2022 20:32:59'!
pop
	| topNodeElement |
	topNodeElement _ self top.
	self newTopNode: self topNode previous.
	^topNodeElement.! !

!OOStack methodsFor: 'public' stamp: 'FR 5/13/2022 20:17:16'!
push: aString
	| newNode | 
	newNode _ FilledNode new initializeWith: aString withPrevious: self topNode.
	self newTopNode: newNode.
	 ! !

!OOStack methodsFor: 'public' stamp: 'FR 5/13/2022 20:17:59'!
size
	^self topNode numberId.! !

!OOStack methodsFor: 'public' stamp: 'FR 5/13/2022 20:33:11'!
top
	^ self topNode element.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FR 5/13/2022 20:55:17'!
obtainStringsFrom: aStack
	| aCollection poppedElement|
	aCollection _ OrderedCollection new.
	
	[ aStack isEmpty not ] whileTrue: [ 
		poppedElement _ aStack pop.
		aCollection addFirst: poppedElement.
		 ].
	
	aCollection do: [ :aString | aStack push: aString].
	^aCollection
	! !


!SentenceFinderByPrefix methodsFor: 'public' stamp: 'FR 5/13/2022 21:20:51'!
find: aPrefixToFind in: aStack
	"Receives a prefix and a stack of strings, and returns an OrderedCollection with the strings that match the prefix.
	This is case-sensitive"
	| aCollection |
	aCollection _ self obtainStringsFrom: aStack.
	aCollection removeAllSuchThat: [ :aString | (aString beginsWith: aPrefixToFind ) not ].
	^aCollection.! !
