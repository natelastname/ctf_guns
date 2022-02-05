ctf_ranged.settings = {}
local settings = ctf_ranged.settings

--[[
    Settings via `minetest.conf`
    Includes if it doesn't exist then make it exist
]]

-- Crafting
settings.craft_gunparts = minetest.settings:get_bool("ctf_guns.craft_gunparts")
if settings.craft_gunparts == nil then
    settings.craft_gunparts = true
    -- Allow it to be changed in 1 spot
    minetest.settings:set_bool("ctf_guns.craft_gunparts", settings.craft_gunparts)
end

settings.craft_ammo = minetest.settings:get_bool("ctf_guns.craft_ammo")
if settings.craft_ammo == nil then
    settings.craft_ammo = true
    minetest.settings:set_bool("ctf_guns.craft_ammo", settings.craft_ammo)
end

settings.craft_tier1_weapons = minetest.settings:get_bool("ctf_guns.craft_tier1_weapons")
if settings.craft_tier1_weapons == nil then
    settings.craft_tier1_weapons = true
    minetest.settings:set_bool("ctf_guns.craft_tier1_weapons", settings.craft_tier1_weapons)
end

settings.craft_tier2_weapons = minetest.settings:get_bool("ctf_guns.craft_tier2_weapons")
if settings.craft_tier2_weapons == nil then
    settings.craft_tier2_weapons = true
    minetest.settings:set_bool("ctf_guns.craft_tier2_weapons", settings.craft_tier2_weapons)
end

settings.craft_tier3_weapons = minetest.settings:get_bool("ctf_guns.craft_tier3_weapons")
if settings.craft_tier3_weapons == nil then
    settings.craft_tier3_weapons = true
    minetest.settings:set_bool("ctf_guns.craft_tier3_weapons", settings.craft_tier3_weapons)
end

settings.craft_energy_weapons = minetest.settings:get_bool("ctf_guns.craft_energy_weapons")
if settings.craft_energy_weapons == nil then
    settings.craft_energy_weapons = true
    minetest.settings:set_bool("ctf_guns.craft_energy_weapons", settings.craft_energy_weapons)
end
