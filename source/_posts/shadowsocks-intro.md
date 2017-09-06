---
title: Shadowsocks 101 and How it's different from VPN
date: 2017-09-05 16:34:35
tags: [ss, GFW, Socks5]
categories: [GFW]
---

{% cq %} There is no perfect tool. {% endcq %}
<!--more-->

### Brief
#### VPN (aka Virtual Private Network)
The purpose of `VPN` is to build a Private Network over the Public Network for encrypted communication purpose and is widely used in Enterprises initially. `VPN` gateway essentially works by encyprting data packets and changing the destination of data packets to achieve remote access. `VPN` has many different forms, mainly differentiated by the protocol they use, such as `PPTP`, `L2TP`, `OpenVPN`, etc. 

#### Shadowsocks (aka Socks5 Proxy)
`Socks` is a circuit-level gateway which is quite low-level. It is developed by David Koblas in 1990 and used as the open standard for Internet RFC ever since. Socks is not restricted to certain OS, unlike HTTP Proxy and application layer proxy. Socks Proxy merely transfer data packet and does not care about which protocol is used, which makes it much master than application layer proxy


### Summary
- `VPN`
  Like its name, you are connected to a private network and all your access to Internet goes out from this Private Network. You will probably be assigned a private IP address just like you are assigend a public IP by your ISP.

- Socks5 Proxy
  It just builds a tunnel between you and the proxy server and put all your network request thru this tunnel. And let the proxy server transfer your request for you to the destination. You never entered any new network. And the proxy server also handles the resposne from the destination and transfer that back to you. There is no further modificaiton of the data. If your data is encrypted originally, it's secure. 

  It's like UPS/Fedex, you want to send a package to your friend, you let Fedex to ship it for you. And when your friend are ready to ship something back to you, he/she will give it to Fedex and let them give back to you.

### Design Concepts
- `VPN` iks developed for secure data transferring inside a Enterprise private network. And what matters the most is security. However, it is easy to identify `VPN` data flow; which makes it really vulnerable to the `GFW`.

  Because of this

  - `PPTP` is banned in most regions
  - `L2TP` also experience interference and disconnect in most regions
  - `OpenVPN` is banned as well.
  - `IKEv2` is not banned but the `GFW` has started to perfrom middle-man attack on it.

  Thus, `VPN` is really struggling with `GFW`.

- `Shadowsocks` is developed to pennetrate the `GFW`, deliberately made inefficient and difficult for the `GFW` to spot and block. Which makes it a way better tool to penetrate the `GFW`.

In conclusion, `Shadowsocks` emphasizes anti-disturbance and anti-interference; while `VPN` emphasizes security. For example, the most secure `VPN` protocol `OpenVPN` is the first to be banned by `GFW`. 

There is no perfect tool. To some extent, you can say `VPN` and `Shadowsocks` are totally different technologies.

### Appendix
- `GFW` refers to `Great Fire Wall` which is a censorship agent in China dedicated to ban information on the Internet which the Party doesn't want you to access.




