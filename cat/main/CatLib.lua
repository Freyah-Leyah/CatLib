_G.CatLib = _G.CatLib or {}

CatLib._new_messages_catlib = CatLib._new_messages_catlib or {}
CatLib._num_catlib = CatLib._num_catlib or 60
CatLib._parts = CatLib._parts or {}

function CatLib:AddNewMessage(id)
    require("lib/utils/Messages")

    for _, message in ipairs(CatLib._new_messages_catlib) do
        if message == id then
            return
        end
    end

    table.insert(CatLib._new_messages_catlib, id)
    CatLib:NewMessageReceived()
end

function CatLib:AddNum()
    CatLib._num_catlib = CatLib._num_catlib + 1
    return CatLib._num_catlib
end

function CatLib:GetCustomMessages()
    return CatLib._new_messages_catlib
end

function CatLib:Success(part)
    if part then
        log("[CatLib] " ..tostring(part).. " Successfully Initialized!")
    elseif not part then
        log("[CatLib] Successfully Initialized!")
    end
end

CatLib:Success()
-- meow --