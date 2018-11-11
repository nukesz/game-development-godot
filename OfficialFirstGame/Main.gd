extends Node

export (PackedScene) var Mob
var score

func _ready():
    randomize()

func new_game():
    $Music.play()
    score = 0
    $Player.start($StartPosition.position)
    $StartTimer.start()
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")

func game_over():
    # $Music.stop()
    # $DeathSound.start()
    $ScoreTimer.stop()
    $MobTimer.stop()
    $HUD.show_game_over()

func _on_StartTimer_timeout():
    $MobTimer.start()
    $ScoreTimer.start()

func _on_ScoreTimer_timeout():
    score += 1
    $HUD.update_score(score)
    
func _on_MobTimer_timeout():
    print("Spawning mob")
    # Choose a random location on Path2D.
    $MobPath/MobSpawnLocation.set_offset(randi())
    # Create a Mob instance and add it to the scene.
    var mob = Mob.instance()
    add_child(mob)
    # Set the mob's direction perpendicular to the path direction.
    var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
    # Set the mob's position to a random location.
    mob.position = $MobPath/MobSpawnLocation.position
    # Add some randomness to the direction.
    direction += rand_range(-PI / 4, PI / 4)
    mob.rotation = direction
    # Choose the velocity.
    mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed), 0).rotated(direction))


