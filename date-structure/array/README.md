Array
===

Array is a data structure consisting of a collection of elements (values or variables), each identified by at least one array index or key. (My understanding is that it has a pointer to point to the end of array.)

# Methods
- get(i)
- set(i, val)
- size() / length(): it should be a variable in array to record the current size
- capacity: number of items it can hold, for dynamically increasing size.
- resize(new_capacity) // private function
  + when you reach capacity, resize to **double** the size
  + when popping an item, if size is **1/4** of capacity, resize to half
  + always create a new array with new size then copy values over

# Big-O
- Add and remove from the end: O(1)
- Add and remove from the beginning or middle: O(n)
- Find: O(n)
