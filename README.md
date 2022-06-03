## Description
The objective of this project is to set up an infrastructure with multiple services using Kubernetes. Each service runs in a dedicated container.

## Components
- **MetalLB** is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols. It is the only entrance to the cluster.
- **Nginx** is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.
- **FTPS** is an extension of the popular File Transfer Protocol that supports Transport Layer Security (TLS) and the new defunct Secure Sockets Layer (SSL).
- **MySQL** is an open-source relational database management system.
- **Wordpress** is a free and open-source content management system focused on the creation of any type of web page.
- **phpMyAdmin** is a free and open-source administration tool for MySQL over the web.
- **InfluxDB** is an open-source time series database.
- **Telegraf** is an open-source plugin-driven server agent for collecting and reporting metrics.
- **Grafana** is a multi-platform open source analytics and interactive visualization web application. Allows you to query, view and explore your metrics from time series database storages.

## Ports
- Nginx on Port 80 (http) and 443 (https)
- FTPS on port 21 and 1551 (passive mode)
- Wordpress on port 5050
- PhpMyAdmin on port 5000
- Grafana on port 3000
- MySQL on port 3306
- Influxdb on port 8086

The script builds the self-written Docker images for each service, before deploying all of them with custom yaml files.

## Usage

### Prerequisites
- Linux
- Docker is installed and running
- VirtualBox Hypervisor
- FileZilla (client for file transfering via FTPS) are installed
- minikube and its dependencies are installed (especially Kubectl)

### Deployment
```
git clone https://github.com/MeSugar/ft_services.git
cd ft_services
./setup.sh
```
