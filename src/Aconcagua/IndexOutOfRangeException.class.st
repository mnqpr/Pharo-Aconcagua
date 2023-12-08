Class {
	#name : #IndexOutOfRangeException,
	#superclass : #Error,
	#instVars : [
		'index',
		'collection'
	],
	#category : #'Aconcagua-ArithmeticModel'
}

{ #category : #'instance creating' }
IndexOutOfRangeException class >> index: anIndex collection: aCollection [
	
	^self new initializeIndex: anIndex collection: aCollection
	
	
]

{ #category : #signaling }
IndexOutOfRangeException class >> signalIndex: anIndex collection: aCollection [
	
	(self index: anIndex collection: aCollection) signal
]

{ #category : #accessing }
IndexOutOfRangeException >> collection [

	^collection
]

{ #category : #accessing }
IndexOutOfRangeException >> description [

	^index isNil 
		ifTrue: [ 'Index out of range for {1}' format: { collection } ]
		ifFalse: [ 'Index {1} out of range for {2}' format: { index .collection }]
]

{ #category : #accessing }
IndexOutOfRangeException >> index [

	^index
]

{ #category : #initialization }
IndexOutOfRangeException >> initializeIndex: anIndex collection: aCollection [

	index := anIndex.	
	collection := aCollection
]
