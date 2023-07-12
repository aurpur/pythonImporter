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
PyIJsonVisitorTest >> testVisitFunctionCall [
	| model |
	"def get_data() :
	Conv2(150,7,7)"
	
	model := self parse: '{"_type": "Module", "body": [{"_type": "FunctionDef", "args": {"_type": "arguments", "args": [], "defaults": [], "kw_defaults": [], "kwarg": null, "kwonlyargs": [], "posonlyargs": [], "vararg": null}, "body": [{"_type": "Expr", "col_offset": 1, "end_col_offset": 15, "end_lineno": 3, "lineno": 3, "value": {"_type": "Call", "args": [{"_type": "Constant", "col_offset": 7, "end_col_offset": 10, "end_lineno": 3, "kind": null, "lineno": 3, "n": 150, "s": 150, "value": 150}, {"_type": "Constant", "col_offset": 11, "end_col_offset": 12, "end_lineno": 3, "kind": null, "lineno": 3, "n": 7, "s": 7, "value": 7}, {"_type": "Constant", "col_offset": 13, "end_col_offset": 14, "end_lineno": 3, "kind": null, "lineno": 3, "n": 7, "s": 7, "value": 7}], "col_offset": 1, "end_col_offset": 15, "end_lineno": 3, "func": {"_type": "Name", "col_offset": 1, "ctx": {"_type": "Load"}, "end_col_offset": 6, "end_lineno": 3, "id": "Conv2", "lineno": 3}, "keywords": [], "lineno": 3}}], "col_offset": 0, "decorator_list": [], "end_col_offset": 15, "end_lineno": 3, "lineno": 2, "name": "get_data", "returns": null, "type_comment": null}], "type_ignores": []}'.

	self assert: model body first body first class equals: PyIFunctionCall.
	self assert: model body first body first name equals: 'Conv2'.
	self assert: model body first body first arguments size equals: 3.

]

