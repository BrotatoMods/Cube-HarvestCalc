extends Node

const MOD_NAME = "Cube-HarvestCalc"

func _init(modLoader = ModLoader):
	modLoader.installScriptExtension("res://mods-unpacked/Cube-HarvestCalc/extensions/ui/menus/shop/item_description.gd")
	modLoader.mod_log("Initialized", MOD_NAME)
	
func _ready():
	ModLoader.mod_log("Finished loading Cube-Harvest Calc mod.", MOD_NAME)
