require "bundler/gem_tasks"
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec do |spec|
  end
rescue LoadError => e
  puts e.message
end
