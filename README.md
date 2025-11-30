# WebLab 01 — Virtual Hosts con Apache y DNS

## 1. Summary
This practice configures two virtual machines using **Vagrant**:

- `ns1.olimpo.test` (192.168.57.10): DNS server for `olimpo.test`.
- `mercurio.olimpo.test` (192.168.57.11): Apache web server with virtual hosts:
  - `apolo.olimpo.test`
  - `atenea.olimpo.test`

---

## 2. Set up the lab
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
[DIG_DIRECT_ZONE](./images/dnssec.png) | [DIG_DIRECT_ZONE](./images/named.conf.local.png)

2. Then we check the forward zone where we will add the alias and then the reverse zone.

Direct zone:
```bash
cat /var/lib/bind/olimpo.test.dns
```  
[DIG_DIRECT_ZONE](./images/direct-zone.png)

Reverse zone:
```bash
cat /var/lib/bind/192.168.57.dns
```  
[DIG_DIRECT_ZONE](./images/reverse-zone.png)

3. Configure Apache server 
We will install it using the provision we have in the vagrant file (mercurio.vm.provision “shell”, name: “apache2”,
                          inline: “apt-get install -y apache2”)
and configure it using the `apache2-provision.sh` file.

4. Virtual Hosts
We want to create and enable web servers for the domains apolo.olimpo.test and
atenea.olimpo.test hosted on the machine mercurio.olimpo.test.
To do this, we configure two files:

- `apolo.olimpo.test.conf`
[DIG_DIRECT_ZONE](./images/apolo.olimpo.test.png)

- `atenea.olimpo.test.conf`
[DIG_DIRECT_ZONE](./images/atenea.olimpo.test.png)

---
