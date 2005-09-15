Short Version
-------------

1. make clean all
2. burn image.iso on CD


Long Version
------------

Download a Debian netinst image[1], "unpack it" somewhere, and link it
to ./debian-netinst.  To double check, there should now be a directory
./debian-netinst/isolinux/.

Download the sarge/main override file from the Debian FTP server[2]
and move it to indices/override.  It may be wisest to use the override
file from the time the netinst image was build, but it's not clear how
important that is.

Download the extra packages from the projects FTP site[3] and place them
into the directory extra-packages.  The exact substructure doesn't
matter, but there should be some .deb files in there.

Run scripts/make-extra-pool, resulting in a directory extra-pool.

Update the version information in scripts/apt.conf and image-data/.disk/info.

Adjust the paths in scripts/apt-ftparchive.conf to your local situation.

Run scripts/make-image to prepare the image/ directory.

Run scripts/make-iso to create the CD image.

Burn the image.


[1]  http://www.debian.org/devel/debian-installer/
[2]  ftp://ftp.de.debian.org/debian/indices/override.sarge.main.gz
[3]  wget -r -A.deb -nd ftp://ftp.berlios.de/pub/osf/extra-packages
