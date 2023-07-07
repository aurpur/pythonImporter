Class {
	#name : #PyIReturnStatement,
	#superclass : #PyIStatement,
	#instVars : [
		'expression'
	],
	#category : #'PythonImporter-model'
}

{ #category : #accessing }
PyIReturnStatement >> expression [

	^ expression
]

{ #category : #accessing }
PyIReturnStatement >> expression: anObject [

	expression := anObject
]
