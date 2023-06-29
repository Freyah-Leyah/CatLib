# **CatLib**
## List of functions:
* `CatLib:AddNewMessage(id)` adds new message id in `Messages.lua` table. Call this before you register wanted message. **Example below**
```
CatLib:AddNewMessage("test1")
self._message_system:register(Message.test1, "meow", callback(self, self, "meow_2"))
```

  
* `CatLib:PreventCrash(func, variables)` allows you to call function in safe mode which will prevent you from crashing (in most cases) and log error. You can call specific function with up to 3 variables typed in table.
    * Example: `CatLib:PreventCrash(test, {1,2,3})` - this will run function `test` and pass `1,2,3` variables to it.
      
* `CatLib:dec_round(num, decimals)` rounds up to wanted decimals places.
    * Example: `CatLib:dec_round(10.23, 1)` - returns `10.2`
      
* `CatLib:string_to_operator(string, x, y)` allows you to convert string to operator.
    * Example: `CatLib:string_to_operator(">", 5, 3)` - checks `5 > 3`, in this case it would return `true`.
 
*  `CatLib:rainbow(base_mul, speed_mul, flat_change)` (animated) Rainbow Color. `base_mul` (table), `speed_mul` and `flat_change` (table) are for changing speed and the way colors shift through.
    * *I recommend having `base_mul` at `5,2,3` or generally desynced values.*
    * Note: colors will shift as long as this function is being called.
    *  Returns R, G, B only, so you need to do for example:
```
local r,g,b = CatLib:rainbow({5, 2, 3}, 10, {0, 20, 50})
color(1,r,g,b)
```
 
* `CatLib:set_time_temporary_property(name, time)` changes duration of temporary property to provided value in `time`.
  
* `CatLib:add_time_temporary_property(name, time)` changes duration of temporary property by adding or subtracting provided value in `time`.

* `CatLib:get_time_from_temporary_property(name)` returns the remaining duration of temporary property.

* `CatLib:fetch_henchmans_upgrades(definition_id, upgrade_id, default)` fetches value of ai teammates wanted ability (even if not ingame). `definition_id` is the id in blackmarket henchmans loadout, `upgrade_id` is the id in tweakdata. Returns `default` or 0 (if default is not provided) if ai teammates does not have wanted ability equipped.

* `CatLib:check_upgrade_value(category, upgrade, index, default)` allows you to get specific value of wanted upgrade value. (Saves you typing a check if player has upgrade value)
    * Example: `CatLib:check_upgrade_value("player", "tag_team_base", "kill_health_gain", 0)` - checks if player has wanted upgrade, if they do it returns `self.values.player.tag_team_base.kill_health_gain` which is `1.5` in this case. If player does not have wanted upgrade it returns `default` or 0 (if default is not provided).
 
* `CatLib:upgrade_value_based_on_current_health(category, upgrade, health_threshold, default, custom_value_1, custom_value_2, operator, per_health_ratio, limited_increase_health_ratio, custom_limit_value)` changes upgrade value depending on your current health. Values do not need to be in choosen upgrade, you can customize it by using `custom_value_1`, `custom_value_2` and `custom_limit_value`. Check `per_health_ratio` if you want your value to increase the lower/higher your health is, use `limited_increase_health_ratio` to set max value it can increase to, use `custom_limit_value` to set custom limit value.
    * If not custom value is not provided then `custom_value_1` defaults to first index of provided upgrade value, `custom_value_2` defaults to second index of provided upgrade value, `custom_limit_value` defaults to third index of provided upgrade value
    * If player does not have provided upgrade value it defaults to `default` or 0 (if default value is not provided)
    * Example: `CatLib:upgrade_value_based_on_current_health("player", "hostage_health_regen_addend", 0.5, 0, nil, nil, "<", true, true)` - defaults to 0, value increases the lower (**operator is "<"**) your health is when below 50% (**health_threshold is 0.5**) health (**per_health_ratio is true**) up to (**limited_increase_health_ratio is true**) third index value of `hostage_health_regen_addend` (**custom_limit_value is nil**), uses first and second index values of `hostage_health_regen_addend` due to **custom_value_1, custom_value_2 being nil**.
 
 * Adds `attack_data.raw_damage` in PlayerDamage damage_bullet, damage_fire_hit, damage_explosion, damage_melee; Returns raw damage taken (before absorption and reduction is applied)
