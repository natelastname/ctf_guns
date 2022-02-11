
local shoot_cooldown = ctf_core.init_cooldowns()


minetest.register_craftitem("ctf_ranged:eammo", {
	description = "Energy Ammo",
	inventory_image = "ctf_ranged_eammo.png",
})
minetest.register_craftitem("ctf_ranged:echarge", {
	description = "Energy Charge",
	inventory_image = "ctf_ranged_echarge.png",
})

local function process_ray(ray, user, look_dir, def)
   local hitpoint = ray:hit_object_or_node({
	 node = function(ndef)
	    return (ndef.walkable == true and ndef.pointable == true) or ndef.groups.liquid
	 end,
	 object = function(obj)
	    -- Instead of only doing damage to players, do damage to any object that can be punched.
	    return obj.punch ~= nil and obj ~= user
	 end
   })

   if hitpoint then
      if hitpoint.type == "node" then
	 local nodedef = minetest.registered_nodes[minetest.get_node(hitpoint.under).name]

	 if nodedef.groups.snappy or (nodedef.groups.oddly_breakable_by_hand or 0) >= 3 then
	    if not minetest.is_protected(hitpoint.under, user:get_player_name()) then
	       minetest.dig_node(hitpoint.under)
	    end
	 else
	    if nodedef.walkable and nodedef.pointable then
			local bullethole = def.bullethole_image or "ctf_ranged_bullethole"
	       minetest.add_particle({
		     pos = vector.subtract(hitpoint.intersection_point, vector.multiply(look_dir, 0.04)),
		     velocity = vector.new(),
		     acceleration = {x=0, y=0, z=0},
		     expirationtime = def.bullethole_lifetime or 3,
		     size = 1,
		     collisiondetection = false,
		     texture = bullethole..".png",
	       })
	    elseif nodedef.groups.liquid then
	       minetest.add_particlespawner({
		     amount = 10,
		     time = 0.1,
		     minpos = hitpoint.intersection_point,
		     maxpos = hitpoint.intersection_point,
		     minvel = {x=look_dir.x * 3, y=4, z=-look_dir.z * 3},
		     maxvel = {x=look_dir.x * 4, y=6, z= look_dir.z * 4},
		     minacc = {x=0, y=-10, z=0},
		     maxacc = {x=0, y=-13, z=0},
		     minexptime = 1,
		     maxexptime = 1,
		     minsize = 0,
		     maxsize = 0,
		     collisiondetection = false,
		     glow = 3,
		     node = {name = nodedef.name},
	       })

	       if def.liquid_travel_dist then
		  -- Disabled due to a stack overflow when shooting quick sand
		  --[[
		  process_ray(rawf.bulletcast(
				 def.bullet, hitpoint.intersection_point,
				 vector.add(hitpoint.intersection_point, vector.multiply(look_dir, def.liquid_travel_dist)), true, false
					     ), user, look_dir, def)
		  --]]
	       end
	    end
	 end
      elseif hitpoint.type == "object" then
	 hitpoint.ref:punch(user, 1, {
			       full_punch_interval = 1,
			       damage_groups = {ranged = 1, [def.type] = 1, fleshy = def.damage}
				     }, look_dir)
      end
   end
end

-- Can be overridden for custom behaviour
function ctf_ranged.can_use_gun(player, name)
   return true
end

local function cartridge_particles(player)
   local up = {x=0, y=1, z=0}
   local eye_offset = {x=0, y=1.625, z=0}
   local p_vel = player:get_velocity()
   local p = player:get_pos()
   if p_vel == nil or p == nil then
      return
   end
   local shell_v = {x=-1,y=0, z=0}
   local lookdir = player:get_look_dir()
   local right = vector.normalize(vector.cross(lookdir, up)) * -1
   --local front = eye_offset + p + lookdir
   minetest.add_particle({
	 pos = p + vector.new({x=0,y=1.3,z=0}) + (lookdir*0.2) + (right*0.4),
	 velocity = right*5,
	 --velocity = vector.new({x=0,y=0,z=0}),
	 acceleration = vector.new({x=0, y=-2, z=0}),
	 --acceleration = vector.new({x=0,y=0,z=0}),
	 expirationtime = 0.4,
	 size = 5,
	 collisiondetection = false,
	 vertical = true,
	 texture = "rangedweapons_shelldrop.png",
	 glow = 15,
   })
