gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'itterative_linked_list'

class IterativeLinkedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = LinkedList.new
  end

  def test_it_starts_with_zero_elements
    assert_equal 0, list.count_node
  end

  def test_nodes_have_data
    node = Node.new("pizza")
    assert_equal "pizza", node.data
  end

  def test_nodes_have_next_node
    n1 = Node.new("pizza")
    n2 = Node.new("cats")
    n1.next_node = n2
    assert_equal "cats", n1.next_node.data
    assert_equal Node, n1.next_node.class
  end

  def test_it_starts_with_zero_elements
    assert_equal 0, list.count_node
  end

  def test_a_new_list_starts_with_nil_head
    assert_equal nil, LinkedList.new.head
  end

  def test_it_pushes_a_single_element_onto_a_list
    list.push("pizza")
    assert_equal "pizza", list.head.data
    assert_equal 1, list.count_node
  end

  def test_it_pushes_two_elements_to_a_list
    list.push("pizza")
    assert_equal "pizza", list.head.data
    list.push("stromboli")
    assert_equal "stromboli", list.head.next_node.data
    assert_equal 2, list.count_node
  end


  def test_it_pushes_three_elements_onto_a_list
    list.push("hello")
    assert_equal "hello", list.head.data
    list.push("world")
    assert_equal "world", list.head.next_node.data
    list.push("today")
    assert_equal "today", list.head.next_node.next_node.data
    assert_equal 3, list.count_node
  end

  def test_it_pops_the_last_element_from_the_list
    list.push("hello")
    list.push("world")
    list.push("today")
    output = list.pop
    assert_equal "today", output
    assert_equal 2, list.count_node
  end

  def test_a_popped_element_is_removed
    list.push("hello")
    output = list.pop
    assert_equal "hello", output
    assert_equal 0, list.count_node
  end

  def test_it_finds_the_last_node
    list.push("hello")
    list.push("world")
    node = list.last_node
    assert_equal "world", node.data
  end

  def test_a_node_links_to_its_next_element
    skip 
    list.push("hello")
    list.push("world")
    assert_equal "world", list.last_node.data
    assert_equal "world", list.head_node.next_node.data
  end

  def test_next_node_for_the_last_node_is_nil
    skip
    list.push("world")
    assert_nil list.last_node.next_node
  end

  def test_find_if_an_element_is_included_in_the_list
    skip
    list.push("hello")
    list.push("world")
    assert_equal true, list.include?("hello")
    assert_equal false, list.include?("bogus")
  end

  def test_find_a_given_node
    skip
    list.push("hello")
    list.push("world")
    list.push("today")

    assert_equal "world", list.find("world").data
    assert_equal "today", list.find("world").next_node.data
  end

  def test_inserts_node_at_arbitrary_position
    skip
    list.push("hello")
    list.push("world")
    list.push("today")

    list.insert(1, "pizza")

    assert_equal 1, list.index("pizza")
    assert_equal ["hello", "pizza", "world", "today"], list.to_a
  end

  def test_inserted_node_is_next_node_for_previous_node
    skip
    list.push("hello")
    list.push("world")
    list.push("today")

    list.insert(1, "pizza")

    assert_equal "world", list.find("pizza").next_node.data
    assert_equal "pizza", list.find("hello").next_node.data
  end

  def test_insert_after_adds_a_node_after_a_given_node
    skip
    list.push("hello")
    list.push("world")
    list.push("today")

    list.insert_after("hello", "pizza")

    assert_equal "world", list.find("pizza").next_node.data
    assert_equal "pizza", list.find("hello").next_node.data
  end

  def test_distance_returns_distance_between_two_nodes
    skip
    list.push("hello")
    list.push("pizza")
    list.push("world")
    list.push("today")
    list.push("tomorrow")
    assert_equal 3, list.distance("hello", "today")
    assert_equal 2, list.distance("pizza", "today")
    assert_equal 2, list.distance("hello", "world")
    assert_equal 4, list.distance("hello", "tomorrow")
    assert_equal 1, list.distance("world", "today")
  end

end
