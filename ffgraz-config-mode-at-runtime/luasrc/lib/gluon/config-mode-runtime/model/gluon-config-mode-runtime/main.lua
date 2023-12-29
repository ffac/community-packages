-- SPDX-FileCopyrightText: Maciej Krüger <maciej@xeredo.it>
--
-- SPDX-License-Identifier: MIT

local f = Element("runtime/main", {}, 'main')
f.template = "runtime/main"
f.package = "ffgraz-config-mode-at-runtime"

f.authinfo = {
  translatef('Authentication mode: %s', translate(Auth.method.display)),
  translatef('User ID: %s', translate(Auth.identity)),
}

return f
