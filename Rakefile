require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require "rake/extensiontask"

Rake::ExtensionTask.new("gethostname") do |ext|
  ext.lib_dir = "lib/gethostname"
end
