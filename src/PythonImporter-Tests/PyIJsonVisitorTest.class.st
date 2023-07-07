"
A PyIJsonVisitorTest is a test class for testing the behavior of PyIJsonVisitor
"
Class {
	#name : #PyIJsonVisitorTest,
	#superclass : #TestCase,
	#category : #'PythonImporter-Tests-visitor'
}

{ #category : #parsing }
PyIJsonVisitorTest >> parse: jsonCode [
	^PyIJsonVisitor new visitJsonElement: ((NeoJSONReader on: jsonCode readStream) next)
]

{ #category : #tests }
PyIJsonVisitorTest >> testVisitFunctionDef [
	| model |
	"def get_data() :
	return 0
	"
	
	model := self parse: '{"_type": "Module", "body": [{"_type": "FunctionDef", "args": {"_type": "arguments", "args": [], "defaults": [], "kw_defaults": [], "kwarg": null, "kwonlyargs": [], "posonlyargs": [], "vararg": null}, "body": [{"_type": "Return", "col_offset": 1, "end_col_offset": 9, "end_lineno": 3, "lineno": 3, "value": {"_type": "Constant", "col_offset": 8, "end_col_offset": 9, "end_lineno": 3, "kind": null, "lineno": 3, "n": 0, "s": 0, "value": 0}}], "col_offset": 0, "decorator_list": [], "end_col_offset": 9, "end_lineno": 3, "lineno": 2, "name": "get_data", "returns": null, "type_comment": null}], "type_ignores": []}'.
	
	self assert: model class equals: PyIModule.
	self assert: model body size equals: 1.

	self assert: model body first class equals: PyIFunctionDef.
	self assert: model body first name equals: 'get_data'.
	self assert: model body first body size equals: 1.

	self assert: model body first body first class equals: PyIReturnStatement 

	
	
]
