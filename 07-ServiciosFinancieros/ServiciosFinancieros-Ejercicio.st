!classDefinition: #PortfolioAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/7/2022 23:26:57'!
test01PortfolioHasZeroAsBalanceWhenCreated
	| portfolio |
	
	portfolio _ PortfolioAccount new.
	
	self assert: 0 equals: (portfolio balance).! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:09:10'!
test02PortfolioCanRegisterAccountsAfterCreation
	| portfolio account |
	account _ ReceptiveAccount new.
	portfolio _ PortfolioAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio add: account .
	
	self assert: (100 * peso) equals: portfolio balance.! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:09:19'!
test03PortfolioWithOneAccountHasSameBalanceAsAccount
	| account portfolio |
	account _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio _ PortfolioAccount new.
	portfolio add: account.

	self assert: account balance equals: portfolio balance.! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:09:27'!
test04PortfolioBalanceIsEqualToSumOfAccountsBalances
	| account1 portfolio account2 |
	account1 _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account1.
	account2 _ ReceptiveAccount new.
	Deposit register: 200 * peso on: account2.
	
	portfolio _ PortfolioAccount new.
	portfolio add: account1.
	portfolio add: account2.

	self assert: (account1 balance + account2 balance) equals: portfolio balance.! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:09:32'!
test05PortfolioKnowsATransactionRegisteredByAnAccountInIt

	| account deposit portfolio withdraw |
	
	account _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
	portfolio _ PortfolioAccount new.
	portfolio add: account.
		
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:09:36'!
test06PortfolioDoesNotKnowADepositNotRegisteredByAnyAccountInIt

	| account deposit portfolio withdraw |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
	portfolio _ PortfolioAccount new.
	portfolio add: account.
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:09:41'!
test07PortfolioKnowsTransactionsOfAnAccountInIt

	| account portfolio withdraw deposit transactions |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
	portfolio _ PortfolioAccount new.
	portfolio add: account.
	
	transactions _ portfolio transactions.
	self assert: 2 equals: transactions size.
	self assert: (transactions includes: deposit).
	self assert: (transactions includes: withdraw).! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 19:22:24'!
test08PortfolioDoesNotKnowTransactionsOfAnAccountNotInIt

	| account portfolio |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	portfolio _ PortfolioAccount new.
	
	self assert: 0 equals: portfolio transactions size.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 22:52:57'!
test01DoingATransferenceBetweenAccountsAffectsTheirBalance
	| receiver sender amount |
	amount := 100 * peso.
	receiver := ReceptiveAccount  new.
	sender := ReceptiveAccount new.
	Deposit register: amount on: sender.

	Transference register: amount on: receiver from: sender.

	self assert: 100 * peso equals: receiver balance.
	self assert: 0 * peso equals: sender balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 22:55:07'!
test02CanNotDoATransferenceWithAnInvalidAmmount
	| sender receiver zeroAmount negativeAmount amounts |
	zeroAmount _ 0 * peso.
	negativeAmount _ -10 * peso.
	amounts _ OrderedCollection with: zeroAmount with: negativeAmount.
	sender _ ReceptiveAccount new.
	receiver _ ReceptiveAccount new.

	amounts do: [ :anInvalidAmount | self should: [Transference register: anInvalidAmount on: receiver from: sender]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText = Transference invalidAmountErrorDescription].]! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/8/2022 23:05:22'!
test03ATransferenceKnowsItsValue
	| sender receiver transference transferenceValue |
	sender _ ReceptiveAccount new.
	receiver _ ReceptiveAccount new.
	transferenceValue _ 100 * peso.
	transference _ Transference register: transferenceValue on: receiver from: sender.

	self assert: transferenceValue equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/9/2022 00:57:31'!
test04ATransferenceTransactionKnowsItsCounterpart
	| sender receiver transference transferenceValue |
	sender _ ReceptiveAccount new.
	receiver _ ReceptiveAccount new.
	transferenceValue _ 100 * peso.
	transference _ Transference register: transferenceValue on: receiver from: sender.
	
	self assert: transference depositLeg equals: (transference withdrawLeg counterpart).
	self assert: transference withdrawLeg equals: (transference depositLeg counterpart).! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'MBM 6/8/2022 22:46:31'!
initialize
	self subclassResponsibility.! !


!Account methodsFor: 'main protocol' stamp: 'MBM 6/8/2022 22:44:41'!
balance
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'MBM 6/8/2022 22:45:32'!
hasRegistered: aTransaction
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'MBM 6/8/2022 22:48:43'!
transactions
	self subclassResponsibility.! !


!classDefinition: #PortfolioAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #PortfolioAccount
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccount methodsFor: 'initialization' stamp: 'MBM 6/6/2022 21:15:15'!
initialize
	accounts _ OrderedCollection new.! !


