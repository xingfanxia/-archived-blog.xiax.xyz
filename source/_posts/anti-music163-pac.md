---
title:  Unlock China-only Access Restriction PAC解除地区限制(网易云音乐, Bilibili番剧等)
date: 2017-09-03 02:26:43
tags: [pac, Linux, GFW]
categories: [GFW]
---

## Update
- **Update 09/05/2017**
Found a solution with Unblock Youku's DNS server instead to unlock more apps.
(Sometimes won't work on desktop, use Unblock Youku's chrome extension instead)

### Preface
A lot of Chinese enjoy music of their own languages which are rarely accessible on spontify, pandora, or any other online music stream service not based in China. However, most companines offering music streaming service in China (like Netease, Tencent, Xiami) blocks foreign IPs for some complicated reasons. Among them, Netease is probably the most popular one among Chinese students abroad. So an easy one to regain access is very much needed.
<!--more-->

### How to (MAC)?
- Open system preference.
- Open Network.
- Click Advanced tab in the corner.
- Choose proxy tab.
- Choose Automatic Proxy Configuration (The second item on the list).
- Add `http://xiax.ai/pac/mobile.pac` to the URL field. Should look like this screenshot.
  ![PAC Config on macOS](pac_mac_config.png)
- Then click ok to go back.
- Click apply.
- Go to music.163.com and start streaming!

### How to (iOS)?
- Open `Settings`
- Click a the information icon on the Wi-Fi you are using.
    ![PAC Config on iOS 1](pac_ios_config_1.png)
- Turn on proxy by activating the `auto` tab under proxy.
- Add the `PAC_URL` (`http://xiax.ai/pac/mobile.pac`) to the field.
    ![PAC Config on iOS 2](pac_ios_config_2.png)
- Go back and stream!

### Caution
- Note this will not work when Unblock Youku's proxy server is down. Just wait and try later.
- Or you can setup your own shadowsocks server instead. I will have a new tutorial for this in the next couples days.
- Leave a comment if you have any trouble with this. I will try my best to help.

### Ref

- `http://xiax.ai/pac/mobile.pac` is just a mirror of `http://pac.uku.im/pac.pac`, in case their server under `DDoS`.
- [If you want to setup your own server](https://jixun.moe/2017/01/01/ymusic-hosts-fix/)
- [Offical Manual from Unblock Youku](https://bbs.uku.im/t/topic/27)