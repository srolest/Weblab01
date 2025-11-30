# WebLab 01 — Virtual Hosts con Apache y DNS

## Summary
This practice configures two virtual machines using **Vagrant**:

- `ns1.olimpo.test` (192.168.57.10): DNS server for `olimpo.test`.
- `mercurio.olimpo.test` (192.168.57.11): Apache web server with virtual hosts:
  - `apolo.olimpo.test`
  - `atenea.olimpo.test`

---

## Set up the lab
```bash
vagrant up
vagrant ssh dns    
vagrant ssh web
```    

---

## Contents

Contains the following files:

- `README.md`, this file

- `Vagrantfile`, Vagrant project

- `apache2-provision.sh` with web server provisioning

- `dns-provision.sh` with DNS server provisioning

Contains the following subdirectories:

- `files/apolo.olimpo.test` root of web documents for that site.

- `files/atenea.olimpo.test` root of web documents for that site.

- `files/mercurio.olimpo.test` web server configuration

- `files/ns1.olimpo.test` DNS server configuration

- `files/apache-config` configuration files that we put in the provision

---

## Steps to follow
First, we check everything related to the DNS.

1. We check the DNSsec and forwarders in the `named.conf.options` file. We also check the named.conf.local file to see the zones and their location.

[NAMED.CONF.OPTIONS](./images/dnssec.png) | [NAMED.CONF.LOCAL](./images/named.conf.local.png)

2. Then we check the forward zone where we will add the alias and then the reverse zone.

Direct zone:
```bash
cat /var/lib/bind/olimpo.test.dns
```  
[DIRECT-ZONE](./images/direct-zone.png)

Reverse zone:
```bash
cat /var/lib/bind/192.168.57.dns
```  
[REVERSE-ZONE](./images/reverse-zone.png)

3. Configure Apache server 

We will install it using the provision we have in the vagrant file (mercurio.vm.provision “shell”, name: “apache2”,
                          inline: “apt-get install -y apache2”)
and configure it using the `apache2-provision.sh` file.

4. Virtual Hosts

We want to create and enable web servers for the domains apolo.olimpo.test and
atenea.olimpo.test hosted on the machine mercurio.olimpo.test.
To do this, we configure two files:

- `apolo.olimpo.test.conf`
[APOLO.OLIMPO.TEST.CONF](./images/apolo.olimpo.test.png)

- `atenea.olimpo.test.conf`
[ATENEA.OLIMPO.TEST.CONF](./images/atenea.olimpo.test.png)

---

5. Checks with curl command

We use the curl command to check the following websites:
- `http://apolo.olimpo.test/` 
- `http://apolo.olimpo.test/apolo.html`
- `http://apolo.olimpo.test/index.html`
- `http://apolo.olimpo.test/messages/404.html`
 
 [APOLO-CURL-RESULT](./images/curl-result.png)

  Then we use the curl command to check the following websites:
- `http://atenea.olimpo.test/atenea.html`
- `http://atenea.olimpo.test/`
- `http://atenea.olimpo.test/index.html`
- `http://atenea.olimpo.test/messages`
 
 [ATENEA-CURL-RESULT](./images/curl-result2.png)

6. Checks with hurl.

Hurl is a tool for executing and testing HTTP requests.

I have also used the hurl file to make checks.
I had to create the soyuz.html file because the HURL file requires it. Although the PDF does not request it, the test does require checking it.
Below is a screenshot of the result:

[HURL-RESULT](./images/hurl-check.png)