extends Node

var players = []

func addPlayer():
	var player_number = players.size() + 1
	players.append(player_number)
	return player_number

func killPlayer(player_number):
	players.erase(player_number)
	if players.size() == 1:
		endGame()

func endGame():
	print("Player: " + str(players[0]) + " Won!")
	players = []
	reloadGame()

func reloadGame():
	get_tree().reload_current_scene()
