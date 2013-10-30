require_relative 'spec_helper'

describe Graph do
  describe "#new" do
    it "should be an instance of Graph" do
      g = Graph.new
      expect(g).to_not be_nil
    end

    it "graph variable should be empty hash" do
      graph = Graph.new
      expect(graph.g).to be {}
      expect(graph.g).to be_empty
    end
  end

  describe "#add_node" do
    let(:graph) { Graph.new }
    let(:node) { Node.new "A" }

    it "should add a node to the graph" do
      expect {
        graph.add_node node
      }.to change {graph.g.size}.by 1
      expect(graph.g[node.key]).to be node
    end
  end

  describe "#add_nodes" do
    let(:graph) { Graph.new }
    let(:nodes) do
      [ Node.new(1), Node.new(2), Node.new(3), Node.new(4), Node.new(5), Node.new(6) ]
    end

    it "should add an array of nodes" do
      expect {
        graph.add_nodes(nodes)
      }.to change { graph.g.size }.by 6
    end
  end

  describe "#add_connection" do
    let(:graph) { Graph.new }
    let(:node_1) { Node.new(1) }
    let(:node_2) { Node.new(2) }

    it "should connect the nodes" do
      graph.add_conection node_1, node_2, 20
      expect(node_1.edges.size).to be 1
      expect(node_2.edges.size).to be 1
      expect(node_1.edges.first.weight).to be 20
      expect(node_1.edges.first.node_b).to be node_2
      expect(node_2.edges.first.node_a).to be node_1
    end
  end
end