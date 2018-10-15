## 4.3 Given a binary tree, design an algorithm which creates a linked list
# of all the nodes at each depth (eg, if you have a tree with depth D, you'll have D linked lists)

# misc:
# time complexity:
# space complexity
# # worst: imbalanced tree
# # avg:

def link_nodes(n)
  list_array = []
  parent = Queue.new
  child = Queue.new

  parent.enq(n)
  list_a = LinkedList.new
  while !parent.empty?
    # same as pop
    temp = parent.deq
    list_a.append_after(temp)
    child.enq(temp.left)
    child.enq(temp.right)
    if !parent.empty?
      tempQ = parent
      parent = child
      child = tempq
    else
      list_array << list_a
      list_a = LinkedList.new
    end
  end
  return list_array
end

# recursive solution
def level_lists(tree)
  height = tree.height
  lists = []
  # i current level
  height.tree do |i|
    current_level = LinkedList.new
    helper(current_level, i, tree.root)
    lists << current_level
  end
end
# TODO more descriptive name for helper
def recursive_helper(list, level_num, node)
  if num == 0
    list.add(node)
  end
  # TODO check if left and right nodes exist
  helper(list, num-1, node.left)
  helper(list, num-1, node.right)
end
