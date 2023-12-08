Extension { #name : #Number }

{ #category : #'*Aconcagua-Extensions' }
Number >> addCompoundMeasure: aMeasureBag [

	^aMeasureBag addSimpleMeasure: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> addInfinity: anInfinity [

	^anInfinity
]

{ #category : #'*Aconcagua-Extensions' }
Number >> addMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'*Aconcagua-Extensions' }
Number >> addSimpleMeasure: aMeasure [

	^CompoundMeasure with: aMeasure with: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> amount [

	^self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> baseUnit [

	^NullUnit new
]

{ #category : #'*Aconcagua-Extensions' }
Number >> compareGreaterThan: aNumber [

	^aNumber < self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> composeWith: aMeasure [

	^aMeasure composeWithNumber: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> composeWithNumber: aNumber [

	self error: 'A MeasureBag should not be created only with numbers'
]

{ #category : #'*Aconcagua-Extensions' }
Number >> composeWithSimpleMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure]
		ifFalse: [aMeasure composeWithNumber: self]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> convertAmountToBaseUnit [

	^self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> convertTo: aTargetUnit [ 
	"A number only can be converted in a number... therefore, if the unit to which it is wanted to convert
	is the same to the one of the numbers returns self, else returns an error."
	
	^aTargetUnit = self baseUnit
		ifTrue: [ self ]
		ifFalse: [ 
			CanNotConvertMeasureException
				signalSourceMeasure: self 
				targetUnit: aTargetUnit ]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> convertTo: aUnit ifSuccessful: aSuccessfulBlock ifFails: aFailureBlock [

	| convertedMeasure |
	
	convertedMeasure := [ self convertTo: aUnit ] 
		on: CanNotConvertMeasureException 
		do: [ :anError | ^aFailureBlock value ].
		
	^aSuccessfulBlock value: convertedMeasure 
]

{ #category : #'*Aconcagua-Extensions' }
Number >> convertToBaseUnit [

	^self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> denominator [

	^self asFraction denominator
]

{ #category : #'*Aconcagua-Extensions' }
Number >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> divideCompoundMeasure: aMeasureBag [

	^aMeasureBag divideByMeasure: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> divideInfinity: anInfinity [

	^0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> divideMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> divideSimpleMeasure: aMeasure [

	^SimpleMeasure amount: aMeasure amount / self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Extensions' }
Number >> equalsCompoundMeasure: aMeasureBag [

	^aMeasureBag equalsSimpleMeasure: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> equalsSimpleMeasure: aMeasure [

	^self isNothing and: [aMeasure isNothing]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> fromInfinity [

	^ArithmeticObjectInterval
		from: Infinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Extensions' }
Number >> fromMinusInfinity [

	^ArithmeticObjectInterval
		from: MinusInfinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Extensions' }
Number >> greaterThanSimpleMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure < aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount < self]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> isCompoundMeasure [

	^false
]

{ #category : #'*Aconcagua-Extensions' }
Number >> isFixed [

	^true
]

{ #category : #'*Aconcagua-Extensions' }
Number >> isNothing [

	^self = 0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> lessThanSimpleMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure > aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount > self]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> moduloCompoundMeasure: aMeasureBag [

	^aMeasureBag moduloByMeasure: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> moduloInfinity: anInfinity [

	^0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> moduloMinusInfinity: aMInusInfinity [

	^0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> moduloSimpleMeasure: aMeasure [

	^SimpleMeasure amount: aMeasure amount // self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Extensions' }
Number >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> multiplyCompoundMeasure: aMeasureBag [

	^aMeasureBag multiplySimpleMeasure: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> multiplyInfinity: anInfinity [

	^self > 0 ifTrue: [anInfinity] ifFalse: [anInfinity negated]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> multiplyMinusInfinity: aMinusInfinity [

	^self > 0 ifTrue: [aMinusInfinity] ifFalse: [aMinusInfinity negated]
]

{ #category : #'*Aconcagua-Extensions' }
Number >> multiplySimpleMeasure: aMeasure [

	^SimpleMeasure amount: aMeasure amount * self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Extensions' }
Number >> numerator [

	^self asFraction numerator
]

{ #category : #'*Aconcagua-Extensions' }
Number >> remainderCompoundMeasure: aMeasureBag [

	^aMeasureBag remainderByNumber: self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> remainderInfinity: anInfinity [

	^0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> remainderMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'*Aconcagua-Extensions' }
Number >> remainderSimpleMeasure: aMeasure [

	^SimpleMeasure amount: aMeasure amount \\ self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Extensions' }
Number >> sameDomainAs: aMeasure [

	^self unit sameDomainAs: aMeasure unit
]

{ #category : #'*Aconcagua-Extensions' }
Number >> subtractFrom: aNumber [

	^aNumber - self
]

{ #category : #'*Aconcagua-Extensions' }
Number >> subtractInfinity: anInfinity [

	^anInfinity
]

{ #category : #'*Aconcagua-Extensions' }
Number >> subtractMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'*Aconcagua-Extensions' }
Number >> toInfinity [

	^ArithmeticObjectInterval
		from: self
		to: Infinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Extensions' }
Number >> toMinusInfinity [

	^ArithmeticObjectInterval
		from: self
		to: MinusInfinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Extensions' }
Number >> unit [

	^self baseUnit
]

{ #category : #'*Aconcagua-Extensions' }
Number >> unitNameOf: aUnit [

	^self abs = 1 ifTrue: [aUnit nameForOne] ifFalse: [aUnit nameForMany]
]
