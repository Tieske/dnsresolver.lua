local resolver = require("resty.dns.resolver")
local pretty = require("pl.pretty").write

local function go(host, typ)
    local r, err = resolver:new{
        nameservers = {"8.8.8.8", {"8.8.4.4", 53} },
        retrans = 5,  -- 5 retransmissions on receive timeout
        timeout = 2000,  -- 2 sec
    }

    if not r then
        print("failed to instantiate the resolver: ", err)
        return
    end
    
    local answers, err = r:query(host, {qtype = (typ and resolver["TYPE_"..typ]) or nil})
    if not answers then
        print("failed to query the DNS server: ", err)
        return
    end

    print(pretty(answers))
end

print "Multiple A records"
go "atest.thijsschreijer.nl"

print "AAAA record" 
go ("google.com", "AAAA")

print "A record redirected through 2 CNAME records"
go ("smtp.thijsschreijer.nl", "A")

print "Multiple SRV records"
go ("srvtest.thijsschreijer.nl", "SRV")
	