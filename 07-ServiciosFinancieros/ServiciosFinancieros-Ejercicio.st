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

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 21:24:15'!
test02PortfolioCanRegisterAccountsAfterCreation
	| portfolio account |
	account _ ReceptiveAccount new.
	portfolio _ PortfolioAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio register: account .
	
	self assert: (100 * peso) equals: portfolio balance.! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 19:21:32'!
test03PortfolioWithOneAccountHasSameBalanceAsAccount
	| account portfolio |
	account _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio _ PortfolioAccount new.
	portfolio register: account.

	self assert: account balance equals: portfolio balance.! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 19:21:42'!
test04PortfolioBalanceIsEqualToSumOfAccountsBalances
	| account1 portfolio account2 |
	account1 _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account1.
	account2 _ ReceptiveAccount new.
	Deposit register: 200 * peso on: account2.
	
	portfolio _ PortfolioAccount new.
	portfolio register: account1.
	portfolio register: account2.

	self assert: (account1 balance + account2 balance) equals: portfolio balance.! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 19:21:56'!
test05PortfolioKnowsATransactionRegisteredByAnAccountInIt

	| account deposit portfolio withdraw |
	
	account _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
	portfolio _ PortfolioAccount new.
	portfolio register: account.
		
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 19:22:05'!
test06PortfolioDoesNotKnowADepositNotRegisteredByAnyAccountInIt

	| account deposit portfolio withdraw |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
	portfolio _ PortfolioAccount new.
	portfolio register: account.
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).! !

!PortfolioAccountTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 19:22:15'!
test07PortfolioKnowsTransactionsOfAnAccountInIt

	| account portfolio withdraw deposit transactions |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
	portfolio _ PortfolioAccount new.
	portfolio register: account.
	
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

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 21:08:21'!
test01DoingATransferenceBetweenAccountsAffectsTheirBalance
	| receiver sender amount |
	amount := 100*peso.
	receiver := ReceptiveAccount  new.
	sender := ReceptiveAccount new.
	Deposit register: amount on: sender.
	
	Transference 	from: sender to: receiver for: amount.
		
	self assert: 100 * peso equals: receiver balance.
	self assert: 0*peso equals: sender balance.
! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'FR 6/8/2022 21:04:47'!
test02
	| sender receiver amount negativeAmount amounts|
	amount _ 0 * peso.
	negativeAmount _ -10 * peso.
	amounts _ OrderedCollection with: amount with: negativeAmount.
	sender _ ReceptiveAccount new.
	receiver _ ReceptiveAccount new.
	
	
	amounts do: [ :anInvalidAmount | self should: [Transference from: sender to: receiver for: anInvalidAmount]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText = Transference invalidAmountErrorDescription].]! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #PortfolioAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #PortfolioAccount
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccount methodsFor: 'initalization' stamp: 'MBM 6/6/2022 21:15:15'!
initialize
	accounts _ OrderedCollection new.! !

!PortfolioAccount methodsFor: 'initalization' stamp: 'FR 6/7/2022 23:17:11'!
with: aCollectionOfAccounts 
	aCollectionOfAccounts do: [ :anAccount | accounts register: anAccount ].! !


!PortfolioAccount methodsFor: 'main protocol' stamp: 'MBM 6/6/2022 21:21:16'!
balance
	^accounts inject: 0 into: [ :balance :anAccount | balance + anAccount balance].! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'MBM 6/7/2022 16:03:23'!
hasRegistered: aTransaction 
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'FR 6/7/2022 23:21:22'!
register: anAccount 
	accounts add: anAccount.! !

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

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 21:35:48'!
affectBalance: aBalance
	self subclassResponsibility.! !

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


!Deposit methodsFor: 'value' stamp: 'MBM 6/2/2022 21:35:48'!
affectBalance: aBalance
	^aBalance + self value ! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
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


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'MBM 6/2/2022 21:35:48'!
affectBalance: aBalance
	^aBalance - self value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'error messages' stamp: 'FR 6/8/2022 20:32:25'!
invalidAmountErrorDescription
	^'Invalid amount for a transference'! !


!Transference class methodsFor: 'unclassified' stamp: 'FR 6/8/2022 21:04:29'!
from: aReceptiveAccount to: aReceptiveAccount2 for: anAmountInPesos
	(anAmountInPesos <= 0) ifTrue: [self error: self invalidAmountErrorDescription.].
	Withdraw register: 100 * peso on: aReceptiveAccount.
	Deposit register: 100 * peso on: aReceptiveAccount2 .! !
