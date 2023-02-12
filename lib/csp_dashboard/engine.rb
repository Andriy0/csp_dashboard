require 'haml'

module CspDashboard
  class Engine < ::Rails::Engine
    isolate_namespace CspDashboard

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
