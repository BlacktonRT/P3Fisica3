extends Node

onready var head_spot = $HeadSpot
onready var foot_spot = $FootSpot

onready var ul_pocket: Pocket = $Pockets/UL_Pocket
onready var u_pocket: Pocket = $Pockets/U_Pocket
onready var ur_pocket: Pocket = $Pockets/UR_Pocket
onready var dl_pocket: Pocket = $Pockets/DL_Pocket
onready var d_pocket: Pocket = $Pockets/D_Pocket
onready var dr_pocket: Pocket = $Pockets/DR_Pocket


func get_head_spot() -> Vector2:
	return head_spot.position * self.scale


func get_foot_spot() -> Vector2:
	return foot_spot.position * self.scale


func get_opposite_pocket(pocket_location):
	if pocket_location == Enums.PocketLocation.UP_LEFT:
		return Enums.PocketLocation.DOWN_RIGHT
	elif pocket_location == Enums.PocketLocation.UP:
		return Enums.PocketLocation.DOWN
	elif pocket_location == Enums.PocketLocation.UP_RIGHT:
		return Enums.PocketLocation.DOWN_LEFT
	elif pocket_location == Enums.PocketLocation.DOWN_LEFT:
		return Enums.PocketLocation.UP_RIGHT
	elif pocket_location == Enums.PocketLocation.DOWN:
		return Enums.PocketLocation.UP
	elif pocket_location == Enums.PocketLocation.DOWN_RIGHT:
		return Enums.PocketLocation.UP_LEFT


func indicate_8_ball_target(pocketLocation):
	match pocketLocation:
		Enums.PocketLocation.UP_LEFT:
			ul_pocket.indicate()
		Enums.PocketLocation.UP:
			u_pocket.indicate()
		Enums.PocketLocation.UP_RIGHT:
			ur_pocket.indicate()
		Enums.PocketLocation.DOWN_LEFT:
			dl_pocket.indicate()
		Enums.PocketLocation.DOWN:
			d_pocket.indicate()
		Enums.PocketLocation.DOWN_RIGHT:
			dr_pocket.indicate()
