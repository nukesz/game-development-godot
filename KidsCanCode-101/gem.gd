extends Area2D



func _ready():
    pass

func _on_gem_area_entered(area):
    if area.get_name() == "player":
        queue_free()
