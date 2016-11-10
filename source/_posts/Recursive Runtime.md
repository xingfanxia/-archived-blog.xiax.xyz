title: Recursive Runtime Study
date: 2016-11-09 18:27:47
tags: [Interview, Big O, Runtime, Recursion]

## Recursive Runtime

### Multiple Return Recursion 

```java
int func(int n) {
  if (n <= 1) {
    return 1;
  }
  return f(n-1) + f(n-1);
}
```

Take this function as an example, what's the runtime of this recursive function?

<!--more-->

| Level | \# of Nodes | In term of powers of 2 |
| ----- | ----------- | ---------------------- |
| 0     | 1           | $2^0$                  |
| 1     | 2           | $2^1$                  |
| 2     | 4           | $2^2$                  |
| 3     | 8           | $2^3$                  |
| 4     | 16          | $2^4$                  |

Looking at the call stack tree table, it is easy to derive $total = 2^0 + 2^1 + 2^2 + … + 2^n = 2^{n+1} -1 $ . Try to remember this pattern. When you have a recursive function that makes multiple calls, the runtime will often (but not always) look like $O(branch^{depth})$, where branches is the number of times each recursive call branches. In this case, this gives us $O(2^n$).

> As you may recall, the base of a log doesn't matter for big O since logs of di erent bases are only di erent by a constant factor. However, this does not apply to exponents. The base of an exponent does matter. Compare $2^n$ and $8^n$. If you expand $8^n$, you get $2^{3n}$, which equals $2^{2n} \times 2^n$. As you can see, $8^n$ and $2^n$ are different by a  factor of $2^{2n}$. That is very much not a constant factor!

The space complexity of this algorithm will be $O(N)$. Although we have $O(2^n)$ nodes in the tree total, only $O(N)$ exist at any given time. Therefore, we would only need to have $O(N)$ memory available.

### Recursion With Iteration

```java
void permutation(String str) {
  permutation(str, "")
}

void permutation(String str, String prefix) {
  if (str.length() == 0) {
    System.out.println(prefix);
  } else {
    for (int i = 0; i < str.length(); i++) {
      String rem = str.substring(0, i) + str.substring(i+1);
      permutation(rem, prefix+str.charAt(i));
    }
  }
}
```

How many times does permutation get called in its base case?

If we were to generate a `permutation`, then we would need to pick characters for each "slot". Suppose we had 7 characters in the string. In the first slot,we have 7 choices. Once we pick the letter there, we have 6choices for the next slot. (Note that this is 6 choices for each of the 7 choices earlier.) Then 5 choices for the next slot,and so on.

Therefore,the total number of options is $7 \times 6 \times 5 \times 4 \times 3 \times 2 \times 1$, which is also expressed as $7!$ (7 factorial).

This tells us that there are $n!$ permutations. Therefore, `permutation` is called $n!$ times in its base case(when `prefix` is the full `permutation`).

How many times does permutation get called before its base case?

But,of course,we also need to consider how many times lines 9 through 12 are hit. Picture a large call tree representing all the calls. There are $n!$ leaves, as shown above. Each leaf is attached to a path of length n.Therefore,we know there will be no more than $n \times n !$ nodes (function calls) in this tree.

How long does each function call take?

Executing line 7 takes O(n) time since each character needs to be printed.

Line 10 and line 11 will also take O(n) time combined,due to the string concatenation. Observe that the sum of the lengths of `rem`, `prefix`, and `str.charAt(i)` will always be n.

Each node in our call tree therefore corresponds to O(n) work.

What is the total runtime?

Since we are calling `permutation` $O(n \times n!) $ times (as an upper bound), and each one takes $O(n)$ time,the total runtime will not exceed $O(n^2 * n ! )$.

Through more complex mathematics,we can derive a tighter runtime equation (though not necessarily anice closed-form expression). This would almost certainly be beyond the scope of any normal interview.

### Optimize Recursion Runtime By Examining 3 Fibonacci Number Examples

#### Naive Example

```java
int fib(int n) {
  if (n <= 0) return 0;
  else if (n == 1) return 1;
  return fib(n-1) + fib(n-2);
}
```

We can use the earlier pattern we'd established for recursive calls: $O(branches^{depth})$. There are 2 branches per call,and we go as deep as N,therefore the runtime is $O(2^N)$

> Through some very complicated math,we can actually get a tighter runtime. The time is indeedexponential,but it's actually closer to $O(1. 6^N)$. The reason that it's not exactly $O(2^N)$ is that, at the bottom of the call stack,there is sometimes only one call. It turns out that a lot of the nodes are at the bottom (as is true in most trees), so this single versus double call actually makes a big difference. Saying $O(2^N)$ would suffice for the scope of an interview,though (and is still techni­cally correct, if you read the note about big theta on page 39). You might get "bonus points" if you can recognize that it'll actually be less than that.

Generally speaking, when you see an algorithm with multiple recursive calls, you're looking at exponential runtime.

#### Iteration Example

The  llowing code prints all Fibonacci numbers from Oto n. What is its time complexity?

```java
void allFib(int n) {
  for (int i = 0; i < n; i++) {
    System.out.println(i + ": " + fib(i));
  }
}

int fib(int n) {
  if (n <= 0) return 0;
  else if (n == 1) return 1;
  return fib(n-1) + fib(n-2);
}
```

Many people will rush to concluding that since `fib(n)` takes $O(2^n)$ time and it's called n times, then it's $O(n{ \times 2^n})$.

Not so fast. Can you  nd the error in the logic?

The error is that the n is changing. Yes, `fib(n)` takes $O(2^n)$ time, but it matters what that value of n is. Refer to the first example, the total amount of work is: $total = 2^0 + 2^1 + 2^2 + …v + 2^n = 2^{n+1} -1 $

Therefore, the runtime to compute the  first n Fibonacci numbers(using this terrible algorithm) is still $O(2^n)$.

### Optimized Example

The  llowing code prints all Fibonacci numbers from Oto n. However, this time, it stores (i.e., caches) previ­ously computed values in an integer array. If it has already been computed, it just returns the cache. What is its runtime?

```java
java allFib(int n) {
  int[] memo = new int[n + 1];
  for (int i = 0; i < n; i++) {
    System.out.println(i + ": " + fib(i, memo));
  }
}

int fib(int n, int[] memo) {
  if (n <= 0) return 0;
  else if (n == 1) return 1;
  else if (memo[n] > 0) return memo[n];
  
  memo[n] = fib(n-1, memo) + fib(n-2, memo);
  return memo[n];
}
```

Let's walk through what's going on:

```java
fib(l) -> return 1
fib(2)
	fib(l) -> return 1 
  	fib(0) -> return 0 
  	store 1 at memo[2]
fib(3)
	fib(2) -> lookup memo[2] -> return 1 
  	fib(l) -> return 1
	store 2 at memo[3]
fib(4)
	fib(3) -> lookup memo[3] -> return 2 
  	fib(2) -> lookup memo[2] -> return 1 
  	store 3 at memo[4]
fib(5)
	fib(4) -> lookup memo[4] -> return 3 
  	fib(3) -> lookup memo[3] -> return 2 
  	store 5 at memo[5]
...
```

At each call to `fib(i)`, we have already computed and stored the values for `fib(i-1)` and `fib(i-2)`.We just look up those values, sum them, store the new result, and return. This takes a constant amount oftime.

We're doing a constant amount of work N times, so this is $O(n)$ time.

==This technique, called `memoization`, is a very common one to optimize exponential time recursive algo­rithms.==







