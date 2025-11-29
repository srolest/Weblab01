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
