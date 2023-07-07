Class {
	#name : #PyIModule,
	#superclass : #Object,
	#instVars : [
		'name',
		'body'
	],
	#category : #'PythonImporter-model'
}

{ #category : #accessing }
PyIModule >> body [

	^ body
]

{ #category : #accessing }
PyIModule >> body: anObject [

	body := anObject
]

{ #category : #accessing }
PyIModule >> name [

	^ name
]

{ #category : #accessing }
PyIModule >> name: anObject [

	name := anObject
]
