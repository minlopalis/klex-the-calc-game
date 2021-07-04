extends Area2D

signal hit
onready var ray_cast = $RayCast2D


func _process(delta):
	if $RayCast2D.is_colliding() && $LaserBeam.visible == true:
		ray_cast.enabled = false
		$LaserBeam/Cooldown.start()
		drain_battery()


func _on_AlienShipGreen_body_entered(body):
	drain_battery()


func drain_battery():
	Gamestate.battery_life -= 25
	emit_signal("hit")


func _on_Cooldown_timeout():
	ray_cast.enabled = true
