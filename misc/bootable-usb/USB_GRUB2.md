# Bootable USB media using GRUB2 and .iso files (GRUB2 METHOD)

## ` caution be extremely careful you can wipe your workstation do not confuse your drives data is lost and will be lost in this procedure `

### ` one more time, this procedure will wipe data! `

Side note:
A very fast way to clone a one usb drive to another (sdb -> sda in this case):
```
dd if=/dev/sdb conv=noerror,sync bs=64k | dd of=/dev/sda bs=64k
```


# Grub2 method: 

Find your USB drive:
```
lsblk -f
```
Make sure your media is clean. In this example /dev/sdg is my external 8GiB usb thumb drive.
```
dd if=/dev/zero of=/dev/sdg
```
Create the disk label and MBR
```
parted /dev/sdg mklabel msdos 
parted /dev/sdg mkpart primary 1 100%
```

Make filesystem with disk name
```
mkdosfs -F32 -n GBRBOOT /dev/sdg1
```

Fastest way to let the system know about changes:
`Pull the drive and re-insert it.`
Check your drive with dmesg (optional)
```
dmesg -T
```

It should show up in this case as GBRBOOT.

Create grub2 structure and install grub2
```
[root@minty ~]# mkdir -p /run/media/grobb/GBRBOOT/{boot,iso}
```

Install GRUB2
```
[root@minty ~]# grub2-install --target=i386-pc --recheck --boot-directory=/run/media/grobb/GBRBOOT/boot /dev/sdg
Installing for i386-pc platform.
Installation finished. No error reported.
```

Take a look at the file structure:
```
[root@minty ~]# ls -la /run/media/grobb/GBRBOOT/
total 12
drwxr-xr-x. 4 grobb grobb 4096 Aug  9 14:05 .
drwxr-x---+ 3 root  root    60 Aug  9 14:02 ..
drwxr-xr-x. 3 grobb grobb 4096 Aug  9 14:07 boot
drwxr-xr-x. 2 grobb grobb 4096 Aug  9 14:05 iso

[root@minty ~]# ls -la /run/media/grobb/GBRBOOT/boot/
total 12
drwxr-xr-x. 3 grobb grobb 4096 Aug  9 14:07 .
drwxr-xr-x. 4 grobb grobb 4096 Aug  9 14:05 ..
drwxr-xr-x. 5 grobb grobb 4096 Aug  9 14:08 grub2
[root@minty ~]# 

```

Copy .iso files over to the .iso directory in this exampel we have two Fedora-Live .iso files.

```
rsync -av /path/to/iso/source/*.iso /run/media/grobb/GBRBOOT/iso/
```

Output of the iso directory post rsync:
```
[grobb@gerty iso]$ ls -la
total 7374632
drwxr-xr-x. 2 grobb grobb       8192 Nov  9 21:37 .
drwxr-xr-x. 4 grobb grobb       8192 Dec 31  1969 ..
-rw-r--r--. 1 grobb grobb  406847488 May  1  2015 android-x86-4.4-r2.iso
-rw-r--r--. 1 grobb grobb         65 May  1  2015 android-x86-4.4-r2.iso.sha1
-rw-r--r--. 1 grobb grobb  593494016 May  1  2015 CentOS-7.0-1406-x86_64-Minimal.iso
-rw-r--r--. 1 grobb grobb  666894336 Mar 31  2015 CentOS-7-x86_64-Minimal-1503-01.iso
-rw-r--r--. 1 grobb grobb  632291328 Jan  5  2016 CentOS-7-x86_64-Minimal-1511.iso
-rw-r--r--. 1 grobb grobb    2949120 May  2  2017 dell-asset-and-service-tag.iso
-rw-r--r--. 1 grobb grobb    1474560 May  2  2017 dell-st.ima
-rw-r--r--. 1 grobb grobb    1474560 May  1  2015 fdodin06.144
-rw-r--r--. 1 grobb grobb 1868562432 Sep 13  2016 Fedora-Server-dvd-x86_64-24-1.2.iso
-rw-r--r--. 1 grobb grobb 1440743424 Jan  7  2017 Fedora-Workstation-Live-x86_64-25-1.3.iso
-rw-r--r--. 1 grobb grobb 1631584256 Feb 26 17:43 Fedora-Workstation-Live-x86_64-27-1.6.iso
-rw-r--r--. 1 grobb grobb  305135616 Nov  8 11:58 gparted-live-0.30.0-1-amd64.iso
-rw-r--r--. 1 grobb grobb        400 Nov 13  2015 id_rsa.pub
-rw-r--r--. 1 grobb grobb      25372 May  1  2015 memdisk
-rw-r--r--. 1 grobb grobb     103308 Sep  4  2015 memtest

```


At time of writing grub.cfg was here:

```
[grobb@gerty grub2]$ pwd
/run/media/grobb/GBRBOOT/boot/grub2
[grobb@gerty grub2]$ ls
fonts  grub.cfg  grubenv  i386-pc  locale
[grobb@gerty grub2]$ 
```


Next make the file /run/media/grobb/GBRBOOT/boot/grub2/grub.cfg manually and test out the drive.  To add additional entries follow the standard grub2 syntax.  *NOTE* take a look a the set imguuid variable and hos it is set.

