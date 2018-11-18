extends Node

var tile_size = Vector2(128, 128)
onready var texture = $Sprite.texture

func _ready():
    var text_width = texture.get_width() / tile_size.x
    var text_height = texture.get_height() / tile_size.y
    var ts = TileSet.new()
    for x in range(text_width):
        for y in range(text_height):
            var region = Rect2(x * tile_size.x, y * tile_size.y,
                               tile_size.x, tile_size.y)
            var id = x + y * 10
            ts.create_tile(id)
            ts.tile_set_texture(id, texture)
            ts.tile_set_region(id, region)
    ResourceSaver.save("res://terrain/terrain_tiles.tres", ts)        

