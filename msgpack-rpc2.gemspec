# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'msgpack/rpc2/version'

Gem::Specification.new do |spec|
  spec.name          = "msgpack-rpc2"
  spec.version       = Msgpack::Rpc2::VERSION
  spec.authors       = ["Artiom Di"]
  spec.email         = ["kron82@gmail.com"]
  spec.description   = %q{}
  spec.summary       = %q{simple msgpack rpc}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "msgpack"
end
