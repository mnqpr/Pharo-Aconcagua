Class {
	#name : #InvalidProportionalUnitConversionFunctionException,
	#superclass : #Error,
	#instVars : [
		'sourceMeasure',
		'equivalentMeasure'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #signaling }
InvalidProportionalUnitConversionFunctionException class >> signalSourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	(self sourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure) signal
]

{ #category : #'instance creation' }
InvalidProportionalUnitConversionFunctionException class >> sourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	^self new initializeSourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure
]

{ #category : #accessing }
InvalidProportionalUnitConversionFunctionException >> description [

	^'The proportional relation between {1} and {2} it is not valid because {1} represents nothing or they are not of the same domain' format: { sourceMeasure .equivalentMeasure }
]

{ #category : #accessing }
InvalidProportionalUnitConversionFunctionException >> equivalentMeasure [

	^equivalentMeasure
]

{ #category : #initialization }
InvalidProportionalUnitConversionFunctionException >> initializeSourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	sourceMeasure := aSourceMeasure.
	equivalentMeasure := aEquivalentMeasure
]

{ #category : #accessing }
InvalidProportionalUnitConversionFunctionException >> sourceMeasure [

	^sourceMeasure
]
