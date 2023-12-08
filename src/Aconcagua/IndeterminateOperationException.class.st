Class {
	#name : #IndeterminateOperationException,
	#superclass : #Error,
	#instVars : [
		'operation',
		'leftOperand',
		'rightOperand'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #'instance creation' }
IndeterminateOperationException class >> operation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

	^self new initializeOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand
]

{ #category : #signaling }
IndeterminateOperationException class >> signalOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

	(self operation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand) signal
]

{ #category : #accessing }
IndeterminateOperationException >> description [

	^'The {1} operation is indeterminate between {2} and {3}' format: { operation .leftOperand .rightOperand }
]

{ #category : #initialization }
IndeterminateOperationException >> initializeOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

	operation := anOperation.
	leftOperand := aLeftOperand.
	rightOperand := aRightOperand
]
