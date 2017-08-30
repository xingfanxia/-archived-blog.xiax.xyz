title: technical interview practices
date: 2016-11-06 22:17:39
tags: [technical interview, Python]
---

### Arrays: Left Rotation

> A left rotation operation on an array of size  shifts each of the array's elements  unit to the left. For example, if  left rotations are performed on array , then the array would become . 
>
> Given an array of  integers and a number, , perform  left rotations on the array. Then print the updated array as a single line of space-separated integers.
>
> Problem at https://www.hackerrank.com/challenges/ctci-array-left-rotation

<!--more-->

```python
def array_left_rotation(a, n, k):
 # a for array, n for #(elements), k for shift
 return a[k:] + a[:k]
```
### Strings: Making Anagrams

> Problem at https://www.hackerrank.com/challenges/ctci-making-anagrams Alice is taking a cryptography class and finding anagrams to be very useful. We consider two strings to be anagrams of each other if the first string's letters can be rearranged to form the second string. In other words, both strings must contain the same exact letters in the same exact frequency For example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.
>
> Alice decides on an encryption scheme involving two large strings where encryption is dependent on the minimum number of character deletions required to make the two strings anagrams. Can you help her find this number?
>
> Given two strings, `a` and `b` , that may or may not be of the same length, determine the minimum number of character deletions required to make `a` and `b` anagrams. Any characters can be deleted from either of the strings.

```python
def deletion_needed_for_anagrams(word1, word2):
 #create an empty dictionary
 charMap = {}

 #loop through all letters in word1, count the frequency of each
 for c in word1:
     if c in charMap:
         charMap[c] = charMap[c]+1
     else:
         charMap[c] = 1

 deletions = 0

 #match with the letters in word2
 for c in word2:
     if c in charMap:
         if charMap[c] > 0: #common letters
             charMap[c] = charMap[c]-1
         else:              #count mismatch
             deletions = deletions+1
     else:
         deletions = deletions+1 #present only in word2
 
 #If there are more characters in first word, delete them
 for c in charMap:
     if charMap[c] > 0:
         deletions = deletions + charMap[c]
 
 return deletions
```
### Hash Tables: Ransom Note

> Problem at https://www.hackerrank.com/challenges/ctci-ransom-note
>
> A kidnapper wrote a ransom note but is worried it will be traced back to him. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-sensitive and he must use whole words available in the magazine, meaning he cannot use substrings or concatenation to create the words he needs.
>
> Given the words in the magazine and the words in the ransom note, print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.A kidnapper wrote a ransom note but is worried it will be traced back to him. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-sensitive and he must use whole words available in the magazine, meaning he cannot use substrings or concatenation to create the words he needs.
>
> Given the words in the magazine and the words in the ransom note, print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.

```python
def ransom_note(magazine, rasom):
    map = {}
    for word in magazine:
        if word in map:
            map[word] = map[word] + 1
        else:
            map[word] = 1
    for f in rasom:
        if (map[f] == 0):
            return False
        map[f] = map[f] - 1
    return True
```
### Linked Lists: Detect a Cycle

> Problem at https://www.hackerrank.com/challenges/ctci-linked-list-cycle
>
> Detect a cycle in a linked list. Note that the head pointer may be 'None' if the list is empty.

```python
"""
A Node is defined as: 
    class Node(object):
        def __init__(self, data = None, next_node = None):
            self.data = data
            self.next = next_node
"""

class Node(object):
    def __init__(self, data = None, next_node = None):
        self.data = data
        self.next = next_node
        
def has_cycle(head):
    cur = head
    ls = []
    while (cur.next is not None):
        if cur in ls:
            return True
        ls.append(cur)
        cur = cur.next
    return False

def has_cycle_better(head):
    d = dict()
    while (head is not None):
        if head.val in d:
            return d[head.val]
        else:
            d[head.val] = head
        head = head.next
```
### Stacks: Balanced Brackets

