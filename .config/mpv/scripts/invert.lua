local utils = require 'mp.utils'

local function get_script_dir()
    local script_path = debug.getinfo(1, "S").source
    if script_path:sub(1, 1) == "@" then
        script_path = script_path:sub(2)
    end
    script_path = script_path:gsub("\\", "/")
    return script_path:match("^(.+)/scripts")
end

local function file_exists(path)
    local f = io.open(path, "r")
    if f then f:close() return true end
    return false
end

local strength = {0.95}
local MAX_VALUE = 1.0
local MIN_VALUE = 0.0
local INCREMENT = 0.01

local script_dir = get_script_dir()
local template_path = script_dir .. "/shaders/invert-template.glsl"
local output_path   = script_dir .. "/shaders/generated/"

-- Function to generate the shader file with the current strength
local function update_shader()
    mp.osd_message("Invert Strength: " .. strength[1])
    local out_filename = output_path .. string.format("invert-generated-%.2f.glsl", tostring(strength[1]))
    if file_exists(out_filename) then
        mp.set_property("glsl-shaders", out_filename)
        return
    end

    local f = io.open(template_path, "r")
    mp.msg.error(template_path)
    if not f then
        mp.msg.error("Failed to open template shader")
        return
    end
    local content = f:read("*a")
    f:close()

    content = content:gsub("__STRENGTH__", tostring(strength[1]))

    local out = io.open(out_filename, "w")
    out:write(content)
    out:close()

    -- Reload the shader
    mp.set_property("glsl-shaders", out_filename)
end

local function increase(value)
    value[1] = value[1] + INCREMENT
    if value[1] > MAX_VALUE then
        value[1] = MAX_VALUE
    end
    update_shader()
end

local function decrease(value)
    value[1] = value[1] - INCREMENT 
    if value[1] < MIN_VALUE then
        value[1] = MIN_VALUE
    end
    update_shader()
end

mp.add_key_binding(nil, "invert-increase-strength", function()
    increase(strength)
end)

mp.add_key_binding(nil, "invert-decrease-strength", function()
    decrease(strength)
end)

local previous_shaders
local shader_on = false
mp.add_key_binding(nil, "invert-toggle", function()
    mp.osd_message("Invert shader " .. tostring(shader_on))
    if shader_on then
        previous_shaders = mp.get_property_native("glsl-shaders")
        mp.set_property_native("glsl-shaders", {})
    else
        if previous_shaders then
            mp.set_property_native("glsl-shaders", previous_shaders)
        else
            -- toggling shader but hasn't been updated/generated yet
            update_shader()
        end
    end
    shader_on = not shader_on
end)