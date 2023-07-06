# frozen_string_literal: true

require('bundler/gem_tasks')

task default: :specs

task :specs do
  sh 'rspec', 'spec'
end

task :rubocop do
  sh 'rubocop', 'bin', 'lib', 'spec'
end
