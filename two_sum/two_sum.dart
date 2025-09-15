
Problem: 
Two Sum. 

Description:

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.


Solution O(n^2)

  class Solution {
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
      for (int j = nums.length - 1; j > 0; j--) {
        if (i != j) {
          if (nums[i] + nums[j] == target) {
            print('target matched: $i $j');
            return [i, j];
          }
        }
      }
    }
    throw Exception("No solution found");
  }
}


Solution O(n):
  
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final Map<int, int> seen = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];

      if (seen.containsKey(complement)) {
        return [seen[complement]!, i];
      }

      seen[nums[i]] = i;
    }

    throw Exception("No solution found");
  }
}


Test Cases: 

void main() {
  test('testing two sum', () {
    final Solution solution = Solution();
    expect(solution.twoSum([3, 2, 4], 6), [1, 2]);
    expect(solution.twoSum([2, 7, 11, 9], 9), [0, 1]);
    expect(solution.twoSum([3, 3], 6), [0, 1]);
  });
}
