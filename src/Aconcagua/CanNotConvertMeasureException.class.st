Class {
	#name : #CanNotConvertMeasureException,
	#superclass : #InvalidOperationException,
	#instVars : [
		'targetUnit',
		'sourceMeasure'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #signaling }
CanNotConvertMeasureException class >> signalSourceMeasure: aSourceMeasure targetUnit: aTargetUnit [

	^(self sourceMeasure: aSourceMeasure targetUnit: aTargetUnit) signal
]

{ #category : #'instance creation' }
CanNotConvertMeasureException class >> sourceMeasure: aSourceMeasure targetUnit: aTargetUnit [

	^self new initializeWith: aSourceMeasure targetUnit: aTargetUnit
]

{ #category : #accessing }
CanNotConvertMeasureException >> description [

	^'It is not possible to convert {1} to {2}' format: { sourceMeasure .targetUnit }
]

{ #category : #initialization }
CanNotConvertMeasureException >> initializeWith: aSourceMeasure targetUnit: aTargetUnit [ 

	sourceMeasure := aSourceMeasure.
	targetUnit := aTargetUnit
]

{ #category : #'priv handling' }
CanNotConvertMeasureException >> isResumable [

	^true
]

{ #category : #accessing }
CanNotConvertMeasureException >> operationName [

	^'convertTo:'
]

{ #category : #accessing }
CanNotConvertMeasureException >> sourceMeasure [

	^sourceMeasure
]

{ #category : #accessing }
CanNotConvertMeasureException >> targetUnit [

	^targetUnit
]
