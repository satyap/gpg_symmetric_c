# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gpg_symmetric_c/version"
$gpg_symmetric_c_gemspec = Gem::Specification.new do |s|
    s.name        = 'gpg_symmetric_c'
    s.version     = GpgSymmetricC::VERSION
    s.date        = '2012-02-22'
    s.summary     = "Encrypt/decrypt with GPG symmetric encryption"
    s.description = "Wrapper for GPG C library's symmetric encryption"
    s.authors     = ["Satya P"]
    s.email       = 'github@thesatya.com'
    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.require_paths = ["lib"]

    s.homepage    = 'http://github.com/satyap/gpg_symmetric_c'

    s.extensions = ['ext/gpg_symmetric_c/extconf.rb']

    s.add_development_dependency(%q<bundler>, ["~> 1.2.0"])
    s.add_development_dependency 'rspec', '~> 2.11.0'
    s.add_development_dependency 'rr', '~> 1.0.4'
    s.add_development_dependency 'rake', '~> 0.9.2'
    s.add_development_dependency(%q<rake-compiler>, ["~> 0.8.1"])
end
