Hooks:PreHook(PlayerDamage, "damage_melee", "CatLibAddRawDamageData&Msg", function(self, attack_data)
	attack_data.raw_damage = attack_data.damage
end)

Hooks:PreHook(PlayerDamage, "damage_explosion", "CatLibAddRawDamageDataExp", function(self, attack_data)
	attack_data.raw_damage = attack_data.damage
end)

Hooks:PreHook(PlayerDamage, "damage_bullet", "CatLibAddRawDamageDataBullet", function(self, attack_data)
	attack_data.raw_damage = attack_data.damage
end)

Hooks:PreHook(PlayerDamage, "damage_fire_hit", "CatLibAddRawDamageDataFire", function(self, attack_data)
	attack_data.raw_damage = attack_data.damage
end)

CatLib:Success("PlayerDamage")