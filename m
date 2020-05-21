Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF971DCCA6
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 14:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgEUMNV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 08:13:21 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35371 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbgEUMNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 08:13:20 -0400
Received: by mail-lf1-f65.google.com with SMTP id 82so4340535lfh.2;
        Thu, 21 May 2020 05:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ar0V6/v4xkg5c5fIB/mK/921xVzim2AHxId5NNmnTM0=;
        b=kaTKWVeb6KmJxbRplkkPohHstLfo8I53t6mctYlOLiT9oSYwt0QZeR2j2epdsxsVRc
         7WHG4B5pRlCAC+10fXlL/vfX4DQvaOknmED0r9bX1NQL5KD6AuGE3QNfrqDM6RuzUCHn
         fgpC0MQTLu6Y+teZZrUgtFfntrb/BowzPzGZNMQ9LEKIRhzMX1lBNrIy4aKZXLrP2jQq
         sKTQOXFZ6RtwxaSdtYVhwkKMwBLfWLhA1yopGZYS6Ko+b3yXrM70bjIKbmq+BrdD/Ua9
         LQ4a8p2q2ZzVZLi2Kz7ImTYUo8uWPrshnmBU5Xfim4jMtQ1Iks7GUcbzs3WnEPzIUIuG
         esYQ==
X-Gm-Message-State: AOAM53010CDO7Kw6xStKP1VH8V5TG33R+U1BtzDY6uXC2vSOzJ8NqbTy
        ETTU1SdKd/HViuScm4I7LhI=
X-Google-Smtp-Source: ABdhPJyLT7L6jb92blpYqa3xML0sI1Li6W6+OR9WS4LAkTEceQCdU2BLQf+H4OC0JjJLR3IeDg8uFA==
X-Received: by 2002:a19:f813:: with SMTP id a19mr4848184lff.212.1590063195991;
        Thu, 21 May 2020 05:13:15 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.googlemail.com with ESMTPSA id t19sm1710308ljg.7.2020.05.21.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 05:13:15 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Denis Efremov <efremov@linux.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] kbuild: add variables for compression tools
Date:   Thu, 21 May 2020 15:13:02 +0300
Message-Id: <20200521121302.9480-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514131234.380097-1-efremov@linux.com>
References: <20200514131234.380097-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Allow user to use alternative implementations of compression tools.
For example, multi-threaded tools to speed up the build:
$ make GZIP=pigz BZIP2=pbzip2

Variable _GZIP is used internally instead of GZIP because the latter is
reserved by the tool. The use of GZIP in gzip tool is obsolete since
2015. However, alternative implementations (e.g., pigz) can still rely
on it.

The credit goes to @grsecurity.

As a sidenote, for multi-threaded lzma, xz compression one can use:
$ export XZ_OPT="--threads=0"

Signed-off-by: Denis Efremov <efremov@linux.com>
---

Compile tested on x86_64, parisc, arm64, mips, m68k.

 Makefile                          | 16 ++++++++++++++--
 arch/arm/boot/deflate_xip_data.sh |  6 +++++-
 arch/ia64/Makefile                |  2 +-
 arch/m68k/Makefile                |  8 ++++----
 arch/mips/lasat/image/Makefile    |  2 +-
 arch/parisc/Makefile              |  2 +-
 kernel/gen_kheaders.sh            |  6 +++++-
 scripts/Kbuild.include            |  4 ++++
 scripts/Makefile.lib              | 12 ++++++------
 scripts/Makefile.package          |  8 ++++----
 scripts/package/buildtar          | 15 ++++++++++++---
 scripts/xz_wrap.sh                |  6 +++++-
 12 files changed, 62 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index 04f5662ae61a..dd5ff189d97e 100644
--- a/Makefile
+++ b/Makefile
@@ -447,6 +447,12 @@ PYTHON		= python
 PYTHON3		= python3
 CHECK		= sparse
 BASH		= bash
+GZIP		= gzip
+BZIP2		= bzip2
+LZMA		= lzma
+LZO		= lzop
+LZ4		= lz4c
+XZ		= xz
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -492,10 +498,16 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
+# GZIP env var is used by old (<= 2015) versions of the tool
+# and alternative implementations for additional arguments
+override _GZIP=$(GZIP)
+unexport GZIP
+
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
+export _GZIP BZIP2 LZMA LZO LZ4 XZ
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
@@ -1005,10 +1017,10 @@ export mod_strip_cmd
 mod_compress_cmd = true
 ifdef CONFIG_MODULE_COMPRESS
   ifdef CONFIG_MODULE_COMPRESS_GZIP
