Heap
===
It's using a Binary Search Tree for visualisation, partially ordering. It stores
in array. An index x, it's childrent are (2x + 1) and (2x + 2), it's parent node
is (x - 1) / 2

## Min heap
The parent node is less than the children

## Max heap
The parent node is greater than the children

## Operations
- insert()
  + firstly insert to the end of the array
  + swap it with its Parent while it's larger

- remove()
  + replace the target value with the last one in the array
  + swap it with its largest child while it's smaller
