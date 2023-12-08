Class {
	#name : #Unit,
	#superclass : #Object,
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #accessing }
Unit class >> defaultSign [

	^'NO SIGN'

]

{ #category : #accessing }
Unit class >> nameForManyEndString [

	^'s'


]

{ #category : #accessing }
Unit class >> nameForManyFrom: aString [

	^aString , self nameForManyEndString.


]

{ #category : #'mathematic operations' }
Unit >> * aNumberOrUnit [

	^aNumberOrUnit multiplyByUnit: self
]

{ #category : #'mathematic operations' }
Unit >> / aNumberOrUnit [

	^aNumberOrUnit divideByUnit: self
]

{ #category : #converting }
Unit >> adaptToNumber: aNumber andSend: aSelector [ 
	^ (NumberToArithmeticObjectAdapter number: aNumber) 
		perform: aSelector
		with: self
]

{ #category : #accessing }
Unit >> baseUnit [

	^self subclassResponsibility
]

{ #category : #converting }
Unit >> convertAmountToBaseUnit: aNumber [

	self subclassResponsibility
]

{ #category : #'converting - private' }
Unit >> convertToBaseUnit: aMeasure [ 
	
	self subclassResponsibility
]

{ #category : #accessing }
Unit >> denominator [

	^NullUnit new
]

{ #category : #accessing }
Unit >> denominatorOf: aNumber [

	^self denominator with: aNumber denominator
	

]

{ #category : #'mathematic operations' }
Unit >> divideByUnit: aNumberOrUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> divideDividedUnit: aDividedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> divideInfinity: anInfinity [

	^((NullUnit new / self) * anInfinity unit) with: anInfinity amount
]

{ #category : #'mathematic operations - private' }
Unit >> divideMinusInfinity: aMinusInfinity [

	^((NullUnit new / self) * aMinusInfinity unit) with: aMinusInfinity amount
]

{ #category : #'mathematic operations - private' }
Unit >> divideMultipliedUnit: aMultipliedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> divideNullUnit: aNullUnit [ 

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> divideSimpleMeasure: aMeasure [

	^((NullUnit new / self) * aMeasure unit) with: aMeasure amount
]

{ #category : #'mathematic operations - private' }
Unit >> divideSimpleUnit: aUnit [

	self subclassResponsibility
]

{ #category : #accessing }
Unit >> doNotImplementHash [ 
	
	"Do not implement hash because its behavior is the same as object
	See representSameEntityAs:"
]

{ #category : #testing }
Unit >> isNamed: aName [
 
	^ self name sameAs: aName
]

{ #category : #testing }
Unit >> isNamedAs: aUnit [ 

	^ aUnit isNamed: self name
]

{ #category : #testing }
Unit >> isZero [

	^self isNothing
]

{ #category : #'mathematic operations' }
Unit >> multiplyByUnit: aNumberOrUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> multiplyDividedUnit: aDividedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> multiplyInfinity: anInfinity [

	^(anInfinity unit * self) with: anInfinity amount
]

{ #category : #'mathematic operations - private' }
Unit >> multiplyMinusInfinity: aMinusInfinity [

	^(aMinusInfinity unit * self) with: aMinusInfinity amount
]

{ #category : #'mathematic operations - private' }
Unit >> multiplyMultipliedUnit: aMultipliedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
Unit >> multiplySimpleMeasure: aMeasure [

	^(aMeasure unit * self) with: aMeasure amount
]

{ #category : #'mathematic operations - private' }
Unit >> multiplySimpleUnit: aUnit [

	self subclassResponsibility
]

{ #category : #accessing }
Unit >> name [

	^self nameForOne
]

{ #category : #accessing }
Unit >> nameFor: aNumber [
	"It returns the name that must be used to identify an amount <aNumber> of receiver"

	^aNumber unitNameOf: self
]

{ #category : #accessing }
Unit >> nameForMany [

	self subclassResponsibility
]

{ #category : #accessing }
Unit >> nameForOne [

	self subclassResponsibility
]

{ #category : #accessing }
Unit >> nameForUndefinedAmount [

	^self nameForMany
]

{ #category : #accessing }
Unit >> nothingAmount [

	self subclassResponsibility
]

{ #category : #accessing }
Unit >> nullMeasure [

	^SimpleMeasure amount: self baseUnit nothingAmount unit: self baseUnit
]

{ #category : #accessing }
Unit >> numerator [

	^self
]

{ #category : #accessing }
Unit >> numeratorOf: aNumber [

	^self numerator with: aNumber numerator
]

{ #category : #printing }
Unit >> printOn: aStream [

	aStream nextPutAll: self name asString
]

{ #category : #accessing }
Unit >> reciprocal [

	^self denominator / self numerator
]

{ #category : #testing }
Unit >> sameDomainAs: aUnit [

	^self baseUnit=aUnit baseUnit

]

{ #category : #accessing }
Unit >> sign [

	self subclassResponsibility
]

{ #category : #'measurement creation' }
Unit >> with: aNumber [

	self subclassResponsibility
]
