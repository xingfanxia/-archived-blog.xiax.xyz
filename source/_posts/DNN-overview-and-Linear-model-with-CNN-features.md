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

$$ L_i = \sum_{j \ne y_i} max(0, s_j -s{y_i} + \Delta) $$

1. j for true label class
2. $ j \ne y_i$ for all incorrect class
3. $s_j$ for weight of the true label class
4. $s_{y_i}$ for weight of other incorrect class
4. $\Delta$ for tolerence of the difference
5. $max(0, -)$ aka hinge loss, people sometimes use squared hinge loss as $max(0, -)^2$ that penalizes violated margins more strongly. Usually linear hinge loss is good enough. 

In summary, the SVM loss function wants the score of the correct class $y_i$ to be larger than the incorrect class scores by at least by $\Delta$ (delta). If this is not the case, we will accumulate loss.

$i.e.$ The Multiclass Support Vector Machine "wants" the score of the correct class to be higher than all other scores by at least a margin of delta. 

#### Regularization for SVM

There is a problem with this SVM loss function is that there could multiple set of $W$ that satisfies (minimizing $L$ to 0). So we want to encode our $W$ to remove this ambiguity. A standard way is to extend the loss function with a regularization penalty $R(W)$. The most common scheme for regularization penalty is $L2$ norm that discourages large weights through an elementwise quadratic penalty over all parameters as shown below:

$$ R(W) = \sum_{k} \sum_{l} W_{k, l}^2 $$

