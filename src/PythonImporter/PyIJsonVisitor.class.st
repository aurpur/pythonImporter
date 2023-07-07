Class {
	#name : #PyIJsonVisitor,
	#superclass : #Object,
	#category : #'PythonImporter-visitor'
}

{ #category : #visiting }
PyIJsonVisitor >> visitFunctionDef: aJsonNode [ 
	| function |
	function := PyIFunctionDef new.
	function name: (aJsonNode at: #name).
	function body:  ((aJsonNode at: #body)
		collect: [:jsonStmt | self visitJsonElement: jsonStmt ]).
	^function
	
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
	module body: ((aJsonNode at: #body)
		collect: [:jsonStmt | self visitJsonElement: jsonStmt ]).
	^module
	
]

{ #category : #visiting }
PyIJsonVisitor >> visitReturn: aJsonNode [
	| stmt |
	stmt := PyIReturnStatement new.
	^stmt
]
