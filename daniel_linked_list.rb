class IterativeLinkedList

  attr_reader :head

   def push(data)
    if head.nil?
       @head = Node.new(data)
     else
       current = @head
      while current.next_node != nil
         current = current.next_node
       end
      current.next_node = Node.new
     end
   end

  def count
    count = 0
    if head.nil?
      return count
    else
      count += 1
      current = head
      until current.next_node == nil
        current = current.next_node
        count += 1
      end
      return count
    end
  end

  def tail
    if head.next_node.nil?
      head
    else
      current = head
      until current.next_node == nil
        current = current.next_node
      end
      current
    end
  end

  def position(index)
    count = 0
    current = head
    if index == 0
      head.data
    else
      until count == index
        current = current.next_node
        count += 1
      end
      current.data
    end
  end

  def pop
    current = head
    if current.next_node.nil?
      @head = nil
    else
      until current.next_node.nil?
        current = current.next_node
      end
      current = nil
    end
  end
# 			while current.next_node				# Why doesn't this work?
# 				current = current.next_node
# 			end
# 			current = nil
# 		end

end
