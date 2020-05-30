Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC3C1E91CA
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2020 15:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgE3Nof (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 May 2020 09:44:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36373 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgE3Nof (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 May 2020 09:44:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id c21so1353401lfb.3;
        Sat, 30 May 2020 06:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tHWX6cImACvkb5Kr/I93+kNBd8jrxw8aUB40vDWu+cM=;
        b=kCdfI8rIOUrrHgrMXi+XTHbxu9Garce/lGVrccJNdmSAUYBSoVca8dv/MHnPIaYTPI
         iyDxVbOoJUGmoAmrwz1irdxN2vTX2ATeOlKx6Jn4ixCNAJOh0o29gMUGKtvdvNnyTdkz
         g2YXE1V2Mw3YgqhQqJlweK3sNM0e/rBgyrJ8XodRHSergDo8rgjyPpbpV0nonyq94oAi
         8MD8CTsR46qccXaxo+1Amk6LN00aRyH6oz43ntvdQROjJOcg6jDumqDqA2OkHBaF7gOZ
         CC9Sg5fyva/HX6i6uWorKEmiSOuxxnqvP9oT/HskVoydPjzfduT4swbIZkHYfEabhhgX
         MHxg==
X-Gm-Message-State: AOAM530xmExoIE/8wifZhQuXwM+lRTfHzgfQNvUEIShIapMpoiKyvvpr
        DA3L26nSc+VaZcYSapkDOjvtYoZ5
X-Google-Smtp-Source: ABdhPJw+lMNpGaxq4f7zmpA2f0o7Q/firUW3OfS1+7OF+g2tVYjwH/UHpX1h7iiKgVLbcYRmRFxvlQ==
X-Received: by 2002:ac2:544b:: with SMTP id d11mr1854389lfn.157.1590846270561;
        Sat, 30 May 2020 06:44:30 -0700 (PDT)
Received: from localhost.localdomain ([213.87.139.175])
        by smtp.googlemail.com with ESMTPSA id l8sm2635763ljc.59.2020.05.30.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 06:44:29 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Denis Efremov <efremov@linux.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3] kbuild: add variables for compression tools
Date:   Sat, 30 May 2020 16:44:15 +0300
Message-Id: <20200530134415.239427-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514131234.380097-1-efremov@linux.com>
References: <20200514131234.380097-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Allow user to use alternative implementations of compression tools,
such as pigz, pbzip2, pxz. For example, multi-threaded tools to
speed up the build:
$ make GZIP=pigz BZIP2=pbzip2

Variables _GZIP, _BZIP2, _LZOP are used internally because original env
vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
since 2015. However, alternative implementations (e.g., pigz) still rely
on it. BZIP2, BZIP, LZOP vars are not obsolescent.

The credit goes to @grsecurity.

As a sidenote, for multi-threaded lzma, xz compression one can use:
$ export XZ_OPT="--threads=0"

Signed-off-by: Denis Efremov <efremov@linux.com>
---
Changes in v2:
  - _GZIP used instead of GZIP
  - tar commands altered to use tools from the vars
Changes in v3:
  - _BZIP2 used instead of BZIP2
  - _LZOP used instead of LZOP

 Makefile                          | 19 +++++++++++++++++--
 arch/arm/boot/deflate_xip_data.sh |  6 +++++-
 arch/ia64/Makefile                |  2 +-
 arch/m68k/Makefile                |  8 ++++----
 arch/mips/lasat/image/Makefile    |  2 +-
 arch/parisc/Makefile              |  2 +-
 kernel/gen_kheaders.sh            |  6 +++++-
 scripts/Kbuild.include            |  5 +++++
 scripts/Makefile.lib              | 12 ++++++------
 scripts/Makefile.package          |  8 ++++----
 scripts/package/buildtar          | 15 ++++++++++++---
 scripts/xz_wrap.sh                |  6 +++++-
 12 files changed, 66 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index f0d118b86287..2ac2dc87f903 100644
--- a/Makefile
+++ b/Makefile
@@ -447,6 +447,12 @@ PYTHON		= python
 PYTHON3		= python3
 CHECK		= sparse
 BASH		= bash
+GZIP		= gzip
+BZIP2		= bzip2
+LZOP		= lzop
+LZMA		= lzma
+LZ4		= lz4c
+XZ		= xz
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -492,10 +498,19 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
+# GZIP, BZIP2, LZOP env vars are used by the tools
+override _GZIP=$(GZIP)
+override _BZIP2=$(BZIP2)
+override _LZOP=$(LZOP)
+unexport GZIP
+unexport BZIP2
+unexport LZOP
+
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
+export _GZIP _BZIP2 _LZOP LZMA LZ4 XZ
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
@@ -1005,10 +1020,10 @@ export mod_strip_cmd
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
index 5d9288384096..ce6db5e5a5a3 100644
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
+	$(_BZIP2) -1c vmlinux.tmp >vmlinux.bz2
 	rm vmlinux.tmp
 else
-	bzip2 -1c vmlinux >vmlinux.bz2
+	$(_BZIP2) -1c vmlinux >vmlinux.bz2
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
index 6cabf20ce66a..b3b49fe7f25f 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -2,6 +2,11 @@
 ####
 # kbuild: Generic definitions
 
+# GZIP, BZIP2, LZOP env vars are used by the tools
+unexport GZIP
+unexport BZIP2
+unexport LZOP
+
 # Convenient variables
 comma   := ,
 quote   := "
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4b799737722c..a1c1424e6b52 100644
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
+      cmd_bzip2 = { cat $(real-prereqs) | $(_BZIP2) -9; $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
 
 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | $(LZMA) -9; $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | $(_LZOP) -9; $(size_append); } > $@
 
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
index 02135d2671a6..b2b6153af63a 100644
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
+$(if $(findstring bz2,$@),$(_BZIP2),                                 \
+$(if $(findstring gz,$@),$(_GZIP),                                  \
+$(if $(findstring xz,$@),$(XZ),                                     \
 $(error unknown target $@))))                                       \
 	-f -9 $(perf-tar).tar)
 
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 77c7caefede1..165826c12da9 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -19,6 +19,15 @@ set -e
 tmpdir="${objtree}/tar-install"
 tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
 
+if [ x$_GZIP = "x" ]; then
+	_GZIP=gzip
+fi
+if [ x$_BZIP2 = "x" ]; then
+	_BZIP2=bzip2
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
+		opts="-I ${_BZIP2}"
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