!PortfolioAccount methodsFor: 'main protocol' stamp: 'MBM 6/8/2022 23:08:51'!
add: anAccount 
	accounts add: anAccount.! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'MBM 6/6/2022 21:21:16'!
balance
	^accounts inject: 0 into: [ :balance :anAccount | balance + anAccount balance].! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'MBM 6/7/2022 16:03:23'!
hasRegistered: aTransaction 
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'FR 6/7/2022 23:09:24'!
transactions
	^accounts inject: OrderedCollection new into: [ :aCollection :anAccount | aCollection addAll: anAccount transactions].
	
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'FR 6/7/2022 23:17:46'!
initialize
	transactions _ OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MBM 6/2/2022 21:35:48'!
balance
	^transactions inject: 0 into: [ :balance :aTransaction | aTransaction affectBalance: balance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FR 6/7/2022 23:22:16'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'main protocol' stamp: 'MBM 6/2/2022 21:35:48'!
affectBalance: aBalance
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'main protocol' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'main protocol' stamp: 'MBM 6/2/2022 21:35:48'!
affectBalance: aBalance
	^aBalance + self value ! !

!Deposit methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'main protocol' stamp: 'MBM 6/2/2022 21:35:48'!
affectBalance: aBalance
	^aBalance - self value ! !

!Withdraw methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'MBM 6/9/2022 00:51:46'!
initializeFor: anAmountInPesos from: aSenderReceptiveAccount to: aReceiverReceptiveAccount
	
	value _ anAmountInPesos.
	withdrawLeg _ TransferenceWithdraw registerTransference: self on: aSenderReceptiveAccount.
	depositLeg _ TransferenceDeposit registerTransference: self on: aReceiverReceptiveAccount.! !


!Transference methodsFor: 'accessing' stamp: 'MBM 6/9/2022 01:01:31'!
depositLeg
	^depositLeg! !

!Transference methodsFor: 'accessing' stamp: 'MBM 6/8/2022 23:16:38'!
value
	^ value.! !

!Transference methodsFor: 'accessing' stamp: 'MBM 6/9/2022 01:01:27'!
withdrawLeg
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'error messages' stamp: 'FR 6/8/2022 20:32:25'!
invalidAmountErrorDescription
	^'Invalid amount for a transference'! !


!Transference class methodsFor: 'instance creation' stamp: 'MBM 6/8/2022 23:33:18'!
register: anAmountInPesos on: aReceiverReceptiveAccount from: aSenderReceptiveAccount

	(anAmountInPesos <= 0) ifTrue: [self error: self invalidAmountErrorDescription.].
	^self new initializeFor: anAmountInPesos from: aSenderReceptiveAccount to: aReceiverReceptiveAccount.! !


!classDefinition: #TransferenceTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceTransaction
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTransaction methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 01:06:17'!
affectBalance: aBalance
	self subclassResponsibility ! !

!TransferenceTransaction methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 00:59:38'!
counterpart
	self subclassResponsibility ! !

!TransferenceTransaction methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 00:23:01'!
value
	^transference value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceTransaction class
	instanceVariableNames: ''!

!TransferenceTransaction class methodsFor: 'instance creation' stamp: 'MBM 6/9/2022 00:19:39'!
forTransference: aTransference
	
	self subclassResponsibility ! !

!TransferenceTransaction class methodsFor: 'instance creation' stamp: 'MBM 6/9/2022 00:19:24'!
registerTransference: aTransference on: aReceptiveAccount
	
	| transaction |
	
	transaction _ self forTransference: aTransference.
	aReceptiveAccount register: transaction.
		
	^ transaction! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferenceTransaction subclass: #TransferenceDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'MBM 6/9/2022 00:27:53'!
initializeFor: aTransference

	transference _ aTransference.! !


!TransferenceDeposit methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 00:22:13'!
affectBalance: aBalance
	^aBalance + self value ! !

!TransferenceDeposit methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 00:59:56'!
counterpart
	^transference withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'MBM 6/9/2022 00:19:56'!
forTransference: aTransference
	
	^self new initializeFor: aTransference.! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferenceTransaction subclass: #TransferenceWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'initialization' stamp: 'MBM 6/9/2022 00:28:01'!
initializeFor: aTransference

	transference _ aTransference.! !


!TransferenceWithdraw methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 00:22:00'!
affectBalance: aBalance
	^aBalance - self value ! !

!TransferenceWithdraw methodsFor: 'main protocol' stamp: 'MBM 6/9/2022 01:00:11'!
counterpart
	^transference depositLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'MBM 6/9/2022 00:20:08'!
forTransference: aTransference
	
	^self new initializeFor: aTransference.! !
