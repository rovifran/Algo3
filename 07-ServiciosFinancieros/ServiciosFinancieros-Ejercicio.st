!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/6/2022 21:27:45'!
test01PortfolioHasZeroAsBalanceWhenCreated
	| portfolio |
	
	portfolio _ Portfolio new.
	
	self assert: 0 equals: (portfolio balance).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/7/2022 15:28:14'!
test02PortfolioWithOneAccountHasSameBalanceAsAccount
	| account portfolio |
	account _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio _ Portfolio withAccount: account.

	self assert: account balance equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/7/2022 15:27:54'!
test03PortfolioBalanceIsEqualToSumOfAccountsBalances
	| account1 portfolio account2 accounts |
	account1 _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account1.
	account2 _ ReceptiveAccount new.
	Deposit register: 200 * peso on: account2.
	accounts _ OrderedCollection new.
	accounts add: account1.
	accounts add: account2.
	
	portfolio _ Portfolio withAccounts: accounts.

	self assert: (account1 balance + account2 balance) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/7/2022 15:56:07'!
test04PortfolioKnowsATransactionRegisteredByAnAccountInIt

	| account deposit portfolio withdraw |
	
	account _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
	portfolio _ Portfolio withAccount: account.
		
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/7/2022 16:24:35'!
test05PortfolioDoesNotKnowADepositNotRegisteredByAnyAccountInIt

	| account deposit portfolio withdraw |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
	portfolio _ Portfolio withAccount: account.
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/7/2022 16:28:57'!
test06PortfolioKnowsTransactionsOfAnAccountInIt

	| account portfolio withdraw deposit transactions |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit register: 100 * peso on: account.
	withdraw _ Withdraw register: 50 * peso on: account.
	portfolio _ Portfolio withAccount: account.
	
	transactions _ portfolio transactionsFrom: account.
	self assert: 2 equals: transactions size.
	self assert: (transactions includes: deposit).
	self assert: (transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/7/2022 16:39:40'!
test07PortfolioDoesNotKnowTransactionsOfAnAccountNotInIt

	| account portfolio |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	portfolio _ Portfolio new.
	
	self should: [portfolio transactionsFrom: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | anError messageText = Portfolio accountNotFoundErrorDescription].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FR 6/7/2022 19:55:26'!
test08PortfolioCanAddAccountsAfterCreation
	| portfolio account |
	account _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	Deposit register: 100 * peso on: account.
	
	portfolio add: account .
	
	self assert: (100 * peso) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'FR 6/7/2022 20:01:25'!
test09
	| portfolio1 portfolio2 portfolio3 account1 account2 deposit withdraw |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account1.
	withdraw _ Withdraw 	register: 50 * peso on: account1.
	
	portfolio1 _ Portfolio withAccount: account1.
	portfolio2 _ Portfolio withAccount: account2.
	portfolio2 add: portfolio1.
	portfolio3 _ Portfolio new.
	portfolio3 add: portfolio2.
	
	self assert: (50 * peso) equals: portfolio3 balance.
	self assert: (portfolio3 hasRegistered: deposit).
	self assert: (portfolio3 hasRegistered: withdraw).
	self assert: (portfolio3 transactionsFrom: account1) includes: deposit.! !


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

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MBM 6/6/2022 21:27:45'!
test01PortfolioHasZeroAsBalanceWhenCreated
	| receiver sender amount |
	amount := 100*peso.
	receiver := ReceptiveAccount  new.
	sender := ReceptiveAccount new.
	Deposit register: amount on: sender.
	
	Transference 	from: sender to: receiver for: amount.
		
	self assert: 100 * peso equals: receiver balance.
	self assert: 0*peso equals: sender balance.
! !


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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initalize' stamp: 'MBM 6/6/2022 21:15:15'!
initialize
	accounts _ OrderedCollection new.! !

!Portfolio methodsFor: 'initalize' stamp: 'MBM 6/6/2022 21:15:09'!
with: aCollectionOfReceptiveAccounts 
	aCollectionOfReceptiveAccounts do: [ :aReceptiveAccount | accounts add: aReceptiveAccount ].! !


!Portfolio methodsFor: 'accesing' stamp: 'MBM 6/6/2022 21:21:16'!
balance
	^accounts inject: 0 into: [ :balance :anAccount | balance + anAccount balance].! !

!Portfolio methodsFor: 'accesing' stamp: 'MBM 6/7/2022 16:03:23'!
hasRegistered: aTransaction 
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'accesing' stamp: 'FR 6/7/2022 20:18:57'!
transactionsFrom: aReceptiveAccount 
	^accounts
		detect: [ :anAccount | anAccount mmm: aReceptiveAccount ]
		ifFound: [ :anAccount | anAccount transactions]
		ifNone: [self error: self class accountNotFoundErrorDescription ].! !


!Portfolio methodsFor: 'uncategorized' stamp: 'FR 6/7/2022 20:28:44'!
mmm: aReceptiveAccount
	accounts detect: [ :anAccount | anAccount mmm: aReceptiveAccount ]
	ifFound: [ :anAccount | ^anAccount ] ifNone: [^false].! !


!Portfolio methodsFor: 'adding' stamp: 'FR 6/7/2022 19:54:15'!
add: aReceptiveAccount 
	accounts add: aReceptiveAccount.! !

!Portfolio methodsFor: 'adding' stamp: 'FR 6/7/2022 20:40:08'!
m1: anAccountOrAnPortfolio! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'hola' stamp: 'MBM 6/6/2022 21:26:12'!
withAccount: aReceptiveAccount
	^self new with: (OrderedCollection with: aReceptiveAccount).! !

!Portfolio class methodsFor: 'hola' stamp: 'MBM 6/6/2022 21:25:14'!
withAccounts: aCollectionOfReceptiveAccounts 
	^self new with: aCollectionOfReceptiveAccounts.! !


!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FR 6/7/2022 20:16:03'!
accountNotFoundErrorDescription
	^'Account Not Found In Portfolio.'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MBM 6/2/2022 21:35:48'!
balance
	^transactions inject: 0 into: [ :balance :aTransaction | aTransaction affectBalance: balance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FR 6/7/2022 20:22:22'!
mmm: anAccount
	^self = anAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!
