extends "res://character/Character.gd"

func _ready():
    can_move = false
    facing = moves.keys()[randi() % 4]
    yield(get_tree().create_timer(0.5), 'timeout')
    can_move = true    
    
func _process(delta: float):
    if can_move:
        if not move(facing) or randi() % 10 > 5:
            facing = moves.keys()[randi() % 4]    
    
