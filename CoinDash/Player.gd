extends Area2D

signal pickup
signal hurt

export (int) var speed: int

var screensize: = Vector2(480, 720)
var _velocity: = Vector2()

func start(pos: Vector2):
    set_process(true)
    position = pos
    $AnimatedSprite.animation = "idle"

func die():
    $AnimatedSprite.animation = "hurt"
    set_process(false)

func _process(delta: float):
    _get_input()
    position += _velocity * delta
    position.x = clamp(position.x, 0, screensize.x) 
    position.y = clamp(position.y, 0, screensize.y) 
    
    if _velocity.length() > 0:
        $AnimatedSprite.animation = "run"
        $AnimatedSprite.flip_h = _velocity.x < 0
    else:    
        $AnimatedSprite.animation = "idle"
    
func _get_input():
    _velocity = Vector2()
    if Input.is_action_pressed("ui_up"):
        _velocity.y -= 1
    if Input.is_action_pressed("ui_down"):
        _velocity.y += 1 
    if Input.is_action_pressed("ui_left"):
        _velocity.x -= 1
    if Input.is_action_pressed("ui_right"):
        _velocity.x += 1   
        
    if _velocity.length() > 0:
        _velocity = _velocity.normalized() * speed 
         

func _on_Player_area_entered(area: Area2D):
    if area.is_in_group("coins"):
        area.pickup()
        emit_signal("pickup", "coin")
    if area.is_in_group("powerups"):
        area.pickup()
        emit_signal("pickup", "powerup")
    if area.is_in_group("obstacles"):
        emit_signal("hurt")
        die()    
