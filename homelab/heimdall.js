const placeholder = '%24%7Bhostname%7D';
const hostname = location.hostname;

// 本地访问还是远程访问
const remoteAccess = hostname.indexOf('pinkyjie.com') !== -1;
const maps = {
	[`http://${placeholder}:60212/`]: 'http://pi-portainer.pinkyjie.com',
	[`http://${placeholder}:60220/`]: 'http://pi-jellyfin.pinkyjie.com',
	[`http://${placeholder}:8123/`]: 'http://pi-ha.pinkyjie.com',
	[`http://${placeholder}:8091/admin/`]: 'http://pi-pihole.pinkyjie.com/admin',
	[`http://${placeholder}:8080/`]: 'http://pi-mqtt.pinkyjie.com',
	[`http://${placeholder}/`]: 'http://pi-alist.pinkyjie.com',
}

// 替换 ${hostname} 为当前路径 hostname
const links = document.querySelectorAll('.item-container > .item > a');
for (const link of links) {
	const url = link.href;
	if (remoteAccess && maps[url]) {
		link.href = maps[url];
	} else if (url.indexOf(placeholder) !== -1) {
		link.href = url.replace(placeholder, hostname);
	}
}
