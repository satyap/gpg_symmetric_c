require 'rubygems'
require 'bundler/setup'

require 'gpg_symmetric_c'

RSpec.configure do |config|
      # some (optional) config here
      config.mock_with :rr
end

