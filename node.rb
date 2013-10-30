class Node
  attr_accessor :source, :destination, :distance, :visited

  def initialize source, destination, distance=Float::INFINITY
    @source = source
    @destination = destination
    @distance = distance
    @visited = false
  end

  def set_zero_for_initial_vertice
    @distance = 0
  end
end