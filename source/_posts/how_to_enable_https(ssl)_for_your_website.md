---
title: how to enable https for you website (Apache and Ubuntu)
date: 2017-09-05 15:51:32
tags: [Apache2, Web Server, HTTPS, Security]
categories: [Security]
---

### Preface
`Https` is becoming more of a common standard these days. Without using an encrypted HTTPS connection opens up your server to a man-in-the-middle (MITM) attack, and risks the interception of user data and passwords. It is a best practice, and highly recommended, to always use HTTPS on production servers, and to never allow unencrypted HTTP. 

`Apache2` comes with built-in `ssl` module which is very easy to configurate.

**This Guide is tested with `Apache2` and Ubuntu 16.04 64bits**
<!--more-->

### Update Apache2 First
I recommend upgrade your apache to this build which comes with `HTTP2`.  `HTTP2` has [huge speed improvements](https://www.troyhunt.com/i-wanna-go-fast-https-massive-speed-advantage/) over `HTTP` with multiple request. Most [browsers already support `HTTP2` over SSL (HTTPS)](http://caniuse.com/#feat=http2).

```bash
$ sudo add-apt-repository -y ppa:ondrej/apache2
$ sudo apt-key update
$ sudo apt-get update
$ sudo apt-get --only-upgrade install apache2 -y
$ sudo a2enmod http2
$ sudo systemctl restart apache2
```

### Enable SSL
1. First we need to enable ssl module of `Apache2`. 

   ```bash
   $ a2enmod ssl
   $ sudo systemctl restart apache2
   ```

2. Then we need to edit the content of our `default-ssl.conf` config file. We will make a copy of the default config instead.

   ```bash
   $ sudo cp default.conf mysite.conf
   $ sudo nano mysite.conf
   ```

3. We will need to edit these two lines in Nano to put our own `ssl` certificate.

   ```bash
   SSLCertificateFile	/path/to/your/cert
   SSLCertificateKeyFile /path/to/your/key
   ```

4. We will use [Let's Encrypt's](https://letsencrypt.org/) Free SSL certificate. Go to [their certbot page](https://certbot.eff.org/). and choose your own server configuration. Here we will do `Apache` and `Ubuntu 16.04`. Follow the installation instruction should be good enough.

   ```bash
   ### Install Certbot
   $ sudo apt-get update
   $ sudo apt-get install software-properties-common
   $ sudo add-apt-repository ppa:certbot/certbot
   $ sudo apt-get update
   $ sudo apt-get install python-certbot-apache

   # Produce Key and modify apache default config
   $ sudo certbot --apache

   # If you want to modify the config yourself, just do
   $ sudo certbot --apache certonly
   ```

5. After adding your cert to `Apache2` config, open up your config file again and append a header to further improve security.

   ```bash
   $ sudo nano mysite.conf 

   #and add this lines in the VirtualHost tags
   <IfModule mod_headers.c>
      Header always set Strict-Transport-Security "max-age=15552000; includeSubDomains"
   </IfModule>·
   ```

6. We are almost finished! One more step is to redirect all traffic to our `HTTPS` protocol instead. This is actaully easy. Just add these lines to a new config file (or you can add to your existing config):

   ```bash
   $ sudo nano redirect.conf

   #add these lines
   NameVirtualHost *:80
   <VirtualHost *:80>
      ServerName yourdomain
      DocumentRoot /var/www/yourdir
      Redirect permanent / https://yourdomin
   </VirtualHost>
   ```

7. Now we are finished. Just enable the configs and restart apache.

   ```bash
   $ sudo a2ensite mysite.conf
   $ sudo a2ensite redirect.conf
   $ sudo systemctl restart apache2
   ```

### Ref

- [CertBot](https://certbot.eff.org/#ubuntuxenial-apache)
- [NextCloud 12 Hardening and Security Guidance](https://docs.nextcloud.com/server/12/admin_manual/configuration_server/harden_server.html#use-https-label)