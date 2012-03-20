require 'spec_helper'

describe "xmlrpc_params_convert" do
  let(:params) do
    path = Rails.root.to_s + "/spec/libs/xmlrpc_data/big_call.xml"
    Hash.from_xml(File.open(path).read)
  end

  it "" do
    p XmlrpcParamsParser.new(params).parse
  end
end
