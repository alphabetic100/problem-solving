/*
This is a problem where you have to convert a given Roman numeral string 
into its equivalent integer value. (e.g., "IX" -> 9, "XII" -> 12, "XXI" -> 21)

There is one common approach to solve this problem efficiently: 

1. [Right-to-Left Traversal Approach]:-
    > Convert the Roman numeral string into uppercase to handle case variations.
    > Define a map that stores the integer values of Roman numeral characters.
    > Traverse the string from right to left.
    > Keep track of the previously seen numeral to handle subtraction cases correctly 
      (e.g., "IX" -> 10 - 1 = 9).
    > If the current numeral is smaller than the previous one, subtract its value.
    > Otherwise, add its value.
    > Continue updating the result until the entire string is processed.

preference: This approach is efficient and straightforward, as it processes 
            the string in a single pass (O(n) time complexity).

complexity: Since each Roman numeral is processed only once, the solution 
            runs in O(n) time complexity, where 'n' is the length of the input string.

runtime: The execution is fast since it uses a simple loop and a hashmap lookup.
         Expected performance: O(n) time, O(1) space.
*/

import 'dart:developer';
import 'dart:io';

/// The main function is the entry point of the program.
/// It prompts the user to enter a Roman numeral, converts it to an integer,
/// and prints the result.
void main(List<String> arguments) {
  stdout.write("Enter Your Roman number: ");
  final rInput =
      stdin.readLineSync()?.toUpperCase() ?? ""; // Ensure uppercase input
  print("Integer Value: ${romanToInt(rInput)}");
}

/// Converts a Roman numeral string into its corresponding integer value.
int romanToInt(String s) {
  if (s.isEmpty) return 0;

  // Mapping of Roman numerals to their integer values
  final Map<String, int> rValues = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
  };

  int result = 0; // Store the final integer value
  int prevValue = 0; // Track the previous numeral's value

  // Traverse the string from right to left
  for (int i = s.length - 1; i >= 0; i--) {
    int currentValue = rValues[s[i]] ?? 0;
    log("$currentValue"); // Debug log

    // If the current value is smaller than the previous one, subtract it
    if (currentValue < prevValue) {
      result -= currentValue;
    } else {
      result += currentValue;
    }

    prevValue = currentValue; // Update previous value
  }

  return result;
}