end

function ctf_ranged.simple_register_gun(name, def)
   minetest.register_tool(rawf.also_register_loaded_tool(name, {
							    description = def.description,
							    ctf_guns_scope_zoom = def.scope_zoom or nil,
							    inventory_image = def.texture.."^[colorize:#F44:42",
							    ammo = def.ammo or "ctf_ranged:ammo",
								bullet_image = def.bullet_image,
								bullethole_image = def.bullethole_image,
							    rounds = def.rounds,
							    _g_category = def.type,
							    groups = {ranged = 1, [def.type] = 1, tier = def.tier or 1, not_in_creative_inventory = nil},
							    on_use = function(itemstack, user)
							       if not ctf_ranged.can_use_gun(user, name) then
								  minetest.sound_play("ctf_ranged_click", {pos = user:get_pos()}, true)
								  return
							       end

							       local result = rawf.load_weapon(itemstack, user:get_inventory())

							       if result:get_name() == itemstack:get_name() then
								  minetest.sound_play("ctf_ranged_click", {pos = user:get_pos()}, true)
							       else
								  minetest.sound_play("ctf_ranged_reload", {pos = user:get_pos()}, true)
							       end

							       return result
							    end,
							       },
							 function(loaded_def)
							    loaded_def.description = def.description.." (Loaded)"
							    loaded_def.inventory_image = def.texture
							    loaded_def.inventory_overlay = def.texture_overlay
							    loaded_def.wield_image = def.wield_texture or def.texture
							    loaded_def.groups.not_in_creative_inventory = 1
								loaded_def.bullet_image = def.bullet_image
								loaded_def.bullethole_image = def.bullethole_image
							    loaded_def.on_use = function(itemstack, user)
							       if not ctf_ranged.can_use_gun(user, name) then
								  minetest.sound_play("ctf_ranged_click", {pos = user:get_pos()}, true)
								  return
							       end

							       if shoot_cooldown:get(user) then
								  return
							       end
							       -- Maybe it is not a good idea to network so many particles.
							       -- Could be worth benchmarking the performance effects.
							       --cartridge_particles(user)
							       if def.automatic then
								  if not rawf.enable_automatic(def.fire_interval, itemstack, user) then
								     return
								  end
							       else
								  shoot_cooldown:set(user, def.fire_interval)
							       end

							       if def.on_fire_callback then
								  def.on_fire_callback(user, def)
								  minetest.sound_play(def.fire_sound, {pos = user:get_pos()}, true)
								  if def.rounds > 0 then
								     return rawf.unload_weapon(itemstack)
								  end
								  return
							       end

							       local spawnpos, look_dir = rawf.get_bullet_start_data(user)
							       local endpos = vector.add(spawnpos, vector.multiply(look_dir, def.range))
							       local rays

								   local bullet_img = def.bullet_image or "ctf_ranged_bullet"

							       if type(def.bullet) == "table" then
								  def.bullet.texture = bullet_img..".png"
							       else
								  def.bullet = {texture = bullet_img..".png"}
							       end

							       if not def.bullet.spread then
								  rays = {rawf.bulletcast(
									     def.bullet,
									     spawnpos, endpos, true, true
								  )}
							       else
								  rays = rawf.spread_bulletcast(def.bullet, spawnpos, endpos, true, true)
							       end

							       minetest.sound_play(def.fire_sound, {pos = user:get_pos()}, true)

							       for _, ray in pairs(rays) do
								  process_ray(ray, user, look_dir, def)
							       end

							       if def.rounds > 0 then
								  return rawf.unload_weapon(itemstack)
							       end
							    end
							    if def.rightclick_func then
							       loaded_def.on_place = function(itemstack, user, pointed, ...)
								  local pointed_def = false
								  local node

								  if pointed and pointed.under then
								     node = minetest.get_node(pointed.under)
								     pointed_def = minetest.registered_nodes[node.name]
								  end

								  if pointed_def and pointed_def.on_rightclick then
								     return minetest.item_place(itemstack, user, pointed)
								  else
								     return def.rightclick_func(itemstack, user, pointed, ...)
								  end
							       end

							       loaded_def.on_secondary_use = def.rightclick_func
							    end
   end))
end
