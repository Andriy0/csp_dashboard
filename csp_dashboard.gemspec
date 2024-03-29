require_relative 'lib/csp_dashboard/version'

Gem::Specification.new do |spec|
  spec.name        = 'csp_dashboard'
  spec.version     = CspDashboard::VERSION
  spec.authors     = ['Andriy0']
  spec.email       = ['andriy2152@gmail.com']
  # spec.homepage    = "TODO"
  spec.summary     = 'Summary of CspDashboard.'
  spec.description = 'Description of CspDashboard.'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.0.6'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'haml'
  spec.add_dependency 'rails', '>= 7.0.4.2'
  spec.add_dependency 'bootstrap'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'rails-ujs'
  spec.add_dependency 'pagy'
  spec.add_dependency 'ransack'
  spec.add_dependency 'simple_form'
  spec.add_dependency 'chartkick'
  spec.add_dependency 'groupdate'
end
