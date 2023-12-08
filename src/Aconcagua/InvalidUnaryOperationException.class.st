Class {
	#name : #InvalidUnaryOperationException,
	#superclass : #InvalidOperationException,
	#instVars : [
		'operationName',
		'operand'
	],
	#category : #'Aconcagua-ArithmeticModel'
}

{ #category : #'instance creation' }
InvalidUnaryOperationException class >> operationName: anOperationName operand: anOperand [

	^self new initializeOperationName: anOperationName operand: anOperand
]

{ #category : #signaling }
InvalidUnaryOperationException class >> signalOperationName: anOperationName operand: anOperand [

	(self operationName: anOperationName operand: anOperand) signal
]

{ #category : #accessing }
InvalidUnaryOperationException >> description [

	^'Attempt to make the operation  {1} with {2} which is invalid' format: { operationName .operand }
]

{ #category : #initialization }
InvalidUnaryOperationException >> initializeOperationName: anOperationName operand: anOperand [

	operationName := anOperationName.
	operand := anOperand.
]

{ #category : #accessing }
InvalidUnaryOperationException >> operand [

	^operand
]

{ #category : #accessing }
InvalidUnaryOperationException >> operationName [

	^operationName
]
