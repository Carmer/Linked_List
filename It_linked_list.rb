class IterativeLinkedList
 attr_accessor :head

 def initialize
   @head = nil
 end

 def count
   if @head.nil?
     0
   else
     count = 1
     current = @head
     while current.next_node?
       count += 1
       current = current.next_node
     end
     count
   end
 end

 def push(data)
   if !@head
     @head = Node.new(data)
   else
     current = head
     while current.next_node?
       current = current.next_node
     end
     current.next_node = Node.new(data)
   end
 end

 def last_node
   current = head
   while current.next_node?
     current = current.next_node
   end
   current
 end

 def pop
   current = head
   previous = nil
   while current.next_node?
     previous = current
     current = current.next_node
   end

   if previous.nil?
     @head = nil
   else
     previous.next_node = nil
   end
   current.data
 end


 def delete(target)
   if head.data == target
     @head = head.next_node
   else
     current = head
     last = nil
     while current.next_node?
       last = current
       current = current.next_node

       if current.data == target
         last.next_node = current.next_node
       end
     end
   end
 end

 def to_a
   result = []
   current = head

   while current
     result << current.data
     current = current.next_node
   end
   return result
 end


end



class Node
 attr_accessor :next_node
 attr_reader :data

 def initialize(input_data)
   @data = input_data
 end

 def next_node?
   next_node
 end
end


list = IterativeLinkedList.new

list.push("Cat")
list.push("Dog")
list.push("Pizza")
list.push("Cat")
list.push("Dog")


puts list.inspect.split

tracycaruso [12:50 PM]
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'jeff_linked'

class IterativeLinkedListTest < Minitest::Test
 attr_reader :list

 def setup
   @list = IterativeLinkedList.new
 end

 def test_it_starts_with_zero_elements
   assert_equal 0, list.count
 end

 def test_it_pushes_an_element_onto_an_empty_list
   list.push("hello")
   assert_equal 1, list.count
 end

 def test_it_pushes_elements_onto_a_list
   list.push("hello")
   list.push("world")
   assert_equal 2, list.count
 end

 def test_it_pushes_three_elements_onto_a_list
   list.push("hello")
   list.push("world")
   list.push("howdy")
   assert_equal 3, list.count
 end

 def test_it_pops_an_element_from_the_list
   list.push("hello")
   output = list.pop
   assert_equal "hello", output
 end

 def test_it_pops_the_last_element_from_the_list
   list.push("hello")
   list.push("world")
   list.push("today")
   output = list.pop
   assert_equal "today", output
   assert_equal 2, list.count
 end

 def test_a_popped_element_is_removed
   list.push("hello")
   output = list.pop
   assert_equal "hello", output
   assert_equal 0, list.count
 end

 def test_it_deletes_a_single_node
   list.push("hello")
   list.delete("hello")
   assert_equal 0, list.count
 end

 def test_it_does_not_delete_when_the_data_does_not_match
   list.push("hello")
   list.push("world")
   list.delete("today")
   assert_equal 2, list.count
 end

 def test_it_deletes_a_middle_node
   list.push("hello")
   list.push("world")
   list.push("today")
   list.delete("world")
   assert_equal 2, list.count
   assert_equal "today", list.pop
   assert_equal "hello", list.pop
 end

 def test_it_deletes_the_head_when_there_are_more_nodes
   list.push("hello")
   list.push("world")
   list.push("today")
   list.delete("hello")
   assert_equal 2, list.count
   assert_equal "today", list.pop
   assert_equal "world", list.pop
 end

 def test_it_converts_to_an_array_when_there_are_no_elements
   assert_equal [], list.to_a
 end

 def test_it_converts_to_an_array_with_several_elements
   list.push("hello")
   list.push("world")
   list.push("today")
   assert_equal ["hello", "world", "today"], list.to_a
 end

 def test_it_finds_the_last_node
   list.push("hello")
   list.push("world")
   node = list.last_node
   assert_equal "world", node.data
 end



end
