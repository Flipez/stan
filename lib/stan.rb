require 'stan/version'
require 'fileutils'
module Stan
  autoload :Server, 'stan/server'
  autoload :Compressor, 'stan/compressor'
  autoload :Deployer, 'stan/deployer'
  CI = ENV.fetch('CI', false).freeze
end
