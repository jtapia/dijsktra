require "./graph"
require "./node"

class Dijkstra

  def initialize
    @graph = Graph.new
  end

  def auto
    @graph.add_node 1, 2, 7
    @graph.add_node 1, 3, 9
    @graph.add_node 1, 6, 14
    @graph.add_node 2, 3, 10
    @graph.add_node 2, 4, 15
    @graph.add_node 3, 4, 11
    @graph.add_node 3, 6, 2
    @graph.add_node 4, 5, 6
    @graph.add_node 5, 6, 9

    p @graph.dijkstra 1, 5
  end

  def insert_nodes; end
end