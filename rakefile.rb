require 'rake/testtask'

require_relative 'graph.rb'
require_relative 'node.rb'

Rake::TestTask.new('test:all') do |t|
  t.libs = ['test']
  t.verbose = true
  t.warning = true
  t.test_files = FileList['specs/*_spec.rb']
end

desc "Run shortest path"
task(:example) do
  graph = Graph.new
  graph.add_node 1, 2, 7
  graph.add_node 1, 3, 9
  graph.add_node 1, 6, 14
  graph.add_node 2, 3, 10
  graph.add_node 2, 4, 15
  graph.add_node 3, 4, 11
  graph.add_node 3, 6, 2
  graph.add_node 4, 5, 6
  graph.add_node 5, 6, 9

  puts graph.dijkstra(1, 5)
end