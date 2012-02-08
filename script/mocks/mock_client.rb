require 'xmlrpc/client'
server = XMLRPC::Client.new2("http://localhost:3000/api/xmlrpc")
server.call("authenticate", "takaaki0@hyper.ocn.ne.jp", "1svk78")
