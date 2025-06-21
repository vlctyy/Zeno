-- zeno_flags.lua
local ZenoFlags = {}
ZenoFlags.Flags = {}

function ZenoFlags:SetFlag(key, value)
    self.Flags[key] = value
    print("[ZENO] SetFlag:", key, "->", tostring(value))
end

function ZenoFlags:GetFlag(key)
    return self.Flags[key]
end

return ZenoFlags
