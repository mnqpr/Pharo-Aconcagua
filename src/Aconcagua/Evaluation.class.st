Class {
	#name : #Evaluation,
	#superclass : #ArithmeticObject,
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #'mathematic operations' }
Evaluation >> * anAritmethicObject [

	^self value * anAritmethicObject value
]

{ #category : #'mathematic operations' }
Evaluation >> + anAritmethicObject [

	^self value + anAritmethicObject value
]

{ #category : #'mathematic operations' }
Evaluation >> - anAritmethicObject [

	^self value - anAritmethicObject value
]

{ #category : #'mathematic operations' }
Evaluation >> / anAritmethicObject [

	^self value / anAritmethicObject value
]

{ #category : #'mathematic operations' }
Evaluation >> // anAritmethicObject [

	^self value // anAritmethicObject value
]

{ #category : #'magnitude protocol' }
Evaluation >> < aMagnitude [

	^self value < aMagnitude
]

{ #category : #'magnitude protocol' }
Evaluation >> <= aMagnitude [
	"Send value to self so that it is faster and does not pass through #doesNotUnderstand"

	^(aMagnitude < self value) not
]

{ #category : #comparing }
Evaluation >> = anObject [

	^self value = anObject value
]

{ #category : #'magnitude protocol' }
Evaluation >> > aMagnitude [
	"Send value to self so that it is faster and does not pass through #doesNotUnderstand"

	^aMagnitude < self value
]

{ #category : #'magnitude protocol' }
Evaluation >> >= aMagnitude [
	"Send value to self so that it is faster and does not pass through #doesNotUnderstand"

	^(self value < aMagnitude) not
]

{ #category : #'mathematic operations' }
Evaluation >> \\ anAritmethicObject [

	^self value \\ anAritmethicObject value
]

{ #category : #'mathematic operations - private' }
Evaluation >> addCompoundMeasure: aMeasureBag [

	^self value addCompoundMeasure: aMeasureBag
]

{ #category : #'arithmetic operations - private' }
Evaluation >> addInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
Evaluation >> addMinusInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Evaluation >> addSimpleMeasure: aMeasure [

	^self value addSimpleMeasure: aMeasure
]

{ #category : #accessing }
Evaluation >> amount [
	
	^self value amount
]

{ #category : #accessing }
Evaluation >> atBaseUnit: aBaseUnit ifNone: aBlock [

	^self value atBaseUnit: aBaseUnit ifNone: aBlock
]

{ #category : #accessing }
Evaluation >> baseUnit [

	^self unit baseUnit
]

{ #category : #'magnitude protocol' }
Evaluation >> between: min and: max [
	"Send value to self so that it is faster and does not pass through #doesNotUnderstand"

	^(min <= self value) and: [self value <= max]
]

{ #category : #'magnitude protocol - private' }
Evaluation >> compareGreaterThan: aNumber [

	^self value compareGreaterThan: aNumber
]

{ #category : #'bag creation - private' }
Evaluation >> composeWith: aMeasure [

	^self value composeWith: aMeasure
]

{ #category : #'bag creation - private' }
Evaluation >> composeWithNumber: aMeasure [

	^self value composeWithNumber: aMeasure
]

{ #category : #'bag creation - private' }
Evaluation >> composeWithSimpleMeasure: aMeasure [

	^self value composeWithSimpleMeasure: aMeasure
]

{ #category : #converting }
Evaluation >> convertAmountToBaseUnit [

	^self value convertAmountToBaseUnit
]

{ #category : #converting }
Evaluation >> convertTo: aUnit [

	^self value convertTo: aUnit
]

{ #category : #'converting - private' }
Evaluation >> convertTo: aTargetUnit using: aMeasureConverter [

	^self value convertTo: aTargetUnit using: aMeasureConverter
]

{ #category : #converting }
Evaluation >> convertToBaseUnit [

	^self value convertToBaseUnit
]

{ #category : #'mathematic operations - private' }
Evaluation >> divFrom: aNumber [ 
	
	^self value divFrom: aNumber
]

{ #category : #'mathematic operations - private' }
Evaluation >> divideCompoundMeasure: aMeasureBag [

	^self value divideCompoundMeasure: aMeasureBag
]

{ #category : #'arithmetic operations - private' }
Evaluation >> divideInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
Evaluation >> divideMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Evaluation >> divideSimpleMeasure: aMeasure [

	^self value divideSimpleMeasure: aMeasure
]

{ #category : #'message forwarding' }
Evaluation >> doesNotUnderstand: aMessage [

	^aMessage sendTo: self value
]

{ #category : #comparing }
Evaluation >> equalsCompoundMeasure: aMeasureBag [

	^self value = aMeasureBag
]

{ #category : #comparing }
Evaluation >> equalsSimpleMeasure: aMeasure [

	^self value = aMeasure
]

{ #category : #'magnitude protocol - private' }
Evaluation >> greaterThanSimpleMeasure: aMeasure [

	^self value greaterThanSimpleMeasure: aMeasure
]

{ #category : #comparing }
Evaluation >> hash [

	^self value hash
]

{ #category : #testing }
Evaluation >> isCompoundMeasure [

	^self value isCompoundMeasure
]

{ #category : #testing }
Evaluation >> isFixed [

	^self value isFixed
]

{ #category : #testing }
Evaluation >> isNothing [

	^self value isNothing
]

{ #category : #'magnitude protocol - private' }
Evaluation >> lessThanSimpleMeasure: aMeasure [

	^self value lessThanSimpleMeasure: aMeasure
]

{ #category : #'magnitude protocol' }
Evaluation >> max: aMagnitude [
	"Send value to self so that it is faster and does not pass through #doesNotUnderstand.
	Self is given back and not self value to continue maintaining the evaluation"

	self value < aMagnitude ifTrue: [^aMagnitude].
	^self
]

{ #category : #accessing }
Evaluation >> measures [

	^self value measures
]

{ #category : #'magnitude protocol' }
Evaluation >> min: aMagnitude [
	"Send value to self so that it is faster and does not pass through #doesNotUnderstand.
	Self is given back and not self value to continue maintaining the evaluation"

	self value < aMagnitude ifTrue: [^self].
	^aMagnitude
]

{ #category : #'mathematic operations - private' }
Evaluation >> moduloCompoundMeasure: aMeasureBag [

	^self value moduloCompoundMeasure: aMeasureBag
]

{ #category : #'arithmetic operations - private' }
Evaluation >> moduloInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
Evaluation >> moduloMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Evaluation >> moduloSimpleMeasure: aMeasure [

	^self value moduloSimpleMeasure: aMeasure
]

{ #category : #'mathematic operations - private' }
Evaluation >> multiplyCompoundMeasure: aMeasureBag [

	^self value multiplyCompoundMeasure: aMeasureBag
]

{ #category : #'arithmetic operations - private' }
Evaluation >> multiplyInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
Evaluation >> multiplyMinusInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Evaluation >> multiplySimpleMeasure: aMeasure [

	^self value multiplySimpleMeasure: aMeasure
]

{ #category : #'mathematic operations' }
Evaluation >> negated [
	
	^self value negated
]

{ #category : #testing }
Evaluation >> negative [

	^self value negative
]

{ #category : #'magnitude protocol' }
Evaluation >> notInclusiveBetween: min and: max [
	"Create local variable #val for best performance"

	| val |

	val := self value.
	^val > min and: [val <= max]
]

{ #category : #'magnitude protocol' }
Evaluation >> notInclusiveBetween: min andNotInclusive: max [
	"Create local variable #val for best performance"

	| val |

	val := self value.
	^val > min and: [val < max]
]

{ #category : #testing }
Evaluation >> positive [

	^self value positive
]

{ #category : #printing }
Evaluation >> printOn: aStream [

	self value printOn: aStream
]

{ #category : #'mathematic operations - private' }
Evaluation >> quoFrom: aNumber [

	^self value quoFrom: aNumber

]

{ #category : #'mathematic operations - private' }
Evaluation >> remFrom: aNumber [

	^self value remFrom: aNumber

]

{ #category : #'mathematic operations - private' }
Evaluation >> remainderCompoundMeasure: aMeasureBag [

	^self value remainderCompoundMeasure: aMeasureBag
]

{ #category : #'arithmetic operations - private' }
Evaluation >> remainderInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
Evaluation >> remainderMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Evaluation >> remainderSimpleMeasure: aMeasure [

	^self value remainderSimpleMeasure: aMeasure
]

{ #category : #'proxy implementation' }
Evaluation >> respondsTo: aSymbol [

	^(super respondsTo: aSymbol) or:[self value respondsTo: aSymbol]
]

{ #category : #'arithmetic operations' }
Evaluation >> roundTo: aNumber [
	
	^self value roundTo: aNumber

]

{ #category : #testing }
Evaluation >> sameDomainAs: aMeasure [

	^self value sameDomainAs: aMeasure
]

{ #category : #testing }
Evaluation >> sameUnitAs: aMeasure [

	^self value sameUnitAs: aMeasure
]

{ #category : #'mathematic operations - private' }
Evaluation >> subtractFrom: aNumber [

	^self value subtractFrom: aNumber
]

{ #category : #'arithmetic operations - private' }
Evaluation >> subtractInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
Evaluation >> subtractMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'interval protocol' }
Evaluation >> to: stop [

	^self value to: stop
]

{ #category : #'interval protocol' }
Evaluation >> to: stop by: step [

	^self to: stop by: step
]

{ #category : #'mathematic operations' }
Evaluation >> truncated [
	
	^self value truncated

]

{ #category : #accessing }
Evaluation >> unit [
	
	^self value unit
]

{ #category : #accessing }
Evaluation >> unitNameFor: aNumber [

	^self value unitNameFor: aNumber
]

{ #category : #evaluating }
Evaluation >> value [

	self subclassResponsibility
]
