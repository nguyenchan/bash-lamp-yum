# 101
## 101.1
yum -y install pciutils
lspci
yum -y install usbutils
lsusb

### lsmod
(cat /proc/modules)
list status of modules in linux kernel
Module: the name of the module. This is usually the name of the module file, minus the extension (.o or .ko), but it may have a custom name, which can be specified as an option when the module is inserted with the insmod command.
Size: the amount of memory used by the resident module, in bytes.
Used by: This column contains a number representing how many instances of the module are being used. If the number is zero, the module is not currently being used. Text after the number represents any available information about what is using the module: this is commonly a device name, a filesystem identifier, or the name of another module.

### modprobe
program to add and remove modules from the Linux Kernel
* -l --list 
List all modules matching the given wildcard (or "*" if no wildcard is given). This option is provided for backwards compatibility: see find(1) and basename(1) for a more flexible alternative.
* -r --remove
* -a --all
insert all module on the command line

### modinfo
liệt kê các thông tin về 1 module

### /sys 
is an interface to the kernel. Specifically, it provides a filesystem-like view of information and configuration settings that the kernel provides, much like /proc. Writing to these files may or may not write to the actual device, depending on the setting you're changing. It isn't only for managing devices, though that's a common use case.

### /proc
Chứa đựng thông tin về quá trình xử lý của hệ thống.

Đây là một pseudo filesystem chứa đựng các thông tin về các process đang chạy.

Đây là một virtual filesystem chứa đựng các thông tin tài nguyên hệ thống.

Ví dụ: /proc/cpuinfo cung cấp cho ta thông số kỹ thuật của CPU. Để xem dùng lệnh cat: $cat /proc/cpuinfo

### /dev
Các file thiết bị - nơi lưu trữ các phân vùng ổ cứng, thiết bị ngoại vi như usb, ổ đĩa cắm ngoài hay bất cứ thiết bị nào được gán vào hệ thống.

## 101.2
### dmesg
xem lại các thông báo trong quá trình khởi động

### bootloader
 1. power on (Power-on Self-test)
 2. MBR 
 3. Bootloader GRUB (or LILO)
 4. Linux kernel
 5. Init

### initramfs

### init
PID = 1
tiến trình khởi chạy đầu tiên, cha của tất cả các tiến trình khác
có 3 kiểu tiến trình init:
 * system V (sysV) : phiên bản truyền thống trên các hệ thống linux cũ
 * upstart: được phát triển và sử dùng bởi ubuntu năm 2009 và sử dùng trong các bản ubuntu cũ hơn 15.04
 * systemd: là một init system được phát triển vào khoảng 2010 và được nhiều phiên bản linux sử dụng để thay thế các init system cũ. Ubuntu từ 15.04 và centos từ 7.0 đã sử sụng systemd làm init system mặc định.

### sysVinit

### systemd 

