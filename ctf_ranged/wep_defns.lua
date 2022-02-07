-- ctf_ranged/wep_defns.lua


--[[
   Tier 1:
   - pistol: ctf_ranged:makarov
   - DMR: ctf_ranged:mini14
   - Shotgun: ctf_ranged:remington870
   - SMG: ctf_ranged:thompson
   - Rifle: ctf_ranged:ak47
   - HMG: ctf_ranged:rpk
   Tier 2:
   - pistol: ctf_ranged:glock17
   - DMR: ctf_ranged:svd
   - Shotgun: ctf_ranged:benelli
   - SMG: ctf_ranged:uzi
   - Rifle: ctf_ranged:m16
   - HMG: ctf_ranged:m60
   Tier 3:
   - pistol: ctf_ranged:deagle
   - DMR: ctf_ranged:m200
   - Shotgun: ctf_ranged:jackhammer
   - SMG: ctf_ranged:mp5
   - Rifle: ctf_ranged:scar
   - HMG: ctf_ranged:minigun
   Energy weapons:
   - E: ctf_ranged:energy_pistol
   - E: ctf_ranged:energy_rifle
   - E: ctf_ranged:energy_shotgun

]]--


--------------------------
-- Tier 1
--------------------------

ctf_ranged.simple_register_gun("ctf_ranged:makarov", {
				  type = "pistol",
				  description = "Makarov",
				  texture = "rangedweapons_makarov.png",
				  fire_sound = "ctf_ranged_mp5fire",
				  rounds = 8,
				  range = 50,
				  damage = 3,
				  automatic = false,
				  fire_interval = 0.6,
				  liquid_travel_dist = 2
})

ctf_ranged.simple_register_gun("ctf_ranged:mini14", {
				  type = "rifle",
				  description = "Ruger Mini-14",
				  texture = "ctf_ranged_mini14.png",
				  fire_sound = "ctf_ranged_m16fire",
				  rounds = 20,
				  range = 150,
				  damage = 4,
				  fire_interval = 0.8,
				  liquid_travel_dist = 4,
})

ctf_ranged.simple_register_gun("ctf_ranged:remington870", {
				  type = "shotgun",
				  description = "Remington 870",
				  texture = "rangedweapons_remington.png",
				  fire_sound = "ctf_ranged_shotgun",
				  bullet = {
				     amount = 28,
				     spread = 3.5,
				  },
				  rounds = 7,
				  range = 24,
				  damage = 1,
				  fire_interval = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:thompson", {
				  type = "smg",
				  description = "Thompson",
				  texture = "rangedweapons_thompson.png",
				  fire_sound = "ctf_ranged_mp5fire",
				  bullet = {
				     spread = 2,
				  },
				  automatic = true,
				  rounds = 20,
				  range = 75,
				  damage = 1,
				  fire_interval = 0.1,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:ak47", {
				  type = "smg",
				  description = "AK-47",
				  texture = "rangedweapons_ak47.png",
				  fire_sound = "ctf_ranged_pdudegun",
				  bullet = {
				     spread = 1.5,
				  },
				  automatic = true,
				  rounds = 30,
				  range = 75,
				  damage = 2,
				  fire_interval = 0.15,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:rpk", {
				  type = "smg",
				  description = "RPK",
				  texture = "rangedweapons_rpk.png",
				  fire_sound = "ctf_ranged_m60fire",
				  bullet = {
				     spread = 1.5,
				  },
				  automatic = true,
				  rounds = 100,
				  range = 150,
				  damage = 2,
				  fire_interval = 0.15,
				  liquid_travel_dist = 2,
})

--------------------------
-- Tier 2
--------------------------

ctf_ranged.simple_register_gun("ctf_ranged:glock17", {
				  type = "pistol",
				  description = "Glock 17",
				  texture = "rangedweapons_glock17.png",
				  fire_sound = "ctf_ranged_mp5fire",
				  rounds = 17,
				  range = 75,
				  damage = 3,
				  automatic = false,
				  fire_interval = 0.35,
				  liquid_travel_dist = 2
})