And thew new loss function $L$ now contains two parts: data loss (which is average loss $L_i$ over all samples$ and the regularization loss. That is the full Multiclass SVM loss: 

$$ L = \frac{1}{N} \sum_{i }L_{i} + \lambda R(W) $$

which can be expand to its full form as : 

$$ L = \frac{1}{N} \sum_{i } \sum_{j \ne y_i} max(0, f(x_i; W)_j -f(x_i; w)_{y_i} + \Delta) + \lambda \sum_{k} \sum_{l} W_{k, l}^2 $$ 

And this is able to improve the generalization performance at the end lead to less overfitting. As the $L2$ penalty prefers smaller and more diffuse weight vectors so the final classifier is encouraaged to take into acocunt all input dimensions to small amounts rather than a few input dimensions and very strongly.
### Softmax as Loss Function

In a softmax classifier, the function mapping $ f(x_i; W) = W_{x_i} $ is unchanged, but it interprets these scores as unnormalized log porbabilities for each class and replace the hinge loss with corss-entrophy loss in the following form: 

$$ L_i =  -log \left(\frac{e^{f_i}}{\sum_j e^{f_j}} \right) $$

1. $f_j$ is the $j_th$ element of the vector of class scores $f$.
2. $\frac{e^{f_i}}{\sum_j e^{f_j}}$ is the **softmax** function, it takes over a vector of arbitrary real-valued scores and squashes it to a vector of values between zero and one that sum to one.

### Optimization with SGD

So with loss function, we are able to build the correlation that 

$$Better\, Prediction = Minimizing \, Loss \, Function$$

So our goal of **optimization** is to find $W$ which minimizes the loss function. 

#### Strategy 1: A very bad solution: **Random Search**
**What should we do?**
{% cq %} Core idea: iterative refinement. {% endcq %}
Of course, it turns out that we can do much better than this random search. The core idea is that finding the best set of weights W is a very difficult or even impossible problem (especially once W contains weights for entire complex neural networks), but the problem of refining a specific set of weights W to be slightly better is significantly less difficult. In other words, our approach will be to start with a random W and then iteratively refine it, making it slightly better each time.
```python
bestloss = float("inf") # Python assigns the highest possible float value
for num in xrange(1000):
    W = np.random.randn(10, 3073) * 0.0001 # generate random parameters
    loss = L(X_train, Y_train, W) # get the loss over the entire training set
    if loss < bestloss: # keep track of the best solution
        bestloss = loss
        bestW = W
    print 'in attempt %d the loss was %f, best %f' % (num, loss, bestloss)
```

#### Strategy 2: **Random Local Search** (Slightly Better)
So a little better solution is:
1. Do the same random search 
2. but only proceed if less loss.

```python
W = np.random.randn(10, 3073) * 0.001 # generate random starting W
bestloss = float("inf")
for i in xrange(1000):
    step_size = 0.0001
    Wtry = W + np.random.randn(10, 3073) * step_size
    loss = L(Xtr_cols, Ytr, Wtry)
    if loss < bestloss:
        W = Wtry
        bestloss = loss
        print 'iter %d loss is %f' % (i, bestloss)
```

#### Strategy 3: Following the **Gradient**

It turns out that there is no need to randomly search for a good direction: we can compute the best direction along which we should change our weight vector that is mathematically guaranteed to be the direction of the steepest descend (at least in the limit as the step size goes towards zero). This direction will be related to the **gradient** of the loss function. 

In our hiking analogy, this approach roughly corresponds to feeling the slope of the hill below our feet and stepping down the direction that feels steepest.

**Computing the Gradient**

There are two ways of computing gradient:
1. Numerical Gradient
```python
def eval_numerical_gradient(f, x):
    """ 
    a naive implementation of numerical gradient of f at x 
    - f should be a function that takes a single argument
    - x is the point (numpy array) to evaluate the gradient at
    """ 

    fx = f(x) # evaluate function value at original point
    grad = np.zeros(x.shape)
    h = 0.00001

    # iterate over all indexes in x
    it = np.nditer(x, flags=['multi_index'], op_flags=['readwrite'])
    while not it.finished:
nction at x+h
        ix = it.multi_index
        old_value = x[ix]
        x[ix] = old_value + h # increment by h
        fxh = f(x) # evalute f(x + h)
        x[ix] = old_value # restore to previous value (very important!)

        # compute the partial derivative
        grad[ix] = (fxh - fx) / h # the slope
        it.iternext() # step to next dimension

        return grad
    
def CIFAR10_loss_fun(W):
    return L(X_train, Y_train, W)

W = np.random.rand(10, 3073) * 0.001 # random weight vector
df = eval_numerical_gradient(CIFAR10_loss_fun, W) # get the gradient

loss_original = CIFAR10_loss_fun(W) # the original loss
print 'original loss: %f' % (loss_original, )

for step_size_log in [-10, -9, -8, -7, -6, -5,-4,-3,-2,-1]:
    step_size = 10 ** step_size_log
    W_new = W - step_size * df # new position in the weight space
    loss_new = CIFAR10_loss_fun(W_new)
    print 'for step size %f new loss: %f' % (step_size, loss_new)
```

2. Analytic Gradient
Because of the fact numerical gradient are expensive to compute for datasets with millions of features which is very common for DNNs. ( Because each step needs to compute the gradient for each feature, so it is linear complexity).

We normally use the other option: **analytic gradient**.

In which we use a direct formula for the gradient which is way faster to compute.
Suppose we have the SVM loss function for a single data point as follows:

$$ L_i = \sum_{j \ne y_i} [max(0, w_j^Tx_i - w_{y_i}^Tx_i + \Delta)]$$

And we can differentiate the function w/ respect to weights $W$. $e.g.$, taking the gradient with respect to $w_{y_i}$ we can obtain:

$$ \nabla_{w_j}  L_i = - \left( \sum_{j \ne y_i}  \mathbb{1} (w_j^Tx_i - w_{y_i}^Tx_i + \Delta > 0) \right) x_i$$

where $\mathbb{1}$ is the indicator function which
1. if the condition inside is true, it evals to 1
2. if false, it evals to 0

The function looks confusing but at its essence, it is equivalent to:

Count the number of classes that didn't meet the desired margin $\Delta$ and scale the data vector $x_i$ by this margin. And the result is the gradient.

### Gradient Descent
Now we can compute the gradient of the loss function, the procedure of repeatedly evaluating the gradient and then performing a parameter update is called *Gradient Descent*. A vanilla version looks like this:
```python
while True:
    weights_grad = evaluate_gradient(loss_fun, data, weights)
    weights += - step_size * weights_grad #
```
**This simple loop is the core of every nueural network libs. **
There are a few different methods of gradient descent:
1. Batch Gradient Descent
2. Mini-Batch Gradient Descent
3. Stochastic Gradietn Descent

** Mini-Batch Gradient Descent ** is the mostly used one and often refered as **SGD**. It takes a random batch of (32, 64, 128, 256) arbitrary number of samples and compute gradient descent on it and update the parameters(weights) every time. A vanilla version looks like this:

```python
while True:
    data_batch = sample_training_data(data, 256) # sample 256 examples
    weights_grad = evaluate_gradient(loss_fun, data_batch, weights)
    weights += - step_size * weights_grad # perform parameter update
```

### Backpropagation (Gradient Descent using reverse-mode autodiff)
An ANN(MLP, multi-layer perceptron) is composed of a input layer and n (n $\geq$ 1) hidden layers and one final layer. Every layer except the output layer includes a bias neuron and is fully connected to next layer. When an ANN has $\geq$ 2 hidden layers, it is called a DNN.

But for years people struggle to find a way to train DNN uintil backpropagation.

For each trainning instance, the algorithm feeds it to the network and computes the output of every neuron in each consecutive layer. (Known as the forward pass). Then it measures the ouput error of the network and it computes how much each neuron in hte last hidden layer contributed to each output neuron's error. It then proceeds to measure how much of these error contributions comes from the previous hidden layer. And this logic carries on until the algorithm reaches the input layer. 

Eventually, this reverse pass efficently measures the error gradient accross all the connection wieghts in the DNN by propagating the error gradient backward in the network. 

In short, for each training instance the backpropagation algorithm first makes a prediction by some scheme (**the forward pass**). Then it measures the error of this prediction then goes through each layer in each layer in reverse order to measure the error contribution from each connection (**the reverse pass**). And slightly tweaks the connection weights to reduce the error (**Gradient Dscent step**). 

The Math details is skipped here, for details checkout here: [Back Propagation](http://cs231n.github.io/optimization-2/).

### Refrence

- [Fast.ai Lesson 2](http://wiki.fast.ai/index.php/Lesson_2_Notes)
- [CS231n Convolutional Neural Networks for Visual Recognition](http://cs231n.github.io/)
- [Visualizing and Understanding Convolutional Networks](https://arxiv.org/abs/1311.2901)