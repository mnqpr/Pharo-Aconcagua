Class {
	#name : #NullUnit,
	#superclass : #Unit,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #initialization }
NullUnit class >> afterLoadInitialization [

	self initialize
]

{ #category : #initialization }
NullUnit class >> initialize [

	uniqueInstance isNil ifTrue: [ self initializeUniqueInstance ]
]

{ #category : #initialization }
NullUnit class >> initializeUniqueInstance [

	uniqueInstance := super new.
]

{ #category : #'instance creation' }
NullUnit class >> new [

	^uniqueInstance
]

{ #category : #accessing }
NullUnit >> baseUnit [
	
	^self
]

{ #category : #converting }
NullUnit >> convertAmountFromBaseUnit: aNumber [

	^0
]

{ #category : #converting }
NullUnit >> convertAmountToBaseUnit: aNumber [

	^0
]

{ #category : #'converting - private' }
NullUnit >> convertFromBaseUnit: aMeasure [ 
	
	^aMeasure
]

{ #category : #'converting - private' }
NullUnit >> convertToBaseUnit: aMeasure [ 
	
	^aMeasure
]

{ #category : #'mathematic operations' }
NullUnit >> divideByUnit: aUnit [

	^aUnit
]

{ #category : #'mathematic operations - private' }
NullUnit >> divideDividedUnit: aDividedUnit [

	^aDividedUnit reciprocal
]

{ #category : #'mathematic operations - private' }
NullUnit >> divideMultipliedUnit: aMultipliedUnit [

	^DividedUnit nullUnit: self multipliedUnit: aMultipliedUnit
]

{ #category : #'mathematic operations - private' }
NullUnit >> divideNullUnit: aNullUnit [ 
	
	^self
]

{ #category : #'mathematic operations - private' }
NullUnit >> divideSimpleUnit: aUnit [

	^DividedUnit nullUnit: self simpleUnit: aUnit
]

{ #category : #'mathematic operations' }
NullUnit >> multiplyByUnit: aUnit [

	^aUnit
]

{ #category : #'mathematic operations - private' }
NullUnit >> multiplyDividedUnit: aDividedUnit [

	^aDividedUnit
]

{ #category : #'mathematic operations - private' }
NullUnit >> multiplyMultipliedUnit: aMultipliedUnit [

	^aMultipliedUnit
]

{ #category : #'mathematic operations - private' }
NullUnit >> multiplySimpleUnit: aUnit [

	^aUnit
]

{ #category : #accessing }
NullUnit >> name [

	^''
]

{ #category : #accessing }
NullUnit >> nameForMany [

	^self name
]

{ #category : #accessing }
NullUnit >> nameForOne [

	^self name
]

{ #category : #accessing }
NullUnit >> nothingAmount [
	
	^0
]

{ #category : #accessing }
NullUnit >> sign [

	^self class defaultSign
]

{ #category : #'measurement creation' }
NullUnit >> with: aNumber [

	^aNumber
]
