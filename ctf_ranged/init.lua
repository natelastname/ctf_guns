-- ctf_ranged/init.lua

local modpath = minetest.get_modpath("ctf_ranged")

ctf_ranged = {}

dofile(modpath.."/settings.lua")
dofile(modpath.."/wep_logic.lua")
dofile(modpath.."/wep_defns.lua")
dofile(modpath.."/wep_recipes.lua")
dofile(modpath.."/custom_controls.lua")
dofile(modpath.."/energy_gen.lua")
