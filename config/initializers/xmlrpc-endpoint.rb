# This file loads when the gem is included, and does plugin-style initialization

module ActionController::Acts
	autoload :XmlrpcEndpoint, "#{Rails.root.to_s}/lib/action_controller/acts/xmlrpc_endpoint.rb"
end

ActionController::Base.send(:include, ActionController::Acts::XmlrpcEndpoint )

