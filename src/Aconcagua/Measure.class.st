Class {
	#name : #Measure,
	#superclass : #ArithmeticObject,
	#category : #'Aconcagua-MeasureModel'
}

{ #category : #accessing }
Measure >> hash [ 
	
	self subclassResponsibility
]

{ #category : #testing }
Measure >> isZero [

	^self isNothing
]
