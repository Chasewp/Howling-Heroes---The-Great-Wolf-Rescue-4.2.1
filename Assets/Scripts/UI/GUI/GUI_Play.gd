extends Control

@onready var character_name = $Character_Name
@onready var biome_location = $Biome_Location
@onready var health = $Health_Bar
@onready var armor = $Armor_Bar
@onready var Pine_Key  = %Pine_Keys
@onready var ice_key = %Ice_Key
@onready var stone_key = %Stone_Key
@onready var snow_fang_key = %Snow_Fang_Key
@onready var frozen_paw_securelock_key = %Frozen_Paw_SecureLock_Key
@onready var grass_key = %Grass_Key
@onready var flower_key = %Flower_Key
@onready var ground_key = %Ground_Key
@onready var dessert_key = %Dessert_Key
@onready var machete_image = %Machete
@onready var machete_background = %Machete_background
@onready var machete_Label = %LabelMacchete
@onready var burst_garou_background =%"Burst-Garou_background"
@onready var burst_garou_image =%Brust_Garou
@onready var burst_garou_label = %Labelbusrstgarou
@onready var weapon_swicher = $Weapon_Switcher

var save = load("user://Save/Progress/Save_Progress.tres")

	
func _ready():
	# Load data dari file save
	var save_path = "user://Save/Progress/Save_Progress.tres"
	if ResourceLoader.exists(save_path):
		if save is Data_Progress:
			# Set data ke singleton
			player_singleton_autoload.setter_name(save.player_name)
			player_singleton_autoload.setter_armor(save.player_armor)
			player_singleton_autoload.setter_health(save.player_health)
			player_singleton_autoload.setter_location(save.player_biome_location)

			# Update UI
			character_name.set_text(player_singleton_autoload.getter_name())
			biome_location.set_text("Location : " + player_singleton_autoload.getter_location())
			health.set_value_no_signal(player_singleton_autoload.getter_health())
			armor.set_value_no_signal(player_singleton_autoload.getter_armor())
		else:
			print("Failed to load resource data.")
	else:
		print("Save file not found.")

	# Update keys visibility
	get_keys()


func _on_player_health_changed(percentage:float):
	health.set_value_no_signal(percentage)
	
func _on_player_armor_changed(percentage:float):
	armor.set_value_no_signal(percentage)

func get_keys():
	# Keys
	if (
		player_singleton_autoload.getter_pine_key() and
		player_singleton_autoload.getter_ice_key() and
		player_singleton_autoload.getter_stone_key() and
		player_singleton_autoload.getter_snow_fang_key() and
		player_singleton_autoload.getter_frozen_paw_securelock_key() and
		player_singleton_autoload.getter_grass_key() and
		player_singleton_autoload.getter_flower_key() and
		player_singleton_autoload.getter_ground_key() and
		player_singleton_autoload.getter_dessert_key()
	):
		Pine_Key.visible = true
		ice_key.visible = true
		stone_key.visible = true
		snow_fang_key.visible = true
		frozen_paw_securelock_key.visible = true
		grass_key.visible = true
		flower_key.visible = true
		ground_key.visible = true
		dessert_key.visible = true
	else:
		Pine_Key.visible = false
		ice_key.visible = false
		stone_key.visible = false
		snow_fang_key.visible = false
		frozen_paw_securelock_key.visible = false
		grass_key.visible = false
		flower_key.visible = false
		ground_key.visible = false
		dessert_key.visible = false
