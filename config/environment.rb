# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WebsoketGeolocation::Application.initialize!
ActiveSupport::XmlMini.backend = "LibXML"
