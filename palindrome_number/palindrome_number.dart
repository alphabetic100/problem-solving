/*
This is a problem there you have to figure out the given integert number is 
palindrome or not. (e.g: 121 is a palindrome number, 1223 is not a palindrome number.) 
There is two types of solution that i can think about initaly (-_-). there for there is the 
solutions: 
1. [String based solution]:-
    >all you have to do just take the input and parse it to string.
    >make another string variable that can hold the reversed string(
     reverse the string using reverse function).
    >check the first str value and the revirse value is matchd or not
    > if match return true: the number is palindrome, else false: the number is not palindrome

2. [Integer based approach]:-
    >you have to check a verious state of conditions there if you go with this approch
    >check the value is nagative or not (e.g: value<0)
    >check the value is a single number or not(e.g: every single number is palindrome)
    >find a divisor to extend the leading digit
    >extruct the leading and trailing digits
    >check the leading and trailing digits are match or not? if it dosn't match it not a palindrome number.

preference: both solutions have diffrents aspect of solving the same problem, if you wanna go with
            with a simple way then i prefere the string based solutin.
            
complexity: the solutions have two diffrence type of complexity, if you go with 
            string based solution, it have -[reverse] function that hase the 
            complexity of O(Log(X)) times,

runtime: >string based solution: 49ms --> 154.6 MB
                >Ingeger based solution: 4ms --> 152.4 MB
*/

import 'dart:io';

/// The main function is the entry point of the program. It prompts the user to enter an integer,
/// reads the input from the standard input, and checks if the input is a valid integer.
/// If the input is valid, it checks whether the integer is a palindrome and prints the result.
/// If the input is invalid, it prints an error message and terminates the program.
void main(List<String> arguments) {
  print("Enter an integer:");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Invalid input. Please enter a valid integer.");
    return;
  }

  int? number = int.tryParse(input);
  if (number == null) {
    print("Invalid input. Please enter a valid integer.");
    return;
  }

  bool result = isPalindromeStringBased(number);
  print(result ? "$number is a palindrome." : "$number is not a palindrome.");
}

// String-based approach
bool isPalindromeStringBased(int x) {
  String str = x.toString();
  //Reverse the string
  String reversedStr = str.split('').reversed.join('');
  //check is palindrome or not
  return str == reversedStr;
}

// Integer-based approach
bool isPalindrome(int x) {
  //Check the number is negitive or not
  if (x < 0) return false;
  //Single digit number are alwayes palindrome
  if (x < 10) return true;

  // Find the divisor to extract the leading digit
  int divisor = 1;
  while (x / divisor >= 10) {
    divisor *= 10;
  }
  while (x > 0) {
    // Extract the leading digit
    int leading = x ~/ divisor;
    // Extract the trailing digit
    int trailing = x % 10;
    // If the leading and trailing digits are not the same, it's not a palindrome
    if (leading != trailing) {
      return false;
    }
    // Remove the leading and trailing digits from the number
    x = (x % divisor) ~/ 10;
    // Adjust the divisor for the next pair of digits
    divisor ~/= 100;
  }
  return true;
}
