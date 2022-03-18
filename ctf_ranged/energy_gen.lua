
local side = "rangedweapons_generator_side.png"

minetest.register_node("ctf_ranged:energy_gen", {
    short_description = "Energy Generator",
    description = "Energy Generator\nPunch to collect Energy Charges",
    tiles = {
        "rangedweapons_generator_top.png",    -- y+
        "rangedweapons_generator_bottom.png",  -- y-
        side, -- x+
        side,  -- x-
        side,  -- z+
        side, -- z-
    },
    is_ground_content = false,
    groups = {cracky = 3, oddly_breakable_by_hand = 3},
    drop = "ctf_ranged:energy_gen",
    on_construct = function (pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("infotext", "Energy Generator")
        meta:set_string("formspec", "")
        local inv = meta:get_inventory()
        inv:set_size("main", 1)
        local timer = minetest.get_node_timer(pos)
        timer:start(3.0)
    end,
    on_timer = function (pos, elapsed)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()

        if inv:room_for_item("main", "ctf_ranged:echarge") then
            inv:add_item("main", ItemStack("ctf_ranged:echarge 1"))
        end

        local size = 0
        if inv:contains_item("main", "ctf_ranged:echarge") then
            local s = inv:remove_item("main", "ctf_ranged:echarge 99")
            if s then
                size = s:get_count()
                --minetest.log("action", "[ctf_ranged] "..s:get_name().." "..tostring(s:get_count()))
                inv:add_item("main", ItemStack(s:get_name().." "..tostring(s:get_count())))
            end
        end

        if size ~= 0 then
            meta:set_string("infotext", "Energy Generator ("..tostring(size)..")")
        else
            meta:set_string("infotext", "Energy Generator")
        end

        return true
    end,
    on_punch = function (pos, node, puncher, pointed_thing)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()

        local size = 0

        if inv:contains_item("main", "ctf_ranged:echarge") then
            local s = inv:remove_item("main", "ctf_ranged:echarge 99")
            if s then
                size = s:get_count()
            end
        end

        if size ~= 0 then
            meta:set_string("infotext", "Energy Generator ("..tostring(size)..")")
        else
            meta:set_string("infotext", "Energy Generator")
        end

        if size ~= 0 then
            local pinv = puncher:get_inventory()
            pinv:add_item("main", ItemStack("ctf_ranged:echarge "..tostring(size)))
        end
    end
})

if ctf_ranged.settings.craft_energy_weapons == true then
    minetest.register_craft({
        output = "ctf_ranged:energy_gen",
        recipe = {
            {"", "default:diamond", ""},
            {"default:diamond", "", "default:diamond"},
            {"ctf_ranged:gunparte", "default:diamond", "ctf_ranged:gunparte"}
        }
    })
end

-- Fusion Globalstep (Does reloading of loaded fusion energy weapons)
local fusion_interval = 0.0
minetest.register_globalstep(function (delta)
    fusion_interval = fusion_interval - delta
    if fusion_interval <= 0.0 then
        for _, player in ipairs(minetest.get_connected_players()) do
            local pname = player:get_player_name()
            local pinv = player:get_inventory()
            -- Only process if a player has any of the 3 fusion energy weapons
            if pinv:contains_item("ctf_ranged:fusion_pistol_loaded") or pinv:contains_item("ctf_ranged:fusion_rifle_loaded") or pinv:contains_item("ctf_ranged:fusion_shotgun_loaded") then
                -- Iterate main inventory
                for i, stack in pairs(pinv:get_list("main")) do
                    -- Only work on stuff not empty things
                    if not stack:is_empty() then
                        local name = stack:get_name()
                        -- Only trigger on any of the fusion weapons
                        if name:sub(1,17) == "ctf_ranged:fusion" then
                            -- Only trigger on damaged items
                            if stack:get_wear() ~= 0 then
                                -- Add reverse wear and update the stack (optional do debug)
                                stack:add_wear( -ctf_ranged.settings.fusion_reload_speed )
                                pinv:set_stack("main", i, stack)
                                if minetest.settings:get_bool("show_debug") == true then -- Come up with a better setting to use and replace this one
                                    -- Debug info (With example of what it could look like in logs, debug.txt)
                                    -- [ctf_ranged] 'ctf_ranged:fusion_pistol_loaded' at 1 in main inv of 'test_subject' now has wear 160.
                                    -- Note: the wear it is showing is inverted (max size of int16, 65535), so lower is better (higher means the gun has more wear)
                                    minetest.log("action", "[ctf_ranged] '"..name.."' at "..tostring(i).." in main inv of '"..pname.."' now has wear "..tostring(stack:get_wear())..".")
                                end
                            end
                        end
                    end
                end
            end
        end
        fusion_interval = 1.0
    end
end)

-- Allow Energy upgrading to Fusion?
if ctf_ranged.settings.allow_energy_fusion == true then
    minetest.register_craft({
        type = "shapeless"
        output = "ctf_ranged:fusion_pistol",
        recipe = {"ctf_ranged:energy_pistol", "ctf_ranged:gunparte"}
    })
    minetest.register_craft({
        type = "shapeless"
        output = "ctf_ranged:fusion_rifle",
        recipe = {"ctf_ranged:energy_rifle", "ctf_ranged:gunparte"}
    })
    minetest.register_craft({
        type = "shapeless"
        output = "ctf_ranged:fusion_shotgun",
        recipe = {"ctf_ranged:energy_shotgun", "ctf_ranged:gunparte"}
    })
end
