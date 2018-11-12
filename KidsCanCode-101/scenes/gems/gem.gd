extends Area2D

signal gem_grabbed

func _ready():
    $effect.interpolate_property($sprite, "scale", $sprite.scale, Vector2(2.0, 2.0), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
    $effect.interpolate_property($sprite, "modulate", $sprite.modulate, Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)

func _on_gem_area_entered(area):
    if area.get_name() == "player":
        emit_signal("gem_grabbed")
        clear_shapes() # Removes collision object
        $effect.start()


func _on_effect_tween_completed(object, key):
    queue_free()

func clear_shapes():
    var owners = get_shape_owners()
    shape_owner_clear_shapes(owners[0])
    
