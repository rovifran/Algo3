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
	instanceVariableNames: 'exampleStack exampleStackCopy sentenceFinder emptyString withBlankSpaceString validPrefixString validPrefixStringWithDifferentCase expectedResultWithValidPrefix expectedResultWithValidPrefixWithDifferentCases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MBM 5/15/2022 21:42:41'!
test01FindingAPrefixInAnEmptyStackReturnsAnEmptyCollection
	
	self assert: (sentenceFinder find: validPrefixString in: OOStack new) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MBM 5/15/2022 22:02:17'!
test02FindingAnEmptyPrefixReturnsError
		
	self 
		should: [sentenceFinder find: emptyString in: exampleStack ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MBM 5/15/2022 22:02:12'!
test03FindingAPrefixWithASpaceReturnsError
	
	self 
		should: [sentenceFinder find: withBlankSpaceString in: exampleStack ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorMessage ].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MBM 5/15/2022 22:20:13'!
test04FindingAValidPrefixInAStackReturnsTheElementsMatchingThePrefix
	
	self assert: (sentenceFinder find: validPrefixString in: exampleStack ) = expectedResultWithValidPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MBM 5/15/2022 22:01:36'!
test05StackSizeIsEqualToResultSizeWhenEveryItemOnStackStartsWithPrefix
	
	| newStack |
	newStack _ OOStack new.
	100 timesRepeat: [ newStack push: validPrefixString ].
	
	self assert: (sentenceFinder find: validPrefixString in: newStack) size = newStack size.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MBM 5/15/2022 22:20:43'!
test06StackFinalStateEqualsToStackInitialState
	
	sentenceFinder find: validPrefixString in: exampleStack.
	
	exampleStackCopy size timesRepeat: [
	self assert: (exampleStack pop = exampleStackCopy pop)]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'FR 5/16/2022 12:07:49'!
test07FindingAPrefixWithDifferentCasesReturnsTheElementsThatStartWithThePrefix

	self assert: (sentenceFinder find: validPrefixStringWithDifferentCase in: exampleStack ) = expectedResultWithValidPrefixWithDifferentCases .! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 5/16/2022 12:06:22'!
setUp
	
	sentenceFinder _ SentenceFinderByPrefix new.
	emptyString _ ''.
	withBlankSpaceString _ 'first second'.
	validPrefixString _ 'prefix'.
	validPrefixStringWithDifferentCase _ 'PRefix'.
	
	exampleStack _ OOStack new.
	exampleStackCopy _ OOStack new.
	OrderedCollection new add: exampleStack; add: exampleStackCopy; do:
	[ :stack | stack push: 'prefix'.
	stack push: 'prefix1'.
	stack push: 'prefix2'.
	stack push: 'prefix with more words'.
	stack push: 'string not starting with prefix'.
	stack push: 'PRefix with different case'.
	stack push: 'PRefix sentence'.
	stack push: 'Prefix'.
	stack push: 'PREFIX all uppercase'.
	].
	
	expectedResultWithValidPrefix _ OrderedCollection newFrom: #('prefix' 'prefix1' 'prefix2' 'prefix with more words').
	expectedResultWithValidPrefixWithDifferentCases _ OrderedCollection newFrom: #('PRefix with different case' 'PRefix sentence').
	! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'element previous index'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:39:04'!
sendMyElementTo: anObject
	self subclassResponsibility ! !

!Node methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:46:04'!
sendMyIndexTo: anObject
	self subclassResponsibility ! !

!Node methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:38:41'!
sendMyPreviousTo: anObject
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'MBM 5/15/2022 18:26:43'!
withString: aString withPrevious: aNode

	self subclassResponsibility ! !


!classDefinition: #BaseNode category: 'Stack-Exercise'!
Node subclass: #BaseNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseNode methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:57:05'!
sendMyElementTo: anObject
	anObject raiseEmptyError.! !

!BaseNode methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:44:56'!
sendMyIndexTo: anObject
	^index! !

!BaseNode methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:57:12'!
sendMyPreviousTo: anObject
	anObject raiseEmptyError.! !


!BaseNode methodsFor: 'initializing' stamp: 'MBM 5/15/2022 18:25:30'!
initialize
	element _ nil.
	previous _ nil.
	index _ 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BaseNode class' category: 'Stack-Exercise'!
BaseNode class
	instanceVariableNames: ''!

!BaseNode class methodsFor: 'as yet unclassified' stamp: 'MBM 5/15/2022 18:24:56'!
withString: aString withPrevious: aNode

	^BaseNode new.! !


!classDefinition: #FilledNode category: 'Stack-Exercise'!
Node subclass: #FilledNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledNode methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:43:18'!
sendMyElementTo: anObject
	^element ! !

!FilledNode methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:45:13'!
sendMyIndexTo: anObject
	^index! !

!FilledNode methodsFor: 'accesing' stamp: 'MBM 5/15/2022 18:45:37'!
sendMyPreviousTo: anObject
	^previous! !


!FilledNode methodsFor: 'initializing' stamp: 'MBM 5/15/2022 18:52:26'!
initializeWith: aString withPrevious: previousNode
	element _ aString.
	previous _ previousNode.
	index _ (previousNode sendMyIndexTo: self) + 1.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledNode class' category: 'Stack-Exercise'!
FilledNode class
	instanceVariableNames: ''!

!FilledNode class methodsFor: 'as yet unclassified' stamp: 'MBM 5/15/2022 18:24:19'!
withString: aString withPrevious: aNode

	^FilledNode new initializeWith: aString withPrevious: aNode.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'MBM 5/15/2022 18:50:07'!
initialize
	topNode _ BaseNode new.! !

!OOStack methodsFor: 'private' stamp: 'FR 5/13/2022 20:17:36'!
newTopNode: aNewNode
	topNode _ aNewNode.! !

!OOStack methodsFor: 'private' stamp: 'MBM 5/15/2022 18:56:56'!
raiseEmptyError
	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'FR 5/13/2022 20:14:32'!
topNode
	^topNode! !


!OOStack methodsFor: 'public' stamp: 'MBM 5/15/2022 18:01:02'!
isEmpty
	^self size = 0.! !

!OOStack methodsFor: 'public' stamp: 'MBM 5/15/2022 18:47:30'!
pop
	| topNodeElement |
	topNodeElement _ self top.
	self newTopNode: (self topNode sendMyPreviousTo: self).
	^topNodeElement.! !

!OOStack methodsFor: 'public' stamp: 'MBM 5/15/2022 17:58:24'!
push: aString
	| newNode | 
	newNode _ FilledNode withString: aString withPrevious: self topNode.
	self newTopNode: newNode.
	 ! !

!OOStack methodsFor: 'public' stamp: 'MBM 5/15/2022 18:48:06'!
size
	^self topNode sendMyIndexTo: self.! !

!OOStack methodsFor: 'public' stamp: 'MBM 5/15/2022 18:48:24'!
top
	^self topNode sendMyElementTo: self.! !

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

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MBM 5/15/2022 21:25:48'!
isAValidPrefix: aPrefix

	^(aPrefix size > 0 and: (aPrefix includesSubString: ' ' ) not)! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MBM 5/15/2022 21:33:54'!
obtainStringsFrom: aStack
	"Recieves a Stack and returns an OrderedCollection which includes all the elements in the Stack.
	The final state of the Stack is the same as the initial one."
	| aCollection poppedElement|
	aCollection _ OrderedCollection new.
	
	aStack size timesRepeat: [ 
		poppedElement _ aStack pop.
		aCollection addFirst: poppedElement.
		].
	
	aCollection do: [ :aString | aStack push: aString].
	^aCollection
	
	"Solucion alternativa que utiliza whileTrue para el ciclo:
	[ aStack isEmpty ] whileFalse: [ 
		poppedElement _ aStack pop.
		aCollection addFirst: poppedElement.
	 ]."! !


!SentenceFinderByPrefix methodsFor: 'public' stamp: 'MBM 5/15/2022 21:32:44'!
find: aPrefix in: aStack
	"Receives a prefix and a stack of strings, and returns an OrderedCollection with the strings that match the prefix.
	This is case-sensitive"
	| aCollection |
	
	
	(self isAValidPrefix: aPrefix ) ifTrue: [
		aCollection _ self obtainStringsFrom: aStack.
		aCollection removeAllSuchThat: [ :aString | (aString beginsWith: aPrefix ) not ].
		^aCollection.
	].
	self error: self class invalidPrefixErrorMessage.
	
	"Solucion Alternativa: Consideramos implementar abstraer el 'ifTrue:' a una clase Prefix que se instancia con el string recibido, subclasificada en ValidPrefix e InvalidPrefix como clases polimorficas que modelaban el comportamiento de un prefijo valido e invalido, y de esta forma abstraer con un Switch Dinamico el 'if'. Pero llegamos a la conclusion de que, un prefijo solo puede ser valido o invalido, los objetos ValidPrefix e InvalidPrefix no tenían un motivo claro de ser (ya que simplemente son Strings encapsuladas) y por mas escalable que fuera esta solucion, nunca se añadirian mas posibles subclases de Prefix, o es valido o invalido.
	Por estas razones consideramos que es mas elegante y prolija esta solucion, ya que realizar todo este proceso no trae ninguna ventaja significativa y requiere mayor trabajo."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MBM 5/15/2022 17:32:04'!
invalidPrefixErrorMessage
	^ 'Prefix cannot be empty or contain blank spaces'! !
