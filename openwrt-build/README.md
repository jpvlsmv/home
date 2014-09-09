Notes for the openwrt-build VM
===========================

After the VM is provisioned, fetch the ImageBuilder image into this location.

Then you can
   tar xvfj /vagrant/Open*bz2

Fetch the modified config files from the running router using the 
fetch-conffiles.sh script (run from inside the Imagebuilder directory)

Making
----------
make image PROFILE=TLWR841 FILES=files/


What's included
---------------
Look at the Packages.txt file, this is what Imagebuilder thinks it has put
into the image.

Compare it to opkg list-installed


