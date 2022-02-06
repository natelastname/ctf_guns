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
   if(minetest.get_modpath("mobs_mc")) ~= nil then
      minetest.register_craft({
	    output = "ctf_ranged:ammo",
	    type = "shapeless",
	    recipe = {
	       "basic_materials:brass_ingot",
	       "mobs_mc:slimeball"
	    }
      })
      minetest.register_craft({
	    output = "ctf_ranged:40mm",
	    type = "shapeless",
	    recipe = {
	       "basic_materials:brass_ingot",
	       "mobs_mc:ghast_tear"
	    }
      })
   else
      minetest.register_craft({
	    output = "ctf_ranged:ammo",
	    type = "shapeless",
	    recipe = {
	       "basic_materials:brass_ingot",
	       "default:gravel"
	    }
      })
      minetest.register_craft({
	    output = "ctf_ranged:40mm",
	    type = "shapeless",
	    recipe = {
	       "basic_materials:brass_ingot",
	       "tnt:gunpowder"
	    }
      })
   end
   if(minetest.get_modpath("mobs_mc")) ~= nil then
      minetest.register_craft({
	    output = "ctf_ranged:ammo",
	    type = "shapeless",
	    recipe = {
	       "basic_materials:brass_ingot",
	       "mobs_mc:slimeball"
	    }
      })
   else
      minetest.register_craft({
	    output = "ctf_ranged:ammo",
	    type = "shapeless",
	    recipe = {
	       "basic_materials:brass_ingot",
	       "default:gravel"
	    }
      })
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
		"basic_materials:gear_steel",
		"default:steelblock"
		}
	})
	minetest.register_craft({
		output = "ctf_ranged:gunpart2",
		recipe = {
		{"", "", ""},
		{"default:goldblock", "ctf_ranged:gunpart1", "default:goldblock"},
		{"", "", ""},
		}
	})
	minetest.register_craft({
		output = "ctf_ranged:gunpart3",
		recipe = {
		{"", "", ""},
		{"default:diamondblock", "ctf_ranged:gunpart2", "default:diamondblock"},
		{"", "", ""},
		}
	})
	if ctf_ranged.settings.craft_energy_weapons == true then
		minetest.register_craft({
			output = "ctf_ranged:gunparte",
			type = "shapeless",
			recipe = {
				"default:diamondblock",
				"default:diamondblock",
				"basic_materials:gear_steel"
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
				recipe = {"ctf_ranged:gunpart1","default:steel_ingot"}})

	minetest.register_craft({output = "ctf_ranged:mini14", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1","default:gold_ingot"}})

	minetest.register_craft({output = "ctf_ranged:remington870", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1","default:tin_ingot"}})

	minetest.register_craft({output = "ctf_ranged:thompson", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1","moreores:silver_ingot"}})

	minetest.register_craft({output = "ctf_ranged:ak47", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1","default:copper_ingot"}})

	minetest.register_craft({output = "ctf_ranged:rpk", type = "shapeless",
				recipe = {"ctf_ranged:gunpart1","default:bronze_ingot"}})
end

--------------------------------- Tier 2

if ctf_ranged.settings.craft_tier2_weapons == true then
	minetest.register_craft({output = "ctf_ranged:glock17", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2","default:steel_ingot"}})

	minetest.register_craft({output = "ctf_ranged:svd", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2","default:gold_ingot"}})

	minetest.register_craft({output = "ctf_ranged:benelli", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2","default:tin_ingot"}})

	minetest.register_craft({output = "ctf_ranged:uzi", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2","moreores:silver_ingot"}})

	minetest.register_craft({output = "ctf_ranged:m16", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2","default:copper_ingot"}})

	minetest.register_craft({output = "ctf_ranged:m60", type = "shapeless",
				recipe = {"ctf_ranged:gunpart2","default:bronze_ingot"}})
end

--------------------------------- Tier 3

if ctf_ranged.settings.craft_tier3_weapons == true then
	minetest.register_craft({output = "ctf_ranged:deagle", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3","default:steel_ingot"}})

	minetest.register_craft({output = "ctf_ranged:m200", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3","default:gold_ingot"}})

	minetest.register_craft({output = "ctf_ranged:jackhammer", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3","default:tin_ingot"}})

	minetest.register_craft({output = "ctf_ranged:mp5", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3","moreores:silver_ingot"}})

	minetest.register_craft({output = "ctf_ranged:scar", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3","default:copper_ingot"}})

	minetest.register_craft({output = "ctf_ranged:minigun", type = "shapeless",
				recipe = {"ctf_ranged:gunpart3","default:bronze_ingot"}})
end

if ctf_ranged.settings.craft_energy_weapons == true then
	minetest.register_craft({output = "ctf_ranged:energy_rifle", type = "shapeless",
				recipe = {"ctf_ranged:gunparte", "ctf_ranged:gunpart3", "default:diamond"}})
	minetest.register_craft({output = "ctf_ranged:energy_shotgun", type = "shapeless",
				recipe = {"ctf_ranged:gunparte", "ctf_ranged:gunpart2", "default:diamond"}})
	minetest.register_craft({output = "ctf_ranged:energy_pistol", type = "shapeless",
				recipe = {"ctf_ranged:gunparte", "ctf_ranged:gunpart1", "default:diamond"}})
end
