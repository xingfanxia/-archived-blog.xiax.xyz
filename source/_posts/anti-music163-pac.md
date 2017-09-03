---
title:  Unlock Netease Music region restriction (WebApp Only) 网易云PAC反代解除地区限制(仅网页端)
date: 2017-09-03 02:26:43
tags: [pac, Linux, GFW]
categories: [GFW]
---

### Preface
A lot of Chinese enjoy music of their own languages which are rarely accessible on spontify, pandora, or any other online music stream service not based in China. However, most companines offering music streaming service in China (like Netease, Tencent, Xiami) blocks foreign IPs for some complicated reasons. Among them, Netease is probably the most popular one among Chinese students abroad. So an easy one to regain access is very much needed.
<!--more-->

### How to?
- Open system preference.
- Open Network.
- Click Advanced tab in the corner.
- Choose proxy tab.
- Choose Automatic Proxy Configuration (The second item on the list)
- Add `http://xiax.ai/neteasex.pac` to the URL field.
  Should look like this screenshot.
  ![PAC Config on macOS](pac_mac_config.png)
- Then click ok to go back.
- Click apply.
- Go to music.163.com and start streaming!

### Ref

- If you are in Europe, use this config url instead: `https://s1.jixun.moe/163/proxy.pac` by `jixun66`
- [server config for this pac to work if you want to host your own server](https://jixun.moe/2017/01/01/ymusic-hosts-fix/)