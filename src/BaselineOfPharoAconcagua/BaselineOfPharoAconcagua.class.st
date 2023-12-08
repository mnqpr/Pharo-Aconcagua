Class {
	#name : #BaselineOfPharoAconcagua,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoAconcagua
}

{ #category : #baseline }
BaselineOfPharoAconcagua >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'PharoAconcagua'
		]
]
