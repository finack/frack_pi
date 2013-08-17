# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','frack','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'frack'
  s.version = Frack::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
# Add your other files here if you make them
  s.files = %w(
bin/frack
lib/frack/version.rb
lib/frack.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','frack.rdoc']
  s.rdoc_options << '--title' << 'frack' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'frack'
  s.add_development_dependency('aruba')
  s.add_development_dependency('pry')
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_runtime_dependency('gli','2.7.0')
  s.add_runtime_dependency('settingslogic')
  s.add_runtime_dependency('stathat')
end
