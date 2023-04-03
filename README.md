# 基于Android《大学计算机应用基础》学习系统APP（可跨平台）

## 说明

1. 该项目仅仅是软件工程的毕业设计，仅供学习参考。**工作量不适用于按天计算的课设。直接照搬到毕设，准备延毕，起码换个名字、换个课程、2024年后再用，而且你答辩/写论文会比较难受，毕竟不是主流，如果是代做的大佬，建议不要害人。直接用来应付工作，准备辞职**。也不要找我帮忙答辩、汇报，~~就像我几天赶出来应付课设的快递管理系统，我自己都不清楚当时怎么瞎写的了~~。

2. 考虑到学习系统通常是需要跨平台的，而我也比较喜欢Qt框架，该系统是使用跨平台框架Qt进行开发的，也用到了Felgo SDK，**主要语言为C++、QML**，不是主流安卓应用开发方式，没有使用Java或者Kotlin。**如果你想找工作，不建议这样开发安卓应用，也不建议学安卓，更不建议学习Qt和Felgo**，~~尤其是在武汉这种地区，除非你想讨饭。~~

3. Qt、C++、Felgo都是自学的，有些部分还是边学边写，代码质量可能不太行或者不太规范，代码变化过大，中途还碰到了Felgo 3/Qt5/Qmake 到 Felgo 4/Qt6/Cmake的迁移。

5. 为什么用Felgo？省代码、QML热重载、有原生风格主题…

   <img src="./readmeResources/Felgo-Desktop.png" width="200" /><img src="./readmeResources/Felgo-Android.png" width="200" /><img src="./readmeResources/Felgo-IOS.png" width="200" />

   

   



## 构建/部署

