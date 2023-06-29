function CatLib:PreventCrash(func, variables)
	local lib = "CatLib"

	if variables then
		local fun, error = pcall(func, variables[1], (variables[2] or nil), (variables[3] or nil))
		if not fun then
			log("[" .. lib .. "] An error occurred in " .. tostring(func) .. " result: " .. tostring(error))
		end

		return
	end

	local fun, error = pcall(func)

	if not fun then
		log("[" .. lib .. "] An error occurred in " .. tostring(func) .. " result: " .. tostring(error))
	end
end

function CatLib:dec_round(num, decimals)
	decimals = math.pow(10, decimals or 0)
	num = num * decimals

	if num >= 0 then
		 num = math.floor(num + 0.5)
	else
 		num = math.ceil(num - 0.5)
	end

	return num / decimals
end

function CatLib:string_to_operator(string, x, y)
	local look_up = {
		['=='] = function (x, y) return x == y end,
		['>='] = function (x, y) return x >= y end,
		['<='] = function (x, y) return x <= y end,
		['>'] = function (x, y) return x > y end,
		['<'] = function (x, y) return x < y end,
		['+'] = function (x, y) return x + y end,
		['-'] = function (x, y) return x - y end,
		['*'] = function (x, y) return x * y end,
		['/'] = function (x, y) return x / y end,
	}

	return look_up[string](x, y)
end

function CatLib:rainbow(base_mul, speed_mul, flat_change)
	local time = Application:time()
	local r = math.max(math.sin(time * ((base_mul[1] or 1) * (speed_mul or 1)) + (flat_change[1] or 0)), 0.1)
	local g = math.max(math.sin(time * ((base_mul[2] or 1) * (speed_mul or 1)) + (flat_change[2] or 0)), 0.1)
	local b = math.max(math.sin(time * ((base_mul[3] or 1) * (speed_mul or 1)) + (flat_change[3] or 0)), 0.1)

	return r,g,b
end

function CatLib:set_time_temporary_property(name, time)
	return managers.player._temporary_properties:set_time(name, time)
end

function CatLib:add_time_temporary_property(name, time)
	return managers.player._temporary_properties:add_time(name, time)
end

function CatLib:get_time_from_temporary_property(name)
	return managers.player._temporary_properties:get_time(name)
end

function CatLib:fetch_henchmans_upgrades(definition_id, upgrade_id, default)
	local data =  tweak_data.upgrades.values.team[upgrade_id][1]
	local upgrades = 0

	for index = 1, 3 do
		local loadout = managers.blackmarket:henchman_loadout(index)
		if loadout.skill == definition_id then
			upgrades = data
		end
	end

	return upgrades or default or 0
end

function CatLib:check_upgrade_value(category, upgrade, index, default)
	local upgrade_value = managers.player:upgrade_value(category, upgrade)

	if upgrade_value == 0 then
		return default or 0
	end

	return upgrade_value[index] or default or 0
end

function CatLib:upgrade_value_based_on_current_health(category, upgrade, health_threshold, default, custom_value_1, custom_value_2, operator, per_health_ratio, limited_increase_health_ratio, custom_limit_value)
	local upgrade_value = managers.player:upgrade_value(category, upgrade)

	if not managers.player:player_unit() then
		return default or 0
	end

	if upgrade_value == 0 then
		return default or 0
	end

	if not per_health_ratio then
		if CatLib:string_to_operator(operator, managers.player:player_unit():character_damage():health_ratio(), health_threshold) then
			return upgrade_value[(custom_value_2 or 2)] or default or 0
		end
	end

	if per_health_ratio then
		if CatLib:string_to_operator(operator, managers.player:player_unit():character_damage():health_ratio(), health_threshold) then
			local health_ratio = managers.player:player_unit():character_damage():health_ratio()
			local upg_value = upgrade_value[(custom_value_1 or 1)]
			local bonus_per_percentage = upgrade_value[(custom_value_2 or 2)]
			local damage_health_ratio = health_threshold - CatLib:dec_round(health_ratio, 2)
			upg_value = upg_value * (1 + bonus_per_percentage * damage_health_ratio)

			if limited_increase_health_ratio then
				upg_value = math.min(upg_value, upgrade_value[(custom_value_1 or 1)] * upgrade_value[(custom_limit_value or 3)])
			end

			return upg_value or default or 0
		end
	end

	return upgrade_value[(custom_value_1 or 1)] or default or 0
end

CatLib:Success("PlayerManager")