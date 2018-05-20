# FIONette hardware

### Tech Specs
https://b2b.gigabyte.com/Embedded-Computing/EL-20-3700-32GB-rev-20#sp

### Hardware Overview
https://b2b.gigabyte.com/Embedded-Computing/EL-20-3700-32GB-rev-20#ov

### Support Downloads
https://b2b.gigabyte.com/Embedded-Computing/EL-20-3700-32GB-rev-20#support-dl

#### Misc notes
 - F3 BIOS recommended
   to create a bootable auto flash onto device /dev/sdz use the following command (this will destroy all data on /dev/sdz)
```
gunzip -c F3-EL20_4G_bootable.img.gz | dd of=/dev/sdz
```

 - Legacy mode vs UEFI recomended
 - Suggest slight under provision of onboard flash for longevity
