extends Node2D

@onready var tilemap: TileMap = $TileMap


func _unhandled_key_input(event: InputEvent):
	#print_debug("Got input event ", event)
	if event is InputEventKey:
		match event.keycode:
			# ? - Toggle control panel visibility
			KEY_SLASH when event.shift_pressed and event.pressed and not event.echo:
				$controls_panel.visible = not $controls_panel.visible
			# F9 - Reload scene
			KEY_F9 when event.pressed and not event.echo:
				get_tree().reload_current_scene()
			# F1 - Show tilemap navmap
			KEY_F1 when event.pressed and not event.echo:
				if tilemap.navigation_visibility_mode == TileMap.VISIBILITY_MODE_FORCE_SHOW:
					tilemap.navigation_visibility_mode = TileMap.VISIBILITY_MODE_DEFAULT
				else:
					tilemap.navigation_visibility_mode = TileMap.VISIBILITY_MODE_FORCE_SHOW
