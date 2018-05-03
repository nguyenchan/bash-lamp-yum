# xu ly chuoi

1. 
### Liet ke cac thiet bi dang cam qua giao dien PCI (hoac USB)
```sh
yum -y install pciutils
lspci
yum -y install usbutils
lsusb
```

### Liet ke cac dich vu se chay khi centos startup
chkconfig --list

2. 

### Tat toan bo phan vung swap
swapoff -a

### Xac dinh server dung BIOS boot hay UEFI boot
dmesg | grep "EFI v"
nếu không có kết quả trả về  là bios boot
nếu có kết quả [ 0.000000] EFI v2.00 by American Megatrends là UEFI boot
hoặc kiểm tra nếu tồn tại thư mục /sys/firmware/efi là uefi boot

### Flush cache
free && sync && echo 3 > /proc/sys/vm/drop_caches && free

3. 
### Dùng softraid trên linux để cấu hình RAID 1 cho 2 ổ cứng vật lý lại, sau đó format ext4, mount vào folder và trình bày cơ chế hoạt động khi dữ liệu đc ghi xuống

4. 
###

5. 
### Liệt kê các gói phần mềm đang được cài từ repo
yum list installed
### Cấu hình loại trừ 1 gói phần mềm ra khỏi yum update
vi /etc/yum.conf
thêm vào:
exclude=perl php python

6. 
### echo trên linux có dùng để tạo file mới đc không
echo 'Hello, world.' >foo.txt
### Liệt kê các biến môi trường trên linux
printenv hoac env
### THế nào là biến môi trường và cách gán 1 biến môi trường mới
NC=nguyenchan
echo $NC
export NC
env | grep NC

7. 
### Lệnh xem kernel ver
uname -r
### In ra danh sách 5 user cuối cùng từ file /etc/passwd

8. ### Lọc file log liệt kê IP truy cập có status code 200, danh sách không trùng
awk '{if ($9=="200") print $1, $9}' testlog | sort -n -u

9. 
### tao usser
useradd nhanvien
### kill all httpd
pkill -f httpd
### stat %wa, %id trong top
%us: %CPU được dùng cho từng tiến trình của User.
%sy: %CPU được dùng cho từng tiến trình của hệ thống.
%ni: %CPU dành cho low-priority processes.
%id: %CPU ở trạng thái nghỉ.
%wa: %CPU đang trong thời gian chờ I/O.
%hi: %CPU được dành cho phần cứng khi bị gián đoạn.
%si: %CPU được dành cho phần mềm khi bị gián đoạn.
%st: %CPU ảo chờ đợi CPU thực xử lý các process.

PID: Process ID
User: User thực hiện Process trên.
PR: Độ ưu tiên của Process.
NI: Giá trị nice value của tiến trình, giá trị âm tăng độ ưu tiên của Process, giá trị dương giảm độ ưu tiên của Process.
VIRT: Dung lượng RAM ảo cho việc thực hiện Process.
RES: Dung lượng RAM thực chạy Process.
SHR: Dung lượng RAM share cho Process.
S : Trạng thái Process đang hoạt động.
%CPU: %CPU được sử dụng cho Process.
%RAM: %RAM được dùng cho Process.
TIME+: Tổng thời gian thực hiện 1 Process.
COMMAND: Tên của Process.

### sed
### Tìm tất cả các file *.php và chown thành owner nhanvien

10. 
### điểm khác nhau khi connect địac chỉ mysql 127.0.0.1 với địa chỉ public
loopback nhanh hơn


~~

### Xem toc do vat ly cua port
ethtool eth0 | grep Speed
### Xac dinh file systems type
lsblk -f
blkid


###Cpanel
Port 2087: Đây là port truy cập vào trang quản lý cPanel dành cho System Admin
Port 2083: Đây là port truy cập vào trang quản lý Host dành cho người dùng
Port 2093: Đây là Port truy cập vào dịch vụ Email Hosting dành cho người dùng
Port 995, 465: mail server


