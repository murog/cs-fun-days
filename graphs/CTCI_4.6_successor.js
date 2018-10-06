// // 4.6 Write an algorithm to find the 'next' node (i.e., in-order successor)
// of a given node in a binary search tree. You may assume that
// each node has a link to its parent.

// misc:
// each node has a link to its parent.
// any kind of tree
// add children to a queue

function linkNodes(node) {
  level = 1;
  linkedNodes = {};
  q = new Queue();
  q.enq({node, level})
  while (!q.isEmpty()) {
    level = q.peek().level
    if(!linkedNodes[level]) {
      // create new list for new level
      linkedNodes[level] = new LinkedList(); 
    } 
    // enq children
    currNode = q.deq
    if(currNode.left) {
      q.enq(currNode.left, level + 1)
    }
    if(currNode.right) {
      q.enq(currNode.right, level + 1)
    }
    linkedNodes[level].add(currNode);
  }
  return linkedNodes;
}
