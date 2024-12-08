extends Node2D

var cardNumValue : int = 2
@onready var cardNumDisplayTop = $FrontFill/MarginContainer/GridContainer/RichTextLabel

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	if(cardNumDisplayTop):
		cardNumDisplayTop.clear()
		cardNumDisplayTop.add_text(str(cardNumValue))
	print('hello')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
