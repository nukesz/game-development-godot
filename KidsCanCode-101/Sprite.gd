extends Sprite

var screen_size
var extents
var pos
var vel
var spin

func _ready():
    randomize()
    screen_size = get_viewport_rect().size
    extents = texture.get_size() / 2
    pos = screen_size / 2
    vel = Vector2(rand_range(100, 300), 0).rotated(rand_range(0, 2 * PI))
    spin = rand_range(-PI, PI)
    
func _process(delta):
    
    if pos.x > screen_size.x - extents.x:
        pos.x = screen_size.x - extents.x
        vel.x *= -1
    if pos.x <= extents.x:
        pos.x = extents.x
        vel.x *= -1
    if pos.y > screen_size.y - extents.y:
        pos.y = screen_size.y - extents.y
        vel.y *= -1
    if pos.y <= extents.y:
        pos.y = extents.y
        vel.y *= -1
        
    pos += vel * delta
    rotation += spin * delta
    position = pos