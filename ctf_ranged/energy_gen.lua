
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
