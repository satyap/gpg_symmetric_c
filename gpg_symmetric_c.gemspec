Gem::Specification.new do |s|
    s.name        = 'gpg_symmetric_c'
    s.version     = '0.0.0'
    s.date        = '2012-02-22'
    s.summary     = "Encrypt/decrypt with GPG symmetric encryption"
    s.description = "Wrapper for GPG C library's symmetric encryption"
    s.authors     = ["Satya P"]
    s.email       = 'github@thesatya.com'
    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.require_paths = ["lib"]

    s.homepage    = 'http://github.com/satyap/gpg_symmetric_c'

    s.add_development_dependency 'rspec', '~> 2.11.0'
    s.add_development_dependency 'rr', '~> 1.0.4'
    s.add_development_dependency 'rake', '~> 0.9.2'
end
