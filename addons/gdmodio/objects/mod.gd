extends Object
class_name ModIOMod

var id : int
var name : String
var submitter : String
var summary : String
var description : String
var date_updated : int
var date_live : int
var thumb_url : String
var profile_url : String
var modfile_url : String
var modfile_name : String
var modfile_size : int
var tags : PackedStringArray

static func from_json(json):
	var mod = ModIOMod.new()
	
	mod.id = json['id']
	mod.name = json['name']
	mod.submitter = json['submitted_by']['username']
	mod.profile_url = json['submitted_by']['profile_url']
	mod.summary = json['summary']
	mod.description = json['description']
	mod.date_updated = json['date_updated']
	mod.date_live = json['date_live']
	mod.thumb_url = json['logo']['original']
	mod.modfile_url = json['modfile']['download']['binary_url']
	mod.modfile_name = json['modfile']['filename']
	mod.modfile_size = json['modfile']['filesize_uncompressed']
	mod.tags = json['tags']

	return mod
