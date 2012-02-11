require 'xmlrpc/client'
server = XMLRPC::Client.new2("http://localhost:3000/api/xmlrpc")
p server.call("authenticate", "takaaki0@hyper.ocn.ne.jp", "1svk78")
p server.call("set_location", "aaaa", "bbbb", "cccc")
p server.call("set_location", "bbbb", "cccc")
