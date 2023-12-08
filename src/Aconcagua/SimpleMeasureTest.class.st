Class {
	#name : #SimpleMeasureTest,
	#superclass : #TestCase,
	#instVars : [
		'units'
	],
	#category : #'Aconcagua-MeasureModelTests'
}

{ #category : #resources }
SimpleMeasureTest class >> resources [

	^Array with: UnitsTestResource
]

{ #category : #'accessing temperature units' }
SimpleMeasureTest >> celsius [

	^units celsius
]

{ #category : #'accessing distance units' }
SimpleMeasureTest >> centimeter [
	
	^units centimeter
]

{ #category : #'bag creation' }
SimpleMeasureTest >> composeWith: aMeasure [

	^aMeasure composeWithSimpleMeasure: self
]

{ #category : #converting }
SimpleMeasureTest >> convertToBaseUnit [
	
	^self
]

{ #category : #'accessing monetary units' }
SimpleMeasureTest >> dollar [

	^units dollar
]

{ #category : #'accessing monetary units' }
SimpleMeasureTest >> euro [

	^units euro
]

{ #category : #'accessing temperature units' }
SimpleMeasureTest >> fahrenheit [

	^units fahrenheit
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> fiveDollars [

	^SimpleMeasure amount: 5 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> fivePesos [

	^SimpleMeasure amount: 5 unit: self peso
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> fortyDollars [

	^SimpleMeasure amount: 40 unit: self dollar
]

{ #category : #'accessing temperature units' }
SimpleMeasureTest >> kelvin [
	
	^units kelvin
]

{ #category : #'accessing distance units' }
SimpleMeasureTest >> kilometer [
	
	^units kilometer
]

{ #category : #'accessing distance units' }
SimpleMeasureTest >> meter [

	^units meter
]

{ #category : #'accessing distance units' }
SimpleMeasureTest >> metro [

	^units metro
]

{ #category : #'accessing distance units' }
SimpleMeasureTest >> millimeter [
	
	^units millimeter
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> minusTenDollars [

	^SimpleMeasure amount: -10 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> minusTenPesos [
	
	^SimpleMeasure amount: -10 unit: self peso
]

{ #category : #'time units' }
SimpleMeasureTest >> minute [

	^units minute
]

{ #category : #'accessing temperature measurements' }
SimpleMeasureTest >> oneCelsius [

	^SimpleMeasure amount: 1 unit: self celsius
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> oneCentimeter [
	
	^SimpleMeasure amount: 1 unit: self centimeter
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> oneDollar [
	
	^SimpleMeasure amount: 1 unit: self dollar
]

{ #category : #'accessing temperature measurements' }
SimpleMeasureTest >> oneFahrenheit [

	^SimpleMeasure amount: 1 unit: self fahrenheit
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> oneKilometer [
	
	^SimpleMeasure amount: 1 unit: self kilometer
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> oneMeter [
	
	^SimpleMeasure amount: 1 unit: self meter
]

{ #category : #'time measurements' }
SimpleMeasureTest >> oneMinute [
	
	^SimpleMeasure amount: 1 unit: self minute
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> onePeso [

	^SimpleMeasure amount: 1 unit: self peso
]

{ #category : #'time measurements' }
SimpleMeasureTest >> oneSecond [
	
	^SimpleMeasure amount: 1 unit: self second
]

{ #category : #'accessing monetary units' }
SimpleMeasureTest >> peso [

	^units peso
]

{ #category : #testing }
SimpleMeasureTest >> sameDomainAs: aMeasure [ 
	
	^false
]

{ #category : #'time units' }
SimpleMeasureTest >> second [
	
	^units second
]

{ #category : #initialization }
SimpleMeasureTest >> setUp [

	units := UnitsTestResource current
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> tenDollars [

	^SimpleMeasure amount: 10 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> tenEuros [

	^SimpleMeasure amount: 10 unit: self euro
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> tenKilometers [
	
	^SimpleMeasure amount: 10 unit: self kilometer
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> tenMeters [

	^SimpleMeasure amount: 10 unit: self meter
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> tenPesos [
	
	^SimpleMeasure amount: 10 unit: self peso
]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> tesRemainderFractionByMeasure [

	self assert: (1/3) \\ self tenPesos = (1/3)
]

{ #category : #test }
SimpleMeasureTest >> testAbs [

	self assert: self onePeso abs = self onePeso.
	self assert: (self onePeso unit with: 0)  abs = (self onePeso unit with: 0).
	self assert: (self onePeso unit with: -1)  abs = (self onePeso unit with: 1)
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddAssociativity [

	self assert: (self oneMeter + (self oneMeter + self oneKilometer)) amount = ((self oneMeter + self oneMeter) + self oneKilometer) amount.
	self assert: (self oneMeter + (self oneMeter + self oneKilometer)) unit = ((self oneMeter + self oneMeter) + self oneKilometer) unit
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddBaseUnit [

	self assert: (self oneMeter + self oneMeter) amount = 2.
	self assert: (self oneMeter + self oneMeter) unit = self meter
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddBaseUnitAndDerivedUnit [

	self assert: (self oneKilometer + self oneMeter) amount = 1001.
	self assert: (self oneKilometer + self oneMeter) unit = self meter.
	
	self assert: (self zeroCelsius + (SimpleMeasure amount: 32 unit: self fahrenheit)) amount = (5463/10).
	self assert: (self zeroCelsius + (SimpleMeasure amount: 32 unit: self fahrenheit)) unit = self kelvin

]

{ #category : #'test add' }
SimpleMeasureTest >> testAddCommutativity [

	self assert: (self oneMeter + self oneKilometer) amount = (self oneKilometer + self oneMeter) amount.
	self assert: (self oneMeter + self oneKilometer) unit = (self oneKilometer + self oneMeter) unit
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddDerivedUnit [

	self assert: (self oneKilometer + self oneCentimeter) amount = (100001/100).
	self assert: (self oneKilometer + self oneCentimeter) unit = self meter
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddDifferentBaseUnits [

	self should: [ (self tenPesos + self twentyDollars) amount ] raise: Exception.
	self should: [ (self tenPesos + self twentyDollars) unit ] raise: Exception.
	self assert: (self tenPesos + self twentyDollars) numberOfMeasures=2.

	self should: [ (self tenPesos + ( self twentyDollars + self tenEuros)) amount ] raise: Exception.
	self should: [ ((self tenPesos + self twentyDollars) + self tenEuros) amount ] raise: Exception.

]

{ #category : #'test add' }
SimpleMeasureTest >> testAddDifferentUnit [

	| a10pesosPlus20Dollars |

	a10pesosPlus20Dollars := self tenPesos + self twentyDollars.
	self assert: a10pesosPlus20Dollars = (self tenPesos + self twentyDollars) description: 'Equality'.
	self assert: a10pesosPlus20Dollars = (self twentyDollars + self tenPesos) description: 'Conmutativity'.
	self assert: a10pesosPlus20Dollars = (self tenPesos + (self tenDollars + self tenDollars)) description: 'Associativity'.
	self assert: (self tenPesos + (self twentyDollars + self tenEuros))=((self tenPesos + self twentyDollars) + self tenEuros) description: 'Associativity'.
	
	a10pesosPlus20Dollars + self tenPesos.
	self assert: a10pesosPlus20Dollars = (self tenPesos + self twentyDollars) description: 'Inmutability'.
	self assert: (self zeroPesos + self twentyDollars) = self twentyDollars description: 'Adding zero'.
	self assert: ((self tenPesos + self twentyDollars) + self zeroCentimeters) = (self tenPesos + self twentyDollars)  description: 'Adding zero, should be equal to bag without nothing member'.
	
	self assert: (self zeroPesos + self zeroDollars) = (self zeroDollars + self zeroPesos) description: 'Adding Zero'
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddDividedMeasure [

	self assert: ((self tenMeters + (self tenMeters / self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters + (self tenMeters / self fivePesos)) atSameBaseUnitAs: (self meter / self peso)) = (self tenMeters / self fivePesos)
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddFloatWithMeasure [

	self assert: ((10.01 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10.01 + self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01.	
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddFractionWithMeasure [

	self assert: ((1/3 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((1/3 + self tenMeters) atSameBaseUnitAs: NullUnit new) = (1/3).	
]

{ #category : #'test infinity' }
SimpleMeasureTest >> testAddInfinity [
 
	self assert: self oneMeter + Infinity = Infinity.
	self assert: Infinity + self oneMeter = Infinity.
	self assert: self oneMeter negated + Infinity = Infinity.
	self assert: Infinity + self oneMeter negated = Infinity
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddIntegerWithMeasure [

	self assert: ((10 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10 + self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test minus infinity' }
SimpleMeasureTest >> testAddMinusInfinity [
 
	self assert: self oneMeter + MinusInfinity = MinusInfinity.
	self assert: MinusInfinity + self oneMeter = MinusInfinity.
	self assert: self oneMeter negated + MinusInfinity = MinusInfinity.
	self assert: MinusInfinity + self oneMeter negated = MinusInfinity
]

{ #category : #'test add' }
SimpleMeasureTest >> testAddMultipliedMeasure [

	self assert: ((self tenMeters + (self tenMeters * self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters + (self tenMeters * self fivePesos)) atSameBaseUnitAs: (self meter*self peso)) = (self tenMeters * self fivePesos)

]

{ #category : #'test add' }
SimpleMeasureTest >> testAddNumber [

	self assert: ((self tenMeters + 10) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters + 10) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test accessing' }
SimpleMeasureTest >> testAmount [

	self assert: self oneMeter amount = 1 description: 'Amount'.
	self assert: self tenMeters amount = 10 description: 'Amount'
]

{ #category : #test }
SimpleMeasureTest >> testAtBaseUnitIfNone [

	self assert: (self oneSecond atBaseUnit: self second ifNone: []) = self oneSecond.
	self assert: (self oneSecond atBaseUnit: self minute ifNone: ['error']) = 'error'
]

{ #category : #'test accessing' }
SimpleMeasureTest >> testBaseUnit [

	self assert: self oneMeter baseUnit = self meter.
	self assert: self oneKilometer baseUnit = self meter.
	self assert: self oneCentimeter baseUnit = self meter.
	
	
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testBetweenAnd [

	self assert: (self tenMeters between: self oneMeter and: (SimpleMeasure amount: 11 unit: self meter)).
	self assert: (self tenMeters between: self oneMeter and: self tenMeters).
	self assert: (self tenMeters between: self tenMeters and: self tenMeters).
	self assert: (self tenMeters between: self oneCentimeter and: self oneKilometer).


]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testBetweenAndNotInclusive [

	self assert: (self tenMeters between: self oneMeter andNotInclusive: (SimpleMeasure amount: 11 unit: self meter)).
	self assert: (self tenMeters between: self tenMeters andNotInclusive: (SimpleMeasure amount: 11 unit: self meter)).
	self deny: (self tenMeters between: self oneMeter andNotInclusive: self tenMeters).


]

{ #category : #test }
SimpleMeasureTest >> testCompareGreaterThan [

	self assert: (self oneCelsius compareGreaterThan: 0).
	self deny: (self zeroCelsius compareGreaterThan: 0).
	self should: [self oneCelsius compareGreaterThan: 1] raise: CanNotConvertMeasureException.
	self should: [self oneCelsius compareGreaterThan: -1] raise: CanNotConvertMeasureException
]

{ #category : #'test accessing' }
SimpleMeasureTest >> testConvertAmountToBaseUnit [

	self assert: self oneMeter convertAmountToBaseUnit = 1.
	self assert: self oneKilometer convertAmountToBaseUnit = 1000.
	self assert: self oneCentimeter convertAmountToBaseUnit = (1/100)
]

{ #category : #'test converting' }
SimpleMeasureTest >> testConvertNothing [

	self assert: (self zeroMeters convertTo: self meter) = self zeroMeters.
	self assert: ((SimpleMeasure amount: 0 unit: self centimeter) convertTo: self meter) = self zeroMeters		
]

{ #category : #'test converting' }
SimpleMeasureTest >> testConvertTo [

	self assert: (self oneMeter convertTo: self meter) = self oneMeter.
	self assert: (self oneKilometer convertTo: self meter) = (SimpleMeasure amount: 1000 unit: self meter).
	self assert: (self oneCentimeter convertTo: self meter) = (SimpleMeasure amount: (1/100) unit: self meter).

	self assert: (self oneMeter convertTo: self kilometer) = (SimpleMeasure amount: (1/1000) unit: self kilometer).
	self assert: (self oneMeter convertTo: self centimeter) = (SimpleMeasure amount: 100 unit: self centimeter).

	self assert: (self oneCentimeter convertTo: self kilometer) = (SimpleMeasure amount: (1/100000) unit: self kilometer).
	self assert: (self oneKilometer convertTo: self centimeter) = (SimpleMeasure amount: 100000 unit: self centimeter)
]

{ #category : #'test converting' }
SimpleMeasureTest >> testConvertToBaseUnit [

	self assert: self oneMeter convertToBaseUnit = self oneMeter.
	self assert: self oneKilometer convertToBaseUnit = (SimpleMeasure amount: 1000 unit: self meter)
]

{ #category : #'test accessing' }
SimpleMeasureTest >> testDenominator [

	self assert: (self tenMeters ) denominator = 1.
	self assert: (self tenMeters * self tenMeters) denominator = 1
]

{ #category : #'test infinity' }
SimpleMeasureTest >> testDivideInfinity [
 
	self assert: self oneMeter / Infinity = 0.
	self
		should: [Infinity / self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and 1 meter'].
	self assert: self oneMeter negated / Infinity = 0.
	self
		should: [Infinity / self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and -1 meter']
]

{ #category : #'test minus infinity' }
SimpleMeasureTest >> testDivideMinusInfinity [

	self assert: self oneMeter / MinusInfinity = 0.
	self
		should: [MinusInfinity / self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and 1 meter'].
	self assert: self oneMeter negated / MinusInfinity = 0.
	self
		should: [MinusInfinity / self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and -1 meter']
]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionByDividedMeasure [

	self assert: (self oneKilometer / (self oneMeter/self onePeso)) = (SimpleMeasure amount: 1000 unit: self peso).
	self assert: (self oneKilometer / (self onePeso/self oneMeter)) = ((self oneKilometer*self oneMeter)/self onePeso)
	

]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionByMeasureBaseUnitOverBaseUnit [

	self assert: (self tenMeters / self tenMeters) = 1.
	self assert: (self tenMeters / self tenMeters) amount= 1.
	self assert: (self tenMeters / self tenMeters) unit = NullUnit new.
	self assert: (self tenMeters / self oneMeter) = 10.
	self assert: (self tenMeters / self oneSecond) = (SimpleMeasure amount: 10 unit: (self meter/self second)).
	self assert: (self tenMeters / self twoSecond) = (SimpleMeasure amount: 5 unit: (self meter/self second)).
	self assert: (self tenMeters / self oneSecond) numerator = self tenMeters.
	self assert: (self tenMeters / self oneSecond) denominator = self oneSecond
]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionByMeasureBaseUnitOverDerivedUnit [

	self assert: (self oneMeter / self oneKilometer) = (1/1000).
	self assert: (self oneMeter / self oneCentimeter) = 100.
	self assert: (self oneMeter / self oneMinute) = (SimpleMeasure amount: 1/60 unit: (self meter/self second)).

	

]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionByMeasureDerivedUnitOverBaseUnit [

	self assert: (self oneKilometer / self oneMeter) = 1000.
	self assert: (self oneKilometer / self tenMeters) = 100.
	self assert: (self oneKilometer / self oneKilometer) = 1.
	self assert: (self oneKilometer / self oneSecond) = (SimpleMeasure amount: 1000 unit: (self meter/self second)).

	

]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionByNumber [

	self assert: (self zeroPesos / 1) amount = 0.
	self assert: (self tenPesos / 10) = self onePeso.


]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionByZero [

	self should: [ self tenPesos / 0 ] raise: Exception description: 'Divition by 0'.

]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionFloatByMeasure [

	self assert: (1.01 / self tenPesos) = ((NullUnit new / self peso) with: 1.01/10)


]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionFractionByMeasure [

	self assert: ((1/3) / self tenPesos) = ((NullUnit new / self peso) with: (1/3)/10)


]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionIntegerByMeasure [

	self assert: (1 / self tenPesos) = ((NullUnit new / self peso) with: 1/10)


]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionOfBaseUnit [

	self assert: (self tenMeters / 10) amount = 1 description: 'Divition'.
	self assert: (self tenMeters / 10) unit = self meter description: 'Divition'.
	

]

{ #category : #'test division' }
SimpleMeasureTest >> testDivisionOfDerivedUnit [

	self assert: (self oneKilometer / 10 ) amount = (1/10).
	self assert: (self oneKilometer / 10 ) unit = self kilometer.
	

]

{ #category : #'test comparing' }
SimpleMeasureTest >> testEqual [

	self assert: self oneMeter = self thousandMillimeters description: 'Equal on same system'.
	self assert: self thousandMillimeters = self oneMeter description: 'Equal on same system'.
	
	self assert: self tenPesos = self tenPesos description: 'Equals'.
	self deny: self tenPesos = self twentyPesos description: 'Equals different amount'.
	
	self deny: self zeroCelsius = self zeroFahrenheit description: 'Equals on the same type of unit but not equal measures'.
	self assert: self zeroCelsius = (SimpleMeasure amount: 32 unit: self fahrenheit)
	
]

{ #category : #'test comparing' }
SimpleMeasureTest >> testEqualDifferentBaseUnit [

	self deny: self tenPesos = self tenDollars
]

{ #category : #'test comparing' }
SimpleMeasureTest >> testEqualNothingWhenRepresentSameEntity [

	self
		assert: self zeroDollars = self zeroPesos
		description: 'Zeros of different units must be equivalent since they represent the same entities'
]

{ #category : #'test comparing' }
SimpleMeasureTest >> testEqualNumber [

	self deny: self oneMeter = 1.
	self deny: 1 = self oneMeter
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testGreaterThan [

	self assert: self tenMeters > self oneMeter.
	self assert: self oneKilometer > self oneMeter.
	self deny: self  oneCentimeter > self oneMeter.
	self deny: self oneMeter > self oneMeter.
	self deny: self thousandMillimeters > self oneMeter.
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testGreaterThanEquals [

	self assert: self tenMeters >= self oneMeter.
	self deny: self oneMeter >= self tenMeters.
	self assert: self tenMeters >= self tenMeters.
	self assert: self oneMeter >= self thousandMillimeters.


]

{ #category : #'test comparing' }
SimpleMeasureTest >> testHash [

	self assert: self oneMeter hash = self oneMeter hash.
	self assert: self oneMeter hash = self thousandMillimeters hash
	
	

]

{ #category : #test }
SimpleMeasureTest >> testIntegerDivideCompoundMeasure [

	self assert:
		(self fiveDollars moduloCompoundMeasure: self fiveDollars + self fivePesos) =
			(1 + (self onePeso / self oneDollar))
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidBetweenAnd [

	self
		should: [self tenMeters between: self oneMeter and: self onePeso]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException operationName = 'convertTo:'.
			self assert: anException targetUnit = self peso].

	self
		should: [self tenMeters between: self onePeso and: self oneMeter]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso].

	self
		should: [self tenMeters between: 1 and: 2]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = NullUnit new]
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidBetweenAndNotInclusive [

	self 
		should: [ self tenMeters between: self oneMeter andNotInclusive: self onePeso ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso ].

	self 
		should: [ self tenMeters between: self onePeso andNotInclusive: self oneMeter ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = self peso ].
			
	self 
		should: [ self tenMeters between: 1 andNotInclusive: 2 ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = NullUnit new ]
]

{ #category : #'test converting' }
SimpleMeasureTest >> testInvalidConvertTo [

	self assert: 
		([ self oneMeter convertTo: self peso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :anException |
				self assert: anException sourceMeasure = self oneMeter.
				self assert: anException targetUnit = self peso.
				self assert: anException isResumable.
				anException return: true ])
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidGreaterThan [

	self assert: (
		[ self oneMeter > self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ])
]

{ #category : #test }
SimpleMeasureTest >> testInvalidGreaterThanAgainstScalar [

	self assert: (
		[
			self oneMeter > 1.
			false]
				on: CanNotConvertMeasureException
				do: [:aSignal | aSignal return: true])
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidGreaterThanEquals [

	self assert: (
		[ self oneMeter >= self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.			
				aSignal return: true ]).

	self assert: (
		[ self oneMeter >= 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ]).
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidLessThan [

	self assert: (
		[ self oneMeter < self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ]).

	self assert: (
		[ self oneMeter < 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ]).
			

]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidLessThanEquals [

	self assert: (
		[ self oneMeter <= self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.			
				aSignal return: true ]).

	self assert: (
		[ self oneMeter <= 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ])
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidMax [

	self assert: (
		[ self tenMeters max: self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self tenMeters.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ]).

	self assert: (
		[ self tenMeters max: 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ])
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidMin [

	self assert: (
		[ self tenMeters min: self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self tenMeters.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ]).

	self assert: (
		[ self tenMeters min: 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ])
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidNotInclusiveBetweenAnd [

	self 
		should: [ self tenMeters notInclusiveBetween: self oneMeter and: self onePeso ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso ].

	self 
		should: [ self tenMeters notInclusiveBetween: self onePeso and: self oneMeter ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = self peso ].
			
	self 
		should: [ self tenMeters notInclusiveBetween: 1 and: 2 ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = NullUnit new ]
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testInvalidNotInclusiveBetweenAndNotInclusive [

	self 
		should: [ self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: self onePeso ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso ].

	self 
		should: [ self tenMeters notInclusiveBetween: self onePeso andNotInclusive: self oneMeter ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = self peso ].
			
	self 
		should: [ self tenMeters notInclusiveBetween: 1 andNotInclusive: 2 ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = NullUnit new ]
]

{ #category : #test }
SimpleMeasureTest >> testIsFraction [

	self deny: (self meter with: 1) isFraction.
	self deny: (self centimeter with: 12) isFraction.
	self deny: ((self peso * self meter) with: 44) isFraction.
	self deny: ((self peso / self meter) with: 1234) isFraction.
	self deny: (self meter with: 1.05) isFraction.
	self deny: (self centimeter with: 1.05) isFraction.
	self deny: ((self peso * self meter) with: 1.05) isFraction.
	self deny: ((self peso / self meter) with: 1.05) isFraction


]

{ #category : #'test testing' }
SimpleMeasureTest >> testIsNothing [

	self assert: self zeroMeters isNothing.
	self assert: self zeroCentimeters isNothing.
	
	self assert: (SimpleMeasure amount: 0 unit: self kelvin) isNothing.
	self assert: (SimpleMeasure amount: (-5463/20) unit: self celsius) isNothing.
	
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testLessThan [

	self assert: self oneMeter < self tenMeters.
	self assert: self oneMeter < self oneKilometer.
	self deny: self oneMeter < self oneCentimeter.
	self deny: self oneMeter < self oneMeter.
	self deny: self oneMeter < self thousandMillimeters.
	self deny: self oneMeter < 0
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testLessThanEquals [

	self assert: self oneMeter <= self tenMeters.
	self deny: self tenMeters <= self oneMeter.
	self assert: self oneMeter <= self oneMeter.
	self assert: self oneMeter <= self thousandMillimeters.

]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testMax [

	self assert: (self tenMeters max: self oneMeter) = self tenMeters.
	self assert: (self oneMeter max: self tenMeters) = self tenMeters.
	self assert: (self tenMeters max: self oneKilometer) = self oneKilometer.
	self assert: (self oneKilometer max: self oneMeter) = self oneKilometer.
	self assert: (self oneCentimeter max: self oneKilometer) = self oneKilometer.
	self assert: (self oneKilometer max: self oneCentimeter) = self oneKilometer.
	

]

{ #category : #'test accessing' }
SimpleMeasureTest >> testMeasures [

	self
		assert: self oneMeter measures size = 1 description: 'Must be included only the own measure';
		assert: (self oneMeter measures includes: self oneMeter) description: 'Must be included the own measure'
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testMin [

	self assert: (self tenMeters min: self oneMeter) = self oneMeter.
	self assert: (self oneMeter min: self tenMeters) = self oneMeter.
	self assert: (self tenMeters min: self oneKilometer) = self tenMeters.
	self assert: (self oneKilometer min: self oneMeter) = self oneMeter.
	self assert: (self oneCentimeter min: self oneKilometer) = self oneCentimeter.
	self assert: (self oneKilometer min: self oneCentimeter) = self oneCentimeter.
	

]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloByMeasure [

	self assert: (self tenMeters // self tenMeters) = 1.
	self assert: (self oneMeter // self tenMeters) = 0.
	self assert:
		(self tenMeters // self oneSecond) = (SimpleMeasure amount: 10 unit: (self meter / self second)).
	self assert:
		(self tenMeters // self twoSecond) = (SimpleMeasure amount: 5 unit: (self meter / self second))
]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloByZero [

	self should: [ self tenPesos // 0 ] raise: Exception.

]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloFloatByMeasure [

	self assert: (10.01 // self tenPesos) = (1 / self onePeso)

]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloFractionByMeasure [

	self assert: (1/3) // self tenPesos = (0 / self onePeso)

]

{ #category : #'test infinity' }
SimpleMeasureTest >> testModuloInfinity [

	self assert: self oneMeter // Infinity = 0.
	self
		should: [Infinity // self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and 1 meter'].
	self assert: self oneMeter negated // Infinity = 0.
	self
		should: [Infinity // self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and -1 meter']
]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloIntegerByMeasure [

	self assert: 1 // self tenPesos = (0 / self onePeso)


]

{ #category : #'test minus infinity' }
SimpleMeasureTest >> testModuloMinusInfinity [

	self assert: self oneMeter // MinusInfinity = 0.
	self
		should: [MinusInfinity // self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and 1 meter'].
	self assert: self oneMeter negated // MinusInfinity = 0.
	self
		should: [MinusInfinity // self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and -1 meter']
]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloOfBaseUnit [

	self assert: (self tenMeters // 10) amount = 1.
	self assert: (self tenMeters // 10) unit = self meter.
	
	self assert: (self tenMeters // 3) amount = 3.

]

{ #category : #'test integer division' }
SimpleMeasureTest >> testModuloOfDerivedUnit [

	self assert: (self tenKilometers // 10 ) amount = 1.
	self assert: (self tenKilometers // 10 ) unit = self kilometer.
	
	self assert: (self tenKilometers // 3 ) amount = 3.

]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplicationOfBaseUnit [

	self assert: (self tenMeters * 2) amount = 20.
	self assert: (self tenMeters * 2) unit = self meter
	
	
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplicationOfDerivedUnit [

	self assert: (self oneKilometer * 2) amount = 2.
	self assert: (self oneKilometer * 2) unit = self kilometer
	
	
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyByDividedMeasure [

	self assert: (self onePeso*(self tenPesos/self oneMeter)) amount = 10.
	self assert: (self onePeso*(self tenPesos/self oneMeter)) unit = (self peso*self peso/self meter).

	self assert: (self onePeso*(self tenMeters/self onePeso)) = self tenMeters
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyByMeasure [

	self assert: (self onePeso*self tenPesos) amount = 10.
	self assert: (self onePeso*self tenPesos) unit = (self peso*self peso).

	
	
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyByMeasureAssociativity [

	self assert: ((self onePeso * self tenPesos) * self tenPesos) = (self onePeso * (self tenPesos * self tenPesos))	
	
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyByMultipliedMeasure [

	self assert: (self onePeso * self tenPesos * self tenPesos) amount = 100.
	self assert: (self onePeso * self tenPesos * self tenPesos) unit = (self peso * self peso * self peso)	
	
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyByNumber [

	self assert: self onePeso * 10 = self tenPesos.	
	self assert: self onePeso * 0 = self zeroPesos.	
	self assert: self onePeso * 0 = 0.
	self assert: self onePeso * 0 = self zeroDollars
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyFloatByMeasure [

	self assert: (1.01 * self tenPesos) = ((NullUnit new * self peso) with: 1.01*10)


]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyFractionByMeasure [

	self assert: ((1/3) * self tenPesos) = ((NullUnit new * self peso) with: (1/3)*10)


]

{ #category : #'test infinity' }
SimpleMeasureTest >> testMultiplyInfinity [
 
	self assert: self oneMeter * Infinity = Infinity.
	self assert: Infinity * self oneMeter = Infinity.
	self assert: self oneMeter negated * Infinity = Infinity.
	self assert: Infinity * self oneMeter negated = Infinity
]

{ #category : #'test multiplication' }
SimpleMeasureTest >> testMultiplyIntegerByMeasure [

	self assert: (3 * self tenPesos) = ((NullUnit new * self peso) with: 3*10)


]

{ #category : #'test minus infinity' }
SimpleMeasureTest >> testMultiplyMinusInfinity [
 
	self assert: self oneMeter * MinusInfinity = MinusInfinity.
	self assert: MinusInfinity * self oneMeter = MinusInfinity.
	self assert: self oneMeter negated * MinusInfinity = MinusInfinity.
	self assert: MinusInfinity * self oneMeter negated = MinusInfinity
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testNegated [

	self assert: self tenPesos negated negated = self tenPesos description: 'Measure Negated'.
	self assert: self minusTenPesos = self tenPesos negated description: 'Measure negated'.
	self assert: self zeroPesos negated = self zeroPesos description: 'Measure negated'
]

{ #category : #test }
SimpleMeasureTest >> testNegative [

	self assert: (self onePeso - self tenPesos) negative.
	self deny: (self onePeso - self tenPesos) negated negative
]

{ #category : #'test comparing' }
SimpleMeasureTest >> testNotEqual [

	self deny: self oneMeter = 'hello'.
	self deny: 'hello' = self oneMeter.
	self deny: self oneMeter = Object new.
	self deny: Object new = self oneMeter
]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testNotInclusiveBetweenAnd [

	self assert: (self tenMeters notInclusiveBetween: self oneMeter and: (SimpleMeasure amount: 11 unit: self meter)).
	self assert: (self tenMeters notInclusiveBetween: self oneMeter and: self tenMeters).
	self deny: (self tenMeters notInclusiveBetween: self tenMeters and: (SimpleMeasure amount: 11 unit: self meter)).


]

{ #category : #'test magnitude protocol' }
SimpleMeasureTest >> testNotInclusiveBetweenAndNotInclusive [

	self assert: (self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: (SimpleMeasure amount: 11 unit: self meter)).
	self deny: (self tenMeters notInclusiveBetween: self tenMeters andNotInclusive: (SimpleMeasure amount: 11 unit: self meter)).
	self deny: (self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: self tenMeters).


]

{ #category : #'test accessing' }
SimpleMeasureTest >> testNumerator [

	self assert: (self tenMeters ) numerator = self tenMeters.
	self assert: (self tenMeters * self tenMeters ) numerator = (self tenMeters * self tenMeters)

	

	

]

{ #category : #test }
SimpleMeasureTest >> testPositive [

	self assert: self tenPesos positive.
	self deny: self tenPesos negated positive.
]

{ #category : #'test printing' }
SimpleMeasureTest >> testPrintingForMany [

	self assert: self tenPesos printString = '10 pesos' description: 'Printing for many with correct creation'.
	self assert: self tenDollars printString = '10 dollars' description: 'Printing for many with invalid creation'	
]

{ #category : #'test printing' }
SimpleMeasureTest >> testPrintingForOne [

	self assert: self onePeso printString = '1 peso' description: 'Printing for one with correct creation'.
	self assert: self oneDollar printString = '1 dollar' description: 'Printing for one with invalid creation'
	
	
]

{ #category : #test }
SimpleMeasureTest >> testRemFrom [

	self
		should: [self oneCelsius remFrom: 0]
		raise: InvalidBinaryOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description notNil;
				assert: anException operationName = 'rest';
				assert: anException leftOperand = 0;
				assert: anException rightOperand = self oneCelsius]
]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderByMeasure [

	self assert: (self tenMeters \\ self tenMeters) = (self meter with: 10\\10).
	self assert: (self oneMeter \\ self tenMeters) = (self meter with: 1\\10).
	self assert: (self tenMeters \\ self oneSecond) = (self meter with: 10\\1).
	self assert: (self tenMeters \\ self threeSeconds) = (self meter with: 10\\3).

	

]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderByZero [

	self should: [ self tenPesos \\ 0 ] raise: Exception.

]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderCompoundMeasureByMeasure [

	self should: [(self tenPesos + self tenDollars) \\ self tenPesos ] raise: InvalidOperationException


]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderFloatByMeasure [

	self assert: (10.5 \\ self tenPesos) = 0.5

]

{ #category : #'test infinity' }
SimpleMeasureTest >> testRemainderInfinity [
 
	self
		should: [self oneMeter \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity'].
	self
		should: [Infinity \\ self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and 1 meter'].
	self
		should: [self oneMeter negated \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity'].
	self
		should: [Infinity \\ self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and -1 meter']
]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderIntegerByMeasure [

	self assert: 1 \\ self tenPesos = 1


]

{ #category : #'test minus infinity' }
SimpleMeasureTest >> testRemainderMinusInfinity [
 
	self
		should: [self oneMeter \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity'].
	self
		should: [MinusInfinity \\ self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and 1 meter'].
	self
		should: [self oneMeter negated \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity'].
	self
		should: [MinusInfinity \\ self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and -1 meter']
]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderOfBaseUnit [

	self assert: (self tenMeters \\ 10) amount = 0.
	self assert: (self tenMeters \\ 10) unit = self meter.
	
	self assert: (self tenMeters \\ 3) amount = 1.

]

{ #category : #'test integer remainder' }
SimpleMeasureTest >> testRemainderOfDerivedUnit [

	self assert: (self tenKilometers \\ 9 ) amount = 1.
	self assert: (self tenKilometers \\ 9 ) unit = self kilometer.
	

]

{ #category : #test }
SimpleMeasureTest >> testRoundTo [

	self assert: ((SimpleMeasure amount: 1 unit: self celsius) roundTo: 1) = (self celsius with: 1).
	self assert: ((SimpleMeasure amount: 1 unit: self celsius) roundTo: 0.1) = (self celsius with: 1).
	self assert: ((SimpleMeasure amount: 1.4 unit: self celsius) roundTo: 1) = (self celsius with: 1).
	self assert: ((SimpleMeasure amount: 1.5 unit: self celsius) roundTo: 1) = (self celsius with: 2).
	self assert: ((SimpleMeasure amount: 1.09 unit: self celsius) roundTo: 1) = (self celsius with: 1).
	self assert: ((SimpleMeasure amount: -1 unit: self celsius) roundTo: 1) = (self celsius with: -1).
	self assert: ((SimpleMeasure amount: -1.1 unit: self celsius) roundTo: 1) = (self celsius with: -1)
]

{ #category : #'test testing' }
SimpleMeasureTest >> testSameDomainAs [

	self assert: (self oneMeter sameDomainAs: self oneMeter).
	self assert: (self oneMeter sameDomainAs: self oneKilometer).
	self assert: (self oneKilometer sameDomainAs: self oneMeter).
	self deny: (self oneMeter sameDomainAs: self onePeso).
	self deny: (self onePeso sameDomainAs: self oneMeter).
]

{ #category : #'test add' }
SimpleMeasureTest >> testSimplificationsAddingWithZero [

	self
		assert: (self oneMeter + 0) = self oneMeter;
		assert: (self oneMeter + 0) unit = self oneMeter unit
]

{ #category : #'test division' }
SimpleMeasureTest >> testSimplificationsDividingFromZero [

	self assert: (0 / self oneMeter) = 0
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractAssociativity [

	self assert: (self tenMeters - self oneMeter - self oneMeter) amount = ((self tenMeters - self oneMeter) - self oneMeter) amount.
	self assert: ((self tenMeters - self oneMeter) - self oneMeter) amount = (self tenMeters - (self oneMeter + self oneMeter)) amount

	
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractBaseUnit [

	self assert: (self tenMeters - self oneMeter) amount = 9.
	self assert: (self tenMeters - self oneMeter) unit = self meter
	
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractDerivedUnit [

	self assert: (self oneKilometer - self oneMeter) amount = 999.
	self assert: (self oneKilometer - self oneMeter) unit = self meter.

	

	
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractDividedMeasure [

	self assert: ((self tenMeters - (self tenMeters / self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters - (self tenMeters / self fivePesos)) atSameBaseUnitAs: (self meter / self peso)) = (self tenMeters negated / self fivePesos)

]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractFloatWithMeasure [

	self assert: ((10.01 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10.01 - self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01.	
	

]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractFractionWithMeasure [

	self assert: ((1/3 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((1/3 - self tenMeters) atSameBaseUnitAs: NullUnit new) = (1/3).	
]

{ #category : #'test infinity' }
SimpleMeasureTest >> testSubtractInfinity [
  
	self assert: self oneMeter - Infinity = MinusInfinity.
	self assert: Infinity - self oneMeter = Infinity.
	self assert: self oneMeter negated - Infinity = MinusInfinity.
	self assert: Infinity - self oneMeter negated = Infinity
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractIntegerWithMeasure [

	self assert: ((10 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10 - self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test minus infinity' }
SimpleMeasureTest >> testSubtractMinusInfinity [
 
	self assert: self oneMeter - MinusInfinity = Infinity.
	self assert: MinusInfinity - self oneMeter = MinusInfinity.
	self assert: self oneMeter negated - MinusInfinity = Infinity.
	self assert: MinusInfinity - self oneMeter negated = MinusInfinity
]

{ #category : #'test subtract' }
SimpleMeasureTest >> testSubtractMultipliedMeasure [

	self assert: ((self tenMeters - (self tenMeters * self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters - (self tenMeters * self fivePesos)) atSameBaseUnitAs: (self meter * self peso)) = (self tenMeters negated * self fivePesos)
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testTo [

	self assert: (self oneMeter to: self tenMeters) from = self oneMeter.
	self assert: (self oneMeter to: self tenMeters) to = self tenMeters.
	self assert: (self oneMeter to: self tenMeters) by = self oneMeter.	

	self assert: (self tenMeters to: self oneKilometer) by = self oneMeter.
	self assert: (self oneCentimeter to: self oneKilometer) by = self oneCentimeter
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToAt [

	| coll |

	coll := self tenMeters to: (self tenMeters * 2).
	1 to: coll size do: [ :index | self assert: (coll at: index) amount = (9 + index) ]
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToAtByNegative [

	| coll |
	
	coll := (self tenMeters * 2) to: self tenMeters by: self oneMeter negated.
	
	1 to: coll size do: [ :index | self assert: (coll at: index) amount = (21 - index) ]	
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToBy [

	self assert: (self oneMeter to: self tenMeters by: self oneCentimeter ) from = self oneMeter.
	self assert: (self oneMeter to: self tenMeters by: self oneCentimeter ) to = self tenMeters.
	self assert: (self oneMeter to: self tenMeters by: self oneCentimeter ) by = self oneCentimeter
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToByDo [

	| value |
	
	value := 1.
	(self oneMeter to: self tenMeters by: self oneMeter) do: [ :aMeasure |
		self assert: value = aMeasure amount.
		value := value + 1 ]

]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToCollect [

	| coll |
	
	coll := (self oneMeter to: self tenMeters) collect: [ :aMeasure | aMeasure amount ].
	coll inject: 1 into: [ :value :amount | self assert: value = amount. value + 1 ]
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToFirst [


	self assert: (self oneMeter to: self tenMeters) first = self oneMeter.
	self assert: (self tenMeters to: self oneMeter by: self oneMeter negated) first = self tenMeters
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToLast [


	self assert: (self oneMeter to: self tenMeters) last = self tenMeters.
	self assert: (self tenMeters to: self oneMeter by: self oneMeter negated) last = self oneMeter
]

{ #category : #'test interval related protocol' }
SimpleMeasureTest >> testToSize [

	self assert: (self oneCentimeter to: self oneKilometer) size = (100*1000)
	
]

{ #category : #'test truncated' }
SimpleMeasureTest >> testTruncated [

	self assert: (self meter with: 1.05) truncated = (self meter with: 1).
	self assert: (self centimeter with: 1.05) truncated = (self centimeter with: 1).
	self assert: ((self peso * self meter ) with: 1.05) truncated = ((self peso * self meter) with: 1).
	self assert: ((self peso / self meter ) with: 1.05) truncated = ((self peso / self meter) with: 1)	
]

{ #category : #'test accessing' }
SimpleMeasureTest >> testUnit [

	self assert: self onePeso unit = self peso.
	self assert: self oneMeter unit = self meter
]

{ #category : #test }
SimpleMeasureTest >> testUnitNameOf [

	self
		assert: (self oneDollar unitNameOf: self dollar) = self dollar nameForOne;
		assert: (self tenDollars unitNameOf: self dollar) = self dollar nameForMany;
		assert: (self zeroDollars unitNameOf: self dollar) = self dollar nameForMany;
		assert: (self oneDollar negated unitNameOf: self dollar) = self dollar nameForOne
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> thirtyPesos [

	^SimpleMeasure amount: 30 unit: self peso
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> thousandMillimeters [
	
	^SimpleMeasure amount: 1000 unit: self millimeter
]

{ #category : #'time measurements' }
SimpleMeasureTest >> threeSeconds [

	^SimpleMeasure amount: 3 unit: self second
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> twentyDollars [

	^SimpleMeasure amount: 20 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> twentyPesos [
	
	^SimpleMeasure amount: 20 unit: self peso
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> twoDollars [

	^SimpleMeasure amount: 2 unit: self dollar
]

{ #category : #'time measurements' }
SimpleMeasureTest >> twoSecond [
	
	^SimpleMeasure amount: 2 unit: self second
]

{ #category : #'accessing temperature measurements' }
SimpleMeasureTest >> zeroCelsius [

	^SimpleMeasure amount: 0 unit: self celsius
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> zeroCentimeters [

	^SimpleMeasure amount: 0 unit: self centimeter
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> zeroDollars [
	
	^SimpleMeasure amount: 0 unit: self dollar
]

{ #category : #'accessing temperature measurements' }
SimpleMeasureTest >> zeroFahrenheit [

	^SimpleMeasure amount: 0 unit: self fahrenheit
]

{ #category : #'accessing distance measurements' }
SimpleMeasureTest >> zeroMeters [

	^SimpleMeasure amount: 0 unit: self meter
]

{ #category : #'accessing monetary measurements' }
SimpleMeasureTest >> zeroPesos [

	^SimpleMeasure amount: 0 unit: self peso
]
