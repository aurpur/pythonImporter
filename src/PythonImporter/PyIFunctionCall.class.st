Class {
	#name : #PyIFunctionCall,
	#superclass : #Object,
	#instVars : [
		'name',
		'arguments'
	],
	#category : #'PythonImporter-model'
}

{ #category : #accessing }
PyIFunctionCall >> arguments [

	^ arguments
]

{ #category : #accessing }
PyIFunctionCall >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
PyIFunctionCall >> name [

	^ name
]

{ #category : #accessing }
PyIFunctionCall >> name: anObject [

	name := anObject
]
