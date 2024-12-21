extends Control

var inital_deck_size : int = 52
var card_scene = load("res://Scenes/Card/Card.tscn")
var card_schema = {
	"clubs":Array(range(13)),
	"spades":Array(range(13)),
	"hearts":Array(range(13)),
	"diamonds":Array(range(13))
}
var cards : Array = []

@export var personal_deck : Control
@export var personal_piles : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	build_deck(inital_deck_size)
	cards.shuffle()
	build_personal_deck(cards)
	build_personal_piles(cards)
	#print(personal_deck.get_children().map(func(x): return {
		#"num":x.cardNumValue,
		#"suit":x.cardSuitValue,
		#"facing up": x.isFaceUp
		#}))
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func build_deck(size: int):
	var card_index = 0
	for i in range(len(card_schema.keys())):
		var suit = card_schema.keys()[i]
		for card_num in card_schema[suit]:
			var new_card = card_scene.instantiate()  # Instantiate a new card
			new_card.set_visible(false)
			new_card.cardNumValue = str(card_num)
			new_card.cardSuitValue = suit
			cards.append(new_card)  # Add the card to the list
			add_child(new_card)  # Add the card instance to the scene tree
			card_index += 1
			
func build_personal_deck(cards):
	#first clear all placeholder cards
	for x in personal_deck.get_children()[0].get_children(): personal_deck.remove_child(x)
	for card in cards.slice(0,24):
		card.set_visible(true)
		card.get_parent().remove_child(card)
		card.flipCardFaceDown()
		personal_deck.add_child(card)		

func build_personal_piles(cards):
	var pile_index = 0
	for pile in personal_piles.get_children()[0].get_children():
		#clear a given pile
		for card in pile.get_children(): pile.remove_child(card)

		#place facedown cards in pile
		for card in cards.slice(0,pile_index + 1):
			card.set_visible(true)
			card.get_parent().remove_child(card)
			card.flipCardFaceDown()
			pile.add_child(card)
			card.set_position(pile.get_position())
		#place top face up card
		var top_card = cards.slice(0,1)[0]
		top_card.get_parent().remove_child(top_card)
		top_card.set_visible(true)
		top_card.flipCardFaceUp()
		pile.add_child(top_card)
		#top_card.set_position(pile.get_position())
		print_debug("pile index: ",pile_index," children: ",pile.get_children().map(func(x): return {
		"num":x.cardNumValue,
		"suit":x.cardSuitValue,
		"facing up": x.isFaceUp,
		"position": x.get_position(),
		"pile_position":x.get_parent().get_position()
		}))
		pile_index += 1
