Class {
	#name : #NumberToArithmeticObjectAdapterTest,
	#superclass : #TestCase,
	#category : #'Aconcagua-ArithmeticModelTests'
}

{ #category : #test }
NumberToArithmeticObjectAdapterTest >> testPrintString [
	self 
		assert: (NumberToArithmeticObjectAdapter number: 10) 
				printString = 'NumberMeasureAdapter for: 10'
]
