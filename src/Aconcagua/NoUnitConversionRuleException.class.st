Class {
	#name : #NoUnitConversionRuleException,
	#superclass : #Error,
	#instVars : [
		'targetUnit',
		'sourceUnit'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #signaling }
NoUnitConversionRuleException class >> signalWithSourceUnit: aSourceUnit targetUnit: aTargetUnit [

	(self sourceUnit: aSourceUnit targetUnit: aTargetUnit) signal
]

{ #category : #'instance creation' }
NoUnitConversionRuleException class >> sourceUnit: aSourceUnit targetUnit: aTargetUnit [

	^self new initializeWith: aSourceUnit targetUnit: aTargetUnit
]

{ #category : #accessing }
NoUnitConversionRuleException >> description [

	^'Does not exist a conversion rule from {1} to {2}' format: { sourceUnit .targetUnit }
]

{ #category : #initialization }
NoUnitConversionRuleException >> initializeWith: aSourceUnit targetUnit: aTargetUnit [

	sourceUnit := aSourceUnit.
	targetUnit := aTargetUnit
]

{ #category : #accessing }
NoUnitConversionRuleException >> sourceUnit [ 

	^sourceUnit

]

{ #category : #accessing }
NoUnitConversionRuleException >> targetUnit [ 

	^targetUnit
]
