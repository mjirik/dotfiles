#! /usr/bin/env lua
--
-- mykeys.lua
-- Copyright (C) 2016 mjirik <mjirik@hp-mjirik>
--
-- Distributed under terms of the MIT license.
--

local awful = require("awful")
require("awful.util")

globalkeys = awful.util.table.join(globalkeys,
-- bind PrintScrn to capture a screen
    awful.key(
        {},
        "Print",
        function()
            -- awful.util.spawn("gnome-screenshot")
            awful.util.spawn("gnome-screenshot --interactive")
        end
    )
)


