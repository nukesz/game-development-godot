extends Area2D

export (int) var speed = 400

var screensize
var vel = Vector2()
var extents

func _ready():
    position = Vector2(500, 300)
    screensize = get_viewport_rect().size
    extents = $CollisionShape2D.get_shape().get_extents()


func _process(delta):
    var input = Vector2(0, 0)
    input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
    input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
    vel = input.normalized() * speed
    var pos = position + vel * delta
    pos.x = clamp(pos.x, extents.x, screensize.x - extents.x)
    pos.y = clamp(pos.y, extents.y, screensize.y - extents.y)
    position = pos