> Problem at https://www.hackerrank.com/challenges/ctci-balanced-brackets
>
> A bracket is considered to be any one of the following characters:`(`,` )`,` {`,` }`, `[`, or `]`.
>
> Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().
>
> A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].
>
> By this logic, we say a sequence of brackets is considered to be balanced if the following conditions are met:
>
> - It contains no unmatched brackets.
> - The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
>
> Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, print YES on a new line; otherwise, print NO on a new line.

```python
def is_matched(expression):
    dic = {'{':'}','[':']','(':')'}
    lst =[]
    for i in expression:
        if i in dic.keys():
            lst.append(dic[i])
        elif len(lst)>0 and i==lst[-1]:
            lst.pop()
        else: 
            return False
    return len(lst) == 0
```
### Implement A Queue using Two Stacks 

> Problem at https://www.hackerrank.com/challenges/ctci-balanced-brackets

```python
class MyQueue(object):
    def __init__(self):
        self.inbox =  []
        self.outbox = []
    
    def peek(self):
        if not self.outbox:
            while self.inbox:
                self.outbox.append(self.inbox.pop())
        return self.outbox[len(self.outbox)-1]
    
    def pop(self):
        if not self.outbox:
            while self.inbox:
                self.outbox.append(self.inbox.pop())
        return self.outbox.pop()
        
    def put(self, value):
        self.inbox.append(value)
```
### GCD

```python
def gcd(A, B):
      while B:
          A, B = B, A%B
      return A
# or
class Solution:
    # @param A : integer
    # @param B : integer
    # @return an integer
    def gcd(self, a, b):
        if (b == 0):
          return a
        else:
          return self.gcd(b, a%b)
```
### Find max depth of a tree

```python
# Definition for a  binary tree node
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

#Recursive
class Solution:
    # @param A : root node of tree
    # @return an integer
    def maxDepth(self, A):
        if A == None:
            return 0     
        return max(self.maxDepth(A.left), self.maxDepth(A.right)) + 1
    
#Iterative
class Solution:
    # @param root, a tree node
    # @return an integer
    def maxDepth(self, root):
        if root == None:
            return 0
        nodeStack = [root];
        depthStack = [1];
        maxDepth = 0;
        while len(nodeStack)>0:
            node = nodeStack.pop();
            depth = depthStack.pop();
            maxDepth = maxDepth if maxDepth > depth else depth
            if node.left != None:
                nodeStack.append(node.left)
                depthStack.append(depth+1)
            if node.right != None:
                nodeStack.append(node.right)
                depthStack.append(depth+1)
        return maxDepth
    
# Test
root = TreeNode(10)
five = TreeNode(5)
two = TreeNode(2)
four = TreeNode(4)
eight = TreeNode(8)

root.left = five
five.left = two
two.left = eight

root.right = four

sol = Solution()
print sol.maxDepth(root)
```
### Flatten a tree

```PYTHON
# Definition for a  binary tree node
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    # @param root, a tree node
    # @return nothing, do it in place
    def flatten(self, root):
        while root != None:
            if root.left != None:
                pre = root.left
                while pre.right != None:
                    pre = pre.right
                pre.right = root.right
                root.right = root.left
                root.left = None
            root = root.right
```
### Validate BST

```python
""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""

def check_binary_search_tree_(root):
    """
    :type root: TreeNode
    :rtype: bool
    """
    stack = []
    curr = root
    prev = None
    while curr or stack:
        while curr:
            stack.append(curr)
            curr = curr.left

        if stack:
            curr = stack.pop()
            if prev and curr.data <= prev.data:
                return False
            prev = curr
            curr = curr.right
    return True
```

### Tries