```
## Config
# path to the partition holding ISO images (lsblk -f)

set imguuid='0D59-F1BD'
set imgdevpath="/dev/disk/by-uuid/$imguuid"
set imgroot='hd0,msdos1'

menuentry '[CentOS 7.4] CentOS 7.4 - INSTALL ' {
    set isofile='/iso/CentOS-7-x86_64-Minimal-1511.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[CentOS 7.4] CentOS 7.4 - RESCUE ' {
    set isofile='/iso/CentOS-7-x86_64-Minimal-1511.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[FC 27] Fedora Live Workstation' {
    set isofile='/iso/Fedora-Workstation-Live-x86_64-27-1.6.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz root=live:CDLABEL=Fedora-WS-Live-27-1-6 iso-scan/filename=$isofile rd.live.image
    initrd (loop)/isolinux/initrd.img
}

menuentry '[FC 25] Fedora-25-Workstation' {
    set isofile='/iso/Fedora-Workstation-Live-x86_64-25-1.3.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz root=live:CDLABEL=Fedora-WS-Live-25-1-3 iso-scan/filename=$isofile rd.live.image
    initrd (loop)/isolinux/initrd.img
}

menuentry '[FC 24] Fedora-Live-Server-x86_64-24-1.2' {
    set isofile='/iso/Fedora-Server-dvd-x86_64-24-1.2.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz root=live:CDLABEL=Fedora-S-dvd-x86_64-24 iso-scan/filename=$isofile rd.live.image
    initrd (loop)/isolinux/initrd.img
}

menuentry '[FC 23] Fedora-Live-Workstation-x86_64-23-10' {
    set isofile='/iso/Fedora-Live-Workstation-x86_64-23-10.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz0 root=live:CDLABEL=Fedora-Live-WS-x86_64-23-10 iso-scan/filename=$isofile rd.live.image
    initrd (loop)/isolinux/initrd0.img
}

menuentry '[CentOS 7.2] CentOS-7.2-Minimal' {
    set isofile='/iso/CentOS-7-x86_64-Minimal-1511.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[CentOS 7.2 - RESCUE] CentOS-7.2 RESCUE' {
    set isofile='/iso/CentOS-7-x86_64-Minimal-1511.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz rescue noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[CentOS 7.1] CentOS-7.1-Minimal' {
    set isofile='/iso/CentOS-7-x86_64-Minimal-1503-01.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[CentOS 7.1 - RESCUE] CentOS-7.1 RESCUE' {
    set isofile='/iso/CentOS-7-x86_64-Minimal-1503-01.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz rescue noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[CentOS 7.0]CentOS-7.0-1406-x86_64-Minimal' {
    set isofile='/iso/CentOS-7.0-1406-x86_64-Minimal.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}

menuentry '[CentOS 7.0 - RESCUE] CentOS-7.0-1406-x86_64-Minimal RESCUE' {
    set isofile='/iso/CentOS-7.0-1406-x86_64-Minimal.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/isolinux/vmlinuz rescue noeject inst.stage2=hd:UUID=$imguuid:$isofile
    initrd (loop)/isolinux/initrd.img
}


# android-x86
# extract iso root directory files to /iso/android

menuentry '[GPARTED] gparted-live-0.30.0-1-amd64' {
    set isofile='/iso/gparted-live-0.30.0-1-amd64.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/live/vmlinuz boot='live' union='overlay' username='user' config components noeject noswap ip='' toram='filesystem.squashfs' findiso="${isofile}"
    initrd (loop)/live/initrd.img
}

menuentry '[loopback]android-x86-4.4-r2 Run' {
    set isofile='/iso/android-x86-4.4-r2.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/kernel root=/dev/ram0 androidboot.hardware=android_x86 quiet SRC=/iso/android DATA=
    initrd (loop)/initrd.img
}

menuentry '[loopback]android-x86-4.4-r2 Install' {
    set isofile='/iso/android-x86-4.4-r2.iso'
    loopback loop ($imgroot)$isofile
    linux (loop)/kernel root=/dev/ram0 androidboot.hardware=android_x86 quiet SRC=/iso/android INSTALL=1 DEBUG=
    initrd (loop)/initrd.img
}

## Freedos

menuentry '[memdisk]Freedos' {
    insmod fat
    set isofile='/iso/fdodin06.144'
    linux16 /iso/memdisk
    initrd16 ($imgroot)$isofile
}


## DELL Service Tag Fix

menuentry '[memdisk]Dell-Service-Tag-Fix' {
    insmod fat
    set isofile='/iso/dell-st.ima'
    linux16 /iso/memdisk
    initrd16 ($imgroot)$isofile
}


## Just boot

menuentry 'memdisk - memtest86-6.2.0 - just boot' {
    linux16 /iso/memtest
}
```

# - OR -


# Bootable USB (SYSLINUX Method)

## This method is legacy and involve a few extra steps vs the GRUB2 method it is not a prefered method yet, maps 1:1 to PXE and menu.c32

Assume all `data will be lost` on drive so, make a backup.

You will need ms-sys, install it from here: <http://ms-sys.sourceforge.net/>

1. `fdisk -l` to determine usb drive 
2. It is a wonderful idea to obliterate the drive with `dd if=/dev/zero of=/dev/<usb>`
3. `fdisk /dev/<usbdrive>`
4. delete all partitions, create new primary partition using all disk space 
5. set partition to type "b" (fat32) 
6. set the boot flag on your partition with the command "a" 
7. `mkdosfs -F32 /dev/<usbdrive partition>`
8. `/usr/local/bin/ms-sys -s /dev/<usbdrive>`  (write a syslinux MBR) 
9. copy linux images, dd images, kernels and original contents to drive 
10. `syslinux /dev/<usbdrive partiton>`
11. modify the `syslinux.cfg` to adjust the menu settings. 
12. if it exists, rm `ldlinux.sys` (usually exists if you copied the necessary root files from someone else's USB) 

Fast way to clone a one usb drive to another:

```
dd if=/dev/sdb conv=noerror,sync bs=64k | dd of=/dev/sda bs=64k
```
