Class {
	#name : #SimpleMeasure,
	#superclass : #Measure,
	#instVars : [
		'amount',
		'unit'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #'instance creation' }
SimpleMeasure class >> amount: aNumber unit: aUnit [

	^self new initializeAmount: aNumber unit: aUnit
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> * aMeasure [

	^aMeasure multiplySimpleMeasure: self
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> + aMeasure [

	^aMeasure addSimpleMeasure: self.
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> / aMeasure [

	^aMeasure divideSimpleMeasure: self

]

{ #category : #'arithmetic operations' }
SimpleMeasure >> // aMeasure [

	^aMeasure moduloSimpleMeasure: self
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> < aMeasure [

	^aMeasure greaterThanSimpleMeasure: self
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> <= aMeasure [
	"This implemented thus so that the CanNotConvertMeasureException exception rises correctly"

	^(self < aMeasure) or: [ self = aMeasure ]
]

{ #category : #comparing }
SimpleMeasure >> = anObject [

	^anObject equalsSimpleMeasure: self 
		
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> > aMeasure [

	^aMeasure lessThanSimpleMeasure: self
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> >= aMeasure [
	"This implemented thus so that the CanNotConvertMeasureException exception rises correctly"

	^(self > aMeasure) or: [ self = aMeasure ]
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> \\ aMeasure [

	^aMeasure remainderSimpleMeasure: self
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> abs [

	^self unit with: amount abs
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> addCompoundMeasure: aMeasureBag [

	^aMeasureBag addSimpleMeasure: self
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> addInfinity: anInfinity [

	^anInfinity
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> addMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> addSameDomainMeasure: aMeasure [

	^(self sameUnitAs: aMeasure) 
		ifTrue: [self class amount: amount + aMeasure amount unit: unit]
		ifFalse: 
			[self class 
				amount: self convertAmountToBaseUnit + aMeasure convertAmountToBaseUnit
				unit: self baseUnit]
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> addSimpleMeasure: aMeasure [ 
	"I delegate the responsibility to CompoundMeasure since this it verifies if the measures are of the same domain.
	When causing that bag has this responsibility, the code that checks this this in a single place and is not created bag
	for measures of the same domain."

	^CompoundMeasure with: aMeasure with: self
]

{ #category : #accessing }
SimpleMeasure >> amount [
	
	^amount
]

{ #category : #accessing }
SimpleMeasure >> atBaseUnit: aBaseUnit ifNone: aBlock [

	^self baseUnit = aBaseUnit ifTrue: [self] ifFalse: aBlock
]

{ #category : #accessing }
SimpleMeasure >> baseUnit [
	
	^self unit baseUnit
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> between: min and: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^(self >= min) and: [self <= max]
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> between: min andNotInclusive: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^self >= min and: [self < max]
]

{ #category : #'magnitude protocol - private' }
SimpleMeasure >> compareGreaterThan: aNumber [

	^aNumber = 0 
		ifTrue: [ self amount > aNumber ]
		ifFalse: [ CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aNumber unit ]
	
]

{ #category : #'bag creation - private' }
SimpleMeasure >> composeWith: aMeasure [

	^self isNothing
		ifTrue: [aMeasure]
		ifFalse: [aMeasure composeWithSimpleMeasure: self]
]

{ #category : #'bag creation - private' }
SimpleMeasure >> composeWithNumber: aNumber [

	^self isNothing
		ifTrue: [aNumber]
		ifFalse: [CompoundMeasure measures: (OrderedCollection with: self with: aNumber)]
]

{ #category : #'bag creation - private' }
SimpleMeasure >> composeWithSimpleMeasure: aMeasure [

	^self isNothing
		ifTrue: [aMeasure]
		ifFalse: 
			[CompoundMeasure measures: (OrderedCollection with: self with: aMeasure)]
]

{ #category : #converting }
SimpleMeasure >> convertAmountToBaseUnit [
	
	^self unit convertAmountToBaseUnit: self amount
]

{ #category : #'converting - private' }
SimpleMeasure >> convertInSameDomainTo: aTargetUnit [

	^aTargetUnit convertFromBaseUnit: (unit convertToBaseUnit: self)
]

{ #category : #converting }
SimpleMeasure >> convertTo: aTargetUnit [

	^(unit sameDomainAs: aTargetUnit) 
		ifTrue: [self convertInSameDomainTo: aTargetUnit]
		ifFalse: [CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aTargetUnit]
]

{ #category : #'converting - private' }
SimpleMeasure >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."
	
	^aMeasureConverter convertMeasure: self to: aTargetUnit
]

{ #category : #converting }
SimpleMeasure >> convertToBaseUnit [

	^self convertTo: self baseUnit
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> divFrom: aNumber [

	^self divideSimpleMeasure: aNumber
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> divideCompoundMeasure: aMeasureBag [

	^aMeasureBag divideByMeasure: self
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> divideInfinity: anInfinity [

	^0
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> divideMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> divideSimpleMeasure: aMeasure [

	| numerator denominator |
	
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	
	^numerator unit / denominator unit 
		with: numerator amount / denominator amount
]

{ #category : #comparing }
SimpleMeasure >> equalsCompoundMeasure: aMeasureBag [

	^aMeasureBag equalsSimpleMeasure: self
]

{ #category : #comparing }
SimpleMeasure >> equalsSimpleMeasure: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	If no, if it is of the same domain it turns the amount and it compares.
	If no, it returns false."

	^unit = aMeasure unit 
		ifTrue: [amount = aMeasure amount]
		ifFalse: 
			[(self sameDomainAs: aMeasure) 
				ifTrue: [self convertAmountToBaseUnit = aMeasure convertAmountToBaseUnit]
				ifFalse: [self isNothing and: [aMeasure isNothing]]]
]

{ #category : #accessing }
SimpleMeasure >> floor [
	
	^unit with: amount floor
]

{ #category : #'magnitude protocol - private' }
SimpleMeasure >> greaterThanSimpleMeasure: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	aMeasure converts to baseUnit so that if there is some error of conversion this jumps fast and generates
	CanNotConvertMeasureException correctly."
	
	^unit = aMeasure unit 
		ifTrue: [aMeasure amount < amount]
		ifFalse: 
			[(aMeasure convertTo: self baseUnit) amount 
				< self convertAmountToBaseUnit]
]

{ #category : #accessing }
SimpleMeasure >> hash [

	^self convertAmountToBaseUnit hash
]

{ #category : #initialization }
SimpleMeasure >> initializeAmount: aNumber unit: aUnit [ 

	amount := aNumber.
	unit := aUnit
]

{ #category : #testing }
SimpleMeasure >> isCompoundMeasure [

	^false
]

{ #category : #testing }
SimpleMeasure >> isFixed [

	^amount isFixed
]

{ #category : #testing }
SimpleMeasure >> isNothing [

	^self convertToBaseUnit amount = self baseUnit nothingAmount
]

{ #category : #'magnitude protocol - private' }
SimpleMeasure >> lessThanSimpleMeasure: aMeasure [ 
	"If the unit is the same one, verifies only the amount.
	aMeasure converts to baseUnit so that if there is some error of conversion this jumps fast and generates
	CanNotConvertMeasureException correctly."

	^unit = aMeasure unit 
		ifTrue: [aMeasure amount > amount]
		ifFalse: 
			[(aMeasure convertTo: self baseUnit) amount 
				> self convertAmountToBaseUnit]
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> max: aMeasure [

	 ^self < aMeasure
		ifTrue: [aMeasure]
		ifFalse: [ self ]
]

{ #category : #accessing }
SimpleMeasure >> measures [

	^self isNothing
		ifTrue: [#()]
		ifFalse: [Array with: self]
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> min: aMeasure [

	 ^self < aMeasure
		ifTrue: [ self ]
		ifFalse: [ aMeasure ]
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> moduloCompoundMeasure: aMeasureBag [

	^aMeasureBag moduloByMeasure: self
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> moduloInfinity: anInfinity [

	^0
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> moduloMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> moduloSimpleMeasure: aMeasure [

	| numerator denominator |
	
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	
	^numerator unit / denominator unit 
		with: numerator amount // denominator amount
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> multiplyCompoundMeasure: aMeasureBag [

	^aMeasureBag multiplySimpleMeasure: self
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> multiplyInfinity: anInfinity [

	^anInfinity
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> multiplyMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> multiplySimpleMeasure: aMeasure [

	| leftFactor rightFactor |
	
	leftFactor := aMeasure convertToBaseUnit.
	rightFactor := self convertToBaseUnit.
	
	^leftFactor unit * rightFactor unit 
		with: leftFactor amount * rightFactor amount
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> negated [

	^self class amount: amount negated unit: unit
]

{ #category : #testing }
SimpleMeasure >> negative [

	^amount negative
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> notInclusiveBetween: min and: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^self > min and: [self <= max]
]

{ #category : #'magnitude protocol' }
SimpleMeasure >> notInclusiveBetween: min andNotInclusive: max [
	"The comparison this done thus so that if there is error of conversion is generated the exception correctly"

	 ^self > min and: [self < max]
]

{ #category : #testing }
SimpleMeasure >> positive [

	^amount positive
]

{ #category : #printing }
SimpleMeasure >> printOn: aStream [

	amount printOn: aStream.
	aStream space.
	aStream nextPutAll: (self unit nameFor: self amount) asString
]

{ #category : #printing }
SimpleMeasure >> printShowingDecimalPlaces: aNumberOfDecimals [

	^(amount printShowingDecimalPlaces: aNumberOfDecimals),  ' ', (self unit nameFor: self amount) asString
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> quoFrom: aNumber [

	^NullUnit new / unit with: (aNumber quo: amount)
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> remFrom: aNumber [

	^aNumber isNothing
		ifTrue: [ InvalidBinaryOperationException signalOperationName: 'rest' leftOperand: aNumber rightOperand: self ]
		ifFalse: [ (unit with: (amount rem: aNumber)) / self ]
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> remainderCompoundMeasure: aMeasureBag [

	InvalidBinaryOperationException 
		signalOperationName: 'remainder'
		leftOperand: aMeasureBag
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> remainderInfinity: anInfinity [

	^0
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> remainderMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> remainderSimpleMeasure: aMeasure [

	| numerator denominator |
	
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	
	^numerator baseUnit with: numerator amount \\ denominator amount
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> roundTo: aNumber [
	
	^self class amount: (amount roundTo: aNumber) unit: unit
]

{ #category : #testing }
SimpleMeasure >> sameDomainAs: aMeasure [ 
	
	^self unit sameDomainAs: aMeasure unit
]

{ #category : #testing }
SimpleMeasure >> sameUnitAs: aMeasure [ 
	
	^unit = aMeasure unit
]

{ #category : #testing }
SimpleMeasure >> strictlyPositive [
	
	^amount strictlyPositive
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> subtractFrom: aNumber [

	^self negated addSimpleMeasure: aNumber
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> subtractInfinity: anInfinity [

	^anInfinity
]

{ #category : #'arithmetic operations - private' }
SimpleMeasure >> subtractMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'interval protocol' }
SimpleMeasure >> to: stop [

	 ^self to: stop by: (unit with: 1)
]

{ #category : #'interval protocol' }
SimpleMeasure >> to: stop by: step [

	 ^ArithmeticObjectInterval from: self to: stop by: step
]

{ #category : #'arithmetic operations' }
SimpleMeasure >> truncated [
	
	^self class amount: amount truncated unit: unit
]

{ #category : #accessing }
SimpleMeasure >> unit [

	^unit
]

{ #category : #accessing }
SimpleMeasure >> unitNameOf: aUnit [

	^self amount abs = 1 ifTrue: [aUnit nameForOne] ifFalse: [aUnit nameForMany]
]
