title: Dummy Guide：如何使用Shadowsocks科学上网
date: 2016-02-02 17:56:29
tags: [GFW，SS]
---
## Requirement:

海外服务器一台，一些动手动脑能力

## 服务器配置:

1. 首先需要一台海外服务器， 推荐使用[DigitalOcean](https://m.do.co/c/93b64356386a) (这里用的是我的Referral链接，注册即可获得10刀Credit) 的5刀一月服务器。
   
   P.S. 如果有Edu结尾的邮箱可以去申请[Github Student Developer Pack](https://education.github.com/pack)。里面包含了十几个开发工具和**价值50刀的DigitalOcean Credit**链接 (以前有100刀)。
   ![](http://7xqpdw.com1.z0.glb.clouddn.com/Screen%20Shot%202016-02-02%20at%206.20.15%20PM.png)
   
   P.S. Edu.cn是无效的。
   
2. 之后就可以在Digital Ocean建Droplet。因为仅仅是用于翻墙，5刀的Ubuntu plan即可。因为翻墙对服务器压力很小，多余的资源可以原来建个人主页；建议在one-click apps中选择LAMP，可以省去很多大量运行环境的设置或是ghost来做简单的独立博客。

<!--more-->

3. 要连接这个远程的虚拟主机的话推荐使用ssh连接。
	
	MAC端的话使用Terminal即可：

	```bash
	ssh root@yourhostIP
	```
	Windows端的话需要使用额外的第三方程序[putty](http://www.putty.org)来进行对虚拟主机的连接。
	
	连上后需要使用建立droplet后发到注册邮箱的密码来登入，并且需要重设新密码。P.S. 没用过linux的用户注意linux输入密码时并不显示任何字符。

4. 成功进入主机的terminal界面时就可以开始Shadowsocks的配置了。

	```bash
	apt-get install python-pip
	pip install shadowsocks
	```
	然后创建Shadowsocks配置文件`shadowsocks.json`
	```bash
	nano /etc/shadowsocks.json
	```
	内容如下填写
	```json
	{
    	"server":"1.2.3.4", // 服务器IP
    	"server_port":, // 对外提供服务的端口
    	"local_port":, //随意填写，一般8080
    	"password":"your password",
    	"timeout":,
    	"method":"rc4-md5"
	}
	```
	*Tip: 加密方式推荐使用rc4-md5，因为 RC4 比 AES 速度快好几倍，并修复了老版本RC4加密的安全漏洞；如果用在路由器上会带来显著性能提升。*
	
5. 创建完配置文件就可以开始启用shadowsocks了。
	```
	//前台启动
	ssserver -c /etc/shadowsocks.json
	
	//后台运行
	ssserver -c /etc/shadowsocks.json -d start # 启动
	ssserver -c /etc/shadowsocks.json -d stop # 停止
	
	//持续运行
	nohup ssserver -c /etc/shadowsocks/config.json &gt; log &amp;

	//开机自启动
	/usr/local/bin/ssserver -c /etc/shadowsocks/config.json
	```



## 客户端配置
#### MAC GUI Client: 
[ShadowsocksX V2.6.3](https://github.com/shadowsocks/shadowsocks-iOS/releases/download/2.6.3/ShadowsocksX-2.6.3.dmg)

#### Windows GUI Client:
[Shadowsocks-win V2.5.6](https://github.com/shadowsocks/shadowsocks-csharp/releases/download/2.5.6/Shadowsocks-win-2.5.6.zip)

客户端配置比较基础，在此不赘述了（其实是因为我太懒了w）。
可以参考这篇文章：[ShadowSocks—科学上网之瑞士军刀](http://www.jianshu.com/p/08ba65d1f91a)

如果对翻墙速度不是很满意，可以尝试使用一些加速服务；虽然并不会有太大的提高。请参考这篇文章：[科学上网之 Shadowsocks 安装及优化加速](http://wuchong.me/blog/2015/02/02/shadowsocks-install-and-optimize/)

