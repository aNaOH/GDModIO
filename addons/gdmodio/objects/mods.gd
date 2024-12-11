extends Object

var game_id : int

func _init(game_id):
	self.game_id = game_id

func all():
	var mods = await ModIO.do_request("games/" + str(game_id) + "/mods")
	print(mods)
	var modList = []
	for mod in mods['data']:
		modList.append(ModIOMod.from_json(mod))
	return modList
	
func one(id : int):
	var mod = await ModIO.do_request("games/" + str(game_id) + "/mods", true, id)
	return ModIOMod.from_json(mod)
	
func query():
	pass
	
func upload():
	pass
	
func new_mod():
	pass
	
func update_mod():
	pass
