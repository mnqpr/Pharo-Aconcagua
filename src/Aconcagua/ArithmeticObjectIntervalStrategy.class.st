Class {
	#name : #ArithmeticObjectIntervalStrategy,
	#superclass : #IntervalStrategy,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Aconcagua-ArithmeticModel'
}

{ #category : #initialization }
ArithmeticObjectIntervalStrategy class >> afterLoadInitialization [

	self initialize
]

{ #category : #initialization }
ArithmeticObjectIntervalStrategy class >> initialize [

	uniqueInstance isNil ifTrue: [ self initializeUniqueInstance ].
]

{ #category : #initialization }
ArithmeticObjectIntervalStrategy class >> initializeUniqueInstance [

	uniqueInstance := super new.
]

{ #category : #'instance creation' }
ArithmeticObjectIntervalStrategy class >> new [

	^uniqueInstance
]

{ #category : #enumerating }
ArithmeticObjectIntervalStrategy >> advanceFrom: from by: by [

	^from + by
]

{ #category : #enumerating }
ArithmeticObjectIntervalStrategy >> advanceFrom: from steps: steps by: by [

	^from + (steps * by)
]

{ #category : #testing }
ArithmeticObjectIntervalStrategy >> isValidIntervalFrom: aStart to: aStop by: aStep [

	^(aStep = 0) not and: [ | steps |
		steps := self stepsFrom: aStart to: aStop by: aStep.
		steps isCompoundMeasure not and: [ steps >= 0 ]]
]

{ #category : #enumerating }
ArithmeticObjectIntervalStrategy >> stepsFrom: from to: to by: by [

	^to - from / by
]
