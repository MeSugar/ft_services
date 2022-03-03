## Description
The objective of this project is to set up multi-service cluster using Kubernetes. Services are nginx, FTPS, Wordpress and PHPMyAdmin working with MySQL database, and Grafana linked to InfluxDB. The script builds the self-written Docker images for each service, before deploying all of them with custom yaml files.

## Usage
```
git clone https://github.com/MeSugar/ft_services.git
cd ft_services
./setup.sh
```
