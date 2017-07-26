# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stan/version'

Gem::Specification.new do |spec|
  spec.name          = 'stan'
  spec.version       = Stan::VERSION
  spec.authors       = ['Flipez']
  spec.email         = ['code@brauser.io']

  spec.summary       = 'Static Site Deployment'
  spec.description   = 'Deploy your static sites easy with Stan'
  spec.homepage      = 'https://github.com/Flipez/static-stan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'typhoeus'
  spec.add_dependency 'thor'
  spec.add_dependency 'sinatra'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
