package = "dns"
version = "0.1-1"
source = {
  url = "https://github.com/Mashape/dnsutils.lua/archive/version_1.0.tar.gz",
  dir = "dnsutils-v.1"
}
description = {
  summary = "DNS resolver",
  detailed = [[
    DNS resolver library, extracted from OpenResty.
    See https://github.com/openresty/lua-resty-dns
  ]],
  homepage = "https://github.com/Tieske/dns.lua",
  license = "BSD"
}
dependencies = {
  "lua >= 5.1, < 5.4",
  "luabitop",
  "luasocket",
}
build = {
  type = "builtin",
  modules = {
    ["resty.dns.resolver"] = "lib/resty/dns/resolver.lua",
  },
}
