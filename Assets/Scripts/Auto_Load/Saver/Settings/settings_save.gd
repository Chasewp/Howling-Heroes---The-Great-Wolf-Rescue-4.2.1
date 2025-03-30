"Auto_Load <Single_Ton> - Save_Settings"
class_name  Save_Setting_Singletons
extends Node

const save_setting_location = "user://Save/Settings/Settings_data.WPA"
var Data_Settings={
			"FullScreen_on":false,
			"V_Sync_on":false,
			"Master_Volume":-1,
			"Music_Volume":-1,
			"SFX_Volume":-1,
			"Dialogue_Volume":-1,
		}
		
func _ready():
	save_settings()
	load_settings()
	
func save_settings():
	var Save_Settings_Data = FileAccess.open_encrypted_with_pass(save_setting_location,FileAccess.WRITE,"Bl1zz4rd03")
	Save_Settings_Data.store_var(Data_Settings)
	Save_Settings_Data.close()
	
func load_settings():
	if FileAccess.file_exists(save_setting_location):
		var Load_Settings_Data = FileAccess.open_encrypted_with_pass(save_setting_location,FileAccess.READ,"Bl1zz4rd03")
		Data_Settings = Load_Settings_Data.get_var()
		Load_Settings_Data.close()
	else:
		print("Settings Data Not Found")
	
	

