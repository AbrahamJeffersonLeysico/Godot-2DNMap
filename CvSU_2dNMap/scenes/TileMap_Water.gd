extends TileMap

# Animation setup
var water_tile_ids = [0, 1, 2, 3]  # Replace with the correct tile IDs for water frames
var animation_speed = 0.6  # Time per frame in seconds
var current_frame = 0
var time_elapsed = 0.0
var blend_speed = 0.1  # Optional: controls how smooth the tile switching feels

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= animation_speed:
		time_elapsed = 0.0
		current_frame = (current_frame + 1) % water_tile_ids.size()
		animate_water()

func animate_water():
	for cell in get_used_cells():
		var tile_id = get_cell(cell.x, cell.y)
		if tile_id in water_tile_ids:  # Replace only water tiles
			var next_frame = water_tile_ids[current_frame]
			set_cell(cell.x, cell.y, next_frame)  # Smooth frame change here
