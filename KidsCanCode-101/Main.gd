extends Node

onready var gem = preload("res://gem.tscn")

var screen_size
var score = 0
var level = 1

func _ready():
    randomize()
    screen_size = get_viewport().get_visible_rect().size
    spawn_gems(10)

func _process(delta):
    $HUD/time_label.text = str(int($game_timer.time_left))
    if $gem_container.get_child_count() == 0:
        level += 1
        spawn_gems(level * 10)    

func spawn_gems(num):
    for i in range(num):
        var g = gem.instance()
        $gem_container.add_child(g)
        g.connect("gem_grabbed", self, "_on_gem_grabbed")
        g.position = Vector2(rand_range(40, screen_size.x - 40), rand_range(40, screen_size.y - 40))

func _on_gem_grabbed():
    score += 10
    $HUD/score_label.text = str(score)

func _on_game_timer_timeout():
    $player.set_process(false)
