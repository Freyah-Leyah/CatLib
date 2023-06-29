# CatLib
## List of functions:
* `CatLib:AddNewMessage(id)` adds new message id in `Messages.lua` table. Call this before you register wanted message.
  
* `CatLib:PreventCrash(func, variables)` allows you to call function in safe mode which will prevent you from crashing (in most cases) and log error. You can call specific function with up to 3 variables typed in table.
    * Example: `CatLib:PreventCrash(test, {1,2,3})` - this will run function `test` and pass `1,2,3` variables to it.
      
* `CatLib:dec_round(num, decimals)` rounds up to wanted decimals places.
    * Example: `CatLib:dec_round(10.23, 1)` - returns `10.2`
      
* `CatLib:string_to_operator(string, x, y)` allows you to convert string to operator.
    * Example: `CatLib:string_to_operator(">", 5, 3)` - checks `5 > 3`, in this case it would return `false`.
 
*  `CatLib:rainbow(base_mul, speed_mul, flat_change)` (animated) Rainbow Color. `base_mul` (table), `speed_mul` and `flat_change` (table) are for changing speed and the way colors shift through.
    * *I recommend having `base_mul` at `5,2,3` or generally desynced.*
    * Example: `CatLib:rainbow({5, 2, 3}, 10, {0, 20, 50})`
 
* `CatLib:set_time_temporary_property(name, time)` changes duration of temporary property to provided value in `time`.
  
* `CatLib:add_time_temporary_property(name, time)` changes duration of temporary property by adding or removing provided value in `time`.

* `CatLib:get_time_from_temporary_property(name)` returns the remaining duration of temporary property.

* `CatLib:fetch_henchmans_upgrades(definition_id, upgrade_id, default)` fetchs value of ai teammates wanted ability (even if not ingame). `definition_id` is the id in blackmarket henchmans loadout, `upgrade_id` is the id in tweakdata. Returns `default` or 0 (if default is not provided) if ai teammates does not have wanted ability equipped.

* `CatLib:check_upgrade_value(category, upgrade, index, default)` allows you to get specific value of wanted upgrade value. (Saves you typing to check if player has upgrade value)
    * Example: `CatLib:check_upgrade_value("player", "tag_team_base", "kill_health_gain", 0)` - checks if player has wanted upgrade, if they do it returns `self.values.player.tag_team_base.kill_health_gain` which is `1.5` in this case. If player does not have wanted upgrade it returns `default` or 0 (if default is not provided).
