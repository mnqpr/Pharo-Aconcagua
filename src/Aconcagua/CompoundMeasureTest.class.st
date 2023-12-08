Class {
	#name : #CompoundMeasureTest,
	#superclass : #TestCase,
	#instVars : [
		'units'
	],
	#category : #'Aconcagua-MeasureModelTests'
}

{ #category : #resources }
CompoundMeasureTest class >> resources [

	^Array with: UnitsTestResource
]

{ #category : #'mock undefined arithmetic object' }
CompoundMeasureTest >> addCompoundMeasure: aMeasureBag [

	^aMeasureBag addSimpleMeasure: self
]

{ #category : #'accessing temperature units' }
CompoundMeasureTest >> celsius [

	^units celsius
]

{ #category : #'accessing monetary units' }
CompoundMeasureTest >> centavo [
	
	^units centavo
]

{ #category : #'accessing distance units' }
CompoundMeasureTest >> centimeter [
	
	^units centimeter
]

{ #category : #'bag creation' }
CompoundMeasureTest >> composeWith: aMeasure [ 
	
	^aMeasure composeWithSimpleMeasure: self
]

{ #category : #'mock undefined arithmetic object' }
CompoundMeasureTest >> composeWithSimpleMeasure: aMeasure [

	^CompoundMeasure with: self with: aMeasure
]

{ #category : #'mock undefined arithmetic object' }
CompoundMeasureTest >> convertToBaseUnit [

	^self
]

{ #category : #'accessing monetary units' }
CompoundMeasureTest >> dollar [

	^units dollar
]

{ #category : #'accessing monetary units' }
CompoundMeasureTest >> euro [

	^units euro
]

{ #category : #'accessing monetary units' }
CompoundMeasureTest >> euroCent [
	
	^units euroCent
]

{ #category : #'accessing temperature units' }
CompoundMeasureTest >> fahrenheit [

	^units fahrenheit
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> fiveDollars [

	^SimpleMeasure amount: 5 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> fivePesos [

	^SimpleMeasure amount: 5 unit: self peso
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> fortyDollars [

	^SimpleMeasure amount: 40 unit: self dollar
]

{ #category : #'accessing distance units' }
CompoundMeasureTest >> kilometer [
	
	^units kilometer
]

{ #category : #'accessing distance units' }
CompoundMeasureTest >> meter [

	^units meter
]

{ #category : #'accessing distance units' }
CompoundMeasureTest >> metro [

	^units metro
]

{ #category : #'accessing distance units' }
CompoundMeasureTest >> millimeter [
	
	^units millimeter
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> minusTenDollars [

	^SimpleMeasure amount: -10 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> minusTenPesos [
	
	^SimpleMeasure amount: -10 unit: self peso
]

{ #category : #'accessing temperature measurements' }
CompoundMeasureTest >> oneCelsius [

	^SimpleMeasure amount: 1 unit: self celsius
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> oneDollar [
	
	^SimpleMeasure amount: 1 unit: self dollar
]

{ #category : #'accessing temperature measurements' }
CompoundMeasureTest >> oneFahrenheit [

	^SimpleMeasure amount: 1 unit: self fahrenheit
]

{ #category : #'accessing distance measurements' }
CompoundMeasureTest >> oneKilometer [
	
	^SimpleMeasure amount: 1 unit: self kilometer
]

{ #category : #'accessing distance measurements' }
CompoundMeasureTest >> oneMeter [
	
	^SimpleMeasure amount: 1 unit: self meter
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> onePeso [

	^SimpleMeasure amount: 1 unit: self peso
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> oneQuarter [
	
	^SimpleMeasure amount: 1 unit: self quarter
]

{ #category : #'accessing monetary units' }
CompoundMeasureTest >> peso [

	^units peso
]

{ #category : #'accessing monetary units' }
CompoundMeasureTest >> quarter [
	
	^units quarter
]

{ #category : #'mock undefined arithmetic object' }
CompoundMeasureTest >> sameDomainAs: aMeasure [ 
	
	^false
]

{ #category : #initialization }
CompoundMeasureTest >> setUp [

	units := UnitsTestResource current
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> tenCentavos [
	
	^SimpleMeasure amount: 10 unit: self centavo
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> tenDollars [

	^SimpleMeasure amount: 10 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> tenEuros [

	^SimpleMeasure amount: 10 unit: self euro
]

{ #category : #'accessing distance measurements' }
CompoundMeasureTest >> tenMeters [

	^SimpleMeasure amount: 10 unit: self meter
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> tenPesos [
	
	^SimpleMeasure amount: 10 unit: self peso
]

{ #category : #'test integer remainder' }
CompoundMeasureTest >> tesRemainderFractionByMeasure [

	self should: [ (1/3) \\  ( self tenPesos + self tenMeters )  ] raise: InvalidOperationException


]

{ #category : #'test add' }
CompoundMeasureTest >> testAdd [

	| measureBag |

	measureBag := self tenPesos + self twentyDollars.
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars.
	
	measureBag := self tenPesos + self twentyDollars + self tenEuros.
	self assert: measureBag numberOfMeasures = 3.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (measureBag atSameBaseUnitAs: self euro) = self tenEuros
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddAssociativity [

	self assert: ((self tenPesos + self twentyDollars) + self tenEuros) = (self tenPesos + (self twentyDollars + self tenEuros))
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddBags [

	| result |
	
	result := (self tenPesos + self twentyDollars) + (self tenEuros + self tenPesos).
	self assert: (result atSameBaseUnitAs: self peso) = self twentyPesos.
	self assert: (result atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (result atSameBaseUnitAs: self euro) = self tenEuros.
	self assert: result numberOfMeasures = 3.
	
	result := (self tenPesos + self twentyDollars) + self tenEuros.
	self assert: (result atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (result atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (result atSameBaseUnitAs: self euro) = self tenEuros.
	self assert: result numberOfMeasures = 3	
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddCommutativity [

	self assert: (self tenPesos + self twentyDollars) = (self twentyDollars + self tenPesos).
	self assert: (self tenPesos + self twentyDollars + self tenEuros) = (self tenEuros + self tenPesos + self twentyDollars ).
	self assert: (self tenPesos + self twentyDollars + self tenEuros) = (self twentyDollars + self tenEuros + self tenPesos ).
	self assert: (self tenPesos + self twentyDollars + self tenEuros) = (self twentyDollars + self tenPesos + self tenEuros ).

]

{ #category : #'test add' }
CompoundMeasureTest >> testAddEquality [

	self assert: (self tenPesos + self twentyDollars)  = (self tenPesos + self twentyDollars).
	self assert: (self tenEuros + self tenPesos + self twentyDollars) = (self tenEuros + self tenPesos + self twentyDollars)
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddExistingUnit [

	| measureBag |

	measureBag := self tenPesos + self twentyDollars.
	measureBag := measureBag + self tenPesos.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self twentyPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddFloatWithMeasure [

	self assert: ((10.01 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10.01 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: ((10.01 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = 10.01
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddFractionWithMeasure [

	self assert: ((1/3 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((1/3 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: ((1/3 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = (1/3)
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddImmutability [

	| a10pesosPlus20Dollars |

	a10pesosPlus20Dollars := self tenPesos + self twentyDollars.
	a10pesosPlus20Dollars + self tenPesos.
	self assert: a10pesosPlus20Dollars = (self tenPesos + self twentyDollars).
	
	
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddIntegerWithMeasure [

	self assert: ((10 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: ((10 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test add' }
CompoundMeasureTest >> testAddNothing [

	self assert: (self zeroPesos + self twentyDollars) = self twentyDollars.
	self assert: (self zeroPesos + self zeroDollars) = self zeroPesos.
	self assert: (self zeroPesos + self zeroDollars) = self zeroDollars.
	
]

{ #category : #'test accessing' }
CompoundMeasureTest >> testAtSameBaseUnitAsWithBaseUnits [

	| measureBag |
	
	measureBag := CompoundMeasure with: self tenPesos with: self twentyDollars.
	
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (measureBag atSameBaseUnitAs: self euro) = 0
	
]

{ #category : #'test accessing' }
CompoundMeasureTest >> testAtSameBaseUnitAsWithDerivedUnits [

	| measureBag |
	
	measureBag := CompoundMeasure with: self tenCentavos with: self oneQuarter.
	
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenCentavos.
	self assert: (measureBag atSameBaseUnitAs: self centavo) = self tenCentavos.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenCentavos convertToBaseUnit.
	self assert: (measureBag atSameBaseUnitAs: self centavo) = self tenCentavos convertToBaseUnit.
	
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self oneQuarter.
	self assert: (measureBag atSameBaseUnitAs: self quarter) = self oneQuarter.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self oneQuarter convertToBaseUnit.
	self assert: (measureBag atSameBaseUnitAs: self quarter) = self oneQuarter convertToBaseUnit.

	self assert: (measureBag atSameBaseUnitAs: self euroCent) = 0
]

{ #category : #'test instance creation' }
CompoundMeasureTest >> testCompoundMeasureImmutability [

	| measureBag measures |
	
	measureBag := CompoundMeasure with: self tenPesos with: self twentyDollars.
	measures := measureBag measures.
	measures add: self tenEuros.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars
]

{ #category : #test }
CompoundMeasureTest >> testConvertAmountToBaseUnit [

	self
		should: [(self tenPesos + self tenDollars) convertAmountToBaseUnit]
		raise: Exception
		withExceptionDo: [ :anException |
			self assert: ('*Unit of a MeasureBag is not defined' match: anException description)]
]

{ #category : #'test instance creation' }
CompoundMeasureTest >> testCreationWithMeasures [

	| measures measureBag |

	measures := OrderedCollection with: self tenPesos with: self twentyDollars with: self tenEuros.	
	measureBag := CompoundMeasure measures: measures.
	
	self assert: measureBag numberOfMeasures = 3.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (measureBag atSameBaseUnitAs: self euro) = self tenEuros
]

{ #category : #test }
CompoundMeasureTest >> testCreationWithMeasuresCopiesCollection [
	"This test verifies that when bag is created using the private message  #measures:,
	the collection that goes as collaborating is copied"
	
	| measures measureBag |

	measures := OrderedCollection
		with: self tenPesos
		with: self twentyDollars
		with: self tenEuros.
	measureBag := CompoundMeasure measures: measures.

	measures add: self oneMeter.
	self assert: measureBag numberOfMeasures = 3.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (measureBag atSameBaseUnitAs: self euro) = self tenEuros



]

{ #category : #'test division' }
CompoundMeasureTest >> testDivideByMeasure [

	self assert: ((self tenPesos + self twentyDollars) / self tenPesos ) =((self twentyDollars / self tenPesos) + 1)
]

{ #category : #'test division' }
CompoundMeasureTest >> testDivision [

	self assert: ((self tenPesos + self twentyDollars) / 10) = (self onePeso + self twoDollars).
	self assert: ((self tenPesos + self twentyDollars) / -10) = (self onePeso negated - self twoDollars).
	self assert: ((self tenPesos + self twentyDollars) / 3) = 	((SimpleMeasure amount: (10/3) unit: self peso) + (SimpleMeasure amount: (20/3) unit: self dollar))
]

{ #category : #'test division' }
CompoundMeasureTest >> testDivisionDistributivity [

	self assert: (self tenPesos + self tenDollars ) / ( self tenPesos + self tenDollars ) =
		(((self tenPesos + self tenDollars ) / self tenPesos) + ((self tenPesos + self tenDollars ) / self tenDollars ))
]

{ #category : #'test division' }
CompoundMeasureTest >> testDivisionFloatByMeasure [

	self assert: (1.01 / (self tenPesos + self tenDollars)) = (CompoundMeasureFraction numerator: 1.01 denominator: (self tenPesos + self tenDollars))


]

{ #category : #'test division' }
CompoundMeasureTest >> testDivisionFractionByMeasure [

	self assert: ((1/3) / (self tenPesos + self tenDollars)) = (CompoundMeasureFraction numerator: (1/3) denominator: (self tenPesos + self tenDollars))


]

{ #category : #'test division' }
CompoundMeasureTest >> testDivisionIntegerByMeasure [

	self assert: (1 / (self tenPesos + self tenDollars)) = (CompoundMeasureFraction numerator: 1 denominator: (self tenPesos + self tenDollars))


]

{ #category : #'test division' }
CompoundMeasureTest >> testDivisionMeasureByCompoundMeasure [

	self assert: (self tenPesos / (self tenPesos + self tenDollars)) = (CompoundMeasureFraction numerator: self tenPesos denominator: (self tenPesos + self tenDollars))


]

{ #category : #'test comparing' }
CompoundMeasureTest >> testEqual [

	self assert: (CompoundMeasure with: self tenPesos with: self twentyDollars) = (CompoundMeasure with: self tenPesos with: self twentyDollars).
	self assert: (CompoundMeasure with: self tenPesos with: self twentyDollars) = (CompoundMeasure with: self twentyDollars with: self tenPesos ).
	self assert: (CompoundMeasure measures: (OrderedCollection with: self tenPesos with: self twentyDollars with: self tenEuros)) =
		(CompoundMeasure measures: (OrderedCollection with: self tenEuros with: self twentyDollars with: self tenPesos)).
	
	self deny: (CompoundMeasure with: self tenPesos with: self twentyDollars) = (CompoundMeasure with: (self tenPesos+self onePeso) with: self twentyDollars)
	
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testEqualAllNothing [

	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) = (CompoundMeasure with: self zeroPesos with: self zeroDollars).
	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) = self zeroPesos.
	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) = self zeroDollars	
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testEqualNumber [

	self assert: (CompoundMeasure with: self zeroPesos with: 1) = 1.
	self assert: 1 = (CompoundMeasure with: self zeroPesos with: 1)
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testEqualOneNothing [

	self assert: (CompoundMeasure with: self zeroPesos with: self tenDollars) = (CompoundMeasure with: self zeroPesos with: self tenDollars).
	self assert: (CompoundMeasure with: self zeroPesos with: self tenDollars) = (CompoundMeasure with: self tenDollars with: self zeroPesos).
	self assert: (CompoundMeasure with: self zeroPesos with: self tenDollars) = self tenDollars.
	self assert: (CompoundMeasure with: self tenDollars with: self zeroPesos) = self tenDollars
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testEqualWithDifferentBagSizeButRepresentSameEntity [

	self assert: (CompoundMeasure with: self onePeso with: self zeroDollars) =
		(CompoundMeasure measures: (Array with: self onePeso))
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testEqualWithDifferentBagSizeIsNothing [

	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) =
		(CompoundMeasure measures: (Array with: self zeroPesos))
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testHash [

	self assert: (CompoundMeasure with: self tenPesos with: self twentyDollars) hash = (CompoundMeasure with: self tenPesos with: self twentyDollars) hash.
	self assert: (CompoundMeasure with: self tenPesos with: self twentyDollars) hash = (CompoundMeasure with: self twentyDollars with: self tenPesos ) hash.
	self assert: (CompoundMeasure measures: (OrderedCollection with: self tenPesos with: self twentyDollars with: self tenEuros)) hash=
		(CompoundMeasure measures: (OrderedCollection with: self tenEuros with: self twentyDollars with: self tenPesos)) hash.
	
	self deny: (CompoundMeasure with: self tenPesos with: self twentyDollars) hash = (CompoundMeasure with: (self tenPesos+self onePeso) with: self twentyDollars) hash
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testHashAllNothing [

	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) hash = (CompoundMeasure with: self zeroPesos with: self zeroDollars) hash.
	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) hash = self zeroPesos hash.
	self assert: (CompoundMeasure with: self zeroPesos with: self zeroDollars) hash = self zeroDollars hash
]

{ #category : #'test comparing' }
CompoundMeasureTest >> testHashOneNothing [

	self assert: (CompoundMeasure with: self zeroPesos with: self tenDollars) hash = (CompoundMeasure with: self zeroPesos with: self tenDollars) hash.
	self assert: (CompoundMeasure with: self zeroPesos with: self tenDollars) hash = (CompoundMeasure with: self tenDollars with: self zeroPesos) hash.
	self assert: (CompoundMeasure with: self zeroPesos with: self tenDollars) hash = self tenDollars hash.
	self assert: (CompoundMeasure with: self tenDollars with: self zeroPesos ) hash = self tenDollars hash
]

{ #category : #'test truncated' }
CompoundMeasureTest >> testInvalidTruncated [

	self 
		should: [ (3 / (self tenPesos + self tenDollars)) truncated ]
		raise: InvalidUnaryOperationException
		withExceptionDo: [ :anException |
			self assert: anException description notNil.
			self assert: anException operand = (3 / (self tenPesos + self tenDollars)).
			self assert: anException operationName = 'truncated' ]
]

{ #category : #'test testing' }
CompoundMeasureTest >> testIsCompoundMeasurement [

	self assert: ((self peso with: 10.01) + (self dollar with: 20.5)) isCompoundMeasure
]

{ #category : #test }
CompoundMeasureTest >> testIsFraction [

	self deny: ((self peso with: 10.01) + (self dollar with: 20.5)) isFraction
]

{ #category : #'test testing' }
CompoundMeasureTest >> testIsNothing [

	self assert: (self zeroPesos + self zeroDollars) isNothing.
	self assert: ((self tenPesos + self tenDollars) - (self tenPesos + self tenDollars)) isNothing
]

{ #category : #'test magnitude protocol' }
CompoundMeasureTest >> testLessThan [
	"Not supported in bags..."

	self should: [ (self tenPesos + self tenDollars) < (self tenPesos + self tenDollars) ] raise: Exception
]

{ #category : #'test accessing' }
CompoundMeasureTest >> testMeasures [

	| measureBag |

	measureBag := CompoundMeasure with: self tenPesos with: self twentyDollars.

	self assert: measureBag measures size = 2.
	self assert: (measureBag measures includes: self tenPesos).
	self assert: (measureBag measures includes: self twentyDollars).
	self deny: (measureBag measures includes: 0)
]

{ #category : #'test integer division' }
CompoundMeasureTest >> testModulo [

	self assert: ((self tenPesos + self twentyDollars) // 8) = (self onePeso + self twoDollars).
	self assert:
		((self tenPesos + self twentyDollars) // -11) = (self onePeso negated - self twoDollars).
	self assert:
		((self tenPesos + self twentyDollars) // 3) = (
			(SimpleMeasure amount: (10 // 3) unit: self peso) +
				(SimpleMeasure amount: (20 // 3) unit: self dollar))
]

{ #category : #'test integer division' }
CompoundMeasureTest >> testModuloCompoundMeasure [

	self should: [ (self tenPesos + self tenDollars) // (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : #'test integer division' }
CompoundMeasureTest >> testModuloFloatByMeasure [

	self should: [ 1.01 // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : #'test integer division' }
CompoundMeasureTest >> testModuloFractionByMeasure [

	self should: [ (1/3) // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : #'test integer division' }
CompoundMeasureTest >> testModuloIntegerByMeasure [

	self should: [ 1 // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : #'test integer division' }
CompoundMeasureTest >> testModuloMeasure [

	self should: [ self tenPesos // (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplication [

	self assert: ((self tenPesos + self twentyDollars) * 2) = (self twentyPesos + self fortyDollars).
	self assert: ((self tenPesos + self twentyDollars + self tenEuros) * 2) = (self twentyPesos + self fortyDollars + self twentyEuros).
	
	
]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplicationByMeasure [

	self assert: ((self tenPesos + self twentyDollars) * self tenPesos) = ((self tenPesos * self tenPesos) + (self tenPesos * self twentyDollars))

	
	
]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplicationByZero [

	self assert: ((self tenPesos + self twentyDollars) * 0) isNothing.
	self assert: (((self tenPesos + self twentyDollars) * 0) + self tenPesos) = self tenPesos.
	self assert: (((self tenPesos + self twentyDollars) * 0) - self tenPesos) = self tenPesos negated 

]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplicationCommutativity [

	self assert: ((self tenPesos + self twentyDollars) * (25/10)) = ((25/10) * (self tenPesos + self twentyDollars)).
	self assert: (self tenPesos * (self tenPesos + self tenDollars)) = ((self tenPesos + self tenDollars) * self tenPesos ).

]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplicationDistributivity [

	self assert: ((self tenPesos + self twentyDollars) * 2) = ((self tenPesos * 2) + (self twentyDollars * 2)).
	self assert: ((self tenPesos + self twentyDollars) * 2) = ((self tenPesos + self twentyDollars) + (self tenPesos + self twentyDollars)) .
	self assert: (((self tenPesos + self twentyDollars) + (self tenPesos + self twentyDollars)) * 2) = (((self tenPesos + self twentyDollars) * 2) + ((self tenPesos + self twentyDollars) * 2)).
	self assert: (self tenPesos + self tenDollars ) * ( self tenPesos + self tenDollars ) =
		(((self tenPesos + self tenDollars )* self tenPesos) + ((self tenPesos + self tenDollars ) * self tenDollars ))
]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplyFloatByMeasure [

	self assert: (1.01 *  ( self tenPesos + self tenMeters ) ) = ((self tenPesos * 1.01) + (self tenMeters * 1.01))


]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplyFractionByMeasure [

	self assert: ((1/3) *  ( self tenPesos + self tenMeters ) ) = ((1/3* self tenPesos) + (1/3*self tenMeters)) 


]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplyIntegerByMeasure [

	self assert: (3 * (self tenPesos + self tenMeters )) =  ((3*self tenPesos) + (3*self tenMeters)) 


]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testMultiplyMeasureByCompoundMeasure [

	self assert: (self tenPesos * (self tenPesos + self tenDollars)) = ((self tenPesos * self tenPesos) + (self tenPesos * self tenDollars))
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testNegated [

	self assert: (self minusTenPesos + self minusTenDollars) = (self tenPesos + self tenDollars) negated
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testNegatedDistribution [

	self assert: (self tenPesos negated + self tenDollars negated) = (self tenPesos + self tenDollars) negated.
	self assert: (self tenPesos + self twentyDollars) negated negated = (self tenPesos + self twentyDollars)
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testNegatedZeroBag [

	self assert: ((self tenPesos + self twentyDollars) - (self tenPesos + self twentyDollars) ) negated isNothing.

]

{ #category : #'test comparing' }
CompoundMeasureTest >> testNotEqual [

	self deny: (CompoundMeasure with: self zeroPesos with: 1) = 'hello'.
	self deny: 'hello' = (CompoundMeasure with: self zeroPesos with: 1).

	self deny: (CompoundMeasure with: self zeroPesos with: 1) = Object new.
	self deny: Object new = (CompoundMeasure with: self zeroPesos with: 1)
]

{ #category : #'test accessing' }
CompoundMeasureTest >> testNumberOfMeasures [

	| measureBag |
	
	measureBag := CompoundMeasure with: self tenPesos with: self twentyDollars.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: measureBag numberOfMeasures = measureBag measures size
]

{ #category : #'test printing' }
CompoundMeasureTest >> testPrintingForMany [

	self assert: self tenPesos printString = '10 pesos' description: 'Printing for many with correct creation'.
	self assert: self tenDollars printString = '10 dollars' description: 'Printing for many with invalid creation'.
	
	
]

{ #category : #'test printing' }
CompoundMeasureTest >> testPrintingForOne [

	self assert: self onePeso printString = '1 peso' description: 'Printing for one with correct creation'.
	self assert: self oneDollar printString = '1 dollar' description: 'Printing for one with invalid creation'.
	
	
]

{ #category : #test }
CompoundMeasureTest >> testRemFrom [

	self
		should: [(self oneKilometer + self fivePesos) remFrom: self oneKilometer]
		raise: InvalidBinaryOperationException
]

{ #category : #'test integer remainder' }
CompoundMeasureTest >> testRemainder [

	self assert: ((self tenPesos + self twentyDollars) \\ 9) = (self onePeso + self twoDollars).
	self assert: ((self tenPesos + self twentyDollars) \\ -11) = (self onePeso negated - self twoDollars).
	self assert: ((self tenPesos + self twentyDollars) \\ 3) = ((SimpleMeasure amount: (10\\3) unit: self peso) + (SimpleMeasure amount: (20\\3) unit: self dollar))
]

{ #category : #'test integer remainder' }
CompoundMeasureTest >> testRemainderCompoundMeasure [

	self should: [ (self tenPesos + self tenDollars) \\ (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : #'test integer remainder' }
CompoundMeasureTest >> testRemainderFloatByMeasure [

	self should: [ 1.01 \\ ( self tenPesos + self tenMeters )  ] raise: InvalidOperationException


]

{ #category : #'test integer remainder' }
CompoundMeasureTest >> testRemainderIntegerByMeasure [

	self should: [ 1 \\  ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : #'test integer remainder' }
CompoundMeasureTest >> testRemainderMeasure [

	self should: [ self tenPesos \\ (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : #test }
CompoundMeasureTest >> testRoundTo [

	self assert: ((self oneKilometer + self fivePesos) roundTo: 1) = (self oneKilometer + self fivePesos)
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtract [

	| measureBag |

	measureBag := self tenPesos - self twentyDollars.
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars negated.
	
	measureBag := self tenPesos - self twentyDollars - self tenEuros.
	self assert: measureBag numberOfMeasures = 3.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars negated.
	self assert: (measureBag atSameBaseUnitAs: self euro) = self tenEuros negated
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractBags [

	| result |

	result := (self tenPesos + self twentyDollars) - (self tenEuros + self tenPesos).
	self assert: (result atSameBaseUnitAs: self peso) isNothing.
	self assert: (result atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (result atSameBaseUnitAs: self euro) = self tenEuros negated.
	self assert: result numberOfMeasures = 2.

	result := (self tenPesos + self twentyDollars) - self tenEuros.
	self assert: (result atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (result atSameBaseUnitAs: self dollar) = self twentyDollars.
	self assert: (result atSameBaseUnitAs: self euro) = self tenEuros negated.
	self assert: result numberOfMeasures = 3
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractEquality [

	self assert: (self tenPesos - self twentyDollars)  = (self tenPesos - self twentyDollars).
	self assert: (self tenEuros - self tenPesos - self twentyDollars)  = (self tenEuros - self tenPesos - self twentyDollars).
	

]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractExistingUnit [

	| measureBag measure |

	measureBag := self tenPesos - self twentyDollars.
	measure := measureBag - self tenPesos.

	self assert: measure = self twentyDollars negated


]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractFloatWithMeasure [

	self assert: ((10.01 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10.01 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos negated.
	self assert: ((10.01 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = 10.01.	
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractFractionWithMeasure [

	self assert: ((1/3 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((1/3 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos negated.
	self assert: ((1/3 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = (1/3).	
]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractIntegerWithMeasure [

	self assert: ((10 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos negated.
	self assert: ((10 - (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test multiplication' }
CompoundMeasureTest >> testSubtractMeasureByCompoundMeasure [

	self assert: (self tenMeters - (self tenPesos + self tenDollars)) = (self tenMeters - self tenPesos - self tenDollars)


]

{ #category : #'test subtract' }
CompoundMeasureTest >> testSubtractNothing [

	self assert: (self zeroPesos - self twentyDollars) = self twentyDollars negated.
	self assert: (self zeroPesos - self zeroDollars) = self zeroPesos.
	self assert: (self zeroPesos - self zeroDollars) = self zeroDollars.
	
]

{ #category : #'test truncated' }
CompoundMeasureTest >> testTruncated [

	self assert: ((self peso with: 10.01) + (self dollar with: 20.5)) truncated = (self tenPesos + self twentyDollars)
]

{ #category : #test }
CompoundMeasureTest >> testUnitNameOf [

	self
		should: [(self tenPesos + self tenDollars) unitNameOf: self dollar]
		raise: Exception
		withExceptionDo: [ :anException |
			self assert: ('*Unit of a MeasureBag is not defined' match: anException description)]
]

{ #category : #'test instance creation' }
CompoundMeasureTest >> testWithWithBaseUnits [

	| measureBag |
	
	measureBag := CompoundMeasure with: self tenPesos with: self twentyDollars.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars
]

{ #category : #'test instance creation' }
CompoundMeasureTest >> testWithWithDerivedUnits [

	| measureBag |
	
	measureBag := CompoundMeasure with: self tenCentavos with: self oneQuarter.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self centavo) amount = (10/100).
	self assert: (measureBag atSameBaseUnitAs: self peso) amount = (10/100).
	self assert: (measureBag atSameBaseUnitAs: self quarter) amount = (1/4).
	self assert: (measureBag atSameBaseUnitAs: self dollar) amount = (1/4)
]

{ #category : #'test division' }
CompoundMeasureTest >> testZeroDivision [

	self assert: ((self zeroPesos + self zeroDollars) / 1) = self zeroPesos.
	self assert: ((self zeroPesos + self zeroDollars) / 1) = self zeroDollars
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> thirtyPesos [

	^SimpleMeasure amount: 30 unit: self peso
]

{ #category : #'accessing distance measurements' }
CompoundMeasureTest >> thousandMillimeters [
	
	^SimpleMeasure amount: 1000 unit: self millimeter
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> twentyDollars [

	^SimpleMeasure amount: 20 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> twentyEuros [
	
	^SimpleMeasure amount: 20 unit: self euro
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> twentyPesos [
	
	^SimpleMeasure amount: 20 unit: self peso
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> twoDollars [

	^SimpleMeasure amount: 2 unit: self dollar
]

{ #category : #'mock undefined arithmetic object' }
CompoundMeasureTest >> unit [
	
	^BaseUnit named: 'Mock Unit'
]

{ #category : #'accessing temperature measurements' }
CompoundMeasureTest >> zeroCelsius [

	^SimpleMeasure amount: 0 unit: self celsius
]

{ #category : #'accessing distance measurements' }
CompoundMeasureTest >> zeroCentimeters [

	^SimpleMeasure amount: 0 unit: self centimeter
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> zeroDollars [
	
	^SimpleMeasure amount: 0 unit: self dollar
]

{ #category : #'accessing temperature measurements' }
CompoundMeasureTest >> zeroFahrenheit [

	^SimpleMeasure amount: 0 unit: self fahrenheit
]

{ #category : #'accessing distance measurements' }
CompoundMeasureTest >> zeroMeters [

	^SimpleMeasure amount: 0 unit: self meter
]

{ #category : #'accessing monetary measurements' }
CompoundMeasureTest >> zeroPesos [

	^SimpleMeasure amount: 0 unit: self peso
]
