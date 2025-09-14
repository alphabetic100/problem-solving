
// Problem: 
// 225. Implement Stack using Queues
// Description: 
// Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).

// Solution : 
class MyStack {
  MyStack();

  final List<int> _stack = [];

  void push(int x) {
    _stack.add(x);
  }

  int pop() {
    if (_stack.isEmpty) return 0;
    final last = _stack.last;
    _stack.removeLast();
    return last;
  }

  int top() {
    return _stack.last;
  }

  bool empty() {
    return _stack.isEmpty;
  }
}
