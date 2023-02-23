# frozen_string_literal: true

require_relative 'node'

# Class and methods to create and manipulate a linked list

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head
      tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    @head ? @head = Node.new(value, @head) : @head = Node.new(value)
  end

  def size
    count = 0
    node = @head

    until node.nil?
      count += 1
      node = node.next_node
    end

    count
  end

  def head
    @head ? @head : nil
  end

  def tail
    node = @head

    return nil if @head.nil?
    return node unless node.next_node
    return node unless node.next_node while (node = node.next_node)
  end

  def at(index)
    node = @head
    count = 0

    return nil if @head.nil?

    until count == index
      count += 1
      node = node.next_node
    end

    node
  end

  def pop
    return nil if @head.nil?
    
    length = self.size
    penultimate_node = self.at(length - 1)
    penultimate_node.next_node = nil
    self
  end

  def contains?(value)
    contains = false
    node = @head

    until node.nil?
      contains = true if node.value == value
      node = node.next_node
    end

    contains
  end

  def find(value)
    index = nil
    count = 0
    node = @head

    until node.nil?
      index = count if node.value == value
      count += 1
      node = node.next_node
    end

    index
  end

  def to_s
    list = []
    node = @head

    until node.nil?
      string = "( #{node.value} )"
      list.push(string)
      node = node.next_node
    end

    list.push('nil')
    list.join(' -> ')
  end

  def insert_at(value, index)
    current_node = @head
    prev_node = nil
    count = 0

    until count == index
      count += 1
      prev_node = current_node
      current_node = current_node.next_node
    end

    prev_node.next_node = Node.new(value, current_node)
  end

  def remove_at(index)
    node = @head
    prev_node = nil
    count = 0

    until count == index
      count += 1
      prev_node = node
      node = node.next_node
    end

    prev_node.next_node = node.next_node
  end
end
