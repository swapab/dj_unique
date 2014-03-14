# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dj_unique/version'

Gem::Specification.new do |spec|
  spec.name          = "dj_unique"
  spec.version       = DjUnique::VERSION
  spec.authors       = ["Swapnil Abnave"]
  spec.email         = ["swapnilabnave42@gmail.com"]
  spec.description   = %q{An armour for delayed_job_active_record to ensure no duplicate jobs are enqueued}
  spec.summary       = %q{dj stands for delayed_job}
  spec.homepage      = "https://github.com/swapnilabnave/dj_unique"
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_dependency             "delayed_job_active_record", "~> 4.0.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
