# frozen_string_literal: true

require_relative 'linked_list'

# Linked List function tests

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
