extends Control

onready var t1_team_label: GameFinishedTeamLabel = $VBoxContainer/HBoxContainer/T1Container/Team
onready var t2_team_label: GameFinishedTeamLabel = $VBoxContainer/HBoxContainer/T2Container/Team
onready var t1_list: VBoxContainer = $VBoxContainer/HBoxContainer/T1Container/Players
onready var t2_list: VBoxContainer = $VBoxContainer/HBoxContainer/T2Container/Players
onready var lobby_button: Button = $VBoxContainer/LobbyButton
onready var waiting_label: Label = $VBoxContainer/WaitingLabel

var __


func initialize():
	hide()
	__ = lobby_button.connect("pressed", self, "_on_LobbyButton_pressed")
	t1_team_label.initialize("Team 1")
	t2_team_label.initialize("Team 2")
	# add players to lists
	for info in Lobby.player_infos.values():
		var player_name = info.name
		var player_team = info.team
		var label = Label.new()
		label.clip_text = true
		label.align = Label.ALIGN_CENTER
		label.text = str(player_name)
		if player_team == 1:
			t1_list.add_child(label)
		elif player_team == 2:
			t2_list.add_child(label)
	# show button or waiting label
	if get_tree().get_network_unique_id() == 1:
		lobby_button.show()
		waiting_label.hide()
	else:
		lobby_button.hide()
		waiting_label.show()


func display(winning_team: int):
	get_tree().paused = true
	show()
	# show win animation
	match winning_team:
		1:
			t1_team_label.show_as_winner()
		2:
			t2_team_label.show_as_winner()


func _on_LobbyButton_pressed():
	SoundManager.click()
	rpc("_back_to_lobby")


remotesync func _back_to_lobby():
	get_tree().paused = false
	__ = get_tree().change_scene("res://scenes/Menu.tscn")
