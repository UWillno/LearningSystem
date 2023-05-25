/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : learning

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 25/05/2023 12:09:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '已加密 ',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('uwillno', 'nrd7CXIMKrkZH7VtgLKUKWBYM3SLMUvPpyT/MGKvgP4=');

-- ----------------------------
-- Table structure for choice_questions
-- ----------------------------
DROP TABLE IF EXISTS `choice_questions`;
CREATE TABLE `choice_questions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option4` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of choice_questions
-- ----------------------------
INSERT INTO `choice_questions` VALUES (1, '以下不属于电子数字计算机特点的是_____', '运算快速', '计算精度高', '形状粗笨', '通用性强', 'C');
INSERT INTO `choice_questions` VALUES (2, '______领域是计算机应用中最诱人、也是难度大且目前研究最为活跃的领域之一。', '辅助设计', '信息处理', '人工智能', '过程控制', 'C');
INSERT INTO `choice_questions` VALUES (3, '在计算机领域，信息是经过转化而成为计算机能够处理的______。', '数据', '符号', '图形', '数字', 'A');
INSERT INTO `choice_questions` VALUES (4, '可被计算机直接执行的程序由（ ）语言编写的程序', '机器', '汇编', '高级', '网络', 'A');
INSERT INTO `choice_questions` VALUES (5, '扩展名为.MOV的文件通常是一个（　　）。', '音频文件', '视频文件', '图片文件', '文本文件', 'B');
INSERT INTO `choice_questions` VALUES (6, '用以太网形式构成的局域网，其拓扑结构为', '环型', '总线型', '星型', '树型', 'B');
INSERT INTO `choice_questions` VALUES (7, '完整的计算机系统由（　　）组成。', '运算器、控制器、存储器、输入设备和输出设备', '主机和外部设备', '硬件系统和软件系统', '主机箱、显示器、键盘、鼠标、打印机', 'A');
INSERT INTO `choice_questions` VALUES (8, '以下软件中，（　　）不是操作系统软件。', 'Windows xp', 'unix', 'linux', 'microsoft office', 'D');
INSERT INTO `choice_questions` VALUES (9, '用一个字节最多能编出（ ）不同的码。', '8个', '16个', '128个', '256个', 'D');
INSERT INTO `choice_questions` VALUES (10, '任何程序都必须加载到（ ）中才能被CPU执行', '磁盘', '硬盘', '内存', '外存', 'C');
INSERT INTO `choice_questions` VALUES (11, '下列设备中，属于输出设备的是', '显示器', '键盘', '鼠标', '手字板', 'A');
INSERT INTO `choice_questions` VALUES (12, '计算机信息计量单位中的K代表', '102', '210', '103', '28', 'B');
INSERT INTO `choice_questions` VALUES (13, 'RAM代表的是', '只读存储器', '高速缓存器', '随机存储器', '软盘存储器', 'C');
INSERT INTO `choice_questions` VALUES (14, '组成计算机的CPU的两大部件是', '运算器和控制器', '控制器和寄存器', '运算器和内存', '控制器和内存', 'A');
INSERT INTO `choice_questions` VALUES (15, '在描述信息传输中bps表示的是', '每秒传输的字节数', '每秒传输的指令数', '每秒传输的字数', '每秒传输的位数', 'D');
INSERT INTO `choice_questions` VALUES (16, '微型计算机的内存容量主要指（　 ）的容量', 'RAM', 'ROM', 'CMOS', 'Cache', 'A');
INSERT INTO `choice_questions` VALUES (17, '十进制数27对应的二进制数为', '1011', '1100', '10111', '11011', 'D');
INSERT INTO `choice_questions` VALUES (18, 'Windows的目录结构采用的是', '树形结构', '线形结构', '层次结构', '网状结构', 'A');
INSERT INTO `choice_questions` VALUES (19, '将回收站中的文件还原时，被还原的文件将回到', '桌面上', '“我的文档”中', '内存中', '被删除的位置', 'D');
INSERT INTO `choice_questions` VALUES (20, '在Windows 的窗口菜单中，若某命令项后面有向右的黑三角，则表示该命令项', '有下级子菜单', '单击鼠标可直接执行', '双击鼠标可直接执行', '右击鼠标可直接执行', 'A');
INSERT INTO `choice_questions` VALUES (21, '计算机的三类总线中，不包括', '控制总线', '地址总线', '传输总线', '数据总线', 'C');
INSERT INTO `choice_questions` VALUES (22, '操作系统按其功能关系分为系统层、管理层和（　　）三个层次。', '数据层', '逻辑层', '用户层', '应用层', 'D');
INSERT INTO `choice_questions` VALUES (23, '汉字的拼音输入码属于汉字的', '外码', '内码', 'ASCII码', '标准码', 'A');
INSERT INTO `choice_questions` VALUES (24, 'Windows的剪贴板是用于临时存放信息的', '一个窗口', '一个文件夹', '一块内存区间', '一块磁盘区间', 'C');
INSERT INTO `choice_questions` VALUES (25, '对处于还原状态的Windows应用程序窗口，不能实现的操作是', '最小化', '最大化', '移动', '旋转', 'D');
INSERT INTO `choice_questions` VALUES (26, '在计算机上插U盘的接口通常是（  ）标准接口。', 'UPS', 'USP', 'UBS', 'USB', 'D');
INSERT INTO `choice_questions` VALUES (27, '新建文档时，Word默认的字体和字号分别是', '黑体、3号', '楷体、4号', '宋体、5号', '仿宋、6号', 'C');
INSERT INTO `choice_questions` VALUES (28, '第一次保存Word文档时，系统将打开（ ）对话框。', '保存', '另存为', '新建', '关闭', 'B');
INSERT INTO `choice_questions` VALUES (29, '在Word表格中，位于第三行第四列的单元格名称是', '3∶4', '4∶3', 'D3', 'C4', 'C');
INSERT INTO `choice_questions` VALUES (30, 'Word编辑文档时，所见即所得的视图是', '普通视图', '页面视图', '大纲视图', 'Web视图', 'B');
INSERT INTO `choice_questions` VALUES (31, '新建的Excel工作簿中默认有（ ）张工作表。', '2', '3', '4', '5', 'B');
INSERT INTO `choice_questions` VALUES (32, '在Excel工作表的单元格中计算一组数据后出现########，这是由于（ ）所致。', '单元格显示宽度不够', '计算数据出错', '计算机公式出错', '数据格式出错', 'A');
INSERT INTO `choice_questions` VALUES (33, '若在Excel的同一单元格中输入的文本有两个段落，则在第一段落输完后应使用', 'Enter', 'Ctrl+Enter', 'Alt+Enter', 'Shift+Enter', 'C');
INSERT INTO `choice_questions` VALUES (34, '用PowerPoint制作的演示文稿默认的扩展名是', '.pwp', '.ppt', '.ppn', '.pop', 'B');
INSERT INTO `choice_questions` VALUES (35, '算法的基本结构中不包括', '逻辑结构', '选择结构', '循环结构', '顺序结构', 'A');
INSERT INTO `choice_questions` VALUES (36, '用C语言编写的程序需要用（  ）程序翻译后计算机才能识别。', '汇编', '编译', '解释', '连接', 'B');
INSERT INTO `choice_questions` VALUES (37, '可被计算机直接执行的程序由（  ）语言编写的程序。', '机器', '汇编', '高级', '网络', 'A');
INSERT INTO `choice_questions` VALUES (38, '关系数据库中的数据逻辑结构是', '层次结构', '树形结构', '网状结构', '二维表格', 'D');
INSERT INTO `choice_questions` VALUES (39, '用以太网形式构成的局域网，其拓扑结构为（　　）', '环型', '总线型', '星型', '树型', 'B');
INSERT INTO `choice_questions` VALUES (40, '在Internet中的IP地址由（　　）位二进制数组成。', '8', '16', '32', '64', 'C');
INSERT INTO `choice_questions` VALUES (41, '在IE地址栏输入的“http://www.cqu.edu.cn/”中，http代表的是', '协议', '主机', '地址', '资源', 'A');
INSERT INTO `choice_questions` VALUES (42, '在Internet上用于收发电子邮件的协议是', 'TCP/IP', 'IPX/SPX', 'POP3/SMTP', 'NetBEUI', 'C');
INSERT INTO `choice_questions` VALUES (43, '在Internet上广泛使用的WWW是一种', '浏览服务模式', '网络主机', '网络服务器', '网络模式', 'A');
INSERT INTO `choice_questions` VALUES (44, '对同一幅照片采用以下格式存储时，占用存储空间最大的格式是', '.JPG', '.TIF', '.BMP', '.GIF', 'C');
INSERT INTO `choice_questions` VALUES (45, '扩展名为.MOV的文件通常是一个（　　）。', '音频文件', '视频文件', '图片文件', '文本文件', 'B');
INSERT INTO `choice_questions` VALUES (46, '从本质上讲，计算机病毒是一种', '细菌', '文本', '程序', '微生物', 'C');
INSERT INTO `choice_questions` VALUES (47, '用户通过拨号连入Internet，通常需从______处申请上网帐号。', 'PPP', 'ISP', 'SLIP', 'SLPI', 'B');
INSERT INTO `choice_questions` VALUES (48, 'IP地址132.166.64.10中，代表网络号的部分是______。', '132', '132.166', '132.166.64', '132.166.64', 'B');
INSERT INTO `choice_questions` VALUES (49, '内置调制解调器在使用时占用PC机的______。', '串行口', '并行口', '打印机端口', 'USB', 'A');
INSERT INTO `choice_questions` VALUES (50, '以下关于域名系统不正确的描述是______。', '域名系统实际上是一个分布式的信息数据库', '域名系统采用客户机/服务器方式工作', '在域名系统中，每个域名对应一个IP地址，且每个IP地址都有一个域名与之对应', '一个IP地址可以对应几个域名', 'C');
INSERT INTO `choice_questions` VALUES (51, '以下不是杀毒软件的是_____。', '瑞星', '系统磁盘清理程序', '诺顿', '卡巴斯基', 'B');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `cxid` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL,
  `reply_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cxid`(`cxid` ASC) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  INDEX `fk_comment`(`reply_id` ASC) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`cxid`) REFERENCES `user` (`cxid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment` FOREIGN KEY (`reply_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (0, 0, 1, 'UWillno', 'Test', '2001-01-01 00:00:00', 0);

-- ----------------------------
-- Table structure for fill_in_the_blanks_questions
-- ----------------------------
DROP TABLE IF EXISTS `fill_in_the_blanks_questions`;
CREATE TABLE `fill_in_the_blanks_questions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fill_in_the_blanks_questions
-- ----------------------------
INSERT INTO `fill_in_the_blanks_questions` VALUES (1, '计算机的指令由（  ）和操作数或地址码组成。____________', '[\"操作码\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (2, '十六进制数3D8用十进制数表示为（　）。', '[\"984\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (3, '微型计算机的主机由控制器、运算器和____构成。', '[\"内存\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (4, 'Windows XP桌面上的（　　）图标不能删除。', '[\"回收站\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (5, '在Word中编辑页眉和页脚的命令在____菜单中。', '[\"视图\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (6, 'Excel工具栏上的Σ按钮功能是____', '[\"求和\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (7, 'PowerPoint普通试图中的三个工作区域是：大纲区、幻灯片区和____', '[\"备注区\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (8, 'LAN、MAN和WAN分别代表的是局域网、城域网和____', '[\"广域网\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (9, '____是安装在计算机显示器或任何监视器表面的一种输入设备。', '[\"触摸屏\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (10, '通常人们把计算机信息系统的非法入侵者称为____', '[\"黑客\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (11, '计算机由硬件和_____两部分组成。', '[\"软件\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (12, '计算机的五大组成部分分别是____、存储器、输入设备、输出设备、_____。', '[\"中央处理器\",\"通信设备\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (13, '计算机可以执行的基本操作是____、存储、_____、控制。', '[\"输入\",\"输出\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (14, '计算机内存中用于临时存储数据的单元是____。', '[\"寄存器\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (15, '操作系统是计算机系统中的____，它管理计算机硬件和软件资源，为应用程序提供服务。', '[\"核心\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (16, '二进制是一种计算机中常用的数字表示方法，它只有两种状态：____和____', '[\"0\",\"1\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (17, '计算机中的基本存储单位是_____', '[\"字节\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (18, '一个字节由____个二进制位组成。', '[\"8\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (19, '二进制数码系统中只有____和____两个数码。', '[\"0\",\"1\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (20, '计算机处理数据的方式有两种：____和____', '[\"数字\",\"字符\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (21, '在计算机网络中，____协议是用于将数据分组并进行传输的协议。', '[\"IP\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (22, '在计算机存储器中，每个存储单元都有一个唯一的地址，这个地址通常用____进制表示。', '[\"十六\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (23, '计算机系统一般有____________和软件两大系统组成。', '[\"硬件\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (24, '在表示存储容量时，1GB表示2的____________次方，或是____________MB。答案', '[\"30\",\"1024\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (25, '存储器一般可以分为主存储器和____________存储器两种。主存储器又称____________。', '[\"辅助\",\"内存\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (26, '在衡量显示设备能表示像素个数的性能指标是____________，目前微型计算机可以配置不同的显示系统，在CGA、EGA和VGA标准中，显示性能最好的一种是____________。', '[\"显示分辨率\",\"VGA\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (27, '7个二进制位可表示____________种状态。', '[\"128\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (28, '在微型计算机中，西文字符通常用____________编码来表示。', '[\"ASCII\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (29, '以国标码为基础的汉字机内码是两个字节的编码，一般在微型计算机中每个字节的最高位为____________。', '[\"1\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (30, '计算机的开机应该遵循先开____________，后开____________的原则。', '[\"外设\",\"主机\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (31, '处理器管理最基本的功能是处理____________事件。', '[\"中断\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (32, '每个用户请求计算机系统完成的一个独立的操作称为____________。', '[\"作业\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (33, 'Windows的整个屏幕画面所包含的区域称____________。', '[\"桌面\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (34, '窗口是Windows____________程序存在的基本方式，每一个窗口都代表一段运行的____________。', '[\"应用\",\"程序\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (35, 'windows是一个完全____________化的环境，其中最主要的____________设备或称交互工具是鼠标。', '[\"图形\",\"定位\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (36, '任务栏上显示的是____________以外的所有窗口，Alt+____________可以在包括对话框在内的所有窗口之间切换。', '[\"对话框\",\"Tab\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (37, '要安装或卸除某个中文输入法，应先启动____________，再使用其中____________的功能。', '[\"控制面板\",\"区域选项\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (38, '在“添加／删除程序”对话框中列出要____________或删除的应用程序，表示该应用程序已经____________了。', '[\"更新\",\"注册\"]');
INSERT INTO `fill_in_the_blanks_questions` VALUES (39, '在“控制面板”的“添加／删除程序”中，可以方便地进行____________程序和windows____________的删除和安装的工作。', '[\"应用\",\"组件\"]');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cxid` int NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL,
  `type` int NOT NULL COMMENT '0:学习心得,1:考试技巧,2:提问,4:保留',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cxid`(`cxid` ASC) USING BTREE INVISIBLE,
  INDEX `username`(`username` ASC) USING BTREE,
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`cxid`) REFERENCES `user` (`cxid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (0, 1, 'UWillno', 'Test', '禁止删除', '2001-01-01 00:00:00', 4);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int NOT NULL COMMENT '0:文档,1:图片,2:视频,3:网页',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for torf_questions
-- ----------------------------
DROP TABLE IF EXISTS `torf_questions`;
CREATE TABLE `torf_questions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of torf_questions
-- ----------------------------
INSERT INTO `torf_questions` VALUES (1, '对定期发作的病毒可通过改变系统日期来防止病毒入侵。', 1);
INSERT INTO `torf_questions` VALUES (2, 'CD－ROM既可以作为输入设备，又可以作为输出设备。', 0);
INSERT INTO `torf_questions` VALUES (3, '操作系统的主要功能是控制和管理计算机的硬件和软件系统资源。', 1);
INSERT INTO `torf_questions` VALUES (4, '已格式化过的软盘，不能再进行格式化。', 0);
INSERT INTO `torf_questions` VALUES (5, '用拼音输入法或五笔字型输入法，只能在大写状态下才能输入汉字。', 0);
INSERT INTO `torf_questions` VALUES (6, '使用最新的杀毒软件一定能检测并清除计算机中感染的任何病毒。', 0);
INSERT INTO `torf_questions` VALUES (7, '软盘要经格式化后才能使用，硬盘则不需要。', 0);
INSERT INTO `torf_questions` VALUES (8, '中文操作系统只适用于使用汉字操作，而不适用于英文操作。', 0);
INSERT INTO `torf_questions` VALUES (9, '微型计算机的输入/输出设备通过输入/输出接口与主机连接。', 1);
INSERT INTO `torf_questions` VALUES (10, '计算机病毒的传播方式，除传统的软盘和盗版光盘传播外，目前主要是通过因特网传播。', 1);
INSERT INTO `torf_questions` VALUES (11, '计算机操作系统只有Windows。', 0);
INSERT INTO `torf_questions` VALUES (12, '内存储器按读写方式的不同分为两种，一种叫随机存储器（简称ROM），另一种叫只读存储器（简称RAM）。', 0);
INSERT INTO `torf_questions` VALUES (13, '一个完整的计算机系统应该包括硬件系统和软件系统。', 1);
INSERT INTO `torf_questions` VALUES (14, '所谓的操作系统就是Windows XP。', 0);
INSERT INTO `torf_questions` VALUES (15, '只要有了硬件设备，计算机即可使用，没有必要安装软件。', 0);
INSERT INTO `torf_questions` VALUES (16, '计算机病毒产生的原因在于软盘存放的环境卫生差。', 0);
INSERT INTO `torf_questions` VALUES (17, '内存用来存放当前正在运行的程序和数据。', 1);
INSERT INTO `torf_questions` VALUES (18, '微机室内规范的摆放着20台多媒体计算机，我们就说它们是一个局域网。', 0);
INSERT INTO `torf_questions` VALUES (19, '计算机病毒不是一种程序。', 0);
INSERT INTO `torf_questions` VALUES (20, '计算机内部存储和运算用的是八进制。', 0);
INSERT INTO `torf_questions` VALUES (21, '世界上第一台计算机诞生于1946年。', 1);
INSERT INTO `torf_questions` VALUES (22, '目前计算机病毒传播速度最快的途径是网络。', 1);
INSERT INTO `torf_questions` VALUES (23, '电子邮件是INTERNET提供的基本服务之一。', 1);
INSERT INTO `torf_questions` VALUES (24, '计算机内部使用二进制的根本原因在于，计算机的主要部件是由仅具有两个稳定状态的物理元件--电子开关线路组成的。', 1);
INSERT INTO `torf_questions` VALUES (25, '第三代电子计算机主要元件为集成电路。', 1);
INSERT INTO `torf_questions` VALUES (26, '第四代电子计算机主要元件为大规模、超大规模集成电路。', 1);
INSERT INTO `torf_questions` VALUES (27, '在标准ASCII代码中，用七位二进制码表示一个字符。', 1);
INSERT INTO `torf_questions` VALUES (28, '在计算机内，符号采用二进制编码表示。', 1);
INSERT INTO `torf_questions` VALUES (29, '存储器指的就是内存。', 0);
INSERT INTO `torf_questions` VALUES (30, '运算器的作用是完成各种算术运算和逻辑运算。', 1);
INSERT INTO `torf_questions` VALUES (31, '目前人们使用的操作系统只有DOS、WINDOWS及LINUX三种。', 0);
INSERT INTO `torf_questions` VALUES (32, '一般情况下，扩展名为EXE的文件表示是可执行的文件。', 1);
INSERT INTO `torf_questions` VALUES (33, 'Internet是一个世界范围的网络，它不属于某个国家或某个组织。', 1);
INSERT INTO `torf_questions` VALUES (34, '将磁盘上的信息调入内存时，信息写入内存储器的ROM。', 0);
INSERT INTO `torf_questions` VALUES (35, '计算机感染病毒后常有现象：频繁死机、程序和数据无故丢失、找不到文件等。', 1);
INSERT INTO `torf_questions` VALUES (36, 'Word、Powerpoint、Wps都是Office的组件。', 0);
INSERT INTO `torf_questions` VALUES (37, '微型计算机硬件系统中最核心的部件是CPU。', 1);
INSERT INTO `torf_questions` VALUES (38, 'Internet提供的服务是电子邮件、文件传输、远程登录、文字处理等服务。', 0);
INSERT INTO `torf_questions` VALUES (39, '系统软件是与计算机的硬件直接联系的，是提供系统服务和用户操作接口的基础软件。', 1);
INSERT INTO `torf_questions` VALUES (40, '已知一补码为10000101,则其真值用二进制表示为-1111011。', 1);
INSERT INTO `torf_questions` VALUES (41, '十进制数123的反码与补码不相同', 0);
INSERT INTO `torf_questions` VALUES (42, '补码的设计目的是使减法运算转换为加法运算,进一步简化计算机中运算器的线路设计', 1);
INSERT INTO `torf_questions` VALUES (43, '微型计算机系统按传输信息的类型分为数据、控制、和地址三种总线，其中地址总线决定了CPU的最大寻址能力。', 1);
INSERT INTO `torf_questions` VALUES (44, '交通管理以及民航售票等都是实时处理系统', 1);
INSERT INTO `torf_questions` VALUES (45, '计算机各部件要轻拿轻放，尤其是硬盘。', 1);
INSERT INTO `torf_questions` VALUES (46, '使用电脑的次数少或使用的时间短，就能延长电脑寿命。', 0);
INSERT INTO `torf_questions` VALUES (47, '强磁场不会破坏软盘磁介质上存储的信息。', 0);
INSERT INTO `torf_questions` VALUES (48, '计算机正在读写数据时可以突然关机。', 0);
INSERT INTO `torf_questions` VALUES (49, '硬盘不能受太大的振动，否则会损坏。', 1);
INSERT INTO `torf_questions` VALUES (50, '各种插头插座、扩充插槽、内存插槽及板卡一般不要用水擦拭。', 1);
INSERT INTO `torf_questions` VALUES (51, '灰尘对显示器没有什么影响，可以不买专用的防尘罩。', 0);
INSERT INTO `torf_questions` VALUES (52, '显示器接触不良将会导致显示颜色减少或者不能同步。', 1);
INSERT INTO `torf_questions` VALUES (53, '避免用手指和工具碰撞打印机喷墨嘴面。', 1);
INSERT INTO `torf_questions` VALUES (54, '计算机系统加电自检程序存储在ROM BIOS芯片中。', 1);
INSERT INTO `torf_questions` VALUES (55, '在拔插内存条时，一定要拔去主机的电源插头，防止使用STR功能时内存带电，烧毁内存条。', 1);
INSERT INTO `torf_questions` VALUES (56, '清洁显示器时可以不用关闭显示器的电源。', 0);
INSERT INTO `torf_questions` VALUES (57, '水分是不会进入液晶显示器的。', 0);
INSERT INTO `torf_questions` VALUES (58, '硬盘无法启动的原因一般是CMOS中的硬盘设置参数丢失或硬盘类型设置错误造成的。', 1);
INSERT INTO `torf_questions` VALUES (59, '电脑病毒都是将自己的病毒码依附在其它程序上。', 0);
INSERT INTO `torf_questions` VALUES (60, '计算机病毒是不会破坏计算机硬件的。', 0);
INSERT INTO `torf_questions` VALUES (61, '光纤分为单模光纤和多模光纤。', 1);
INSERT INTO `torf_questions` VALUES (62, '使用电磁波、声音可以传递信息。', 1);
INSERT INTO `torf_questions` VALUES (63, '书籍、报纸、电视、广播和网络是人们收集信息的重要来源。', 1);
INSERT INTO `torf_questions` VALUES (64, '人工智能技术能使计算机取代人的思维和行为。', 0);
INSERT INTO `torf_questions` VALUES (65, '计算机辅助教学的英文简称是CAD。', 0);
INSERT INTO `torf_questions` VALUES (66, '杀毒软件可以防止一切病毒的感染。', 0);
INSERT INTO `torf_questions` VALUES (67, '双击就是分别按鼠标左鍵和右鍵各一次。', 0);
INSERT INTO `torf_questions` VALUES (68, '鼠标操作的左单击和右单击效果通常是一样的。', 0);
INSERT INTO `torf_questions` VALUES (69, '计算机病毒只会通过软盘传播。', 0);
INSERT INTO `torf_questions` VALUES (70, '计算机病毒是生物病毒的一种。', 0);
INSERT INTO `torf_questions` VALUES (71, '根据计算机的工作原理，计算机由系统软件和应用软件两部分组成。', 0);
INSERT INTO `torf_questions` VALUES (72, '在计算机中存放的数据录到软盘上，称为读盘。', 0);
INSERT INTO `torf_questions` VALUES (73, '总线中负责在部件间传输数据的一组信号线称为数据线。', 1);
INSERT INTO `torf_questions` VALUES (74, 'CAI是计算机应用的一个重要领域，它的含义是计算机辅助教学。', 1);
INSERT INTO `torf_questions` VALUES (75, '我们常用的文字处理软件如：WPS、Word，它们属于系统软件。', 0);
INSERT INTO `torf_questions` VALUES (76, '计算机断电后，内存储器RAM中的信息都会全部丢失。', 1);
INSERT INTO `torf_questions` VALUES (77, '打印机只能打印字符和表格，不能打印图形。', 0);
INSERT INTO `torf_questions` VALUES (78, '一个汉字的机内码在计算机中用2个字节表示。', 1);
INSERT INTO `torf_questions` VALUES (79, '鼠标左键双击和右键双击均可打开一个文件。', 0);
INSERT INTO `torf_questions` VALUES (80, '鼠标左键双击和右键双击均可打开一个文件。', 1);
INSERT INTO `torf_questions` VALUES (81, '在关闭计算机时最快、最有效的办法是直接按下Power键，一般不会对计算机造成损坏。', 0);
INSERT INTO `torf_questions` VALUES (82, '将多张软盘叠放在一起会造成计算机病毒的相互传播。', 0);
INSERT INTO `torf_questions` VALUES (83, '1GB的确切表示为1024*1024*1024个Byte。', 1);
INSERT INTO `torf_questions` VALUES (84, '在微型计算机中，应用最普遍的字符编码是汉字编码。', 0);
INSERT INTO `torf_questions` VALUES (85, '在微型计算机中，bit的中文含义是字节。', 0);
INSERT INTO `torf_questions` VALUES (86, '在计算机系统中，CPU可以直接读/写RAM中的内容。', 1);
INSERT INTO `torf_questions` VALUES (87, '第二代计算机采用电子管作为逻辑元件。', 0);
INSERT INTO `torf_questions` VALUES (88, '在计算机内部，用来传送、存储、加工处理的数据或指令都以十进制进行的。', 0);
INSERT INTO `torf_questions` VALUES (89, '计算机的光驱应经常使用才不会使激光头沾染灰尘，所以长时间播放VCD也是对光驱的一种维护。', 0);
INSERT INTO `torf_questions` VALUES (90, '计算机只可以处理数字信号，不能处理模似信息。', 0);
INSERT INTO `torf_questions` VALUES (91, '计算机只要经常使用，不维护也能有较长的使用寿命。', 0);
INSERT INTO `torf_questions` VALUES (92, '多媒体指的是文字、图片、声音和视频的任意组合。', 1);
INSERT INTO `torf_questions` VALUES (93, '应用软件对操作系统没有任何要求。', 0);
INSERT INTO `torf_questions` VALUES (94, '人和计算机进行信息交换是通过输入/输出设备实现的', 0);
INSERT INTO `torf_questions` VALUES (95, 'ROM又称随机存取存储器。', 0);
INSERT INTO `torf_questions` VALUES (96, '微机常常是在信息复制和信息交换时感染上计算机病毒。', 1);
INSERT INTO `torf_questions` VALUES (97, '一台微型计算机系统的处理速度主要取决于内存的大小。', 0);
INSERT INTO `torf_questions` VALUES (98, '任何的数字、符号、字母、汉字在机内都是以二进制代码形式存储和处理。', 1);
INSERT INTO `torf_questions` VALUES (99, '微型计算机的主机由运算器和控制器组成。', 0);
INSERT INTO `torf_questions` VALUES (100, '字母\"A\"与\"a\"的ASCII编码是相同的。', 0);
INSERT INTO `torf_questions` VALUES (101, '二进制数1101转化为十进制数是12。', 0);
INSERT INTO `torf_questions` VALUES (102, '1MB等于1024000字节。', 0);
INSERT INTO `torf_questions` VALUES (103, '删除文章段落中的某个错字，除可用Delete键外，还可用Insert键。', 0);
INSERT INTO `torf_questions` VALUES (104, '删除文章段落中的某个错字，除可用Delete键外，还可用Insert键。', 0);
INSERT INTO `torf_questions` VALUES (105, '人们常说的计算机一般是指通用计算机。', 1);
INSERT INTO `torf_questions` VALUES (106, '在计算机内部，一切信息的存储、处理与传送都采用二进制来表示的。', 1);
INSERT INTO `torf_questions` VALUES (107, '计算机主存储器分为随机存储器和只读存储器，一般开机测试、系统初始化程序都是存放在随机存储器中的。', 0);
INSERT INTO `torf_questions` VALUES (108, '计算机主存储器的特点是存储容量有限，但存取速度快。', 1);
INSERT INTO `torf_questions` VALUES (109, '微机的功能主要取决于微处理器CPU。', 1);
INSERT INTO `torf_questions` VALUES (110, '指令包括操作码和地址码。', 1);
INSERT INTO `torf_questions` VALUES (111, '微机的主频通常是指CPU在单位时间内运行的次数。', 1);
INSERT INTO `torf_questions` VALUES (112, '计算机的存储器按照存取的方式可以分为随机存储器和只读存储器。', 1);
INSERT INTO `torf_questions` VALUES (113, '在计算机各部件中，能够与主存储器进行信息交流的只有外存储器。', 0);
INSERT INTO `torf_questions` VALUES (114, '硬盘是固定在微机主机箱内的，所以硬盘是内存。', 0);
INSERT INTO `torf_questions` VALUES (115, '在微机性能指标中，内存容量反映了内存存储数据的能力，存储量越大，运算速度越快。', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `cxid` int NOT NULL COMMENT '1保留',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `questions` json NULL,
  `exams` json NULL,
  PRIMARY KEY (`cxid`) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'UWillno', '[{\"wrongCQ\": [83, 54, 29, 63]}, {\"wrongTQ\": [26, 47]}, {\"wrongFQ\": [21, 23]}, {\"rightCQ\": [56, 53, 28, 52, 50]}, {\"rightTQ\": [44, 43, 46]}, {\"rightFQ\": [55, 20, 23, 22]}]', '[{\"date\": \"2023-03-08 13:22:51\", \"point\": 0, \"right\": [], \"wrong\": [0, 1, 2, 3, 4], \"cQArray\": [31, 3], \"fQArray\": [5], \"tQArray\": [45, 8]}]');

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger4`;
delimiter ;;
CREATE TRIGGER `trigger4` BEFORE UPDATE ON `comment` FOR EACH ROW BEGIN IF (OLD.id = 0) THEN SET NEW.id = OLD.id; END IF; END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger3`;
delimiter ;;
CREATE TRIGGER `trigger3` BEFORE DELETE ON `comment` FOR EACH ROW BEGIN IF (OLD.id = 0) THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = ‘不能删除该行’; 
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table post
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger1`;
delimiter ;;
CREATE TRIGGER `trigger1` BEFORE UPDATE ON `post` FOR EACH ROW BEGIN IF (OLD.id = 0) THEN SET NEW.id = OLD.id; END IF; END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table post
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger2`;
delimiter ;;
CREATE TRIGGER `trigger2` BEFORE DELETE ON `post` FOR EACH ROW BEGIN IF (OLD.id = 0) THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = ‘不能删除该行’; 
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `Trigger5`;
delimiter ;;
CREATE TRIGGER `Trigger5` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN IF (OLD.cxid = 1) THEN SET NEW.cxid = OLD.cxid; END IF; END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `Trigger6`;
delimiter ;;
CREATE TRIGGER `Trigger6` BEFORE DELETE ON `user` FOR EACH ROW BEGIN IF (OLD.cxid = 1) THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = ‘不能删除该行’; 
END IF; 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
