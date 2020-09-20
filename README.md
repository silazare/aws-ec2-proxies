# AWS EC2 Proxies

Create free HTTPS/SOCKS5 proxy servers with AWS EC2 and Goproxy.

* Based on - [vifreefly/ec2_proxies](https://github.com/vifreefly/ec2_proxies)
* Proxy server - [Goproxy](https://github.com/snail007/goproxy)

## Usage

* Clone the repo.
* Run `make init` inside of project directory.
* Run `make apply` to create instances. Use output IP addresses to connect to proxy servers.
* Run `make destroy` to delete instances.

## Settings

* `instance_count` - the number of proxy servers to create. Default is 3.
* `proxy_type` - type of proxy server. Default is `socks` (socks5). If you need HTTP/HTTPS anonymous proxy instead, set variable to `http`.
* `proxy_port` - port of proxy server. Default is `46642`.
* `proxy_user` and `proxy_password` - set these variables if you want proxy server use authorization. Defaut is empty (proxy without authorization).

## License

[MIT](https://opensource.org/licenses/MIT)