ctf_ranged.simple_register_gun("ctf_ranged:svd", {
				  type = "rifle",
				  description = "SVD Dragunov",
				  texture = "rangedweapons_svd.png",
				  fire_sound = "ctf_ranged_m16fire",
				  rounds = 10,
				  scope_zoom=10,
				  range = 150,
				  damage = 5,
				  fire_interval = 0.75,
				  liquid_travel_dist = 4,
})


ctf_ranged.simple_register_gun("ctf_ranged:benelli", {
				  type = "shotgun",
				  description = "Benelli M4",
				  texture = "rangedweapons_benelli.png",
				  fire_sound = "ctf_ranged_shotgun",
				  bullet = {
				     amount = 20,
				     spread = 2.5,
				  },
				  rounds = 8,
				  range = 24,
				  damage = 2,
				  fire_interval = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:uzi", {
				  type = "smg",
				  description = "Uzi",
				  texture = "rangedweapons_uzi.png",
				  fire_sound = "ctf_ranged_mp5fire",
				  bullet = {
				     spread = 2,
				  },
				  automatic = true,
				  rounds = 30,
				  range = 75,
				  damage = 2,
				  fire_interval = 0.08,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:m16", {
				  type = "smg",
				  description = "M-16",
				  texture = "rangedweapons_m16.png",
				  fire_sound = "ctf_ranged_pdudegun",
				  bullet = {
				     spread = 1.3,
				  },
				  automatic = true,
				  rounds = 30,
				  range = 100,
				  damage = 2,
				  fire_interval = 0.15,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:m60", {
				  type = "smg",
				  description = "M60",
				  texture = "rangedweapons_m60.png",
				  fire_sound = "ctf_ranged_m60fire",
				  bullet = {
				     spread = 1.3,
				  },
				  automatic = true,
				  rounds = 150,
				  range = 150,
				  damage = 2,
				  fire_interval = 0.15,
				  liquid_travel_dist = 2,
})

--------------------------
-- Tier 3
--------------------------

ctf_ranged.simple_register_gun("ctf_ranged:deagle", {
				  type = "pistol",
				  description = "IMI Desert Eagle",
				  texture = "rangedweapons_deagle.png",
				  fire_sound = "ctf_ranged_deagle",
				  rounds = 8,
				  range = 75,
				  damage = 5,
				  automatic = false,
				  fire_interval = 0.5,
				  liquid_travel_dist = 2
})

ctf_ranged.simple_register_gun("ctf_ranged:m200", {
				  type = "rifle",
				  description = "CheyTac Intervention",
				  texture = "rangedweapons_m200.png",
				  fire_sound = "ctf_ranged_m16fire",
				  rounds = 5,
				  scope_zoom=10,
				  range = 200,
				  damage = 15,
				  fire_interval = 2.0,
				  liquid_travel_dist = 4,
})

ctf_ranged.simple_register_gun("ctf_ranged:jackhammer", {
				  type = "shotgun",
				  description = "Pancor Jackhammer",
				  texture = "rangedweapons_jackhammer.png",
				  fire_sound = "ctf_ranged_shotgun",
				  bullet = {
				     amount = 20,
				     spread = 2.5,
				  },
				  automatic = true,
				  rounds = 10,
				  range = 24,
				  damage = 2,
				  fire_interval = 0.5,
})

ctf_ranged.simple_register_gun("ctf_ranged:mp5", {
				  type = "smg",
				  description = "HK MP5",
				  texture = "rangedweapons_mp5.png",
				  fire_sound = "ctf_ranged_mp5fire",
				  bullet = {
				     spread = 2,
				  },
				  automatic = true,
				  rounds = 30,
				  range = 100,
				  damage = 3,
				  fire_interval = 0.08,
				  liquid_travel_dist = 25,
})

