Class {
	#name : #Graph,
	#superclass : #Object,
	#instVars : [
		'edges',
		'acyclic',
		'nodes'
	],
	#category : #'Aconcagua-GraphModel'
}

{ #category : #preconditions }
Graph class >> assert: aCollectionOfEdges endpointsIncludedIn: aCollectionOfNodes [

	aCollectionOfEdges do: [:edge |
		((aCollectionOfNodes includes: edge source) and: [aCollectionOfNodes includes: edge target])
			ifFalse: [
				EdgeEndpointNotIncludedInNodesException
					signalInvalidEdge: edge
					edges: aCollectionOfEdges
					nodes: aCollectionOfNodes]]



]

{ #category : #'instance creation' }
Graph class >> edges: aCollectionOfEdges [

	| nodes |

	nodes :=
		aCollectionOfEdges
			inject: Set new
			into: [:set :edge |
				set
					add: edge source;
					add: edge target;
					yourself].

	^self edges: aCollectionOfEdges nodes: nodes
]

{ #category : #'instance creation' }
Graph class >> edges: aCollectionOfEdges nodes: aCollectionOfNodes [

	self assert: aCollectionOfEdges endpointsIncludedIn: aCollectionOfNodes.
	^self new initializeEdges: aCollectionOfEdges nodes: aCollectionOfNodes
]

{ #category : #comparing }
Graph >> = anotherGraph [

	^self class = anotherGraph class
		and: [(self sameEdgesAs: anotherGraph) and: [self sameNodesAs: anotherGraph]]
]

{ #category : #accessing }
Graph >> apply: applyBlock usingDepthFirstSearchFrom: aNode [

	self apply: applyBlock usingDepthFirstSearchFrom: aNode ignoring: Set new
	
]

{ #category : #'accessing - private' }
Graph >> apply: applyBlock usingDepthFirstSearchFrom: aNode ignoring: aSet [

	^self
		apply: applyBlock
		usingDepthFirstSearchFrom: aNode
		ignoring: aSet
		ifCycleEncounteredDo: []
]

{ #category : #'accessing - private' }
Graph >> apply: applyBlock usingDepthFirstSearchFrom: aNode ignoring: aSet ifCycleEncounteredDo: cycleBlock [

	| nonVisitedNodes adjacentNodes |

	applyBlock value: aNode.

	aSet add: aNode.

	adjacentNodes := self nodesAdjacentTo: aNode.
	nonVisitedNodes := adjacentNodes reject: [:adjacentNode | aSet includes: adjacentNode].

	(adjacentNodes size = nonVisitedNodes size) ifFalse: cycleBlock.

	nonVisitedNodes do: [:nonVisitedNode |
		self
			apply: applyBlock
			usingDepthFirstSearchFrom: nonVisitedNode
			ignoring: aSet
			ifCycleEncounteredDo: cycleBlock]
]

{ #category : #preconditions }
Graph >> assertIncludesAllNodesOf: aCollectionOfNodes [

	aCollectionOfNodes do: [:node |
		(nodes includes: node) ifFalse: [NodeNotFoundException signalNode: node graph: self]]


]

{ #category : #accessing }
Graph >> edges [
	
	^edges copy
]

{ #category : #accessing }
Graph >> edgesConvergingTo: aNode [

	^edges select: [ :anEdge | anEdge convergesTo: aNode ].
]

{ #category : #accessing }
Graph >> edgesConvergingToSelf [

	^edges select: [:anEdge | anEdge convergesToSelf]
]

{ #category : #accessing }
Graph >> edgesStartingOn: aNode [

	^edges select: [ :anEdge | anEdge startsOn: aNode ].
]

{ #category : #accessing }
Graph >> hash [

	| edgesHash nodesHash |

	edgesHash := edges inject: 0 into: [:hashNumber :anEdge | hashNumber bitXor: anEdge hash].
	nodesHash := nodes inject: 0 into: [:hashNumber :aNode | hashNumber bitXor: aNode hash].

	^edgesHash bitXor: nodesHash
]

{ #category : #testing }
Graph >> includesNode: aNode [

	^nodes includes: aNode
]

{ #category : #initialization }
Graph >> initializeAcyclicValue [

	| startingNodes visitedNodes |

	startingNodes := self nodesWithoutStartingEdges.
	visitedNodes := Set new.

	startingNodes do: [:startingNode |
		self
			apply: [:eachNode | ]
			usingDepthFirstSearchFrom: startingNode
			ignoring: visitedNodes
			ifCycleEncounteredDo: [
				acyclic := false.
				^self]].

	acyclic := edges isEmpty or: [startingNodes notEmpty]
]

{ #category : #initialization }
Graph >> initializeEdges: aCollectionOfEdges nodes: aCollectionOfNodes [

	edges := OrderedCollection withAll: aCollectionOfEdges.
	nodes := aCollectionOfNodes asSet
	

]

{ #category : #testing }
Graph >> isAcyclic [

	acyclic isNil ifTrue: [self initializeAcyclicValue].

	^acyclic
]

{ #category : #testing }
Graph >> isEmpty [

	^nodes isEmpty
]

{ #category : #accessing }
Graph >> nodes [

	^nodes copy
]

{ #category : #accessing }
Graph >> nodesAdjacentTo: aNode [

	^(self edgesStartingOn: aNode) collect: [:edge | edge target]
]

{ #category : #accessing }
Graph >> nodesWithoutConvergingEdges [

	^nodes select: [:node | (self edgesConvergingTo: node) isEmpty]
]

{ #category : #accessing }
Graph >> nodesWithoutStartingEdges [

	^nodes select: [:node | (self edgesStartingOn: node) isEmpty]
]

{ #category : #testing }
Graph >> notEmpty [

	^self isEmpty not
]

{ #category : #'removing nodes' }
Graph >> removeNode: anObject [

	^self removeNode: anObject ifAbsent: [NodeNotFoundException signalNode: anObject graph: self]
]

{ #category : #'removing nodes' }
Graph >> removeNode: anObject ifAbsent: aBlock [

	| nodesWithoutNode edgesWithoutNode |

	(nodes includes: anObject) ifFalse: [^aBlock value].

	nodesWithoutNode := nodes reject: [:node | node = anObject].
	edgesWithoutNode := edges reject: [:edge | edge isIncidentTo: anObject].

	^self class edges: edgesWithoutNode nodes: nodesWithoutNode
]

{ #category : #'removing nodes' }
Graph >> removeNodes: aCollectionOfNodes [

	| nodesWithoutNodes edgesWithoutNode |

	self assertIncludesAllNodesOf: aCollectionOfNodes.

	nodesWithoutNodes := nodes reject: [:node | aCollectionOfNodes includes: node].
	edgesWithoutNode :=
		edges reject: [:edge | aCollectionOfNodes anySatisfy: [:node | edge isIncidentTo: node]].

	^self class edges: edgesWithoutNode nodes: nodesWithoutNodes
]

{ #category : #testing }
Graph >> sameEdgesAs: anotherGraph [

	| anotherEdges |

	anotherEdges := anotherGraph edges.
	^edges size = anotherEdges size and: [edges allSatisfy: [:edge | anotherEdges includes: edge]]
]

{ #category : #testing }
Graph >> sameNodesAs: anotherGraph [

	| anotherNodes |

	anotherNodes := anotherGraph nodes.
	^nodes size = anotherNodes size and: [nodes allSatisfy: [:node | anotherNodes includes: node]]
]
