require 'xmlrpc/client'
server = XMLRPC::Client.new2("http://localhost:3000/api/xmlrpc")
p server.call("authenticate", "takaaki0@hyper.ocn.ne.jp", "bXIOg8", {"imei" => "imei_value", "key1" => "value1", "key2" => "value2"})