ctf_ranged.simple_register_gun("ctf_ranged:scar", {
				  type = "smg",
				  description = "FN SCAR-H",
				  texture = "rangedweapons_scar.png",
				  fire_sound = "ctf_ranged_pdudegun",
				  bullet = {
				     spread = 1.0,
				  },
				  automatic = true,
				  rounds = 20,
				  range = 150,
				  damage = 6,
				  fire_interval = 0.2,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:minigun", {
				  type = "smg",
				  description = "",
				  texture = "rangedweapons_minigun.png",
				  fire_sound = "ctf_ranged_m60fire",
				  bullet = {
				     spread = 2.25,
				  },
				  automatic = true,
				  rounds = 200,
				  range = 150,
				  damage = 4,
				  fire_interval = 0.08,
				  liquid_travel_dist = 2,
})



--------------------------
-- Other guns
--------------------------

ctf_ranged.simple_register_gun("ctf_ranged:python", {
				  type = "pistol",
				  description = "Colt Python",
				  texture = "rangedweapons_python.png",
				  fire_sound = "ctf_ranged_mk23fire",
				  bullet = {
				     spread = 1.5,
				  },
				  automatic = false,
				  rounds = 6,
				  range = 100,
				  damage = 5,
				  fire_interval = 0.8,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:g11", {
				  type = "smg",
				  description = "HK G11",
				  texture = "rangedweapons_g11.png",
				  fire_sound = "ctf_ranged_mk23fire",
				  bullet = {
				     spread = 1.25,
				     amount = 3
				  },
				  scope_zoom=10,
				  automatic = false,
				  rounds = 16,
				  range = 150,
				  damage = 5,
				  fire_interval = 0.5,
				  liquid_travel_dist = 2,
})

ctf_ranged.simple_register_gun("ctf_ranged:deagle_gold", {
				  type = "pistol",
				  description = "IMI Desert Eagle",
				  texture = "rangedweapons_golden_deagle.png",
				  fire_sound = "ctf_ranged_deagle",
				  rounds = 8,
				  range = 75,
				  damage = 5,
				  automatic = false,
				  fire_interval = 0.5,
				  liquid_travel_dist = 2
})




function launch_grenade(user)
   grenades.throw_grenade("grenades:frag", 30, user)
end

ctf_ranged.simple_register_gun("ctf_ranged:m79", {
				  type = "pistol",
				  description = "M79",
				  texture = "rangedweapons_m79.png",
				  fire_sound = "ctf_ranged_ashotfir",
				  ammo="ctf_ranged:40mm",
				  rounds = 2,
				  range = 50,
				  damage = 3,
				  automatic = false,
				  fire_interval = 1.5,
				  liquid_travel_dist = 2,
				  on_fire_callback=launch_grenade
})

--------------------------
-- Energy weapons
--------------------------

ctf_ranged.simple_register_gun("ctf_ranged:energy_pistol", {
	type = "pistol",
	description = "Laser Blaster",
	texture = "rangedweapons_laser_blaster.png",
	fire_sound = "ctf_ranged_dzap",
	rounds = 20,
	range = 85,
	damage = 4,
	automatic = false,
	fire_interval = 0.35,
	liquid_travel_dist = 2,
	ammo = "ctf_ranged:eammo"
})

ctf_ranged.simple_register_gun("ctf_ranged:energy_rifle", {
	type = "smg",
	description = "Laser Rifle",
	texture = "rangedweapons_laser_rifle.png",
	fire_sound = "ctf_ranged_dzap",
	bullet = {
	   spread = 1.0,
	},
	automatic = true,
	rounds = 30,
	range = 75,
	damage = 7,
	fire_interval = 0.25,
	liquid_travel_dist = 2,
	ammo = "ctf_ranged:eammo"
})

ctf_ranged.simple_register_gun("ctf_ranged:energy_shotgun", {
	type = "shotgun",
	description = "Laser Shotgun",
	texture = "rangedweapons_laser_shotgun.png",
	fire_sound = "ctf_ranged_plasma",
	bullet = {
	   amount = 10,
	   spread = 3.0,
	},
	rounds = 10,
	range = 25,
	damage = 2,
	fire_interval = 0.65,
	automatic = false,
	ammo = "ctf_ranged:eammo"
})