1. 该设计的开发环境与服务端部署系统均为Arch Linux，其中部分资源放在了Apache HTTP 服务器，故需要安装并配置Apache HTTP 服务器，可见[ArchWiki](https://wiki.archlinuxcn.org/wiki/Apache_HTTP_%E6%9C%8D%E5%8A%A1%E5%99%A8)。不同 Linux发行版安装命令和包名可能有所不同，配置文件应该差不多，但配置文件中一定需要改的内容：

   `DocumentRoot "/srv/http"` 

   `<Directory "/srv/http">`

   若不能访问尝试更改目录权限，不建议换Apache HTTP的目录，因为需要改动的地方可能会比较多？

2. 修改局域网IPv4地址`192.168.1.244`。如果换IP地址，需要同时替换源码和数据库表内某些字段中的值。

   SQL语句如下：

   `update 表名 set 字段名 = replace(字段名,'192.168.244','新IP地址');`

3. 建表，验收后会传`.sql`文件上来，因为表结构可能会随着开发、测试进行来进行变动与完善。也可以按照服务端的实体类的属性类型进行建表。

4. 服务器端一定要使用Qt6.4以上，`QHttpServer`是自从6.4以后官方才提供的，且此模块处于"技术预览"状态。之前Qt5时，服务端与客户端一直使用的`QTcpServer`和`QTcpSocket`进行数据传输，迁移到Qt6后，后期大多数功能都使用了`QHttpServer`，编码起来也更加方便。

5. 如果构建安卓应用，运行直接崩溃，报错有关`__emutls_get_address`，更换`NDK r23b`。

## 主要功能

​	1. 功能验收/写毕业论文后再完善了，目前就瞎写点... 

​	2. 如果没记错的话，软件里的图片几乎都可以点击全屏打开，图片、文档、视频大部分也可以长按保存（不是全屏打开后长按，直接长按富文本或列表项），会有确认弹窗的。

​	**3. 考虑到数据会比较多，和论坛相关的所有功能列表都做了下拉刷新和触底加载，因此数据全部都是灌水的，毕竟要测试。**

​	**4. 测试用的号是我同学的，截图内出现的信息不是我的，不要骚扰他**，只是他的密码比较好记，大四了也不怎么用该平台，之前Uwzz开发时也一直用的他的号。

### 登录

#### 用户登录

​	点击触发，这里目前是用的XXT的账号登录，所以不提供注册功能。

<img src="./readmeResources/用户登录.png" alt="点击头像" width="200" />

#### 管理员登录

​	长按触发。

<img src="./readmeResources/管理员登录.png" alt="点击头像" width="200" />

### 管理员功能

#### 功能列表

<img src="./readmeResources/管理员功能列表.png" width="200" />

#### 添加题目

​	目前只支持3种题型。

<img src="./readmeResources/选择题录入.png"  width="200" /><img src="./readmeResources/判断题录入.png"  width="200" /><img src="./readmeResources/填空题录入.png" width="200" />

#### 查看、检索、编辑题目



<img src="./readmeResources/查看题目.png"  width="200" /><img src="./readmeResources/题目检索.png"  width="200" /><img src="./readmeResources/题目编辑.png"  width="200" />

#### 题库更新

​	会将旧题库放入historyquestions文件夹（暂时没任何作用，可以把源码中这段删除），生成新的currentQuestions.json于Http目录。

#### 帖子管理

​	管理员可以和用户一样浏览检索帖子和浏览评论，但会多一个删除操作。

#### 学习资源管理

​	原本没打算写这个功能的...这里面的查看和学习不同，是直接打开浏览器查看……

<img src="./readmeResources/学习资源管理功能列表.png"  width="200" /><img src="./readmeResources/资源录入.png"  width="200" /><img src="./readmeResources/资源录入2.png"  width="200" /><img src="./readmeResources/资源管理列表.png"  width="200" />

#### 评论管理

​	虽然帖子里查看详情也可以删评论，但是比较麻烦，感觉应该比较直观展示评论并删除比较好，才有这个功能。

​	而评论是分多级的，可以展开与收缩，可以单独操作，右上角可以一键操作，长按进行删除操作，检索可以检索多级的。

<img src="./readmeResources/查看评论.png"  width="200" /><img src="./readmeResources/查看评论展开.png"  width="200" />



### 学习

#### 功能列表

​	其中文档是外部打开，图片、视频、WEB可以选择外部打开或者内部打开，都可以进行保存。最后一项内部打开，具体功能理论上zz全部功能，并且更好用一些，不过实测某个功能有些人可能用不了，但我测试多次仍未排查出问题。

<img src="./readmeResources/课程学习功能列表.png"  width="200" />

#### 文档学习

​	学习时会直接外部打开。

<img src="./readmeResources/文档资源列表.png"  width="200" />

#### 图片学习

<img src="./readmeResources/图片资源列表.png"  width="200" /><img src="./readmeResources/图片学习.png"  width="200" /><img src="./readmeResources/图片点击打开.png"  width="200" />

#### 视频学习

​	手机横屏时自动全屏，Qt应用似乎不受锁定方向影响？

​	可以倍速、拖进度条、暂停、长按保存操作。最近换用Wayland，Genymotion模拟器窗口显示有些问题。

​	PC端视频可能碰到不能直接解码的情况，`yay -S gstreamer gst-libav gst-plugins-good gst-plugins-bad gst-plugins-ugly`

<img src="./readmeResources/视频资源列表.png"  width="200" /><img src="./readmeResources/视频学习竖屏.png"  width="200" />

<img src="./readmeResources/视频学习.png"  width="600" />

#### WEB学习

<img src="./readmeResources/web资源列表.png"  width="200" /><img src="./readmeResources/web学习-内部打开.png"  width="200" />

#### XXT学习

功能见Uwzz

### 练习

​	主页会更新练习情况。

#### 功能列表

<img src="./readmeResources/练习功能列表.png"  width="200" />

#### 刷题

<img src="./readmeResources/刷题记录.png"  width="200" /><img src="./readmeResources/刷题正确.png"  width="200" /><img src="./readmeResources/刷题错误.png"  width="200" /><img src="./readmeResources/主页2.png"  width="200" />

#### 历史错题

​	列表与刷题差不多，不过只收录了错题。错题的右上角点击后可以移出历史错题列。

<img src="./readmeResources/错题可移出.png"  width="200" />

#### 模拟考试

<img src="./readmeResources/模拟考试题量设置.png"  height="330" /><img src="./readmeResources/交卷界面.png"  width="200" /><img src="./readmeResources/得分界面.png"  width="200" /><img src="./readmeResources/主页1.png"  width="200" />

<img src="./readmeResources/考试记录.png"  width="200" /><img src="./readmeResources/浏览考试情况-对题.png"  width="200" /><img src="./readmeResources/浏览考试情况-错题.png"  width="200" />

### 论坛

#### 功能列表

<img src="./readmeResources/论坛功能列表.png"  width="200" />

#### 发帖

​	帖子支持富文本，评论不支持富文本。

<img src="./readmeResources/发帖.png"  width="200" />

#### 看贴

<img src="./readmeResources/帖子列表1.png"  width="200" /><img src="./readmeResources/帖子列表2.png"  width="200" /><img src="./readmeResources/帖子筛选.png"  width="200" /><img src="./readmeResources/帖子检索.png"  width="200" />

#### 详情、回帖

<img src="./readmeResources/评论界面.png"  width="200" />

### 同步功能

<img src="./readmeResources/主页3.png"  width="200" />

### 其他

可能要大改？感觉功能有点少，但又不知道加什么。



