extends Object
class_name ModIOGame

var id : int
var status : int
var name : String
var submitter : String
var icon_url : String
var logo_url : String
var header_url : String
var tags : Dictionary

func Mods():
	return preload("res://addons/gdmodio/objects/mods.gd").new(id)

static func from_json(json):
	var game = ModIOGame.new()
	
	game.id = json['id']
	game.status = json['status']
	game.name = json['name']
	game.submitter = json['submitted_by']['username']
	game.icon_url = json['icon']['original']
	game.logo_url = json['logo']['original']
	game.header_url = json['header']['original']
	
	for tag_option in json['tag_options']:
		game.tags[tag_option['name']] = tag_option['tags']
	
	
	return game
