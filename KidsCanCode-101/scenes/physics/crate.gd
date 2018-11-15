extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _input(event):
    if event.is_action_pressed("ui_select"):
        apply_impulse(Vector2(-20, 0), Vector2(0, -500))