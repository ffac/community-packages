-- SPDX-FileCopyrightText: Maciej Krüger <maciej@xeredo.it>
--
-- SPDX-License-Identifier: MIT

need_number({'mesh_vpn', 'openvpn', 'mtu'}, false)
need_boolean({'mesh_vpn', 'openvpn', 'self_signed'}, false)
need_string({'mesh_vpn', 'openvpn', 'ca'})
need_table({'mesh_vpn', 'openvpn', 'config'})
