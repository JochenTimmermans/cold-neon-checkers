require 'rubocop/rake_task'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb']
  task.fail_on_error = false
end


task :run do
  ruby 'bin/show.rb'
end
