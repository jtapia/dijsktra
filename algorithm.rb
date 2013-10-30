require './dijkstra'

class Algorithm
  def initialize
    @clazz = Dijkstra.new
  end

  def start
    if ARGV.empty?
      @clazz.auto
    else
      @clazz.insert_nodes
    end
  end
end

algorithm = Algorithm.new
algorithm.start
