Class {
	#name : #PyIFunctionDef,
	#superclass : #Object,
	#instVars : [
		'name',
		'parameters',
		'body',
		'returnType'
	],
	#category : #'PythonImporter-model'
}

{ #category : #accessing }
PyIFunctionDef >> body [

	^ body
]

{ #category : #accessing }
PyIFunctionDef >> body: anObject [

	body := anObject
]

{ #category : #accessing }
PyIFunctionDef >> name [

	^ name
]

{ #category : #accessing }
PyIFunctionDef >> name: anObject [

	name := anObject
]

{ #category : #accessing }
PyIFunctionDef >> parameters [

	^ parameters
]

{ #category : #accessing }
PyIFunctionDef >> parameters: anObject [

	parameters := anObject
]

{ #category : #accessing }
PyIFunctionDef >> returnType [

	^ returnType
]

{ #category : #accessing }
PyIFunctionDef >> returnType: anObject [

	returnType := anObject
]
