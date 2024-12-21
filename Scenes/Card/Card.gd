extends Control

@export var cardNumValue : String
@export var cardSuitValue : String
@export var isFaceUp : bool = false
var suits = {
	"clubs":load("res://Assets/Sprites/suits/club.svg"),
	"spades":load("res://Assets/Sprites/suits/spade.svg"),
	"hearts":load("res://Assets/Sprites/suits/heart.svg"),
	"diamonds":load("res://Assets/Sprites/suits/diamond.svg")
}

var face_cards = {
	"1": "A",
	"11": "J",
	"12": "Q",
	"13": "K"
}

@onready var cardNumDisplayTop = $Node2D/FrontFill/CardContentMargin/GridContainer/CardNumberDisplayTop
@onready var cardNumDisplayBottom = $Node2D/FrontFill/CardContentMargin/GridContainer/CardNumberDisplayBottom
@onready var cardSuitDisplayTop = $Node2D/FrontFill/CardContentMargin/GridContainer/MarginContainer/CardSuitDisplayTop
@onready var cardSuitDisplayBottom = $Node2D/FrontFill/CardContentMargin/GridContainer/MarginContainer2/CardSuitDisplayBottom
@onready var cardBack = $Node2D/FrontFill/CardContentMargin/CardBack
@onready var cardContentMargin = $Node2D/FrontFill/CardContentMargin

# Called when the node enters the scene tree for the first time.
func _ready():
	if cardNumValue:
		cardNumValue = str(int(cardNumValue) + 1)
		if cardNumValue in face_cards.keys():
			cardNumValue = face_cards[str(cardNumValue)]
	   
		cardNumDisplayTop.clear()
		cardNumDisplayTop.add_text(str(cardNumValue))
		
		cardNumDisplayBottom.clear()
		cardNumDisplayBottom.add_text(str(cardNumValue))
	#suit
	if cardSuitValue:
		cardSuitDisplayTop.set_texture(suits[cardSuitValue])
		cardSuitDisplayBottom.set_texture(suits[cardSuitValue])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass		
	
func flipCardFaceUp():
	isFaceUp = true
	cardBack.visible = false
	cardContentMargin.add_theme_constant_override("margin_top",5)
	cardContentMargin.add_theme_constant_override("margin_right",10)
	cardContentMargin.add_theme_constant_override("margin_bottom",5)
	cardContentMargin.add_theme_constant_override("margin_left",10)
	
func flipCardFaceDown():
	isFaceUp = false
	cardBack.visible = true
	cardContentMargin.add_theme_constant_override("margin_top",0)
	cardContentMargin.add_theme_constant_override("margin_right",0)
	cardContentMargin.add_theme_constant_override("margin_bottom",0)
	cardContentMargin.add_theme_constant_override("margin_left",0)

