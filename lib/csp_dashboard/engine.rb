require 'haml'
require 'bootstrap'
require 'pagy'
require 'rails-ujs'
require 'jquery-rails'
require 'ransack'
require 'simple_form'
require 'chartkick'
require 'groupdate'

ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

module CspDashboard
  class Engine < ::Rails::Engine
    isolate_namespace CspDashboard

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
