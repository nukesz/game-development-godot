extends Area2D

enum Items { health, ammo }

export (Items) var type = Items.health
export (Vector2) var ammo = Vector2(10, 25) # random value between

