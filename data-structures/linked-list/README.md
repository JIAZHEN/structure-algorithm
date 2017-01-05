Linked-list
===

# Singly-linked list
Linked-list has head pointer. Every node contains key and next pointer (point to next node).

## Operations
- insert()
- remove()
- size()
- pushFront()
- popFront()
- pushBack()
- popBack()
- Find(key)
- Erase(key)
- AddBefore(key, node)
- AddAfter(key, node)
- Empty()

## Big-O
- pushFront is O(1)
- popFront is O(1)
- pushBack is O(n), no tail
- popBack is O(n), no tail
- pushBack is O(1), with tail, current tail's pointer point to new node, tail set to new node
- popBack is O(n), with tail, iterate from first node to the second last node, tail set to the second last node. The second last point to nothing
- Find(key) is O(n)
- Erase(key) is O(n)
- AddBefore(key, node) is O(n)
- AddAfter(key, node) is O(1)
- Empty() is O(1)
