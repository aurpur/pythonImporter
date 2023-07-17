Class {
	#name : #PyIJsonVisitor,
	#superclass : #Object,
	#category : #'PythonImporter-visitor'
}

{ #category : #visiting }
PyIJsonVisitor >> visitAssign: aJsonNode [ 
	| assign |
	assign := PyIAssignStatement new.
	assign targets: (self visitJsonElement: (aJsonNode at: #targets)).
	assign value: (self visitJsonArray: (aJsonNode at: #value)).
	^assign

]

{ #category : #visiting }
PyIJsonVisitor >> visitCall: aJsonNode [ 
	| function |
	function := PyIFunctionCall new.
	function name: (self visitJsonElement: (aJsonNode at: #func)).
	function arguments: (self visitJsonArray: (aJsonNode at: #args)).
	^function

]

{ #category : #visiting }
PyIJsonVisitor >> visitConstant: aJsonNode [ 
	| literal |
	literal := PyILiteral new.
	literal value: (aJsonNode at: #value).
	^literal
]

{ #category : #visiting }
PyIJsonVisitor >> visitExpr: aJsonNode [ 
	^self visitJsonElement: (aJsonNode at: #value)

]

{ #category : #visiting }
PyIJsonVisitor >> visitFunctionDef: aJsonNode [ 
	| function |
	function := PyIFunctionDef new.
	function name: (aJsonNode at: #name).
	function body: (self visitJsonArray: (aJsonNode at: #body)).
	^function
	
]

{ #category : #visiting }
PyIJsonVisitor >> visitJsonArray: aJsonArray [
	^aJsonArray 
		collect: [:jsonStmt | self visitJsonElement: jsonStmt ]
]

{ #category : #visiting }
PyIJsonVisitor >> visitJsonElement: aJSonNode [
	| selector |
	selector := 'visit' , (aJSonNode at: #'_type') capitalized , ':'.
	^self perform: selector asSymbol with: aJSonNode  
]

{ #category : #visiting }
PyIJsonVisitor >> visitModule: aJsonNode [
	| module |
	module := PyIModule new.
	module body: (self visitJsonArray: (aJsonNode at: #body)).
	^module
	
]

{ #category : #visiting }
PyIJsonVisitor >> visitName: aJsonNode [ 
	^aJsonNode at: #id
]

{ #category : #visiting }
PyIJsonVisitor >> visitReturn: aJsonNode [
	| stmt |
	stmt := PyIReturnStatement new.
	^stmt
]
