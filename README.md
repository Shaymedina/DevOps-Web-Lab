# DevOps Web Lab
Simple web lab that run three VM's. The LAB was built using Vagrant (with VirtualBox) and Puppet.
The end result will allow to run single `vagrant up` command which will build the LAB from scratch.

**LAB description:**

Components:

- Two VMs that act as Web servers and run Nginx
- The web servers serve a simple page that prints "Hello World!"
- Third VM acts as a load balancer for the web servers VMs and as monitoring server
- HAProxy is used as load balancer
- Prometheus + Alert-manager used for monitoring the VMs
- Each VM have `node_exporter` running and scraped by the Prometheus server
- Alert-manager will send email if CPU or Memory are above 80% on the VMs
- Alert-manager will send email if either of Nginx or HAproxy are down or not responding to HTTP requests

The end result should be similar to the following diagram:

```text
                                   VM2 (Web server)
                                     +---------+
                         +-------->  |  Nginx  |
VM1 (LB and Prometheus)  |           +---------+
    +------------+       |
    |  HAProxy   +-------+
    +------------+       |         VM3 (Web server)
                         |           +---------+
                         +-------->  |  Nginx  |
                                     +---------+
```

---

 **Setup & Starting**

- The command `vagrant up` and `vagrant provision` in terminal will run the project.
- You can now view the web1 from <http://192.168.100.20:80> 
- You can now view the web2 from <http://192.168.100.21:80> 
- Haproxy load balancer <http://192.168.100.10:9000/stats>
- Prometheus + Alertmanager <http://192.168.100.10:9090>

**Tools used in the LAB:**

- [HAProxy](http://haproxy.1wt.eu)
- [Nginx](http://nginx.org/en/download.html)
- [Prometheus](https://prometheus.io)
- [Prometheus `node_exporter`](https://github.com/prometheus/node_exporter)
- [Puppet](http://puppetlabs.com/puppet/puppet-open-source)
- [Vagrant](http://www.vagrantup.com)
- [Virtualbox](https://www.virtualbox.org)
