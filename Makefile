sd.img: opensbi/build/platform/generic/firmware/fw_dynamic.itb u-boot/u-boot.itb
	# WIP. It does not work now
	dd if=blobs/u-boot-bpi-f3-header-sd-0k.img of=$@ bs=512 seek=0    conv=notrunc
	dd if=blobs/u-boot-bpi-f3-512b.img         of=$@ bs=512 seek=1    conv=notrunc
	dd if=u-boot/FSBL.bin                      of=$@ bs=512 seek=512  conv=notrunc
	dd if=opensbi/build/platform/generic/firmware/fw_dynamic.itb of=$@ bs=512 seek=1280 conv=notrunc
	dd if=u-boot/u-boot.itb                    of=$@ bs=512 seek=2048 conv=notrunc

opensbi/build/platform/generic/firmware/fw_dynamic.itb:
	make -C opensbi PLATFORM=generic CROSS_COMPILE=riscv64-linux-gnu- -j `nproc`

u-boot/u-boot.itb:
	make -C u-boot ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- -j `nproc`
