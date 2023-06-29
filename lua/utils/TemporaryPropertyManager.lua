TemporaryPropertyManager = TemporaryPropertyManager or class()
function TemporaryPropertyManager:add_time(prop, time)
	if self:has_active_property(prop) then
		self._properties[prop][2] = self._properties[prop][2] + time
	end
end

function TemporaryPropertyManager:get_time(prop)
	if self:has_active_property(prop) then
		return self._properties[prop][2] - Application:time()
	end
end

CatLib:Success("TemporaryPropertyManager")