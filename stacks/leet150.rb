require_relative "stack"


#  from LeetCode # 150:
#  https://leetcode.com/problems/evaluate-reverse-polish-notation/description/
#  Evaluate teh value of an arithmetic expression in Reverse Polish Notation.
#  Valid operators are +, -, *, /
#  Each operand may be an integer or another expression
#  Examples below

def reverse_polish_notation(arr)
  valid_ops = {
    "+" => :+,
    "-" => :-,
    "*" => :*,
    "/" => :/
  }


  stack = Stack.new()

  i = 0
  while i < arr.length()
    puts "looking at: #{arr[i]}"
    if !valid_ops[arr[i]]
      puts "pushing to stack"
      stack.push(arr[i].to_i)
    else
      puts "making operation"
      oper = valid_ops[arr[i]]
      first_val = stack.pop()
      second_val = stack.pop()
      puts "#{first_val} #{oper} #{second_val} = #{first_val.send(oper, second_val)}"
      stack.push(first_val.send(oper, second_val))
    end
    i += 1
  end

  return stack.pop()
end

# Example 1:
# Input: ["2", "1", "+", "3", "*"]
# Output: 9
# Explanation: ((2 + 1) * 3) = 9
ex1 = ["2", "1", "+", "3", "*"]
# expected output: 9
puts "example 1: "
puts reverse_polish_notation(ex1)

# Example 2:
# Input: ["4", "13", "5", "/", "+"]
# Output: 6
# Explanation: (4 + (13 / 5)) = 6
ex2 = ["4", "13", "5", "/", "+"]
# expected output: 6
puts "example 2: "
puts reverse_polish_notation(ex2)

# Example 3:
# Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "5", "+"]
# Output: 22
# Explanation:
#   ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
# = ((10 * (6 / (12 * -11))) + 17) + 5
# = ((10 * (6 / -132)) + 17) + 5
# = ((10 * 0) + 17) + 5
# = (0 + 17) + 5
# = 17 + 5
# = 22
ex3 = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "5", "+"]
# expected output: 22
puts "example 3: "
puts reverse_polish_notation(ex3)
