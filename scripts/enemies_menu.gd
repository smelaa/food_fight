extends Control

@export var strength = "10"
@export var speed = "10"
@export var bullet_demage = "10"
@export var bullet_speed = "10"

@export var bullet_name = """"""
@export var bullet_texture: Texture2D

@export var enemy_name = """"""
@export var enemy_texture: Texture2D

func _ready():
	$HBoxContainer/VBoxContainer2/StrengthNum.text = strength
	$HBoxContainer/VBoxContainer2/SpeedNum.text = speed
	$HBoxContainer/VBoxContainer2/BulletDemageNum.text = bullet_demage
	$HBoxContainer/VBoxContainer2/BulletSpeedNum.text = bullet_speed
	$BulletName.text = str(bullet_name)
	$EnemyName.text = str(enemy_name)
	$BulletImg.texture = bullet_texture
	$EnemyImg.texture = enemy_texture
