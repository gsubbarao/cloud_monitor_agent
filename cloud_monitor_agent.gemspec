# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/version'

Gem::Specification.new do |spec|
  spec.name          = "cloud_monitor_agent"
  spec.version       = CloudMonitor::VERSION
  spec.authors       = ["G SubbaRao"]
  spec.email         = ["subbarao.kly@gmail.com"]
  spec.description   = %q{A Ruby Gem with methods to send statistics such as CPU, Disk, TCP/UDP Connections, Load, Bandwidth, Disk I/O, and Memory to remote address}
  spec.summary       = %q{Extended version of usagewatch_ext}
  spec.homepage      = "https://github.com/gsubbarao/cloud_monitor_agent"
  spec.license       = "MIT"
  spec.rdoc_options << '--main' << 'README'

  spec.post_install_message = "* CloudMonitorAgent Gem for sending client machine \nThanks for installing!"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency('usagewatch_ext', '~> 0.2.1')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