-    mod_compress_cmd = gzip -n -f
+    mod_compress_cmd = $(_GZIP) -n -f
   endif # CONFIG_MODULE_COMPRESS_GZIP
   ifdef CONFIG_MODULE_COMPRESS_XZ
-    mod_compress_cmd = xz -f
+    mod_compress_cmd = $(XZ) -f
   endif # CONFIG_MODULE_COMPRESS_XZ
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
index 40937248cebe..81253142d2ae 100755
--- a/arch/arm/boot/deflate_xip_data.sh
+++ b/arch/arm/boot/deflate_xip_data.sh
@@ -19,6 +19,10 @@ XIPIMAGE="$2"
 
 DD="dd status=none"
 
+if [ x$_GZIP = "x" ]; then
+	_GZIP=gzip
+fi
+
 # Use "make V=1" to debug this script.
 case "$KBUILD_VERBOSE" in
 *1*)
@@ -56,7 +60,7 @@ trap 'rm -f "$XIPIMAGE.tmp"; exit 1' 1 2 3
 # substitute the data section by a compressed version
 $DD if="$XIPIMAGE" count=$data_start iflag=count_bytes of="$XIPIMAGE.tmp"
 $DD if="$XIPIMAGE"  skip=$data_start iflag=skip_bytes |
-gzip -9 >> "$XIPIMAGE.tmp"
+$_GZIP -9 >> "$XIPIMAGE.tmp"
 
 # replace kernel binary
 mv -f "$XIPIMAGE.tmp" "$XIPIMAGE"
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 32240000dc0c..f817f3d5e758 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -40,7 +40,7 @@ $(error Sorry, you need a newer version of the assember, one that is built from
 endif
 
 quiet_cmd_gzip = GZIP    $@
-cmd_gzip = cat $(real-prereqs) | gzip -n -f -9 > $@
+cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
 
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 5d9288384096..7f259a723753 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -135,10 +135,10 @@ vmlinux.gz: vmlinux
 ifndef CONFIG_KGDB
 	cp vmlinux vmlinux.tmp
 	$(STRIP) vmlinux.tmp
-	gzip -9c vmlinux.tmp >vmlinux.gz
+	$(_GZIP) -9c vmlinux.tmp >vmlinux.gz
 	rm vmlinux.tmp
 else
-	gzip -9c vmlinux >vmlinux.gz
+	$(_GZIP) -9c vmlinux >vmlinux.gz
 endif
 
 bzImage: vmlinux.bz2
@@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
 ifndef CONFIG_KGDB
 	cp vmlinux vmlinux.tmp
 	$(STRIP) vmlinux.tmp
-	bzip2 -1c vmlinux.tmp >vmlinux.bz2
+	$(BZIP2) -1c vmlinux.tmp >vmlinux.bz2
 	rm vmlinux.tmp
 else
-	bzip2 -1c vmlinux >vmlinux.bz2
+	$(BZIP2) -1c vmlinux >vmlinux.bz2
 endif
 
 archclean:
diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makefile
index 78ce4cff1012..24d8dbde1109 100644
--- a/arch/mips/lasat/image/Makefile
+++ b/arch/mips/lasat/image/Makefile
@@ -44,7 +44,7 @@ $(obj)/%.o: $(obj)/%.gz
 	$(LD) -r -o $@ -b binary $<
 
 $(obj)/%.gz: $(obj)/%.bin
-	gzip -cf -9 $< > $@
+	$(_GZIP) -cf -9 $< > $@
 
 $(obj)/kImage.bin: $(KERNEL_IMAGE)
 	$(OBJCOPY) -O binary -S $^ $@
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 628cd8bb7ad8..e1aa514aeb36 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -162,7 +162,7 @@ vmlinuz: bzImage
 	$(OBJCOPY) $(boot)/bzImage $@
 else
 vmlinuz: vmlinux
-	@gzip -cf -9 $< > $@
+	@$(_GZIP) -cf -9 $< > $@
 endif
 
 install:
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index e13ca842eb7e..58e05b3702f3 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -9,6 +9,10 @@ outdir="$(pwd)"
 tarfile=$1
 cpio_dir=$outdir/$tarfile.tmp
 
+if [ x$XZ = "x" ]; then
+	XZ=xz
+fi
+
 dir_list="
 include/
 arch/$SRCARCH/include/
@@ -88,7 +92,7 @@ find $cpio_dir -type f -print0 |
 find $cpio_dir -printf "./%P\n" | LC_ALL=C sort | \
     tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
     --owner=0 --group=0 --numeric-owner --no-recursion \
-    -Jcf $tarfile -C $cpio_dir/ -T - > /dev/null
+    -I $XZ -cf $tarfile -C $cpio_dir/ -T - > /dev/null
 
 echo $headers_md5 > kernel/kheaders.md5
 echo "$this_file_md5" >> kernel/kheaders.md5
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 6cabf20ce66a..d7c25b3cb1a8 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -2,6 +2,10 @@
 ####
 # kbuild: Generic definitions
 
+# GZIP env var is used by old (<= 2015) versions of the tool
+# and alternative implementations for additional arguments
+unexport GZIP
+
 # Convenient variables
 comma   := ,
 quote   := "
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4b799737722c..812f1c0e5beb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -241,7 +241,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 # ---------------------------------------------------------------------------
 
 quiet_cmd_gzip = GZIP    $@
-      cmd_gzip = cat $(real-prereqs) | gzip -n -f -9 > $@
+      cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
 
 # DTC
 # ---------------------------------------------------------------------------
@@ -334,19 +334,19 @@ printf "%08x\n" $$dec_size |						\
 )
 
 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | $(BZIP2) -9; $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
 
 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | $(LZMA) -9; $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | $(LZO) -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
