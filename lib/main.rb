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
    new_node = Node.new(value)

    if @head
      new_node.next_node = @head
      @head = new_node
    else
      @head = new_node
    end
  end

  def size
    count = 0
    node = @head

    return count if node.nil?

    until node.next_node.nil?
      count += 1
      node = node.next_node
    end

    return count
  end

  def head
    @head ? @head : nil
  end

  def tail
    node = @head

    return nil if @head.nil?
    return node if !node.next_node
    return node if !node.next_node while (node = node.next_node)
  end

  def at(index)
    node = @head
    count = 0
 
    return nil if @head.nil?

    until count == index
      count += 1
      node = node.next_node
    end

    return node
  end

  def pop
    return nil if @head.nil?

    length = self.size
    penultimate_node = self.at(length - 1)
    penultimate_node.next_node = nil

    return self
  end

  def contains?(value)
    contains = false
    node = @head

    until node.nil?
      contains = true if node.value == value
      node = node.next_node
    end

    return contains
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

    return index
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
    return list.join(' -> ')
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    current_node = @head
    prev_node = nil
    count = 0

    until count == index
      count += 1
      prev_node = current_node
      current_node = current_node.next_node
    end

    prev_node.next_node = new_node
    new_node.next_node = current_node
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

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Tests

my_list = LinkedList.new
my_list.append('item-one')
my_list.append('item-two')
my_list.append('item-three')
my_list.prepend('item-zero')
my_list.insert_at('item-additional', 3)
empty_list = LinkedList.new

p my_list

p "list size: #{my_list.size}"
p "empty list size: #{empty_list.size}"

p "list head: #{my_list.head}"
p "empty head: #{empty_list.head}"

p "list tail: #{my_list.tail}"
p "empty tail: #{empty_list.tail}"

p "list index 2: #{my_list.at(2)}"
p "empty index 2: #{empty_list.at(2)}"

p "list pop: #{my_list.pop}"
p "empty pop: #{empty_list.pop}"

p "list contains item-two: #{my_list.contains?('item-two')}"
p "empty contains item-two: #{empty_list.contains?('item-two')}"

p "list index of item-two: #{my_list.find('item-two')}"
p "empty index of item-two: #{empty_list.find('item-two')}"

p my_list.to_s
p empty_list.to_s

my_list.remove_at(3)
p my_list
