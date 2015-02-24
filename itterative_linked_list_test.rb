require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'itterative_linked_list'

class LinkedTest < Minitest::Test

  def test_it_creates_nodes
    list = Node.new("Casio")
    assert_equal "Casio",list.data
  end

  def test_a_new_node_points_to_nil_next_node
    list = Node.new("Casio")
    assert_equal nil,list.head.next_node
  end

  def test_a_pointer_can_be_added_to_a_node
    list = Node.new("Casio")
    list.ammend("Banana")
    assert_equal "Banana",list.data
  end

  def test_the_pointer_can_be_changed
    list = Node.new("Casio")
    list.ammend("Banana")
    list.ammend("Fruit")
    assert_equal "Fruit",list.data
  end

  def test_it_can_build_a_single_node
    list = LinkedList.new
    list.ammend("Casio")
    assert_equal "Casio",list.head.data
  end

  def test_it_can_assign_a_head
    list = LinkedList.new
    list.ammend("Reginald")
    assert_equal "Reginald",list.head.data
  end

  def test_it_can_create_multiple_nodes
    list = LinkedList.new
    list.ammend("Reginald")
    list.ammend("Parliment")
    list.ammend("Casio")
    assert_equal "Reginald",list.head.data
    assert_equal "Parliment",list.data
  end

  def test_it_prints_out_the_node_list
    list = LinkedList.new
    list.ammend("Reginald")
    list.ammend("Parliment")
    list.ammend("Casio")
    assert_equal "", list.print_all_nodes
  end

end
