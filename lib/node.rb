# frozen_string_literal: true

#Class representationve of a node to be place inside a linked list

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
