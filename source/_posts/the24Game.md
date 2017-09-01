title: The 24 Game Solver Algorithm and Extensions - A Python Approach 24点算法及延伸 - 一个Python解法
date: 2016-07-01 19:52:36
tags: [Python, Algorithm, Tutorial]
categories: [Algorithm]
---

### Preword

Because I am going to teach at a coding summer camp to middle school kids in Changsha very soon. I have been searching for interesting projects for them to build so they can learn better. And this idea of building a solver for the 24 Game cross my mind. It is rather interesting and takes me actually a lot longer than I expect to finish it.  Probably won't give this to them; maybe as a optional challenge.

<!--more-->

### What is the 24 Game?

It is basically a Card game. It originates in China sometime last century.

> This Chinese game requires skill at mental arithmetic. It has been played in Shanghai at least since the 1960's and may have originated there, and it is also known in some other cities, for example in Qingdao and Guangzhou. Since the end of the 20th century it has also spread to some places in North America. The basic game for two players will be described first, followed by variations for a larger number of players and extra options.

Basically you are given a deck of poker cards and the Jokers are removed. You treat A~10 as 1~10 and J~K as 11~13, (in early versions only A~10 is included) and you have to do some calculations to the four card so the result equals 24. Only basic arithmetics are allowed (`+`, `-`, `*`, `/` and `( ) `) and each number can only be used once. For example if the four cards were 2, 3, 6, 9 then possible solutions would be `(9+6-3)×2=24`,  `(9-3)×(6-2)=24` or `(9×3)-(6÷2)=24`. Whoever can tell a correct equation first wins the round.

### The Algorithm

Was thinking of a iterative approach but code will be too ugly to read. Decide to do a recursive approach. Basically the thinking is to reduce the amount of numbers to calculate to two, so if the output equals 24 it is valid. Take 2 numbers each time and do the 4 operations to reduce to one number and eventually there will be only 2 numbers remaining. Theoretically, this should apply to any amount of numbers and any output to be calculated.

For example:

1. There are 4 numbers, take 2 of them and do some calculations so there will be 3 numbers remaining.
2. Now there are 3 numbers, do whatever operations so there will be only 2 numbers remaining.
3. If the 2 can get the output of 24, it is a valid equation; otherwise it is false.

### The Implementation 

```python
# The 24 Game Solver Python Version
# @author Xingfan Xia
import math

PRECISION = 1E-6
COUNT_OF_NUMBER = 4
NUMBER_TO_BE_CAL = 24
g_expression = []
g_number = []
#input
numInput = str(input('''enter the numbers you want to solve
Note: each number has to be separated by A SPACE
you can enter any numbers you like and any amount of it
'''))

#initialization
g_expression = numInput.split()
g_number = [0]*len(g_expression)
COUNT_OF_NUMBER = len(g_expression)
for i in range(len(g_expression)):
    g_number[i] = int(g_expression[i])

#recursive solver
def solve(n):
    if(1 == n):
        if(math.fabs(NUMBER_TO_BE_CAL - g_number[0]) < PRECISION):
            print("The answer is: " + g_expression[0] + " = 24")
            return True
        else:
            return False
    else:
        for i in range(0, n):
            for j in range(i+1, n):
                a = g_number[i]
                b = g_number[j]
                #**********************************
                #   Move the meaingful forward
                #   answer saved in [i]
                #   number[j]can just be overwritten by the last number
                #   *******************************
                g_number[j] = g_number[n - 1]
                expa = g_expression[i]
                expb = g_expression[j]
                g_expression[j] = g_expression[n - 1]
                # cal a+b
                g_expression[i] = '(' + expa + '+' + expb + ')'
                g_number[i] = a + b
                if ( solve(n - 1) ) :
                    return True

                # cal a-b
                g_expression[i] = '(' + expa + '-' + expb + ')'
                g_number[i] = a - b
                if ( solve(n - 1) ) :
                    return True

                # cal b-a
                g_expression[i] = '(' + expb + '-' + expa + ')'
                g_number[i] = b - a
                if ( solve(n - 1) ):
                    return True

                # cal (a*b)
                g_expression[i] = '(' + expa + '*' + expb + ')'
                g_number[i] = a * b
                if ( solve(n - 1) ):
                    return True

                # cal (a/b)
                if (b != 0) :
                    g_expression[i] = '(' + expa + '/' + expb + ')'
                    g_number[i] = a / b
                    if ( solve(n - 1) ) :
                        return True

                # cal (b/a)
                    if (a != 0) :
                        g_expression[i] = '(' + expb + '/' + expa + ')'
                        g_number[i] = b / a
                        if ( solve(n - 1) ):
                            return True

                 # resume and recursion
                g_number[i] = a
                g_number[j] = b
                g_expression[i] = expa
                g_expression[j] = expb
        return False
#main
if(not solve(COUNT_OF_NUMBER)):
    print('no solution')
```

### Sample Output

- 4 Numbers

  ```bash
  $python3 24Game.py
  enter the numbers you want to solve
  Note: each number has to be separated by A SPACE
  you can enter any numbers you like and any amount of it
  5 5 5 1
  The answer is: ((5-(1/5))*5) = 24
  ```

- More than 4 Numbers

  ```bash
  $python3 24Game.py
  enter the numbers you want to solve
  Note: each number has to be separated by A SPACE
  you can enter any numbers you like and any amount of it
  9 9 9 9 7 7 7 7 3 2 5 6 1 3 8
  The answer is: (((((((((((9+9)+8)+3)+1)+6)+5)+2)+3)+7)+7)/((9/(7-9))+7)) = 24
  ```

### Reference

[Rules of Twenty Four](https://www.pagat.com/adders/24.html)