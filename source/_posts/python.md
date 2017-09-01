title: Python A Dummy Guide
date: 2016-02-22 16:36:53
tags: [Python, Tutorial]
categories: [Tutorial]
---

# A Dummy Guide to Python

## Day One: Complete Introduction

### What is Python?

Python is a language designed to write computer programs. You may or may not hear of many popular programming languages. For example, there is `C language [One of the hardest language to learn]` , `Java [which is insanely popular but also pretty hard]` , `Basic [the Language for beginners]` , and `JavaScript [Designed for web developing]`.
<!--more-->
### What kind of language is Python?

To start, we have to talk about programming language first. Any programming language is designed to tell the computer to do its job like downloading a mp3, editing text. However, the CPU inside the core of computer only recognizes machine code which is basically 1 and 0s. So, even though there are huge differences between different kinds of programming languages. They, eventually, have to be translated as machine code that could be executed by CPU. Different programming language requires different loads of code to be written.

For example, to write for the same task, maybe you have to write 1000 lines of `C` and 500 lines of`Java` but you only needs 100 lines of `Python`. So `Python` is a very high-level language. 

So you may ask, wow, only $\frac{1}{10}$lines of code written in C. Why don't we write everything in Python? However, with fewer lines of code, it requires more time to compute. For example, `C` program may only take 1s,` Java` 2s but `Python` may need 10s.

So is it to say that lower-level languages are easier and high level language are harder? Superficially yes! However, in very advance abstract computing, high-level Python is pretty hard to learn as well!

However, if we take those advance stuff out of the context. Then, yes, Python is easy to learn for beginners and it's very handy for small scripts. Giants like Google and Facebook use it everywhere as well.

So what you can do with Python exactly? You can write daily tasks like doing daily backup of your music library; you can write a website with it (Youtube is written largely in Python); you can make a backend of online games. In short, you can a lot with Python

### A Better Intro to Python

Python is developed by **Guido Van Possum** during Xmas 1989. And he built it just to pass time, being too bored at home for Xmas.

#### Application Language Python

There are around 600 programming languages; and the popular ones you can count are under 20. The most popular programming languages in last 10 years are shown in the diagram below:

![TIOBE RANKING](http://www.liaoxuefeng.com/files/attachments/00138595453161126cc9f11f1d441b0934661239528fa55000/0)

Overall, these programming languages have their own pros and cons. For example, `C` can be used to write operating system and other languages that work very closely with hardwares. `C` is suitable to build programs that are speed-hungry, trying to squeeze every last bit of hardware power. In contrast, Python is the high level language that is required to build application software. 

#### Libraries for High-level Languages like Python

When you are starting real software development, apart from writing codes, there are also a lot of elementary prewritten stuff for you to use, to speed up your development. For example, you were to write a email client, if you start from writing codes for the most low-level network protocols, you probably can't write any shit in a year or two. However, higher level languages are usually packaged with a library that provides all these features for you to use. For example, `SMTP library` for email protocols, `GUI library` for desktop environment. To build your application upon these, an adequate developer can write a simple email client in a few days. 

Python proves us with this very complete code library, it covers network, file, GUI, database, text and other whole lot of content and these are nicely called as "batteries included". For Python development, not everything has to start from scratch. You are more than welcome to what Python has for you. These libraries are usually very well written, commented and more efficient than your code if you were to write it on your own.

Apart from the built-in libraries, there are a lot of third-party libraries developed by other developers free for you to use. Of course, you can also write libraries for others to use.

#### What are Python suitable for?

When **Guido** develops Python, he defines it as "elegant", "precise" and "simple". So python programs looks very simple to understand but it also have the capacity to write for very complicated needs.

In short, python's philosophy is simple and elegant. Write fewer codes, write simpler codes. If someone is showing off his difficult and complicate code, laugh at him!

So what exactly are python suitable for?

1. Web apps. Including backend services and websites, etc
2. Many daily simple scripts that speed up your workflows.
3. Wrap around applications developed in other languages and make it easier to use.

Lastly, we will talk about python's shortcomings. 

1. Python is slow.
   Compared to `C`, python is very slow. Because python is a interpret language. Your code is translated to machine code line by line when your code is executing. This translation is very slow and time-consuming. C applications are pre-complied to machine code understandable by CPU before it can execute. So C is very fast.

   However, a lot of applications don't need to be fast. Because users can't feel the difference. For example, when you develop a application to download `mp3` , the C application may take 0.001s and the python application may take 0.01s, 10 times slower. However, Internet are slower, it requires 5 seconds. Can the user feel the difference between 5.001s and 5.01s? 

   It's like driving F1 race car in a traffic jam. Even though F1 cars can run at 400kph; because of the jam, it moves like a snail, slower than 20kph. Not better than taking a taxi which can only run maybe 100kph at best.

   ![speed no](http://www.liaoxuefeng.com/files/attachments/001386817301840d023640b45b844b99ab37e34106f2eaa000/0)

2. Python could not be encrypted.
   If you were to publish your python program, you are publishing its source code. This is very different from C. C doesn't require publishing source code for it to be executed. You only need to publish the compiled machine code (the `****.exe`) And it is very impossible for people to reverse engineer the source code from compiled machine code. 

   For all the compile language, there is no such a problem. For interpret language, you have to publish the source code.

   This shortcoming is only limited when you have to sell your software to others to make money. The good news is the Internet time is coming and selling license is less and less. More and more developers are selling services and this doesn't require them to give their source code to any one.

   Also, the open-source wave and the Internet spirit of free and open is everywhere over the Internet. There are countless beautiful codes like linux. The big companies who are reluctant to give their codes are often because their codes are so bad. If open-sourced, no one want to use their product any more.

   ![bad code](http://www.liaoxuefeng.com/files/attachments/0013868176293326466225daa824587bef6bb39c8683c2c000/0)

3. There are also some small shortcomings of python. But it's trivial and we won't count it in this course.

## Install Python

