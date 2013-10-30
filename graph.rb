require './node'

class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
    @visited = []
    @result = []
  end

  def add_node source, destination, distance=Float::INFINITY
    unless source.nil? or destination.nil?
       @nodes << Node.new(source, destination, distance)
       @nodes << Node.new(destination, source, distance)
    end
  end

  def current_node
    @current_node ||= @nodes.first
  end

  def neighbors(vertex, prev=0)
    neighbors = []
    @nodes.each do |node|
      neighbors << node.destination if node.source == vertex and node.destination != prev
    end
    neighbors
  end

  def set_current_node nodes
    near_node = nodes.min_by{|o| o.distance }
    @current_node = @nodes.select{|node| node.source == near_node.destination}.last
  end

  def set_results
    @result << @current_node.source
    @current_node.visited = true
  end

  def delete_visited
    source = @current_node.source
    nodes = @nodes.select{ |node| node.source == source or node.destination == source }
    nodes.each do |node|
      @nodes.delete(node)
    end
  end

  def dijkstra source, destination=Float::INFINITY
    current_node
    @nodes[source].set_zero_for_initial_vertice

    until @nodes.empty?
      @near_nodes = []

      break if @current_node.source == destination
      near_neighbours = neighbors @current_node.source, @prev
      @nodes.each do |node|
        @near_nodes << node if near_neighbours.include?(node.destination) && node.source == @current_node.source
      end

      set_results unless @current_node.source == source
      delete_visited
      set_current_node @near_nodes
    end

    return @result
  end
end