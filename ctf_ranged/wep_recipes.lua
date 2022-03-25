-- ctf_ranged/wep_recipes.lua

--[[
   basic_materials:gear_steel

   Steel gear + copper ingot = tier 1 pistol
   Steel gear + silver ingot = tier 1 rifle
   Steel gear + steel ingot = tier 1 SMG
   Steel gear + gold ingot = tier 1 shotgun
   Steel gear + brass ingot = tier 1 DMR
   Steel gear + mese frag = tier 1 HMG

   [Tier 1 Part] + [resource block] = Tier 2 part

   [Tier 2 part] + [Crystal, Gemstones gem, nether ingot] = Tier 3 Part

]]--

local gear_steel = "basic_materials:gear_steel"
local steel_ingot = "default:steel_ingot"
local steelblock = "default:steelblock"
local gold_ingot = "default:gold_ingot"
local goldblock = "default:goldblock"
local diamondblock = "default:diamondblock"
local brass_ingot = "basic_materials:brass_ingot"
local mese_crystal = "default:mese_crystal"
local gravel = "default:gravel"
local gunpowder = "tnt:gunpowder"
local diamond = "default:diamond"
local tin_ingot = "default:tin_ingot"
local bronze_ingot = "default:bronze_ingot"
local copper = "default:copper_ingot"
local silver = "moreores:silver_ingot"

