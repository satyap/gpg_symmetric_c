require 'bundler/gem_tasks'
require 'rake/extensiontask'
require 'rspec/core/rake_task'

load './gpg_symmetric_c.gemspec'
Gem::PackageTask.new($gpg_symmetric_c_gemspec)

desc 'Run specs'
task :default => [:compile, :spec]

Rake::ExtensionTask.new('gpg_symmetric_c') do |ext|
  ext.source_pattern = "*.{c,cc}"        # monitor file changes to allow simple rebuild.
  ext.gem_spec = $gpg_symmetric_c_gemspec
end


RSpec::Core::RakeTask.new do |t|
    # t.pattern = 'spec/**/*_spec.rb'
end

