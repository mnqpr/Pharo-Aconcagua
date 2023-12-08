Class {
	#name : #CompoundMeasure,
	#superclass : #Measure,
	#instVars : [
		'measures'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #'instance creation - private' }
CompoundMeasure class >> measures: aCollection [ 
	"NOTE: THIS METHOD IS PRIVATE. IT ASSUMES THE COLLECTION HAS NO ZERO MEASURES AND
	MEASURES WITH DIFFERENT UNITS. DO NOT USE IT TO CREATE A MEASUREBAG, USE +, -, ETC"

	^self new initializeMeasures: (aCollection 
				collect: [:measure | measure convertToBaseUnit])
]

{ #category : #'instance creation - private' }
CompoundMeasure class >> with: aMeasure with: anotherMeasure [
	"This message is not due to never use. A MeasureBag is created sending the messages #+ or #-.
	If the two measures are of the same domain, directly it gives back a canonized measure to the base unit.
	If they are of different domains, adds the measures canonized.
	This comparison is here and not in Measure so that they are not possible to be created incorrect bag.
	
	DEFINITION: A MeasureBag always has its measures canonized."
	
	^(aMeasure sameDomainAs: anotherMeasure)
		ifTrue: [aMeasure addSameDomainMeasure: anotherMeasure]
		ifFalse: [aMeasure composeWith: anotherMeasure]
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> * aMeasure [

	^aMeasure multiplyCompoundMeasure: self

]

{ #category : #'arithmetic operations' }
CompoundMeasure >> + aMeasure [

	^aMeasure addCompoundMeasure: self
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> / aMeasure [ 

	^aMeasure divideCompoundMeasure: self
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> // aMeasure [

	^aMeasure moduloCompoundMeasure: self
]

{ #category : #comparing }
CompoundMeasure >> = anObject [

	^anObject equalsCompoundMeasure: self
		
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> \\ aMeasure [ 

	^aMeasure remainderCompoundMeasure: self 

]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> addCompoundMeasure: aMeasureBag [

	| measuresByUnit nonNullMeasures |
	
	measuresByUnit := Dictionary new.
	measures do: [:aMeasure | measuresByUnit at: aMeasure baseUnit put: aMeasure].
	aMeasureBag measures do: [:aMeasure | | measureToAdd |
		measureToAdd := measuresByUnit at: aMeasure baseUnit ifAbsent: [0].
		measuresByUnit at: aMeasure baseUnit put: measureToAdd + aMeasure].
	nonNullMeasures := measuresByUnit values reject: [:measure | measure isNothing].
	
	^nonNullMeasures isEmpty
		ifTrue: [0]
		ifFalse: 
			[nonNullMeasures size = 1 
				ifTrue: [nonNullMeasures first]
				ifFalse: [self class measures: nonNullMeasures]]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> addSimpleMeasure: aMeasureToAdd [

	| newMeasures sameBaseUnitMeasure nonNullMeasures |
	
	sameBaseUnitMeasure := self atSameBaseUnitAs: aMeasureToAdd unit.
	newMeasures := measures reject: [:aMeasure | aMeasure baseUnit = sameBaseUnitMeasure baseUnit].
	newMeasures add: sameBaseUnitMeasure + aMeasureToAdd.
	nonNullMeasures := newMeasures reject: [:measure | measure isNothing].
	
	^nonNullMeasures size = 1 
		ifTrue: [nonNullMeasures first]
		ifFalse: [self class measures: nonNullMeasures]
]

{ #category : #accessing }
CompoundMeasure >> amount [
	
	Error signal: 'Amount of a MeasureBag is not defined'
]

{ #category : #accessing }
CompoundMeasure >> atBaseUnit: aBaseUnit ifNone: aBlock [

	^measures detect: [ :aMeasure | aMeasure baseUnit=aBaseUnit ] ifNone: aBlock
	
]

{ #category : #accessing }
CompoundMeasure >> atSameBaseUnitAs: aUnit [

	^self atBaseUnit: aUnit baseUnit ifNone: [0]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> composeDoingOnEachMeasure: aBlock [

	| newMeasures |
	
	newMeasures := measures collect: aBlock.
	^self class measures: newMeasures
]

{ #category : #converting }
CompoundMeasure >> convertAmountToBaseUnit [
	"In fact, always one is going away to raise an exception since amount is not defined for a MeasureBag,
	but it was implemented thus so that the semantics is clear and not to repeat the code that generates the exception"

	^self unit convertAmountToBaseUnit: self amount
]

{ #category : #'converting - private' }
CompoundMeasure >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."
	
	^aMeasureConverter convertCompoundMeasure: self to: aTargetUnit
]

{ #category : #accessing }
CompoundMeasure >> denominator [

	^1
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> divFrom: aNumber [

	aNumber isNothing ifTrue: [^aNumber].
	"This is necesary because enters an infinity loop when sends #truncate to a Fraction which
	denominator is a MeasureBag"
	^CompoundMeasureFraction numerator: aNumber denominator: self
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> divideByMeasure: aMeasure [

	^self composeDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag / aMeasure]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> divideCompoundMeasure: aMeasureBag [

	^measures inject: 0 into: [:resultMeasure :aMeasureInBag | resultMeasure + (aMeasureBag / aMeasureInBag)]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> divideSimpleMeasure: aMeasure [

	^CompoundMeasureFraction numerator: aMeasure denominator: self
]

{ #category : #comparing }
CompoundMeasure >> equalsCompoundMeasure: aMeasureBag [

	^(self - aMeasureBag) isNothing
]

{ #category : #comparing }
CompoundMeasure >> equalsSimpleMeasure: aMeasure [

	^measures allSatisfy: [:aMeasureInBag | 
		(aMeasureInBag sameDomainAs: aMeasure) 
			ifTrue: [aMeasureInBag = aMeasure]
			ifFalse: [aMeasureInBag isNothing]]
]

{ #category : #accessing }
CompoundMeasure >> hash [

	^measures inject: 0 into: [ :hash :measure | hash bitXor: measure hash ].

		
		
]

{ #category : #initialization }
CompoundMeasure >> initializeMeasures: aCollection [

	measures := aCollection
]

{ #category : #testing }
CompoundMeasure >> isCompoundMeasure [

	^true
]

{ #category : #testing }
CompoundMeasure >> isFixed [

	^measures allSatisfy: [ :aMeasure | aMeasure isFixed]
	
	
]

{ #category : #testing }
CompoundMeasure >> isNothing [

	^measures allSatisfy: [ :aMeasure | aMeasure isNothing].
	
	
]

{ #category : #accessing }
CompoundMeasure >> measures [
	"Return a copy because aMeasureBag inmutable"
	
	^measures copy
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> moduloByMeasure: aMeasure [

	^self composeDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag // aMeasure]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> moduloCompoundMeasure: aMeasureBag [

	InvalidBinaryOperationException 
		signalOperationName: 'modulo'
		leftOperand: aMeasureBag
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> moduloSimpleMeasure: aMeasure [

	InvalidBinaryOperationException 
		signalOperationName: 'modulo'
		leftOperand: aMeasure
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> multiplyCompoundMeasure: aMeasureBag [

	^measures inject: 0 into: [:resultMeasure :aMeasureInBag | resultMeasure + (aMeasureBag * aMeasureInBag)]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> multiplySimpleMeasure: aMeasure [

	aMeasure isNothing ifTrue: [^aMeasure].
	^self composeDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag * aMeasure]
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> negated [
	
	^self composeDoingOnEachMeasure: [:aMeasure | aMeasure negated]
]

{ #category : #accessing }
CompoundMeasure >> numberOfMeasures [
	
	^measures size
]

{ #category : #accessing }
CompoundMeasure >> numerator [

	^self
]

{ #category : #printing }
CompoundMeasure >> printOn: aStream [

	measures 
		do: [:aMeasure | aMeasure printOn: aStream]
		separatedBy: [aStream nextPut: $+]
]

{ #category : #printing }
CompoundMeasure >> printShowingDecimalPlaces: aNumberOfDecimals [

	| stream |
	
	stream := WriteStream on: String new.
	measures 
		do: [:aMeasure | stream nextPutAll: (aMeasure printShowingDecimalPlaces: aNumberOfDecimals)  ]
		separatedBy: [stream nextPut: $+].
		
	^stream contents
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> quoFrom: aNumber [

	InvalidBinaryOperationException signalOperationName: 'quotient' leftOperand: aNumber rightOperand: self
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> remFrom: aNumber [

	InvalidBinaryOperationException signalOperationName: 'rest' leftOperand: aNumber rightOperand: self
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> remainderByNumber: aNumber [ 

	^self composeDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag \\ aNumber ]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> remainderCompoundMeasure: aMeasureBag [

	InvalidBinaryOperationException 
		signalOperationName: 'remainder'
		leftOperand: aMeasureBag
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> remainderSimpleMeasure: aMeasure [

	InvalidBinaryOperationException 
		signalOperationName: 'remainder'
		leftOperand: aMeasure
		rightOperand: self
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> roundTo: aNumber [
	
	^self composeDoingOnEachMeasure: [:aMeasure | aMeasure roundTo: aNumber ]
]

{ #category : #'arithmetic operations - private' }
CompoundMeasure >> subtractFrom: aNumber [

	^self negated + aNumber
]

{ #category : #'arithmetic operations' }
CompoundMeasure >> truncated [
	
	^self composeDoingOnEachMeasure: [:aMeasure | aMeasure truncated ]
]

{ #category : #accessing }
CompoundMeasure >> unit [
	
	Error signal: 'Unit of a MeasureBag is not defined'
]

{ #category : #accessing }
CompoundMeasure >> unitNameOf: aUnit [

	Error signal: 'Unit of a MeasureBag is not defined'
]
