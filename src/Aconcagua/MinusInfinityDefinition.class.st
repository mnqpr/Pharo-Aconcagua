Class {
	#name : #MinusInfinityDefinition,
	#superclass : #ArithmeticObject,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #initialization }
MinusInfinityDefinition class >> afterLoadInitialization [

	self initialize
]

{ #category : #naming }
MinusInfinityDefinition class >> globalName [ 

	^ #MinusInfinity
]

{ #category : #initialization }
MinusInfinityDefinition class >> initialize [

	uniqueInstance isNil ifTrue: [ self initializeUniqueInstance ].
	self initializeGlobalVariable.

]

{ #category : #initialization }
MinusInfinityDefinition class >> initializeGlobalVariable [

	Smalltalk at: self globalName put: uniqueInstance 

]

{ #category : #initialization }
MinusInfinityDefinition class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
MinusInfinityDefinition class >> new [

	^uniqueInstance
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> * aMeasure [

	aMeasure isNothing
		ifTrue: [self signalIndeterminateOperation: 'Multiplication' leftOperand: aMeasure].
	^aMeasure multiplyMinusInfinity: self
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> + aMeasure [

	^aMeasure addMinusInfinity: self
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> - aMeasure [

	^aMeasure subtractMinusInfinity: self
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> / aMeasure [

	self signalIndeterminateOperation: 'Division' rightOperand: aMeasure
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> // aMeasure [

	self signalIndeterminateOperation: 'Modulo' rightOperand: aMeasure
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> < aMagnitude [

	^true
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> <= aMagnitude [

	^true
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> > aMagnitude [

	^false
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> >= aMagnitude [

	^self = aMagnitude
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> \\ aMeasure [

	self signalIndeterminateOperation: 'Remainder' rightOperand: aMeasure
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> addInfinity: anInfinity [

	self signalIndeterminateOperation: 'Sum' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> addMinusInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> addSimpleMeasure: aMeasure [

	^self
]

{ #category : #accessing }
MinusInfinityDefinition >> amount [

	^self
]

{ #category : #accessing }
MinusInfinityDefinition >> baseUnit [

	^NullUnit new
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> between: min and: max [

	^(self >= min) and: [self <= max]
]

{ #category : #'magnitude protocol - private' }
MinusInfinityDefinition >> compareGreaterThan: aNumber [

	^false
]

{ #category : #'bag creation - private' }
MinusInfinityDefinition >> composeWith: aMeasure [

	^aMeasure composeWithSimpleMeasure: self
]

{ #category : #'bag creation - private' }
MinusInfinityDefinition >> composeWithNumber: aNumber [

	^CompoundMeasure measures: (OrderedCollection with: self with: aNumber)
]

{ #category : #'bag creation - private' }
MinusInfinityDefinition >> composeWithSimpleMeasure: aMeasure [

	^CompoundMeasure measures: (OrderedCollection with: self with: aMeasure)
]

{ #category : #converting }
MinusInfinityDefinition >> convertAmountToBaseUnit [

	^self unit convertAmountToBaseUnit: self
]

{ #category : #'converting - private' }
MinusInfinityDefinition >> convertInSameDomainTo: aTargetUnit [

	^aTargetUnit convertFromBaseUnit: (self unit convertToBaseUnit: self)
]

{ #category : #converting }
MinusInfinityDefinition >> convertTo: aTargetUnit [

	^(self unit sameDomainAs: aTargetUnit)
		ifTrue: [self convertInSameDomainTo: aTargetUnit]
		ifFalse: [CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aTargetUnit]
]

{ #category : #'converting - private' }
MinusInfinityDefinition >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."

	^aMeasureConverter convertMeasure: self to: aTargetUnit
]

{ #category : #converting }
MinusInfinityDefinition >> convertToBaseUnit [

	^self convertTo: self baseUnit
]

{ #category : #accessing }
MinusInfinityDefinition >> denominator [

	^1
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> divFrom: aNumber [

	^0
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> divideInfinity: anInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> divideMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> divideSimpleMeasure: aMeasure [

	^0
]

{ #category : #comparing }
MinusInfinityDefinition >> equalsCompoundMeasure: aMeasureBag [

	^self = aMeasureBag
]

{ #category : #comparing }
MinusInfinityDefinition >> equalsSimpleMeasure: aMeasure [

	^self = aMeasure
]

{ #category : #'magnitude protocol - private' }
MinusInfinityDefinition >> greaterThanSimpleMeasure: aMeasure [

	^true
]

{ #category : #testing }
MinusInfinityDefinition >> isCompoundMeasure [

	^false
]

{ #category : #testing }
MinusInfinityDefinition >> isFixed [

	^false
]

{ #category : #testing }
MinusInfinityDefinition >> isNothing [

	^false
]

{ #category : #'magnitude protocol - private' }
MinusInfinityDefinition >> lessThanSimpleMeasure: aMeasure [

	^false
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> max: aMagnitude [

	^aMagnitude
]

{ #category : #'magnitude protocol' }
MinusInfinityDefinition >> min: aMagnitude [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> moduloInfinity: anInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> moduloMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> moduloSimpleMeasure: aMeasure [

	^0
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> multiplyInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> multiplyMinusInfinity: aMinusInfinity [

	^aMinusInfinity negated
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> multiplySimpleMeasure: aMeasure [

	^self
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> negated [
  
	^InfinityDefinition new
]

{ #category : #testing }
MinusInfinityDefinition >> negative [

	^false
]

{ #category : #accessing }
MinusInfinityDefinition >> numerator [

	 ^self
]

{ #category : #testing }
MinusInfinityDefinition >> positive [

	^true
]

{ #category : #printing }
MinusInfinityDefinition >> printOn: aStream [

	aStream nextPutAll: 'Minus Infinity'
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> quoFrom: aNumber [

	^aNumber / self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> remFrom: aNumber [

	^aNumber - (self * (self quoFrom: aNumber))
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> remainderInfinity: anInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> remainderMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> remainderSimpleMeasure: aMeasure [

	^aMeasure - (self * (self quoFrom: aMeasure))
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> roundTo: aNumber [

	^self
]

{ #category : #testing }
MinusInfinityDefinition >> sameDomainAs: aMeasure [ 
	
	^self unit sameDomainAs: aMeasure unit
]

{ #category : #testing }
MinusInfinityDefinition >> sameUnitAs: aMeasure [

	^self unit = aMeasure unit
]

{ #category : #exceptions }
MinusInfinityDefinition >> signalIndeterminateOperation: anOperationString leftOperand: aLeftOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: aLeftOperand
		rightOperand: self
]

{ #category : #exceptions }
MinusInfinityDefinition >> signalIndeterminateOperation: anOperationString rightOperand: aRightOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: self
		rightOperand: aRightOperand
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> subtractFrom: aNumber [

	^self negated
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> subtractInfinity: anInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityDefinition >> subtractMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: aMinusInfinity
]

{ #category : #'interval protocol' }
MinusInfinityDefinition >> to: stop [

	^self to: stop by: (self unit with: 1)
]

{ #category : #'interval protocol' }
MinusInfinityDefinition >> to: stop by: step [

	^ArithmeticObjectInterval
		from: self
		to: stop
		by: step
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'arithmetic operations' }
MinusInfinityDefinition >> truncated [

	^self
]

{ #category : #accessing }
MinusInfinityDefinition >> unit [

	^self baseUnit
]

{ #category : #accessing }
MinusInfinityDefinition >> unitNameOf: aUnit [

	^aUnit nameForMany
]
