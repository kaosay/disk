
#yum install lvm2

pvcreate /dev/vdb

vgcreate vg_log /dev/vdb

lvcreate -l 100%free vg_log -n lv_log

mkdir /data

mkfs.ext4 /dev/mapper/vg_log-lv_log

mount /dev/mapper/vg_log-lv_log /data/

sed -i '$a /dev/mapper/vg_log-lv_log  /data  ext4  defaults  0  0' /etc/fstab
