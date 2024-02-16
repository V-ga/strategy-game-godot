
extends Camera2D

# Variables to control camera movement speed and smoothing
var follow_speed = 2
var smoothing = 5.0

var zoom_maximum = Vector2(1,1)
var zoom_speed = Vector2(0.5,0.5)

func _process(delta):
	# Get the position of the cursor in world coordinates
	var mousepos = get_viewport().get_mouse_position()
	var direction = (mousepos - position).normalized()
	var distance = position.distance_to(mousepos)
	position += direction * min(follow_speed * delta * distance, distance)
	



func _input(event):
	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			set_zoom(get_zoom() + Vector2(0.25, 0.25))
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and get_zoom()>zoom_maximum:
			set_zoom(get_zoom() - Vector2(0.25, 0.25))
			
		  
#func _unhandled_key_input(event):
#	if event.pressed:
#		print("pressed: ", event.unicode)
#	else:
#		print("released: ", event.unicode)
