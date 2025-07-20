# AdGuard

AdGuard is a comprehensive software suite designed to enhance your online experience by blocking ads, protecting your privacy, and improving security across multiple devices and platforms. It works by filtering out various types of advertisements, preventing online trackers from collecting your data, and warning you about potentially malicious websites. Available as full applications for Windows, macOS, Android, and iOS, as browser extensions, and even as network-wide solutions like AdGuard Home and AdGuard DNS, it offers a versatile approach to achieving a cleaner, faster, and more secure internet.

## Setup notes

Adguard requires port 53 UDP and TCP, which are also used by a system service, `systemd-resolved`
This is the service that provides the first DNS server. AdGuard will replace that.

Disable the service by executing:
```sh
systemctl disable systemd-resolved.service
systemctl stop systemd-resolved
```

## Admin panel

The admin panel can be accessed in port 3000.
