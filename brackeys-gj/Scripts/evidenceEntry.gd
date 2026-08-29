class_name EvidenceEntry

extends Resource

@export var evidence_name: String = ""
@export var characters: Array[String] = []
@export var location: String = ""
#@export var time: String = ""
@export_multiline var desc: String = ""

static func makeEntry(p_name: String, p_characters: Array[String], p_location: String, p_desc : String) -> EvidenceEntry:
	var e := EvidenceEntry.new()
	e.evidence_name = p_name
	e.characters = p_characters
	e.location = p_location
	#e.time = p_time
	e.desc = p_desc
	return e

static func compareEntries(a: EvidenceEntry, b: EvidenceEntry) -> bool:
	return a.evidence_name == b.evidence_name \
		and a.location == b.location \
		#and a.time == b.time \
		and a.characters == b.characters \
