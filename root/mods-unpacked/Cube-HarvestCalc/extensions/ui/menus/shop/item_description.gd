extends "res://ui/menus/shop/item_description.gd"

const LOG_NAME = "Cube-HarvestCalc"

# Extensions
# =============================================================================

func set_item(item_data:ItemParentData)->void :
	.set_item(item_data)

	_cube_harvest_calc_extends_set_item(item_data)


# Custom
# =============================================================================

func _cube_harvest_calc_extends_set_item(item_data):
	if str(get_tree().current_scene.name) == "Shop" and not (item_data is CharacterData) and not (item_data is UpgradeData) and not (item_data is DifficultyData) and not (item_data is WeaponData):
		for effect in item_data.effects:
			if effect.key == "stat_harvesting" and effect.value >= 0:
				var harvesting_value = effect.value
				var item_cost = ItemService.get_value(RunData.current_wave, item_data.value)
				var current_harvesting_gain = RunData.get_stat("harvesting_growth")

				var current_profit_loss
				var current_harvesting
				var previous_profit_loss
				var previous_harvesting
				get_effects().bbcode_text = get_effects().bbcode_text + "\n [color=#736C6B]Profit at wave end:[/color]"

				for wave in range(RunData.current_wave, 20):
					if wave == RunData.current_wave:
						current_harvesting = harvesting_value
						current_profit_loss = - item_cost
					else :
						current_profit_loss = previous_profit_loss + previous_harvesting
						current_harvesting = ceil(previous_harvesting * (1 + current_harvesting_gain / 100))

					if wave == RunData.current_wave or wave == 19 or (previous_profit_loss < 0 and current_profit_loss >= 0):
						get_effects().bbcode_text = get_effects().bbcode_text + "\n [color=#736C6B]Wave " + str(wave) + ": [/color]"

						if current_profit_loss < 0:
							get_effects().bbcode_text = get_effects().bbcode_text + "[color=#FF0000]"
						if current_profit_loss > 0:
							get_effects().bbcode_text = get_effects().bbcode_text + "[color=#00FB00]"
						if current_profit_loss == 0:
							get_effects().bbcode_text = get_effects().bbcode_text + "[color=#535353]"

						get_effects().bbcode_text = get_effects().bbcode_text + str(current_profit_loss) + "[/color]"

					previous_harvesting = current_harvesting
					previous_profit_loss = current_profit_loss
