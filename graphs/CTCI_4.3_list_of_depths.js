// // 4.3 Given a binary tree, design an algorithm which creates a linked list
// of all the nodes at each depth (eg, if you have a tree with depth D, you'll have D linked lists)

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
