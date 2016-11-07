title: Wiki 框架调研
date: 2016-06-21 18:50:53
tags: [Wiki]
---

## 大型框架

### *全能但庞大*

### [Media Wiki](https://www.mediawiki.org/wiki/MediaWiki) (Demo: [萌娘百科](https://zh.moegirl.org/Mainpage), [WikiPedia](http://wikipedia.org))

#### 简要：

大型企业级框架，有些臃肿。Wikipedia就用了这个框架，不过可以在其基础上进行很大程度的自定义。主要基于PHP, MySQL。
<!--more-->
#### 优点：

- 提供了非常完整的一套框架体系， 运行环境要求很低,架设过程简洁,即使新手也可以迅速建立自己的站点 。
- 支持相当程度的自定义。
  - API
  - HOoks
  - Parser Functions
  - SKins
  - Special Pages
  - Tag Extension 
- 应用扩展制作简单：不需要修改PHP文件，PHP程序员可直接写扩展进行挂载，非常方便。
- 适合高配置高抗压：网站访问量越大、服务器配置越高越能体现Mediawiki性能，因为Mediawiki已经为程序准备好迎接高强度体验。
- mediawiki的功能非常丰富,支持多语言版本,充分满足知识站点的需要 。
- 有大量插件可以使用。
- 相当大的开发社区。
- 运用广，目前用的最多的wiki框架；并且在不停开发。
- **中文支持度非常好。**

#### 缺点：

- 低配置运行慢：Mediawiki很多功能都是为高访问量抗压设置，而如果只是文件缓存功能等，在低配置上和小访问量网站上会效果一般。
- 服务端兼容性不佳。
- 文章编辑代码有一些学习曲线，编辑新文章比较复杂；一般人不学习之前没法编辑。

#### 总结：

仍然是目前最好的框架，但是没有可视化编辑器（好像有插件可以解决此问题）。

### [XWiki](http://www.xwiki.org/xwiki/bin/view/Main/WebHome) ([Demo](http://www.xwiki.org/xwiki/bin/view/Roadmaps/))

#### 简要：

基于Java的开源框架。有10年以上的开发历史，有800多个插件。

#### 优点：

- 界面简洁，界面风格可配置性很强，无需在页面代码中书写配置脚本。
- 插入宏或者插件/链接等超级容易，简单易用。

#### 缺点：

- **中文支持度很差。**中文界面很差，搜索准确率很低。
- 许多配置功能都需要代码层面的调试。
- 无可视化编辑器。（对小白用户不友好）

#### 总结：

功能多但是相当难用，中文支持度还差不建议使用。

### [BitWeaver](http://www.bitweaver.org)

#### 简要：

和Media Wiki一样是个全能框架。基本该有的功能都有。

#### 优点：

- Wiki, Blog, Post什么的功能
- 非常简单的主题自定义。
- 强大的CSS功能。
- 安装比较简单。

#### 缺点：

- 据有些用户说相当慢。
- 还是没有可视化编辑器。
- 预加载的功能很多，需要手动关闭不需要并且会拖慢加载速度的功能。


## Markdown Based框架：

### *小型高速但功能受限*

### [Gitit](http://github.com/jgm/gitit) ([Demo Site](http://gitit.johnmacfarlane.net/))

#### 简要：

基于Haskell 和 Pandoc 的 Wiki。支持大量不同方式的输入。

#### 优点：

- 因为是基于Pandoc进行标记。所以支持大量标准的格式：Markdown. RST, LaTeX, etc
- Markdown集成了`TeXmath`, 有完善的数学公式支持。
- 简洁的界面。

#### 缺点：

- 无可视化编辑器。（对小白用户不友好）
- 框架较为简单，适合做简单的wiki，缺乏大型wiki的功能性。

#### 总结：

因为是留学百科似乎不需要这么多输入格式标准，不过markdown输入仍然算是相当友好的编辑方式。

### [Simiki](http://simiki.org) ([Demo](http://demo.simiki.org))

#### 简要：

基于Python的Wiki Framework。

#### 优点:

- Setup简单快捷。
- 能按Category归纳文档。
- 使用Markdown编辑。
- 页面结构模仿mediawiki，有这样的需求的话推荐Simiki。
- 提供CLI工具支持。

##### 缺点：

- 不提供搜索支持。可以尝试使用[微搜索](http://tinysou.com)等第三方服务进行站内搜索。


- 不详。

#### 总结：

纳入备选方案。

### [MDWIKI](http://dynalon.github.io/mdwiki/#!index.md) ([Demo](http://dynalon.github.io/mdwiki/#!index.md))

#### 简要：

基于JS的Wiki Framework.

#### 优点:

- 完全基于HTML5和JavaScript，无其他dependency 需求。
- 使用Markdown编辑。
- 基于BootStrap3和jQuery的跨浏览器支持和响应式布局。
- 页面简洁，和传统的wiki页面布局不太一样；但是我个人比较喜欢这种Manual风格。
- 提供BootStrap自订主题，并支持所有[Bootswatch](http://www.bootswatch.com/)主题。

#### 缺点：

- 不提供搜索支持。可以尝试使用[微搜索](http://tinysou.com)等第三方服务进行站内搜索。

- 不详。

#### 总结：

纳入备选方案。

### [Realms.io](http://realms.io)

#### 简要：

基于Python和NodeJS的Wiki Framework.

#### 优点:

- 完全基于HTML5和JavaScript，无其他dependency 需求。
- 使用Markdown编辑，并提供了内置编辑器（可以实时预览输出效果）。
- 基于BootStrap3和jQuery的跨浏览器支持和响应式布局。
- 页面风格比较码农风，好像目前还没有目录功能。。
- 提供合作功能。
- 提供历史记录。

#### 缺点：

- 不详。

#### 总结：

纳入备选方案。

### [Gollum](https://github.com/gollum/gollum)

#### 简要：

基于Git和Ruby的Wiki Framework，基本上就像一个git repo。

#### 优点:

- 支持2种markup语言：ROC和Markdown。
- 页面风格很有Github风格; Github 就用这个framework来维护他们的wiki功能。
- 提供多种hosting方式。
- 提供历史记录。
- 提供搜索。

#### 缺点：

- 不是静态，不过可能可以通过这个Package来解决：[gollum-site](https://github.com/dreverri/gollum-site)。

#### 总结：

纳入备选方案。



## 附录:

[符合要求的框架引擎比较](http://www.wikimatrix.org/compare/bitweaver%2BBlueSpice-for-MediaWiki%2BBoltWire%2BDokuWiki%2BFoswiki%2BGeniusWiki%2BJAMWiki%2BJSPWiki%2BMediaWiki%2BOddmuse%2BScrewTurn-Wiki%2BTiki-Wiki-CMS-Groupware%2BTracWiki%2BTWiki%2BWicked%2BWikyBlog%2BXWiki%2BZim)

