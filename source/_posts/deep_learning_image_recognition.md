---
title: Fast.ai Overview and Image Recognition with DNN
date: 2017-09-01 01:18:22
tags: [Deep Learning, Image Recognition, Vgg, Tutorial, Python]
categories: [Deep Learning]
---

### Preface

{% cq %} More of a discussion of the way to teach {% endcq %}
<!--more-->

I have recently started learning machine learning, mainly following a popular book called [Hands-On Machine Learning with Scikit-Learn and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems](https://www.amazon.com/Hands-Machine-Learning-Scikit-Learn-TensorFlow/dp/1491962291/ref=sr_1_1?ie=UTF8&qid=1504254172&sr=8-1&keywords=hands+on+machine+learning+with+scikit+learn+and+tensorflow) by Aurélien Géron). 

It is a great book for a brief intro to the field of machine learning. I really recommend it if you are new and you want to have a taste of machine learning before you completely lose interest in a traditional academia approach. It is taught in a hands-on manner so you won't get bored following the examples and practices on the book. The author also published all the IPython notebooks on a github repo to help learning. 

Anyway, it's not really the focus here. Maybe I will write something about it if I have the time or energy. So I finished the first half of the book about machine learning with `scikitlearn` and I found the second half of the book to be really boring to follow through. The author switched his teaching style somehow and explained the material in a tedious academic approach (not that serious Maths but I got bored quickly). So I went on an adventure seeking something more hands-on and interesting and I found [Fast.ai](http://www.fast.ai/). 

It is a course originally developed for the Data Institute at UCSF by **Jeremy Howard** and **Rachel Thomas**. I looked around at their course website and it seemed pretty good to my needs. Every class is taught with a hands-on real world example. This should be it. 

And their overview video just shocked me. I thought it would be another overview video with an outrageous duration of 31 minutes. I was gonna skip thru it but I couldn't. I got so carried along that I dropped my sandwich. What they said literally resonated with me so deeply every word was ringing in my head. I couldn't agree more. 

What they basically said is that they think that the current common approach to teach machine learning is deeply flawed. It is taught in a way so it could remain in the world of the ivory tower. 

- *Is it useful to learn about all the nitty-gritty about Maths? Yes!* 
- **Is it necessary for everyone? HELL NO!**

Then they talk about this problem's origin. Jeremy believed that the problem is deeply rooted in our Maths education system. It is a system that designed to teach not to inspire. The teachers are trained to feed formula and equation to their students instead of picturing mathematics as an interesting and creative subject. I will skip the details here but you can read this amazing article: [A Mathematician’s Lament](https://www.maa.org/external_archive/devlin/LockhartsLament.pdf) by Paul Lockhart if you are interested in the discussion.

Jeremy also points out the traditional way of teaching mathematics has a big problem of giving tiny pieces to the students and they will have to wait until they have all the pieces to say "WOW! This is so interesting, now I know why I am learning all of those stuff!". Why not show them something amazing and they will be interested to learn more about the details instead of giving up halfway. 

So what he has in mind is to teach in the latter way, the interesting way. And this course is not for researchers in AI. It is designed to teach coders to use the AI tools for various purposes, really unleashing the power of it. He wants to give these tools to experts at other fields like biology, agriculture; so the experts can utilize the tool for much more pragmatic purposes. He gave two examples:

1. He built a Deep Learning Model that has a better precision of identifying tumors than a panel of radiologists in his recent endeavor.
2. Japanese farm owner used Deep Learning to classifying crops into different grades.

I have to take this course after watching this overview.

### Lesson 1

There is not much covered in lesson 1 really about Deep Learning, it is a general intro to all the tools and how to setup `Python`, `Jupyter`,  AWS p2 instances, etc. Afterwards is a brief intro about image recognition with `CNN(convolutional neural network)`.  

I learned about how to use a pre-existing model([Vgg](http://www.robots.ox.ac.uk/~vgg/research/very_deep/), winner of [ImageNet](http://www.image-net.org/) of 2014) to predict images and finetune the model to identify the task: tell if an image contains a cat v.s. a dog. And the homework is to get into the top 50% of Kaggle's [Dogs vs. Cats Redux: Kernels Edition Competition](https://www.kaggle.com/c/dogs-vs-cats-redux-kernels-edition). He also mentioned a few learning methods like "don't copy paste, write your own version".

For the details, check out the lesson and my copy of notes and homework: [L1 Notes](https://github.com/xingfanxia/learn_fast_ai/blob/master/Lesson%201%20Use%20Vgg%20for%20Image%20Recognition%20Tasks%20Active%20Recall.ipynb).

### Appendix

- You will find everything here: [Lesson 1 at Fast.ai](http://course.fast.ai/lessons/lesson1.html)
- **Jeremy Howard** was president and chief data scientist at **Kaggle**.
- **Rachel Thomas** has a math PhD from Duke and was selected by Forbes as one of [“20 Incredible Women Advancing AI Research.”](https://www.forbes.com/sites/mariyayao/2017/05/18/meet-20-incredible-women-advancing-a-i-research/#78336fa426f9)
- [A Mathematician’s Lament](https://www.maa.org/external_archive/devlin/LockhartsLament.pdf) by Paul Lockhart
- [My Learning Repo](https://github.com/xingfanxia/learn_fast_ai)

For the next blog, I will go thru the lesson 2 topics about `CNN`, maths of Deep Learning, and what is hidden in the `finetuning` of `Vgg`.
