extends Control

func _ready():
	pass





func _on_Game_poinst_updated(points):
	$PanelContainer/Label.text = "Puntos" +  ":" + str(points) 