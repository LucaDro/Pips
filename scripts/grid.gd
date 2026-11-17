extends GridContainer

const SLOT_SIZE = 16
@export var slot_texture: PackedScene
@export var empty_slot_texture: PackedScene
@export var dimensions: Vector2i
@export var grid_requirements: Array[int]
var grid_data: Array[Node] = []

func _ready() -> void:
	create_grid()
	init_grid_data()

func get_index_from_coords(pos: Vector2i) -> int:
	return pos.x + pos.y * columns

func create_grid() -> void:
	self.columns = dimensions.x
	for y in dimensions.y:
		for x in dimensions.x:
			if grid_requirements[get_index_from_coords(Vector2i(x, y))] == -1:
				var grid_slot = empty_slot_texture.instantiate()
				add_child(grid_slot)
			else:
				var grid_slot = slot_texture.instantiate()
				add_child(grid_slot)

func init_grid_data() -> void:
	grid_data.resize(dimensions.x * dimensions.y)
	grid_data.fill(null)
