.PHONY: install-networkmanager

NM_CONF = /etc/NetworkManager

install-networkmanager:
	grep dns=dnsmasq $(NM_CONF)/NetworkManager.conf >/dev/null || \
	  sed -i 's/\[main\]/\0\ndns=dnsmasq/' $(NM_CONF)/NetworkManager.conf
	install -m0644 -D docker-rawdns.conf $(NM_CONF)/dnsmasq.d/docker-rawdns.conf