if minetest.get_modpath("mcl_core") ~= nil then
	steel_ingot = "mcl_core:iron_ingot"
	steelblock = "mcl_core:ironblock"
	gold_ingot = "mcl_core:gold_ingot"
	goldblock = "mcl_core:goldblock"
	diamondblock = "mcl_core:diamondblock"
	brass_ingot = gold_ingot -- Use a gold ingot instead (Warning, don't use this in multiple recipes which also could take gold)
	mese_crystal = "mcl_core:diamond" -- Use a diamond instead (Warning, don't use this in multiple recipes which could also take diamond)
	diamond = "mcl_core:diamond"
	gear_steel = "xpanes:bar_flat" -- Use a iron bar instead
	gravel = "mcl_core:gravel"
	gunpowder = "mcl_mobitems:gunpowder"
	tin_ingot = steelblock
	bronze_ingot = goldblock
	-- If mcl_copper is installed it could be MCL5 or MCL2 + mcl_copper mod
	if minetest.get_modpath("mcl_copper") ~= nil then
		copper = "mcl_copper:copper_ingot"
	else
		copper = gear_steel
	end
	silver = "mcl_mobitems:magma_cream" -- Use Magma Cream instead
end

minetest.register_craftitem("ctf_ranged:40mm", {
			       description = "40mm Grenade",
			       inventory_image = "rangedweapons_40mm.png",
})

minetest.register_craftitem("ctf_ranged:ammo", {
			       description = "Ammo",
			       inventory_image = "ctf_ranged_ammo.png",
})

minetest.register_craftitem("ctf_ranged:gunpart1", {
				description = "Tier 1 gun part",
				inventory_image = "rangedweapons_gunpart1.png"
})
minetest.register_craftitem("ctf_ranged:gunpart2", {
				description = "Tier 2 gun part",
				inventory_image = "rangedweapons_gunpart2.png"
})
minetest.register_craftitem("ctf_ranged:gunpart3", {
				description = "Tier 3 gun part",
				inventory_image = "rangedweapons_gunpart3.png"
})
minetest.register_craftitem("ctf_ranged:gunparte", {
	description = "Energy gun part",
	inventory_image = "rangedweapons_gun_power_core.png"
})

-------------------------------
-- Basics
-------------------------------

if ctf_ranged.settings.craft_ammo == true then
   if minetest.get_modpath("mcl_mobitems") ~= nil then
		minetest.register_craft({
			output = "ctf_ranged:ammo",
			type = "shapeless",
			recipe = {
			brass_ingot,
			"mcl_mobitems:slimeball"
			}
		})
		minetest.register_craft({
			output = "ctf_ranged:40mm",
			type = "shapeless",
			recipe = {
			brass_ingot,
			"mcl_mobitems:ghast_tear"
			}
		})
   else
		if(minetest.get_modpath("mobs_mc")) ~= nil then
			minetest.register_craft({
				output = "ctf_ranged:ammo",
				type = "shapeless",
				recipe = {
				brass_ingot,
				"mobs_mc:slimeball" -- Could use mcl_mobitems:slimeball
				}
			})
			minetest.register_craft({
				output = "ctf_ranged:40mm",
				type = "shapeless",
				recipe = {
				brass_ingot,
				"mobs_mc:ghast_tear" -- Could use mcl_mobitems:ghast_tear
				}
			})
		else
			minetest.register_craft({
				output = "ctf_ranged:ammo",
				type = "shapeless",
				recipe = {
				brass_ingot,
				gravel
				}
			})
			minetest.register_craft({
				output = "ctf_ranged:40mm",
				type = "shapeless",
				recipe = {
				brass_ingot,
				gunpowder
				}
			})
		end
   end
   if ctf_ranged.settings.craft_energy_weapons == true then
      minetest.register_craft({
	    output = "ctf_ranged:eammo",
	    type = "shapeless",
	    recipe = {
	       "ctf_ranged:echarge",
	       "ctf_ranged:echarge",
	       "ctf_ranged:echarge",
	       "ctf_ranged:echarge"
	    }
      })
   end
end

if ctf_ranged.settings.craft_gunparts == true then
	minetest.register_craft({
		output = "ctf_ranged:gunpart1",
		type = "shapeless",
		recipe = {
		gear_steel,
		steelblock
		}
	})
	minetest.register_craft({
		output = "ctf_ranged:gunpart2",
		recipe = {
		{"", "", ""},
		{goldblock, "ctf_ranged:gunpart1", goldblock},
		{"", "", ""},
		}
	})
	minetest.register_craft({
		output = "ctf_ranged:gunpart3",
		recipe = {
		{"", "", ""},
		{diamondblock, "ctf_ranged:gunpart2", diamondblock},
		{"", "", ""},
		}
	})
	if ctf_ranged.settings.craft_energy_weapons == true then
		minetest.register_craft({
			output = "ctf_ranged:gunparte",
			type = "shapeless",
			recipe = {
				diamondblock,
				diamondblock,
				gear_steel
			}
		})
	end
end

-------------------------------
-- Guns
-------------------------------


--------------------------------- Tier 1
if ctf_ranged.settings.craft_tier1_weapons == true then
	minetest.register_craft({output = "ctf_ranged:makarov", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1",steel_ingot}})

	minetest.register_craft({output = "ctf_ranged:mini14", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1",gold_ingot}})

	minetest.register_craft({output = "ctf_ranged:remington870", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1",tin_ingot}})

	minetest.register_craft({output = "ctf_ranged:thompson", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1",silver}})

	minetest.register_craft({output = "ctf_ranged:ak47", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1",copper}})

	minetest.register_craft({output = "ctf_ranged:rpk", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1",bronze_ingot}})
end

--------------------------------- Tier 2

if ctf_ranged.settings.craft_tier2_weapons == true then
	minetest.register_craft({output = "ctf_ranged:glock17", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2",steel_ingot}})

	minetest.register_craft({output = "ctf_ranged:svd", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2",gold_ingot}})

	minetest.register_craft({output = "ctf_ranged:benelli", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2",tin_ingot}})

	minetest.register_craft({output = "ctf_ranged:uzi", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2",silver}})

	minetest.register_craft({output = "ctf_ranged:m16", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2",copper}})

	minetest.register_craft({output = "ctf_ranged:m60", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2",bronze_ingot}})
end

--------------------------------- Tier 3

if ctf_ranged.settings.craft_tier3_weapons == true then
	minetest.register_craft({output = "ctf_ranged:deagle", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3",steel_ingot}})

	minetest.register_craft({output = "ctf_ranged:m200", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3",gold_ingot}})

	minetest.register_craft({output = "ctf_ranged:jackhammer", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3",tin_ingot}})

	minetest.register_craft({output = "ctf_ranged:mp5", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3",silver}})

	minetest.register_craft({output = "ctf_ranged:scar", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3",copper}})

	minetest.register_craft({output = "ctf_ranged:minigun", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3",bronze_ingot}})
end

if ctf_ranged.settings.craft_energy_weapons == true then
	minetest.register_craft({output = "ctf_ranged:energy_rifle", type = "shapeless",
				recipe = {"ctf_ranged:gunparte", "ctf_ranged:gunpart3", diamond}})
	minetest.register_craft({output = "ctf_ranged:energy_shotgun", type = "shapeless",
				recipe = {"ctf_ranged:gunparte", "ctf_ranged:gunpart2", diamond}})
	minetest.register_craft({output = "ctf_ranged:energy_pistol", type = "shapeless",
				recipe = {"ctf_ranged:gunparte", "ctf_ranged:gunpart1", diamond}})
end
