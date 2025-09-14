// Problem
// Happy Number

// Description: 

// Starting with any positive integer, replace the number by the sum of the squares of its digits.
// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy.
// Return true if n is a happy number, and false if not.


class Solution {
  bool isHappy(int n) {
    int slow = n;
    int fast = n;

    do {
      slow = executeSum(slow);
      fast = executeSum(executeSum(fast));
    } while (slow != fast);

    return slow == 1;
  }

  int executeSum(int number) {
    int sum = 0;
    while (number > 0) {
      int digit = number % 10;
      sum += digit * digit;
      number ~/= 10;
    }
    return sum;
  }
}
