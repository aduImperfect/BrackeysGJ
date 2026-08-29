class_name SuspectEntry

extends Resource

@export var suspect_title: String = ""
@export var suspect_name: String = ""
@export_multiline var suspect_shortdesc: String = ""
@export_multiline var suspect_desc: String = ""
@export var suspect_basesuspicionlevel: int = 0

static func makeEntry(p_title: String, p_name: String, p_shortdesc : String, p_desc : String, p_basesuslevel) -> SuspectEntry:
	var e := SuspectEntry.new()
	e.suspect_title = p_title
	e.suspect_name = p_name
	e.suspect_shortdesc = p_shortdesc
	e.suspect_desc = p_desc
	e.suspect_basesuspicionlevel = p_basesuslevel
	return e

static func compareEntries(a: SuspectEntry, b: SuspectEntry) -> bool:
	return a.suspect_title == b.suspect_title \
		and a.suspect_name == b.suspect_name \
