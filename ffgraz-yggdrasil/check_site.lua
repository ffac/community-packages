-- SPDX-FileCopyrightText: Maciej Krüger <maciej@xeredo.it>
--
-- SPDX-License-Identifier: MIT

local required = need_boolean({'mesh', 'yggdrasil', 'enabled'}, false)
need_string_array_match({'mesh', 'yggdrasil', 'peers'}, '^%l+://.+$', required)