```python
# list_implementation
class Node(object):

    def __init__(self, char):
        self.char = char
        self.children = []
        self.words_count = 0

    def get_child(self, c):
        for child in self.children:
            if child.char == c:
                return child
        return None

class Trie(object):

    def __init__(self):
        self.root = Node("*") # token root char

    def add(self, word):
        current = self.root
        for i in word:
            next_node = current.get_child(i)
            if next_node is None:
                next_node = Node(i)
                current.children.append(next_node)
            next_node.words_count += 1
            current = next_node

    def find(self, word):
        current = self.root
        for i in word:
            next_node = current.get_child(i)
            if next_node is None:
                return 0
            current = next_node
        return current.words_count



n = int(input().strip())
tr = Trie()
for a0 in range(n):
    op, contact = input().strip().split(' ')
    if op == "add":
        tr.add(contact)
    elif op == "find":
        print(tr.find(contact))

# dictionary_implementation
class Node(object):

    def __init__(self, char):
        self.char = char
        self.children = {}
        self.words_count = 0

    def get_child(self, c):
        for child in self.children:
            if child.char == c:
                return child
        return None

class Trie(object):

    def __init__(self):
        self.root = Node("*") # token root char

    def add(self, word):
        current = self.root
        for i in word:
            if i not in current.children:
                current.children[i] = Node(i)
            current = current.children[i]
            current.words_count += 1
            

    def find(self, word):
        current = self.root
        for i in word:
            if i not in current.children:
                return 0
            current = current.children[i]
        return current.words_count



n = int(input().strip())
tr = Trie()
for a0 in range(n):
    op, contact = input().strip().split(' ')
    if op == "add":
        tr.add(contact)
    elif op == "find":
        print(tr.find(contact))
```

### Merge sort to count inversions

```python
def list_join(c,d):
    result = []
    global sortCounter

    for i in range(0,len(c)+len(d)):

        if not d:
            result.append(c.pop(0))
            continue

        if not c:
            result.append(d.pop(0))
            continue

        if c[0] <= d[0]:
            result.append(c.pop(0))
            continue

        if d[0] < c[0]:
            sortCounter += len(c)
            result.append(d.pop(0))
            continue

    return result

def merge_sort(a):
    if len(a) == 1:
        return a
    mid = int(len(a)/2)
    left, right = a[:mid], a[mid:]
    leftSorted, rightSorted = merge_sort(left), merge_sort(right)
    return list_join(leftSorted, rightSorted)

def count_inversions(a):
    global sortCounter 
    sortCounter = 0
    merge_sort(a)
    return sortCounter
```

### Regular Expression Matching

```python
# Implement regular expression matching with support for '.' and '*'.

# '.' Matches any single character.
# '*' Matches zero or more of the preceding element.

# The matching should cover the entire input string (not partial).

# The function prototype should be:
# bool isMatch(const char *s, const char *p)

# Some examples:
# isMatch("aa","a") → false
# isMatch("aa","aa") → true
# isMatch("aaa","aa") → false
# isMatch("aa", "a*") → true
# isMatch("aa", ".*") → true
# isMatch("ab", ".*") → true
# isMatch("aab", "c*a*b") → true

def isMatch(s,p):
    if not p:
        return not s           
    if p[-1]=='*':     
        if isMatch(s, p[:-2]):    
            return True               
        if s and (s[-1]==p[-2] or p[-2]=='.'):
            return isMatch(s[:-1], p)           
    else:
        if s and (s[-1]==p[-1] or p[-1]=='.'):
            return isMatch(s[:-1], p[:-1] )    
        else:
            return False
    return False

print(isMatch("aa","a")) #→ false
print(isMatch("aa","aa")) #→ true
print(isMatch("aaa","aa")) #→ false
print(isMatch("aa", "a*")) #→ true
print(isMatch("aa", ".*")) #→ true
print(isMatch("ab", ".*")) #→ true
print(isMatch("aab", "c*a*b")) #→ truea
```

### Sorting: Bubble Sort

```python
n = int(input().strip())
a = list(map(int, input().strip().split(' ')))

def bubble_sort(array):
    total_num = 0
    for i in range(len(array)):
        num_swaps = 0
        for j in range(len(array)-1):
            if a[j+1]<a[j]:
                temp = a[j]
                a[j] = a[j+1]
                a[j+1] = temp
                num_swaps += 1
                total_num += 1
        if (num_swaps == 0):
            break
    return total_num

num = bubble_sort(a)
print("Array is sorted in {} swaps.".format(num))
print("First Element:", a[0])
print("Last Element:", a[len(a)-1])
```

