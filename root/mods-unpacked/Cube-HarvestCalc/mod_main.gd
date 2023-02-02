extends Node

const HARVESTMOD_LOG = "Cube-HarvestCalc"

func _init(modLoader = ModLoader):
	modLoader.install_script_extension("res://mods-unpacked/Cube-HarvestCalc/extensions/ui/menus/shop/item_description.gd")
	ModLoaderUtils.log_info("Initialized", HARVESTMOD_LOG)

func _ready():
	ModLoaderUtils.log_info("Finished loading Cube-Harvest Calc mod.", HARVESTMOD_LOG)
