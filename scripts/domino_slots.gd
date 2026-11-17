extends GridContainer

@export var dominoes: Array[domino_data] = []
@export var domino_scene: PackedScene


func _ready() -> void:
	for domino in dominoes:
		add_domino(domino)
	create_slots()

func add_domino(domino_data) -> void:
	var domino = domino_scene.instantiate()
	domino.data = domino_data
	add_child(domino)

func create_slots() -> void:
	pass
