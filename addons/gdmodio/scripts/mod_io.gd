extends Node

var api_key : String
var game_id : int

func get_api_url():
	return "https://g-"+ str(game_id) +".modapi.io/v1/"
	
func Games(id : int = -1):
	var ns = "games"
	if(id < 0):
		var response = await do_request(ns)
		var games = []
		for game in response:
			games.append(ModIOGame.from_json(response))
	else:
		var response = await do_request(ns, true, id)
		return ModIOGame.from_json(response)

func do_request(ns : String, needs_key : bool = true, id : int = -1):
	var http_request = HTTPRequest.new()
	add_child(http_request)
	
	var url = get_api_url() + ns
	if id >= 0:
		url += "/" + str(id)
		
	if(needs_key):
		url += "?api_key=" + api_key
	
	print("Requesting URL: ", url)

	var err = http_request.request(url)
	if err != OK:
		print("Failed to start HTTP request: ", err)
		return null

	var response = await http_request.request_completed
	var response_code = response[1]
	var response_headers = response[2]
	var response_body = response[3]

	if response_code != 200:
		print("Request failed with code: ", response_code)
		return null

	var response_text = response_body.get_string_from_utf8()
	var response_json = JSON.parse_string(response_text)

	if response_json == null:
		print("Failed to parse JSON response.")
		return null

	return response_json
