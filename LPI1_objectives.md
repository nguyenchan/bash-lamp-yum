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
 3. Bootloader GRUB (or LILO):
  LILO không có giao diện commandline tương tác như GRUB
  LILO không hỗ trợ boot từ network như GRUB
  GRUB hỗ trợ load nhiều OS khác nhau
  GRUB load 2 stages (MBR, GRUB bootloader)
 4. Linux kernel
 5. Init

### initramfs
được nạp vào hệ thống sau khi load xong kernel và trước khi chạy init

### init
PID = 1
tiến trình khởi chạy đầu tiên, cha của tất cả các tiến trình khác
có 3 kiểu tiến trình init:
 * system V (sysV) : phiên bản truyền thống trên các hệ thống linux cũ
 * upstart: được phát triển và sử dùng bởi ubuntu năm 2009 và sử dùng trong các bản ubuntu cũ hơn 15.04
 * systemd: là một init system được phát triển vào khoảng 2010 và được nhiều phiên bản linux sử dụng để thay thế các init system cũ. Ubuntu từ 15.04 và centos từ 7.0 đã sử sụng systemd làm init system mặc định.

### sysVinit
 * 0: half
 * 1: single-user
 * 2: multi-user
 * 3: multi-user with networking
 * 4: undefind (user defind)
 * 5: multi-user with display manager (graphical login)
 * 6: reboot

### systemd 
trong systemd khái niệm "runlevels" được thay thế bằng các targets để boot vào như sau:
 * poweroff.target - shutdown system
 * rescue.target - single user mode
 * multi-user.target - multiuser with networking
 * graphical.target - multiuser with networking and GUI
 * reboot.target - restart

## 101.3
### /etc/inittab
CHứa config hệ thống sẽ làm gì khi khởi động

`id:3:initdefault:`

runlevel mặc định là lvl 3: Full multiuser mode

### shutdown [-krhPHc] [-t sec] time [message]
 * -k: không shutdown nhưng sẽ cảnh báo khi ai đó shutdown hệ thống
 * -r: reboot sau khi shutdown
 * -h: shutdown và halt hoặc power off 
 * -P: shutdown và ngắt điện từ nguồn (power off)
 * -H: shutdown và giữ trạng thái halt (tắt CPU)
 * -c: huỷ lệnh shutdown đang chờ
 * -t sec: đợi "sec" giây trước khi shutdown
 * time: thời gian thực hiện shutdown trong ngày (0-23h)
 * message: tin nhắn đến tất cả user trước khi shutdown

### init [runlevel]
dùng để thay đổi runlevel
- Run level 0 (init 0): chế độ tắt máy.
- Run level 1 (init 1): chế độ này chỉ sử dụng được 1 người dùng.
- Run level 2 (init 2): chế độ đa người dùng nhưng không có dịch vụ NFS.
- Run level 3 (linit 3): chế độ đa người dùng, có đầy đủ các dịch vụ.
- Run level 4 (linit 4): người dùng định nghĩa
- Run level 5 (linit 5): chế độ đồ họa.
- Run level 6 (linit 6): khởi động lại máy.

### /etc/init.d/ 
Chứa các script sử dụng bởi SysVinit, đây là cách quản lý các gói dịch vụ truyền thống của linux.
Các file trong này là shell script dùng để start, stop, restart các service.

### telinit
giống init

### systeamd
Thuộc nhóm chương trình system and service manager - nó quản lý (start/stop/restart) các service chạy trên máy từ lúc bật máy lên cho tới lúc tắt máy.
Nó cũng quản lý luôn cả hệ thống (system) cụ thể là các công việc: set tên máy(hostname), cấu hình loopback interface (lo trong output của lệnh `ip addr`), thiết lập mount các filesystem như /sys/proc ..
systemd thường là process đầu tiên được chạy sau khi bật máy (PID = 1) và còn được gọi là init system giống như Upstart trên Ubuntu 14.04, launchd của OSX, supervisor viết bằng python, SysV trên các hệ thống linux cũ.
