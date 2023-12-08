Class {
	#name : #InfinityDefinition,
	#superclass : #ArithmeticObject,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #initialization }
InfinityDefinition class >> afterLoadInitialization [

	self initialize
]

{ #category : #naming }
InfinityDefinition class >> globalName [ 

	^ #Infinity 
]

{ #category : #initialization }
InfinityDefinition class >> initialize [

	uniqueInstance isNil ifTrue: [ self initializeUniqueInstance ].
	self initializeGlobalVariable.

]

{ #category : #initialization }
InfinityDefinition class >> initializeGlobalVariable [

	Smalltalk at: self globalName put: uniqueInstance 


]

{ #category : #initialization }
InfinityDefinition class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
InfinityDefinition class >> new [

	^uniqueInstance
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> * aMeasure [

	aMeasure isNothing
		ifTrue: [self signalIndeterminateOperation: 'Multiplication' leftOperand: aMeasure].
	^aMeasure multiplyInfinity: self
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> + aMeasure [

	^aMeasure addInfinity: self
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> - aMeasure [

	^aMeasure subtractInfinity: self
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> / aMeasure [

	self signalIndeterminateOperation: 'Division' rightOperand: aMeasure
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> // aMeasure [

	self signalIndeterminateOperation: 'Modulo' rightOperand: aMeasure
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> < aMagnitude [

	^false
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> <= aMagnitude [

	^self = aMagnitude
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> > aMagnitude [

	^(self = aMagnitude) not
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> >= aMagnitude [

	^true
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> \\ aMeasure [

	self signalIndeterminateOperation: 'Remainder' rightOperand: aMeasure
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> addInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> addMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Sum' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> addSimpleMeasure: aMeasure [

	^self
]

{ #category : #accessing }
InfinityDefinition >> amount [

	^self
]

{ #category : #accessing }
InfinityDefinition >> baseUnit [

	^NullUnit new
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> between: min and: max [

	^(self >= min) and: [self <= max]
]

{ #category : #'magnitude protocol - private' }
InfinityDefinition >> compareGreaterThan: aNumber [

	^true
]

{ #category : #'bag creation - private' }
InfinityDefinition >> composeWith: aMeasure [

	^aMeasure composeWithSimpleMeasure: self
]

{ #category : #'bag creation - private' }
InfinityDefinition >> composeWithNumber: aNumber [

	^CompoundMeasure measures: (OrderedCollection with: self with: aNumber)
]

{ #category : #'bag creation - private' }
InfinityDefinition >> composeWithSimpleMeasure: aMeasure [

	^CompoundMeasure measures: (OrderedCollection with: self with: aMeasure)
]

{ #category : #converting }
InfinityDefinition >> convertAmountToBaseUnit [

	^self unit convertAmountToBaseUnit: self
]

{ #category : #'converting - private' }
InfinityDefinition >> convertInSameDomainTo: aTargetUnit [

	^aTargetUnit convertFromBaseUnit: (self unit convertToBaseUnit: self)
]

{ #category : #converting }
InfinityDefinition >> convertTo: aTargetUnit [

	^(self unit sameDomainAs: aTargetUnit)
		ifTrue: [self convertInSameDomainTo: aTargetUnit]
		ifFalse: [CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aTargetUnit]
]

{ #category : #'converting - private' }
InfinityDefinition >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."

	^aMeasureConverter convertMeasure: self to: aTargetUnit
]

{ #category : #converting }
InfinityDefinition >> convertToBaseUnit [

	^self convertTo: self baseUnit
]

{ #category : #accessing }
InfinityDefinition >> denominator [

	^1
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> divFrom: aNumber [

	^0
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> divideInfinity: anInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> divideMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> divideSimpleMeasure: aMeasure [

	^0
]

{ #category : #comparing }
InfinityDefinition >> equalsCompoundMeasure: aMeasureBag [

	^self = aMeasureBag
]

{ #category : #comparing }
InfinityDefinition >> equalsSimpleMeasure: aMeasure [

	^self = aMeasure
]

{ #category : #'magnitude protocol - private' }
InfinityDefinition >> greaterThanSimpleMeasure: aMeasure [

	^true
]

{ #category : #testing }
InfinityDefinition >> isCompoundMeasure [

	^false
]

{ #category : #testing }
InfinityDefinition >> isFixed [

	^false
]

{ #category : #testing }
InfinityDefinition >> isNothing [

	^false
]

{ #category : #'magnitude protocol - private' }
InfinityDefinition >> lessThanSimpleMeasure: aMeasure [

	^false
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> max: aMagnitude [

	^self
]

{ #category : #'magnitude protocol' }
InfinityDefinition >> min: aMagnitude [

	^aMagnitude
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> moduloInfinity: anInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> moduloMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> moduloSimpleMeasure: aMeasure [

	^0
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> multiplyInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> multiplyMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> multiplySimpleMeasure: aMeasure [

	^self
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> negated [

	^MinusInfinityDefinition new
]

{ #category : #testing }
InfinityDefinition >> negative [

	^false
]

{ #category : #accessing }
InfinityDefinition >> numerator [

	 ^self
]

{ #category : #testing }
InfinityDefinition >> positive [

	^true
]

{ #category : #printing }
InfinityDefinition >> printOn: aStream [

	aStream nextPutAll: 'Infinity'
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> quoFrom: aNumber [

	^aNumber / self
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> remFrom: aNumber [

	^aNumber - (self * (self quoFrom: aNumber))
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> remainderInfinity: anInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> remainderMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> remainderSimpleMeasure: aMeasure [

	^aMeasure - (self * (self quoFrom: aMeasure))
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> roundTo: aNumber [

	^self
]

{ #category : #testing }
InfinityDefinition >> sameDomainAs: aMeasure [ 
	
	^self unit sameDomainAs: aMeasure unit
]

{ #category : #testing }
InfinityDefinition >> sameUnitAs: aMeasure [

	^self unit = aMeasure unit
]

{ #category : #exceptions }
InfinityDefinition >> signalIndeterminateOperation: anOperationString leftOperand: aLeftOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: aLeftOperand
		rightOperand: self
]

{ #category : #exceptions }
InfinityDefinition >> signalIndeterminateOperation: anOperationString rightOperand: aRightOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: self
		rightOperand: aRightOperand
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> subtractFrom: aNumber [

	^self negated
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> subtractInfinity: anInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityDefinition >> subtractMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: aMinusInfinity
]

{ #category : #'interval protocol' }
InfinityDefinition >> to: stop [

	^self to: stop by: (self unit with: 1)
]

{ #category : #'interval protocol' }
InfinityDefinition >> to: stop by: step [

	^ArithmeticObjectInterval
		from: self
		to: stop
		by: step
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'arithmetic operations' }
InfinityDefinition >> truncated [

	^self
]

{ #category : #accessing }
InfinityDefinition >> unit [

	^self baseUnit
]

{ #category : #accessing }
InfinityDefinition >> unitNameOf: aUnit [

	^aUnit nameForMany
]
