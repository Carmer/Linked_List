class LinkedList

  attr_accessor  :head, :data


  # def initialize
  # end

  def push(data)
    if head.nil?
      @head = Node.new(data)
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
        current.next_node = Node.new(data)
    end
  end

  def count_node
   if head.nil?
     count = 0
   else
     count = 1
     current = @head
     while current.next_node
       count += 1
       current = current.next_node
     end
     count
   end
 end

 def print_all_nodes
   if head == nil
     output = "no nodes"
   elsif
     while head.nil?
      node = head
   end
  end
end

  def pop
    current = head
    if current.next_node.nil?
      output = head.data
      @head = nil
    else
      until current.next_node.next_node.nil?
          current = current.next_node
          output = current.next_node.data
        end
        current.next_node = nil
    end
    output
  end

  def last_node
    if head.nil?
      head
    else current = head
      while current.next_node != nil
        current = current.next_node
      end
      current
    end
  end

  def head_node
  end




end

class Node

  attr_reader :data
  attr_accessor :next_node

  def initialize(data)
    @data = data
  end

end

# link = List.new
# link.ammend("Eric")
#
# puts link.node_name
