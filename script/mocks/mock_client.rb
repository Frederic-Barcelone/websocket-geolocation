require 'xmlrpc/client'
server = XMLRPC::Client.new2("http://localhost:3000/api/xmlrpc")
p server.call("authenticate", "takaaki0@hyper.ocn.ne.jp", "ISHPmb", {"hoge" => 1, "piyo" => { "1" => true}})
