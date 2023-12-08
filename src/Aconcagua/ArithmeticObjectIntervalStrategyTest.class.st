Class {
	#name : #ArithmeticObjectIntervalStrategyTest,
	#superclass : #TestCase,
	#category : #'Aconcagua-ArithmeticModelTests'
}

{ #category : #test }
ArithmeticObjectIntervalStrategyTest >> testSingleton [

	self assert: ArithmeticObjectIntervalStrategy new == ArithmeticObjectIntervalStrategy new
]
