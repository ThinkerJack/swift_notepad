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

<img src="https://img-blog.csdnimg.cn/56b9067b42d64e0790bd8dce4755082a.png" style="zoom: 25%;" /><img src="https://img-blog.csdnimg.cn/b9eaa8f15e22495ba23a459167b9294c.png" style="zoom: 50%;" /><img src="https://img-blog.csdnimg.cn/3f36ad8153c14385a00aba8fbce730ba.png" style="zoom:50%;" /><img src="https://img-blog.csdnimg.cn/3474e1c07636435f88409bea199596d8.png" style="zoom:50%;" /><img src="https://img-blog.csdnimg.cn/e4e83d9a8a43436d9bf1673cb3fef2f4.png" style="zoom: 50%;" />

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

正式参加工作已经两年了，从准备加入程序员行列到现在已经三年多了，值得庆幸的是编程绝不是一项无聊的工作，计算机世界的浩瀚，让普通人穷尽一生只是在一个细分的方向上探索到计算机科学的边界。虽然自己对编程谈不上多么的狂热，不过在工作和学习中还是能获得一些乐趣，这份乐趣也就成了自己不断学习的动力。赶上了时代红利，拿到了远超平均水平的工资。做一份不令人讨厌的工作，领一份丰厚的薪水，还有什么不知足的呢。