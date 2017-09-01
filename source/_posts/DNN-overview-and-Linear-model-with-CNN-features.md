---
title: Vgg Overview and Build a Linear Model with CNN Features
date: 2017-09-01 14:08:24
tags: [Deep Learning, Image Recognition, Vgg, Tutorial, Python, Linear Model, Maths]
categories: [Deep Learning]
mathjax: true
---

### Preface
In this article, I will go through some key maths background to understand DNN. As well as finetuning aka how to build a train a linear model on top of a existing image recogniton to our tasks.
This is a study note of [Fast.ai Lesson 2](http://course.fast.ai/lessons/lesson2.html) .

<!--more-->
### So what's magic happening in Lesson 1?

How can we just borrow the Vgg model, finetune it and it magically can distinguish cats vs dogs?

Let's start with how can Vgg recognize images. 

#### What is Vgg?

Vgg is basically a DNN that is trained upon the ImageNet which is enable to classify the input into one of the 1000 categories(It actually gives probas for each categories). How it's doing that? Although DNN is often time a black box, we can still understand parts of how it works following this [paper](https://arxiv.org/pdf/1311.2901.pdf). Generally, a Image Recognition DNN is consists of multiple layers of pattern from the very simple ones to complicated ones. The first layer might just be a gradient, a line, a diagonal, a curve, any small simple patterns like that. The second layer basically assembles patterns found in the first layer, it might recognize corner (just two connecting diagonal connected with a 90 degree angle), circule, oval now . The same logic follows on. For example, the model could identify human faces at level 5 or level 6.

Here is an image taken from the paper, first 5 layers is shown along with actual images where it found a match.

![layers of DNN](layers of DNN.png)

For example, Vgg has 16 layers.

### DNN

So how is Vgg doing that? No one is telling it about the patterns. This is done by the black box of DNN. 

A neural network is at its core a sequence of matrices that map an input vector to an output vector through matrix multiplication. The intermediate vectors in between each matrix are the activations, and the matrices themselves are the layers. Through a process we'll learn about called "fitting", our goal is to adjust the values of the matrices, which we call "weights", so that when our input vectors are passed into the neural network we are able to produce an output vector that is as close as possible to the true output vector, and we do this across multiple labeled input vectors. This is what makes up a training set.

Above, we started with randomly generated weights as our matrix elements. After performing all the operations and observing the outcome, notice how the activations output is significantly different than our target vector y. Our goal is to get as close to the target vector y as possible using some sort of *optimization algorithm*. Before using the optimization algorithm, it's suggested to start your weight values in a manner that makes the activations output at least relatively close to the target vector. This method is called *weight initialization*.

There are many weight initializers to choose from. In the lecture, Jeremy uses [Xavier Initialization](http://andyljones.tumblr.com/post/110998971763/an-explanation-of-xavier-initialization%7C) (also known as Glorot Initialization). However, it's important to note that most modern deep learning libraries will handle weight initialization for you.

### Loss Functions

So how are we minimizing this loss function? First we need to define a loss function, there are several popular loss functions. Here I will introduce *SVM(Support Vector Machine)* and *Softmax*.

####  SVM as Loss Function

#### SVM (Multiclass Support Vector Machine loss)

$$L_i = \sum_{j \ne y_i} max(0, s_j -s{y_i} + \Delta)$$

1. j for true label class
2. $ j \ne y_i$ for all incorrect class
3. $s_j$ for weight of the true label class and $s_{y_i}$ for weight of other incorrect class
4. $\Delta$ for tolerence of the difference
5. $max(0, -)$ aka hinge loss, people sometimes use squared hinge loss as $max(0, -)^2$ that penalizes violated margins more strongly. Usually linear hinge loss is good enough. 

In summary, the SVM loss function wants the score of the correct class $y_i$ to be larger than the incorrect class scores by at least by $\Delta$ (delta). If this is not the case, we will accumulate loss.

$i.e.$ The Multiclass Support Vector Machine "wants" the score of the correct class to be higher than all other scores by at least a margin of delta. 

#### Regularization for SVM

There is a problem with this SVM loss function is that there could multiple set of $W$ that satisfies (minimizing $L$ to 0). So we want to encode our $W$ to remove this ambiguity. A standard way is to extend the loss function with a regularization penalty $R(W)$. The most common scheme for regularization penalty is $L2$ norm that discourages large weights through an elementwise quadratic penalty over all parameters as shown below:

$$ R(W) = \sum_{k} \sum_{l} W_{k, l}^2$$

And thew new loss function $L$ now contains two parts: data loss (which is average loss $L_i$ over all samples$ and the regularization loss. That is the full Multiclass SVM loss: 

$$ L = \frac{1}{N} \sum_{i }L_{i} + \lambda R(W)$$

which can be expand to its full form as : $$ L = \frac{1}{N} \sum_{i } \sum_{j \ne y_i} max(0, f(x_i; W)_j -f(x_i; w)_{y_i} + \Delta) + \lambda \sum_{k} \sum_{l} W_{k, l}^2 $$ 

And this is able to improve the generalization performance at the end lead to less overfitting. As the $L2$ penalty prefers smaller and more diffuse weight vectors so the final classifier is encouraaged to take into acocunt all input dimensions to small amounts rather than a few input dimensions and very strongly.

### Refrence

- [Fast.ai Lesson 2](http://wiki.fast.ai/index.php/Lesson_2_Notes)
- [CS231n Convolutional Neural Networks for Visual Recognition](http://cs231n.github.io/)
- [Visualizing and Understanding Convolutional Networks](https://arxiv.org/abs/1311.2901)