{ #category : #tests }
PyIJsonVisitorTest >> testVisitFunctionCallFunctionCallArgument [

	| model |
	"def get_data() :
	add(Conv2(150,7,7))"
	model := self parse:
		         '{"_type": "Module", "body": [{"_type": "FunctionDef", "args": {"_type": "arguments", "args": [], "defaults": [], "kw_defaults": [], "kwarg": null, "kwonlyargs": [], "posonlyargs": [], "vararg": null}, "body": [{"_type": "Expr", "col_offset": 1, "end_col_offset": 20, "end_lineno": 3, "lineno": 3, "value": {"_type": "Call", "args": [{"_type": "Call", "args": [{"_type": "Constant", "col_offset": 11, "end_col_offset": 14, "end_lineno": 3, "kind": null, "lineno": 3, "n": 150, "s": 150, "value": 150}, {"_type": "Constant", "col_offset": 15, "end_col_offset": 16, "end_lineno": 3, "kind": null, "lineno": 3, "n": 7, "s": 7, "value": 7}, {"_type": "Constant", "col_offset": 17, "end_col_offset": 18, "end_lineno": 3, "kind": null, "lineno": 3, "n": 7, "s": 7, "value": 7}], "col_offset": 5, "end_col_offset": 19, "end_lineno": 3, "func": {"_type": "Name", "col_offset": 5, "ctx": {"_type": "Load"}, "end_col_offset": 10, "end_lineno": 3, "id": "Conv2", "lineno": 3}, "keywords": [], "lineno": 3}], "col_offset": 1, "end_col_offset": 20, "end_lineno": 3, "func": {"_type": "Name", "col_offset": 1, "ctx": {"_type": "Load"}, "end_col_offset": 4, "end_lineno": 3, "id": "add", "lineno": 3}, "keywords": [], "lineno": 3}}], "col_offset": 0, "decorator_list": [], "end_col_offset": 20, "end_lineno": 3, "lineno": 2, "name": "get_data", "returns": null, "type_comment": null}], "type_ignores": []}'.

	self
		assert: model body first body first class
		equals: PyIFunctionCall.
	self assert: model body first body first name equals: 'add'.
	self assert: model body first body first arguments size equals: 1.
	self
		assert: model body first body first arguments first class
		equals: PyIFunctionCall.
	self
		assert: model body first body first arguments first name
		equals: 'Conv2'.
	self
		assert: model body first body first arguments first arguments first
		value equals: 150.
	self
		assert: model body first body first arguments first arguments second
		value equals: 7.
	self
		assert: model body first body first arguments first arguments third
		value equals: 7.
]

{ #category : #tests }
PyIJsonVisitorTest >> testVisitFunctionCallLiteralArguments [
	| model |
	"def get_data() :
	Conv2(150,7,7)"
	
	model := self parse: '{"_type": "Module", "body": [{"_type": "FunctionDef", "args": {"_type": "arguments", "args": [], "defaults": [], "kw_defaults": [], "kwarg": null, "kwonlyargs": [], "posonlyargs": [], "vararg": null}, "body": [{"_type": "Expr", "col_offset": 1, "end_col_offset": 15, "end_lineno": 3, "lineno": 3, "value": {"_type": "Call", "args": [{"_type": "Constant", "col_offset": 7, "end_col_offset": 10, "end_lineno": 3, "kind": null, "lineno": 3, "n": 150, "s": 150, "value": 150}, {"_type": "Constant", "col_offset": 11, "end_col_offset": 12, "end_lineno": 3, "kind": null, "lineno": 3, "n": 7, "s": 7, "value": 7}, {"_type": "Constant", "col_offset": 13, "end_col_offset": 14, "end_lineno": 3, "kind": null, "lineno": 3, "n": 7, "s": 7, "value": 7}], "col_offset": 1, "end_col_offset": 15, "end_lineno": 3, "func": {"_type": "Name", "col_offset": 1, "ctx": {"_type": "Load"}, "end_col_offset": 6, "end_lineno": 3, "id": "Conv2", "lineno": 3}, "keywords": [], "lineno": 3}}], "col_offset": 0, "decorator_list": [], "end_col_offset": 15, "end_lineno": 3, "lineno": 2, "name": "get_data", "returns": null, "type_comment": null}], "type_ignores": []}'.

	self assert: model body first body first class equals: PyIFunctionCall.
	self assert: model body first body first name equals: 'Conv2'.
	self assert: model body first body first arguments size equals: 3.

]

{ #category : #tests }
PyIJsonVisitorTest >> testVisitFunctionDef [
	| model |
	"def get_data() :
	return 0
	"
	
	model := self parse: '{"_type": "Module", "body": [{"_type": "FunctionDef", "args": {"_type": "arguments", "args": [], "defaults": [], "kw_defaults": [], "kwarg": null, "kwonlyargs": [], "posonlyargs": [], "vararg": null}, "body": [{"_type": "Return", "col_offset": 1, "end_col_offset": 9, "end_lineno": 3, "lineno": 3, "value": {"_type": "Constant", "col_offset": 8, "end_col_offset": 9, "end_lineno": 3, "kind": null, "lineno": 3, "n": 0, "s": 0, "value": 0}}], "col_offset": 0, "decorator_list": [], "end_col_offset": 9, "end_lineno": 3, "lineno": 2, "name": "get_data", "returns": null, "type_comment": null}], "type_ignores": []}'.

	self assert: model body first class equals: PyIFunctionDef.
	self assert: model body first name equals: 'get_data'.

]

{ #category : #tests }
PyIJsonVisitorTest >> testVisitReturnStatement [
	| model |
	"def get_data() :
	return 0
	"
	
	model := self parse: '{"_type": "Module", "body": [{"_type": "FunctionDef", "args": {"_type": "arguments", "args": [], "defaults": [], "kw_defaults": [], "kwarg": null, "kwonlyargs": [], "posonlyargs": [], "vararg": null}, "body": [{"_type": "Return", "col_offset": 1, "end_col_offset": 9, "end_lineno": 3, "lineno": 3, "value": {"_type": "Constant", "col_offset": 8, "end_col_offset": 9, "end_lineno": 3, "kind": null, "lineno": 3, "n": 0, "s": 0, "value": 0}}], "col_offset": 0, "decorator_list": [], "end_col_offset": 9, "end_lineno": 3, "lineno": 2, "name": "get_data", "returns": null, "type_comment": null}], "type_ignores": []}'.

	self assert: model body first body first class equals: PyIReturnStatement 

	
	
]
