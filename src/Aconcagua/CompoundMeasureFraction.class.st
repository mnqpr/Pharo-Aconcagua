Class {
	#name : #CompoundMeasureFraction,
	#superclass : #Fraction,
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #'arithmetic operations' }
CompoundMeasureFraction >> = anObject [

	^self class = anObject class ifTrue:[ (numerator * anObject denominator) = (denominator * anObject numerator)  ]
	ifFalse:[super = anObject 		]
]

{ #category : #'arithmetic operations' }
CompoundMeasureFraction >> isFraction [

	^false
]

{ #category : #private }
CompoundMeasureFraction >> numerator: aNumerator denominator: aDenominator [

	self setNumerator: aNumerator denominator: aDenominator
]

{ #category : #printing }
CompoundMeasureFraction >> printOn: aStream base: base [

	aStream nextPut: $(.
	numerator printOn: aStream.
	aStream nextPut: $/.
	denominator printOn: aStream.
	aStream nextPut: $)
]

{ #category : #private }
CompoundMeasureFraction >> setNumerator: aNumerator denominator: aDenominator [

	aDenominator = 0
		ifTrue: [^(ZeroDivide dividend: aNumerator) signal]
		ifFalse: 
			[numerator := aNumerator.
			denominator := aDenominator]
]

{ #category : #'arithmetic operations' }
CompoundMeasureFraction >> truncated [

	InvalidUnaryOperationException signalOperationName: 'truncated' operand: self
]