### Sorting: Comparator

```python
from functools import cmp_to_key
class Player:
    def __init__(self, name, score):
        self.name = name
        self.score = score
    def __repr__(self):
        return name + "  " + str(score)
    def comparator(a, b):
        if a.score < b.score:
            return 1
        if a.score > b.score:
            return -1
        if a.name < b.name:
            return -1
        if a.name > b.name:
            return 1
        return 0
n = int(input())
data = []
for i in range(n):
    name, score = input().split()
    score = int(score)
    player = Player(name, score)
    data.append(player)
    
data = sorted(data, key=cmp_to_key(Player.comparator))
for i in data:
    print(i.name, i.score)  
```

### Binary Search: Ice Cream Parlor

#### Binary Search Approach By AllisonP

```java
import java.util.*;

class IceCream implements Comparable{
    public int cost;
    public int id;

    public IceCream(int cost, int index) {
        this.cost = cost;
        this.id = index;
    }
    
    @Override
    public int compareTo(Object o) {
        IceCream iceCream = (IceCream) o;
        
        return this.cost - iceCream.cost;
    }

    @Override
    public boolean equals(Object o){
        IceCream iceCream = (IceCream) o;
        
        return iceCream.cost == this.cost;
    }
        
}

class Solution {
    public IceCream[] menu;
    public int n;
    public int m;
    
    public Solution(IceCream[] menu, int n, int m) {
        this.menu = menu;
        Arrays.sort(this.menu);
        this.n = n;
        this.m = m;
    }
    
    public int binarySearch(int min, int max, int search) {
        
        int middle = (min + max) >> 1;
        
        while(min <= max) {
            // Search value is found
            if( menu[middle].cost == search ) {
                if(max - min <= 1 ) {
                    return menu[middle].id;
                }
                
                // else, continue searching
                max = middle;
            }
            // Else, continue looking for search value
            else {
                if ( menu[middle].cost < search ) {
                    // Continue searching right
                    min = middle + 1;  
                }
                else {
                    // Continue searching left
                    max = middle - 1;
                }
            }
            
            // Set new middle at halfway point
            middle = (min + max) >> 1;
            
        } // END WHILE, first > last
        
        // No price matching 'search' exists in the menu
        return -1;
    }
    
    public void solve() {
        // Search menu for a valid pair of prices
        for(int i = 0; i < n - 1 ; i++) {
            // Set desired price that will match the cost at index i
            int search = m - menu[i].cost;

            // If search < menu[i], then no match exists for that cost because the menu array is sorted
            if(search >= menu[i].cost) {    
                
                // Search for the desired value starting at the first index to the right of the flavor at index i
                int index = binarySearch(i + 1, n - 1, search);

                // Index of valid second flavor was returned by binary search 
                if( index != -1 ) {
                    System.out.println( Math.min(menu[i].id, index) + " " + Math.max(menu[i].id, index));
                    break;
                }
                // Else, continue looping and check the next value.
            }
        }   
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
 
        int t = scanner.nextInt();
        while(t-- > 0) {       
            int m = scanner.nextInt();
            int n = scanner.nextInt(); 
            IceCream[] menu = new IceCream[n];
            
            // Fill flavor menu and sort
            for (int i = 0; i < n; i++) {
                menu[i] = new IceCream(scanner.nextInt(), i + 1);
            }
            
            Solution solution = new Solution(menu, n, m);
            solution.solve();
        }   
        scanner.close();
    }                       
}
```

#### Hash-Map Solution

```python
def flavors(m,a):
    prices = {}
    for idx, p in enumerate(a):
        if m-p in prices:
            return prices[m-p], idx
        prices[p] = idx
    return None

t = int(input().strip())
for a0 in range(t):
    m = int(input().strip())
    n = int(input().strip())
    a = list(map(int, input().strip().split(' ')))
    f1, f2 = flavors(m,a)
    print(f1+1, f2+1)
```

