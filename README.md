![](https://img-blog.csdnimg.cn/20211014152112852.png)

前端时间使用iOS技术编写了一个记事本APP，[github地址](https://github.com/ThinkerJack/android-ios-flutter_notepad)，https://github.com/ThinkerJack/android-ios-flutter_notepad。

# ios_notepad

## 1.项目简介

使用Swift编写的IOS APP，除了常规记事本的增删改查功能之外，加入了分组功能。

## 2.环境简介

语言：Swift 5.4

UI框架：UIKit

包管理工具：CocoaPods

布局框架：SnapKit 5.0.0

本地数据库管理库：GRDB.swift

## 3.项目截图

![](https://img-blog.csdnimg.cn/56b9067b42d64e0790bd8dce4755082a.png)![](https://img-blog.csdnimg.cn/b9eaa8f15e22495ba23a459167b9294c.png)

![](https://img-blog.csdnimg.cn/3f36ad8153c14385a00aba8fbce730ba.png)![](https://img-blog.csdnimg.cn/3474e1c07636435f88409bea199596d8.png)![](https://img-blog.csdnimg.cn/e4e83d9a8a43436d9bf1673cb3fef2f4.png)

## 4.代码逻辑简述

新建数据库管理类，编写创建数据库，创建分组数据表，在分组数据表进行增删的方法。

新建首页布局文件，数据为外部传入，使用协议将点击事件传递给调用者。在ViewController中调用数据库管理类，进行数据库和数据表的初始化，当点击事件发生时调用数据库管理类中的数据操作方法。

其余页面的逻辑与上述步骤一致。

## 5.技术准备

- [Swift基础语法](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)

- [UIKit使用](https://developer.apple.com/documentation/uikit/)

- [SnapKit使用](http://snapkit.io/docs/)

- [CocoaPods使用](https://cocoapods.org/)

  ```
  sudo gem install cocoapods
  pod init
  pod install
  ```

  M1 mac安装有[问题](https://github.com/CocoaPods/CocoaPods/issues/10723)

- [Swift中的协议](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

- [Swift中的闭包](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)

- [CRDB使用](https://github.com/groue/GRDB.swift)

## 6.总结

编写这个APP就是想巩固一下自己最近学习的IOS开发相关知识，此APP参考了一本有些过时的IOS书籍，虽然书上的很多API和现在已经大不相同，不过随着工作经验的增长，自己也成长为一个有些经验的端开发工程师，从最开始用JQuery,bootstrap写网页，到后面使用Angular，然后接触到Flutter，到现在自学的Android和IOS，对端开发一些常见的步骤都有了自己的认识，比如路由管理，页面布局，工程架构（mvc,mvp,mvvm），这个APP就是通过协议将View层中的逻辑部分暴露出来，逻辑全部交给controller处理，实现页面和逻辑的分层，网络请求，还有web一般不会用到但客户端很常用的本地存储，本地数据库等等。虽说不同的端具体的API上可能有变化，不过大体的思路都一致，凭借着这种思路和搜索引擎，还有看文档的习惯，还是把这个APP完整的做出来了。

正式参加工作已经两年了，从准备成为一名程序员到现在已经三年多了。从事编程工作以来，最让我感到庆幸的是编程绝不是一项无聊的工作，计算机世界的浩瀚，让普通人穷尽一生也只在一个细分的方向上探索到计算机科学的边界。我喜欢这份工作，因为他能让我的大脑不停的工作，让我总是能思考。虽然自己对编程谈不上多么的狂热，但是在工作和学习中还是能获得一些乐趣，这份乐趣也就成了自己不断学习的动力。

这两年换了两次工作，当一份工作和自己的目标发生冲突的时候，我就会重新找一份满足自己要求的，我发现自己很讨厌稳定，当一份工作没有挑战，成为机械式的重复之后，就会对这份工作丧失全部的热情和兴趣，失去兴趣之后真是一天也不想在做了，只想尽快逃离。想起面试的时候HR问我你觉得你的稳定性怎么样，现在想来，是工作能多大程度激发我的兴趣决定了我的稳定性。想想自己二十多年来，在学生时代一直都没能有什么成就，比较直观的就是没考一个好点的大学，现在想想自己对学校各个科目的兴趣总是很短暂，失去兴趣之后也就随便学学就行了。唯一感兴趣的是文学，可惜自己学的还是理科。

从事这份工作以来总是让我感到理想和现实的分裂，总是觉得工作没有和人生的终极目标发生联系很可惜。世界上哪有完美的事情呢，就算能从事理想中的工作，能不能满足基本的生存需要都是未知数，当我意识到无产阶级就是需要出卖自己的劳动力来换取生存条件的时候，我渐渐的可以接受这种分裂了。原来自己总想着三十岁就退休，逐渐了解实际情况后才发现劳动可能是一辈子的事情。劳动是光荣又伟大的，只是我有那么点不喜欢。

两年很快就过去了，虽然没有做到完美，现在想来这两年的时间我并没有荒废，虽然我不曾在两年之前订下过什么目标，但我觉得我对现在的自己还是比较满意的。其实一名程序员的成功标准是很难衡量的，工资高低？职位高低？技术水平？对开源社区的贡献？对计算机科学的贡献？每个人都有自己不同的答案，能做到让自己满意就极为难得了。

人生总是在追逐，在职业生涯上更是如此，有的时候对世俗意义上的成功不屑一顾，但大部分的时候还是朝着世俗意义上的成功努力，仿佛是在跟谁较劲，拼了命的证明自己，跟谁较劲呢？证明自己给谁看呢？这些问题或许都没有答案，但也是这些问题给了我不断前进的动力。

站在此刻，向着未来的人生望去，前面什么也看不到，未来唯一可以确定的就是他的不确定性，不过我还是希望我以后的工作内容是真正的为社会做贡献，帮助世界变的更好，最好能为祖国迈向共产主义贡献一份力量。期望毕竟是期望，如果没有那么一个美妙的机会让我达成这些目标，那我就想身体健康的多挣点钱。一份工作能不破坏我的健康，能让我有尊严的活着，能让我在工作之外的时间可以做自己想做的事情，幸甚至哉。

# 写在末尾

Android 和 Flutter 端的工程不打算写了，做同一种事情的工具掌握三种并没有什么意义，软件开发核心还是基础和流程，拒绝做API boy。

![](https://img-blog.csdnimg.cn/c66cc07b674c424ba11ec6825e22a640.png)

![](https://img-blog.csdnimg.cn/46f9ed15f914479ab130d47e9578e721.png)
