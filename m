Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A84E364E64
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 01:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhDSXEN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 19:04:13 -0400
Received: from terminus.zytor.com ([198.137.202.136]:39215 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230326AbhDSXED (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 19:04:03 -0400
Received: from tazenda.hos.anvin.org ([IPv6:2601:646:8602:8be0:7285:c2ff:fefb:fd4])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13JN30Cp2438940
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 19 Apr 2021 16:03:09 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13JN30Cp2438940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021032801; t=1618873390;
        bh=VLw22aBEbihi3LrdDn3aUt6okN2p3qy4OLbKqxodokQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UAvZ7n63GdAafbSjvysVTT/Qui3m+txGanptLLVT34zI+AGrRR4EU3ku0ZYHZAFp3
         TWpns5KdU/NTeanjr5FXhIIJE1yTm4Yevc7hzqtsQyQVFEt6nzRjXXfSXjUsL3I1TM
         kuYSoq4PCf8iXbcpcH+Dlu2S9uepL9grl9CHGykYKyTxBkgkR/rkN8FL4rV5Q8tlN7
         tr95nef9Nxw3+BFLUyb0MOaKLZewMBYYVQIsLe5i2yzQ7OujRtjDV8MihVF0/HU7yZ
         c2a33yqTlfFXuyrb4JtUI0Hz7av1ipWxYQ8iRiQnG3j/wGEYTmeXMKxI6fstF+MzbO
         vd9u+8mELru9A==
From:   "H. Peter Anvin" <hpa@zytor.com>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
        "H. Peter Anvin (Intel)" <hpa@zytor.com>
Subject: [PATCH v2 1/3] x86/boot: Modernize genimage script; hdimage support; remove bzlilo
Date:   Mon, 19 Apr 2021 16:02:50 -0700
Message-Id: <20210419230252.1583169-2-hpa@zytor.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419230252.1583169-1-hpa@zytor.com>
References: <20210419230252.1583169-1-hpa@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

The image generation scripts in arch/x86/boot are pretty out of date,
except for the isoimage target. Update and clean up the
genimage.sh script, and make it support an arbitrary number of
initramfs files in the image.

Add a "hdimage" target, which can be booted by either BIOS or
EFI (if the kernel is compiled with the EFI stub.) For EFI to be able
to pass the command line to the kernel, we need the EFI shell, but the
firmware builtin EFI shell, if it even exists, is pretty much always
the last resort boot option, so search for OVMF or EDK2 and explicitly
include a copy of the EFI shell.

To make this all work, use bash features in the script.  Furthermore,
this version of the script makes use of some mtools features,
especially mpartition, that might not exist in very old version of
mtools, but given all the other dependencies on this script this
doesn't seem such a big deal.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/Makefile            |   5 +-
 arch/x86/boot/.gitignore     |   1 +
 arch/x86/boot/Makefile       |  44 +++---
 arch/x86/boot/genimage.sh    | 294 ++++++++++++++++++++++++++---------
 arch/x86/boot/mtools.conf.in |   3 +
 5 files changed, 247 insertions(+), 100 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 9a85eae37b17..943f26a32834 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -247,7 +247,7 @@ drivers-$(CONFIG_FB) += arch/x86/video/
 
 boot := arch/x86/boot
 
-BOOT_TARGETS = bzdisk fdimage fdimage144 fdimage288 isoimage
+BOOT_TARGETS = bzdisk fdimage fdimage144 fdimage288 hdimage isoimage
 
 PHONY += bzImage $(BOOT_TARGETS)
 
@@ -305,8 +305,9 @@ define archhelp
   echo  '  fdimage		- Create 1.4MB boot floppy image (arch/x86/boot/fdimage)'
   echo  '  fdimage144		- Create 1.4MB boot floppy image (arch/x86/boot/fdimage)'
   echo  '  fdimage288		- Create 2.8MB boot floppy image (arch/x86/boot/fdimage)'
+  echo  '  hdimage		- Create a BIOS/EFI hard disk image (arch/x86/boot/hdimage)'
   echo  '  isoimage		- Create a boot CD-ROM image (arch/x86/boot/image.iso)'
-  echo  '			  bzdisk/fdimage*/isoimage also accept:'
+  echo  '			  bzdisk/fdimage*/hdimage/isoimage also accept:'
   echo  '			  FDARGS="..."  arguments for the booted kernel'
   echo  '                  	  FDINITRD=file initrd for the booted kernel'
   echo  ''
diff --git a/arch/x86/boot/.gitignore b/arch/x86/boot/.gitignore
index 9cc7f1357b9b..1189be057ebd 100644
--- a/arch/x86/boot/.gitignore
+++ b/arch/x86/boot/.gitignore
@@ -11,3 +11,4 @@ setup.elf
 fdimage
 mtools.conf
 image.iso
+hdimage
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index fe605205b4ce..dfbc26a8e924 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -29,7 +29,7 @@ KCOV_INSTRUMENT		:= n
 SVGA_MODE	:= -DSVGA_MODE=NORMAL_VGA
 
 targets		:= vmlinux.bin setup.bin setup.elf bzImage
-targets		+= fdimage fdimage144 fdimage288 image.iso mtools.conf
+targets		+= fdimage fdimage144 fdimage288 image.iso hdimage
 subdir-		:= compressed
 
 setup-y		+= a20.o bioscall.o cmdline.o copy.o cpu.o cpuflags.o cpucheck.o
@@ -115,47 +115,49 @@ $(obj)/compressed/vmlinux: FORCE
 	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
 
 # Set this if you want to pass append arguments to the
-# bzdisk/fdimage/isoimage kernel
+# bzdisk/fdimage/hdimage/isoimage kernel
 FDARGS =
-# Set this if you want an initrd included with the
-# bzdisk/fdimage/isoimage kernel
+# Set this if you want one or more initrds included in the image
 FDINITRD =
 
-image_cmdline = default linux $(FDARGS) $(if $(FDINITRD),initrd=initrd.img,)
+imgdeps = $(obj)/bzImage $(obj)/mtools.conf $(src)/genimage.sh
 
 $(obj)/mtools.conf: $(src)/mtools.conf.in
 	sed -e 's|@OBJ@|$(obj)|g' < $< > $@
 
+targets += mtools.conf
+
+# genimage.sh requires bash, but it also has a bunch of other
+# external dependencies.
 quiet_cmd_genimage = GENIMAGE $3
-cmd_genimage = sh $(srctree)/$(src)/genimage.sh $2 $3 $(obj)/bzImage \
-			$(obj)/mtools.conf '$(image_cmdline)' $(FDINITRD)
+cmd_genimage = $(BASH) $(srctree)/$(src)/genimage.sh $2 $3 $(obj)/bzImage \
+		$(obj)/mtools.conf '$(FDARGS)' $(FDINITRD)
 
-PHONY += bzdisk fdimage fdimage144 fdimage288 isoimage bzlilo install
+PHONY += bzdisk fdimage fdimage144 fdimage288 hdimage isoimage install
 
 # This requires write access to /dev/fd0
-bzdisk: $(obj)/bzImage $(obj)/mtools.conf
+# All images require syslinux to be installed; hdimage also requires
+# EDK2/OVMF if the kernel is compiled with the EFI stub.
+bzdisk: $(imgdeps)
 	$(call cmd,genimage,bzdisk,/dev/fd0)
 
-# These require being root or having syslinux 2.02 or higher installed
-fdimage fdimage144: $(obj)/bzImage $(obj)/mtools.conf
+fdimage fdimage144: $(imgdeps)
 	$(call cmd,genimage,fdimage144,$(obj)/fdimage)
 	@$(kecho) 'Kernel: $(obj)/fdimage is ready'
 
-fdimage288: $(obj)/bzImage $(obj)/mtools.conf
+fdimage288: $(imgdeps)
 	$(call cmd,genimage,fdimage288,$(obj)/fdimage)
 	@$(kecho) 'Kernel: $(obj)/fdimage is ready'
 
-isoimage: $(obj)/bzImage
+hdimage: $(imgdeps)
+	$(call cmd,genimage,hdimage,$(obj)/hdimage)
+	@$(kecho) 'Kernel: $(obj)/hdimage is ready'
+
+isoimage: $(imgdeps)
 	$(call cmd,genimage,isoimage,$(obj)/image.iso)
 	@$(kecho) 'Kernel: $(obj)/image.iso is ready'
 
-bzlilo:
-	if [ -f $(INSTALL_PATH)/vmlinuz ]; then mv $(INSTALL_PATH)/vmlinuz $(INSTALL_PATH)/vmlinuz.old; fi
-	if [ -f $(INSTALL_PATH)/System.map ]; then mv $(INSTALL_PATH)/System.map $(INSTALL_PATH)/System.old; fi
-	cat $(obj)/bzImage > $(INSTALL_PATH)/vmlinuz
-	cp System.map $(INSTALL_PATH)/
-	if [ -x /sbin/lilo ]; then /sbin/lilo; else /etc/lilo/install; fi
-
 install:
-	sh $(srctree)/$(src)/install.sh $(KERNELRELEASE) $(obj)/bzImage \
+	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh \
+		$(KERNELRELEASE) $(obj)/bzImage \
 		System.map "$(INSTALL_PATH)"
diff --git a/arch/x86/boot/genimage.sh b/arch/x86/boot/genimage.sh
index 6a10d52a4145..4b554049ec3c 100644
--- a/arch/x86/boot/genimage.sh
+++ b/arch/x86/boot/genimage.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 #
 # This file is subject to the terms and conditions of the GNU General Public
 # License.  See the file "COPYING" in the main directory of this archive
@@ -8,15 +8,24 @@
 #
 # Adapted from code in arch/x86/boot/Makefile by H. Peter Anvin and others
 #
-# "make fdimage/fdimage144/fdimage288/isoimage" script for x86 architecture
+# "make fdimage/fdimage144/fdimage288/hdimage/isoimage"
+# script for x86 architecture
 #
 # Arguments:
-#   $1 - fdimage format
-#   $2 - target image file
-#   $3 - kernel bzImage file
-#   $4 - mtool configuration file
-#   $5 - kernel cmdline
-#   $6 - inird image file
+#   $1  - fdimage format
+#   $2  - target image file
+#   $3  - kernel bzImage file
+#   $4  - mtools configuration file
+#   $5  - kernel cmdline
+#   $6+ - initrd image file(s)
+#
+# This script requires:
+#   bash
+#   syslinux
+#   mtools (for fdimage* and hdimage)
+#   edk2/OVMF (for hdimage)
+#
+# Otherwise try to stick to POSIX shell commands...
 #
 
 # Use "make V=1" to debug this script
@@ -26,105 +35,236 @@ case "${KBUILD_VERBOSE}" in
         ;;
 esac
 
-verify () {
-	if [ ! -f "$1" ]; then
-		echo ""                                                   1>&2
-		echo " *** Missing file: $1"                              1>&2
-		echo ""                                                   1>&2
-		exit 1
+# Exit the top-level shell with an error
+topshell=$$
+trap 'exit 1' USR1
+die() {
+	echo ""        1>&2
+	echo " *** $*" 1>&2
+	echo ""        1>&2
+	kill -USR1 $topshell
+}
+
+# Verify the existence and readability of a file
+verify() {
+	if [ ! -f "$1" -o ! -r "$1" ]; then
+		die "Missing file: $1"
 	fi
 }
 
+diskfmt="$1"
+FIMAGE="$2"
+FBZIMAGE="$3"
+MTOOLSRC="$4"
+KCMDLINE="$5"
+shift 5				# Remaining arguments = initrd files
+
+export MTOOLSRC
 
-export MTOOLSRC=$4
-FIMAGE=$2
-FBZIMAGE=$3
-KCMDLINE=$5
-FDINITRD=$6
+# common options for dd
+dd='dd iflag=fullblock'
 
 # Make sure the files actually exist
 verify "$FBZIMAGE"
 
+declare -a FDINITRDS
+irdpfx=' initrd='
+initrdopts_syslinux=''
+initrdopts_efi=''
+for f in "$@"; do
+	if [ -n "$f" ]; then
+	    FDINITRDS=("${FDINITRDS[@]}" "$f")
+	    fname="$(basename "$f")"
+	    initrdopts_syslinux="${initrdopts_syslinux}${irdpfx}${fname}"
+	    irdpfx=,
+	    initrdopts_efi="${initrdopts_efi} initrd=${fname}"
+	fi
+done
+
+# Read a $3-byte littleendian unsigned value at offset $2 from file $1
+le() {
+	local n=0
+	local m=1
+	for b in $(od -A n -v -j $2 -N $3 -t u1 "$1"); do
+		n=$((n + b*m))
+		m=$((m * 256))
+	done
+	echo $n
+}
+
+# Get the EFI architecture name such that boot{name}.efi is the default
+# boot file name. Returns false with no output if the file is not an
+# EFI image or otherwise unknown.
+efiarch() {
+	[ -f "$1" ] || return
+	[ $(le "$1" 0 2) -eq 23117 ] || return		# MZ magic
+	peoffs=$(le "$1" 60 4)				# PE header offset
+	[ $peoffs -ge 64 ] || return
+	[ $(le "$1" $peoffs 4) -eq 17744 ] || return	# PE magic
+	case $(le "$1" $((peoffs+4+20)) 2) in		# PE type
+		267)	;;				# PE32
+		523)	;;				# PE32+
+		*) return 1 ;;				# Invalid
+	esac
+	[ $(le "$1" $((peoffs+4+20+68)) 2) -eq 10 ] || return # EFI app
+	case $(le "$1" $((peoffs+4)) 2) in		# Machine type
+		 332)	echo i386	;;
+		 450)	echo arm	;;
+		 512)	echo ia64	;;
+		20530)	echo riscv32	;;
+		20580)	echo riscv64	;;
+		20776)	echo riscv128	;;
+		34404)	echo x64	;;
+		43620)	echo aa64	;;
+	esac
+}
+
+# Get the combined sizes in bytes of the files given, counting sparse
+# files as full length, and padding each file to a 4K block size
+filesizes() {
+	local t=0
+	local s
+	for s in $(ls -lnL "$@" 2>/dev/null | awk '/^-/{ print $5; }'); do
+		t=$((t + ((s+4095)/4096)*4096))
+	done
+	echo $t
+}
+
+# Expand directory names which should be in /usr/share into a list
+# of possible alternatives
+sharedirs() {
+	local dir file
+	for dir in /usr/share /usr/lib64 /usr/lib; do
+		for file; do
+			echo "$dir/$file"
+			echo "$dir/${file^^}"
+		done
+	done
+}
+efidirs() {
+	local dir file
+	for dir in /usr/share /boot /usr/lib64 /usr/lib; do
+		for file; do
+			echo "$dir/$file"
+			echo "$dir/${file^^}"
+		done
+	done
+}
+
+findsyslinux() {
+	local f="$(find -L $(sharedirs syslinux isolinux) \
+		    -name "$1" -readable -type f -print -quit 2>/dev/null)"
+	if [ ! -f "$f" ]; then
+		die "Need a $1 file, please install syslinux/isolinux."
+	fi
+	echo "$f"
+	return 0
+}
+
+findovmf() {
+	local arch="$1"
+	shift
+	local -a names=(-false)
+	local name f
+	for name; do
+		names=("${names[@]}" -or -iname "$name")
+	done
+	for f in $(find -L $(efidirs edk2 ovmf) \
+			\( "${names[@]}" \) -readable -type f \
+			-print 2>/dev/null); do
+		if [ "$(efiarch "$f")" = "$arch" ]; then
+			echo "$f"
+			return 0
+		fi
+	done
+	die "Need a $1 file for $arch, please install EDK2/OVMF."
+}
+
+do_mcopy() {
+	if [ ${#FDINITRDS[@]} -gt 0 ]; then
+		mcopy "${FDINITRDS[@]}" "$1"
+	fi
+	if [ -n "$efishell" ]; then
+		mmd "$1"EFI "$1"EFI/Boot
+		mcopy "$efishell" "$1"EFI/Boot/boot${kefiarch}.efi
+	fi
+	if [ -n "$kefiarch" ]; then
+		echo linux "$KCMDLINE$initrdopts_efi" | \
+			mcopy - "$1"startup.nsh
+	fi
+	echo default linux "$KCMDLINE$initrdopts_syslinux" | \
+		mcopy - "$1"syslinux.cfg
+	mcopy "$FBZIMAGE" "$1"linux
+}
+
 genbzdisk() {
 	verify "$MTOOLSRC"
 	mformat a:
-	syslinux $FIMAGE
-	echo "$KCMDLINE" | mcopy - a:syslinux.cfg
-	if [ -f "$FDINITRD" ] ; then
-		mcopy "$FDINITRD" a:initrd.img
-	fi
-	mcopy $FBZIMAGE a:linux
+	syslinux "$FIMAGE"
+	do_mcopy a:
 }
 
 genfdimage144() {
 	verify "$MTOOLSRC"
-	dd if=/dev/zero of=$FIMAGE bs=1024 count=1440 2> /dev/null
+	$dd if=/dev/zero of="$FIMAGE" bs=1024 count=1440 2>/dev/null
 	mformat v:
-	syslinux $FIMAGE
-	echo "$KCMDLINE" | mcopy - v:syslinux.cfg
-	if [ -f "$FDINITRD" ] ; then
-		mcopy "$FDINITRD" v:initrd.img
-	fi
-	mcopy $FBZIMAGE v:linux
+	syslinux "$FIMAGE"
+	do_mcopy v:
 }
 
 genfdimage288() {
 	verify "$MTOOLSRC"
-	dd if=/dev/zero of=$FIMAGE bs=1024 count=2880 2> /dev/null
+	$dd if=/dev/zero of="$FIMAGE" bs=1024 count=2880 2>/dev/null
 	mformat w:
-	syslinux $FIMAGE
-	echo "$KCMDLINE" | mcopy - W:syslinux.cfg
-	if [ -f "$FDINITRD" ] ; then
-		mcopy "$FDINITRD" w:initrd.img
+	syslinux "$FIMAGE"
+	do_mcopy w:
+}
+
+genhdimage() {
+	verify "$MTOOLSRC"
+	mbr="$(findsyslinux mbr.bin)"
+	kefiarch="$(efiarch "$FBZIMAGE")"
+	if [ -n "$kefiarch" ]; then
+		# The efishell provides command line handling
+		efishell="$(findovmf $kefiarch shell.efi shell${kefiarch}.efi)"
+		ptype='-T 0xef'	# EFI system partition, no GPT
 	fi
-	mcopy $FBZIMAGE w:linux
+	sizes=$(filesizes "$FBZIMAGE" "${FDINITRDS[@]}" "$efishell")
+	# Allow 1% + 1 MiB for filesystem and partition table overhead,
+	# syslinux, and config files
+	megs=$(((sizes + sizes/100 + 2*1024*1024 - 1)/(1024*1024)))
+	$dd if=/dev/zero of="$FIMAGE" bs=$((1024*1024)) count=$megs 2>/dev/null
+	mpartition -I -c -s 32 -h 64 -t $megs $ptype -b 512 -a h:
+	$dd if="$mbr" of="$FIMAGE" bs=440 count=1 conv=notrunc 2>/dev/null
+	mformat -s 32 -h 64 -t $megs h:
+	syslinux --offset $((512*512)) "$FIMAGE"
+	do_mcopy h:
 }
 
 geniso() {
-	tmp_dir=`dirname $FIMAGE`/isoimage
-	rm -rf $tmp_dir
-	mkdir $tmp_dir
-	for i in lib lib64 share ; do
-		for j in syslinux ISOLINUX ; do
-			if [ -f /usr/$i/$j/isolinux.bin ] ; then
-				isolinux=/usr/$i/$j/isolinux.bin
-			fi
-		done
-		for j in syslinux syslinux/modules/bios ; do
-			if [ -f /usr/$i/$j/ldlinux.c32 ]; then
-				ldlinux=/usr/$i/$j/ldlinux.c32
-			fi
-		done
-		if [ -n "$isolinux" -a -n "$ldlinux" ] ; then
-			break
-		fi
-	done
-	if [ -z "$isolinux" ] ; then
-		echo 'Need an isolinux.bin file, please install syslinux/isolinux.'
-		exit 1
-	fi
-	if [ -z "$ldlinux" ] ; then
-		echo 'Need an ldlinux.c32 file, please install syslinux/isolinux.'
-		exit 1
-	fi
-	cp $isolinux $tmp_dir
-	cp $ldlinux $tmp_dir
-	cp $FBZIMAGE $tmp_dir/linux
-	echo "$KCMDLINE" > $tmp_dir/isolinux.cfg
-	if [ -f "$FDINITRD" ] ; then
-		cp "$FDINITRD" $tmp_dir/initrd.img
-	fi
-	genisoimage -J -r -input-charset=utf-8 -quiet -o $FIMAGE \
+	tmp_dir="$(dirname "$FIMAGE")/isoimage"
+	rm -rf "$tmp_dir"
+	mkdir "$tmp_dir"
+	isolinux=$(findsyslinux isolinux.bin)
+	ldlinux=$(findsyslinux  ldlinux.c32)
+	cp "$isolinux" "$ldlinux" "$tmp_dir"
+	cp "$FBZIMAGE" "$tmp_dir"/linux
+	echo default linux "$KCMDLINE" > "$tmp_dir"/isolinux.cfg
+	cp "${FDINITRDS[@]}" "$tmp_dir"/
+	genisoimage -J -r -input-charset=utf-8 -quiet -o "$FIMAGE" \
 		-b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 \
-		-boot-info-table $tmp_dir
-	isohybrid $FIMAGE 2>/dev/null || true
-	rm -rf $tmp_dir
+		-boot-info-table "$tmp_dir"
+	isohybrid "$FIMAGE" 2>/dev/null || true
+	rm -rf "$tmp_dir"
 }
 
-case $1 in
+rm -f "$FIMAGE"
+
+case "$diskfmt" in
 	bzdisk)     genbzdisk;;
 	fdimage144) genfdimage144;;
 	fdimage288) genfdimage288;;
+	hdimage)    genhdimage;;
 	isoimage)   geniso;;
-	*)          echo 'Unknown image format'; exit 1;
+	*)          die "Unknown image format: $diskfmt";;
 esac
diff --git a/arch/x86/boot/mtools.conf.in b/arch/x86/boot/mtools.conf.in
index efd6d2490c1d..9e2662d01364 100644
--- a/arch/x86/boot/mtools.conf.in
+++ b/arch/x86/boot/mtools.conf.in
@@ -14,4 +14,7 @@ drive v:
 drive w:
   file="@OBJ@/fdimage" cylinders=80 heads=2 sectors=36 filter
 
+# Hard disk
+drive h:
+  file="@OBJ@/hdimage" partition=1 mformat_only
 
-- 
2.30.2

