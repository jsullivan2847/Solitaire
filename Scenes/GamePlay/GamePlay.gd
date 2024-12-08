extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var new_card = load("res://Scenes/Card/Card.tscn").instantiate()
	add_child(new_card)
	new_card.position = Vector2(514,286)
	
	#var new_card = card.instantiate()
	#new_card.position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
