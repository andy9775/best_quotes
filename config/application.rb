require 'rulers'

# since autoloading of controllers isn't configured, manually set one up
# allow regular requiring of controllers
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
# require 'quotes_controller' # not needed with rulers autoloading

# similar to rails config/application file
module BestQuotes
  class Application < Rulers::Application
  end
end
