function CatLib:NewMessageReceived()
    local msg_id = CatLib:GetCustomMessages()
    local num = CatLib:AddNum()
    for _, id in pairs(msg_id) do
        Message[id] = num
    end
end

CatLib:Success("Messages")