+      cmd_lz4 = { cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout; \
                   $(size_append); } > $@
 
 # U-Boot mkimage
@@ -393,7 +393,7 @@ quiet_cmd_xzkern = XZKERN  $@
                      $(size_append); } > $@
 
 quiet_cmd_xzmisc = XZMISC  $@
-      cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
+      cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
 
 # ASM offsets
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 02135d2671a6..537179828d0c 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -45,7 +45,7 @@ if test "$(objtree)" != "$(srctree)"; then \
 	false; \
 fi ; \
 $(srctree)/scripts/setlocalversion --save-scmversion; \
-tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
+tar -I $(_GZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
 rm -f $(objtree)/.scmversion
 
@@ -127,9 +127,9 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-$(if $(findstring bz2,$@),bzip2,                                    \
-$(if $(findstring gz,$@),gzip,                                      \
-$(if $(findstring xz,$@),xz,                                        \
+$(if $(findstring bz2,$@),$(BZIP2),                                 \
+$(if $(findstring gz,$@),$(_GZIP),                                  \
+$(if $(findstring xz,$@),$(XZ),                                     \
 $(error unknown target $@))))                                       \
 	-f -9 $(perf-tar).tar)
 
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 77c7caefede1..8a0ebcc292af 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -19,6 +19,15 @@ set -e
 tmpdir="${objtree}/tar-install"
 tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
 
+if [ x$_GZIP = "x" ]; then
+	_GZIP=gzip
+fi
+if [ x$BZIP2 = "x" ]; then
+	BZIP2=bzip2
+fi
+if [ x$XZ = "x" ]; then
+	XZ=xz
+fi
 
 #
 # Figure out how to compress, if requested at all
@@ -28,15 +37,15 @@ case "${1}" in
 		opts=
 		;;
 	targz-pkg)
-		opts=--gzip
+		opts="-I ${_GZIP}"
 		tarball=${tarball}.gz
 		;;
 	tarbz2-pkg)
-		opts=--bzip2
+		opts="-I ${BZIP2}"
 		tarball=${tarball}.bz2
 		;;
 	tarxz-pkg)
-		opts=--xz
+		opts="-I ${XZ}"
 		tarball=${tarball}.xz
 		;;
 	*)
diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
index 7a2d372f4885..b387cd208952 100755
--- a/scripts/xz_wrap.sh
+++ b/scripts/xz_wrap.sh
@@ -9,6 +9,10 @@
 # You can do whatever you want with this file.
 #
 
+if [ x$XZ = "x" ]; then
+	XZ=xz
+fi
+
 BCJ=
 LZMA2OPTS=
 
@@ -20,4 +24,4 @@ case $SRCARCH in
 	sparc)          BCJ=--sparc ;;
 esac
 
-exec xz --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
+exec $XZ --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
-- 
2.26.2

