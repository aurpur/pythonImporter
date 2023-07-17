Class {
	#name : #PyIAssignStatement,
	#superclass : #PyIStatement,
	#instVars : [
		'targets',
		'value'
	],
	#category : #'PythonImporter-model'
}

{ #category : #accessing }
PyIAssignStatement >> targets [

	^ targets
]

{ #category : #accessing }
PyIAssignStatement >> targets: anObject [

	targets := anObject
]

{ #category : #accessing }
PyIAssignStatement >> value [

	^ value
]

{ #category : #accessing }
PyIAssignStatement >> value: anObject [

	value := anObject
]
