class LinkedListNode
    attr_accessor :value, :next_node
  
    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end
end


def print_values(list_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
end

def reverse_list(list, previous=nil)
    # do stuff
    head = list
    nextnode = list
    while list
        nextnode = list.next_node
        list.next_node = previous
        previous = list
        list = nextnode
    end
    head = previous
end

def detect_cycle(list) 
    cycle_present = false
    if list == nil
        cycle_present
    else
        fast = list.next_node
        slow = list
        while fast != nil && slow != nil && fast.next_node != nil
            if fast == slow 
                cycle_present = true
                return cycle_present
            else 
                fast = fast.next_node.next_node
                slow = slow.next_node
            end
        end
        return cycle_present
    end
    
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"


revlist = reverse_list(node3, nil)

print_values(revlist)

puts "--------"
puts "cycle detection"
puts "--------"

node4 = LinkedListNode.new(37)
node5 = LinkedListNode.new(99, node4)
node6 = LinkedListNode.new(12, node5)
node4.next_node = node6

cycle_present = detect_cycle(node4)
puts cycle_present
