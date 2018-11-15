extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 450
const FRICTION = -500
const GRAVITY = 60
const JUMP_HEIGHT = -1350
const MIN_JUMP = -750

var motion = Vector2()
var anim = "idle"

func _input(event):
    if event.is_action_pressed("ui_up") and $ground_ray.is_colliding():
        motion.y = JUMP_HEIGHT 
    if event.is_action_released("ui_up"):
        motion.y = clamp(motion.y, MIN_JUMP, motion.y)

func _physics_process(delta):
    motion.y += GRAVITY
    var friction = false
    
    if Input.is_action_pressed("ui_right"):
        motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
    elif Input.is_action_pressed("ui_left"):
        motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
    else: 
        friction = true

    if is_on_floor():
        if friction == true:
            motion.x = lerp(motion.x, 0, 0.2)
    else:
        if friction == true:
            motion.x = lerp(motion.x, 0, 0.05)
            
    motion = move_and_slide(motion, UP) 
        
    if motion.x == 0:
        anim = "idle"
    else:
        anim = "running"   
    $sprite.animation = anim    
    
    if motion.x < 0:
        $sprite.flip_h = true  
    elif motion.x > 0:
        $sprite.flip_h = false