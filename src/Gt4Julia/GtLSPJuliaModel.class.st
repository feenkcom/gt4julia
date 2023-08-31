Class {
	#name : #GtLSPJuliaModel,
	#superclass : #GtLSPDirectoryModel,
	#category : #'Gt4Julia-LSP'
}

{ #category : #accessing }
GtLSPJuliaModel class >> downloadExecutable [
	self error: 'TODO'
]

{ #category : #accessing }
GtLSPJuliaModel class >> extensions [
	^ '*.jl'
]

{ #category : #accessing }
GtLSPJuliaModel class >> initializeJuliaLSP [
	self executable: 'julia'.
	self
		arguments: {'-e'. 'using LanguageServer; runserver()'} 
]

{ #category : #accessing }
GtLSPJuliaModel class >> initializeJuliaLSPUsingEnvironment: anEnvironment [
	self executable: 'julia'.
	self
		arguments: {'-e'. 'using LanguageServer; runserver()'} 
]

{ #category : #accessing }
GtLSPJuliaModel class >> languageType [
	^ 'julia'
]

{ #category : #accessing }
GtLSPJuliaModel class >> styler [
	^ JuliaParser gtStyler
]

{ #category : #accessing }
GtLSPJuliaModel >> allSymbolsStream [
	^ self files asAsyncStream flatCollect: [ :each | each symbolStream ]
]

{ #category : #accessing }
GtLSPJuliaModel >> build [
	self halt
]

{ #category : #accessing }
GtLSPJuliaModel >> diffSplitter [
	^ GtSmaCCDiffSplitter new scannerClass: JuliaScanner
]

{ #category : #accessing }
GtLSPJuliaModel >> gtFieldSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Field') value.
	^ aSearch list
		priority: 13;
		title: 'Fields';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #accessing }
GtLSPJuliaModel >> gtFilesFor: aView [
	<gtView>
	^ aView list 
		title: 'Files';
		items: [ self files ]
]

{ #category : #accessing }
GtLSPJuliaModel >> gtFunctionSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Function') value.
	^ aSearch list
		priority: 12;
		title: 'Functions';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #accessing }
GtLSPJuliaModel >> gtLSPBuildAction [
	<gtLSPToolbarAction>
	^ GtLSPCoderAction new
		id: #buildAction;
		action: [ :button | 
			button disable.
			[ [ self build ] ensure: [ button inUIProcessDo: [ button enable ] ] ] fork ];
		title: 'Build';
		icon: BrGlamorousVectorIcons play;
		order: 20
]

{ #category : #accessing }
GtLSPJuliaModel >> gtStructureSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Struct') value.
	^ aSearch list
		priority: 11;
		title: 'Structures';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #private }
GtLSPJuliaModel >> installMessageHandlers [
	lspClient
		on: 'textDocument/publishDiagnostics'
		as: GtLSPPublishDiagnosticsParamsStructure
		send: #publishDiagnostics:
		to: self
]

{ #category : #private }
GtLSPJuliaModel >> publishDiagnostics: each [
	(self fileForUri: each uri)
		ifNotNil: [ :file | file diagnostics: each diagnostics ]
]
