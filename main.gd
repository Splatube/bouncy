extends Node2D

@onready var marker_2d: Marker2D = $Marker2D

func _ready() -> void:
	for player in get_tree().get_nodes_in_group("Player"):
		player.respwaned.connect(_on_player_respawned.bind(player))
		
func _on_player_respawned(player):
	player.global_position = marker_2d.global_position


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
