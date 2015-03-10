# Zero out the free space to save space in the final image:
echo "zeroing the disk..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
