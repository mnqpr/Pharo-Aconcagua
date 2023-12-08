Class {
	#name : #DerivedUnit,
	#superclass : #SimpleUnit,
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #'converting - private' }
DerivedUnit >> convertAmountFromBaseUnit: aNumber [

	self subclassResponsibility
]

{ #category : #'converting - private' }
DerivedUnit >> convertFromBaseUnit: aSimpleMeasure [ 

	^SimpleMeasure amount: (self convertAmountFromBaseUnit: aSimpleMeasure amount) unit: self
]

{ #category : #'converting - private' }
DerivedUnit >> convertToBaseUnit: aSimpleMeasure [ 
	
	^SimpleMeasure 
		amount: (self convertAmountToBaseUnit: aSimpleMeasure amount)
		unit: self baseUnit
]

{ #category : #accessing }
DerivedUnit >> nothingAmount [

	^self convertAmountFromBaseUnit: self baseUnit nothingAmount
]
