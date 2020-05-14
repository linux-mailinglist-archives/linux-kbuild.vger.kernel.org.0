Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CAB1D30D2
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2020 15:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgENNOR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 May 2020 09:14:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46805 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENNOR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 09:14:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id f18so3415691lja.13;
        Thu, 14 May 2020 06:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/MXRPkMDcSwRMZ28S3/UK2rpc54+iO94C0XDkvWcitY=;
        b=ltVsI3iPW/wocH381KApD0TYSt1G5ghlN1J9yMBE2NEc9imnUNs7jfeckBqQ0OaANS
         8jz7npVAbwfXjMjagjCPGjrBkTIraQ/y/goDdUhwX9nMQfBifgszdeRiiUvh4E2zUUpD
         9tSFoT3g5USxafjnjMI7lm0yf4h90maJzgVxI7x1iGRftZNXtoYyj8htEUiY0JzjfiZK
         1qBkliEvwTHdTG1PfWDXUnWT/FTiGbnnVE7vqgW25IQEe9bYAN1QDIetRKyxng6mW26J
         MxKPsZO772mVe2CiXrkWCkdIM/4oT1XiFGe3Fzha/V4HNPDrJ4NEIH3sMA9vE6xlxjgt
         X0rw==
X-Gm-Message-State: AOAM5314EGdfVQDqJL2TDE7r0XXlslqYqM5E1crUtmtTdTR8jp9DDXVF
        xHGGGjYohY1uY1WErPqylQw=
X-Google-Smtp-Source: ABdhPJzzy6BpdnYqPVdiWi5QbMy+F42zD96BH5dOe3+1xh/x6lpIsCLn5mWbbhD1iPR/JGF728aSZQ==
X-Received: by 2002:a05:651c:c8:: with SMTP id 8mr2634923ljr.182.1589462053276;
        Thu, 14 May 2020 06:14:13 -0700 (PDT)
Received: from localhost.localdomain ([213.87.130.150])
        by smtp.googlemail.com with ESMTPSA id q27sm1791609lfn.58.2020.05.14.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 06:14:12 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Denis Efremov <efremov@linux.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: [RFC PATCH] kbuild: add variables for compression tools
Date:   Thu, 14 May 2020 16:12:34 +0300
Message-Id: <20200514131234.380097-1-efremov@linux.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Allow user to use alternative implementations of compression tools.
For example, multi-threaded tools to speed up the build:
$ make KGZIP=pigz KXZ=pxz

Variable KGZIP is used instead of GZIP because the latter is reserved
by the tool. Other variables are prefixed with 'K' for consistency.

The credit goes to @grsecurity.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 Makefile                          | 11 +++++++++--
 arch/arm/boot/deflate_xip_data.sh |  6 +++++-
 arch/ia64/Makefile                |  2 +-
 arch/m68k/Makefile                |  4 ++--
 arch/mips/lasat/image/Makefile    |  2 +-
 arch/parisc/Makefile              |  2 +-
 kernel/gen_kheaders.sh            |  6 +++++-
 scripts/Makefile.lib              | 12 ++++++------
 scripts/Makefile.package          |  6 +++---
 scripts/xz_wrap.sh                |  6 +++++-
 10 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 11fe9b1535de..9af13cfeed7a 100644
--- a/Makefile
+++ b/Makefile
@@ -447,6 +447,12 @@ PYTHON		= python
 PYTHON3		= python3
 CHECK		= sparse
 BASH		= bash
+KGZIP		= gzip
+KBZIP2		= bzip2
+KLZMA		= lzma
+KLZOP		= lzop
+KLZ4		= lz4c
+KXZ		= xz
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -496,6 +502,7 @@ export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
+export KGZIP KBZIP2 KLZMA KLZOP KLZ4 KXZ
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
@@ -1005,10 +1012,10 @@ export mod_strip_cmd
 mod_compress_cmd = true
 ifdef CONFIG_MODULE_COMPRESS
   ifdef CONFIG_MODULE_COMPRESS_GZIP
-    mod_compress_cmd = gzip -n -f
+    mod_compress_cmd = $(KGZIP) -n -f
   endif # CONFIG_MODULE_COMPRESS_GZIP
   ifdef CONFIG_MODULE_COMPRESS_XZ
-    mod_compress_cmd = xz -f
+    mod_compress_cmd = $(KXZ) -f
   endif # CONFIG_MODULE_COMPRESS_XZ
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
index 40937248cebe..08dd50e08c17 100755
--- a/arch/arm/boot/deflate_xip_data.sh
+++ b/arch/arm/boot/deflate_xip_data.sh
@@ -19,6 +19,10 @@ XIPIMAGE="$2"
 
 DD="dd status=none"
 
+if [ x$KGZIP = "x" ]; then
+	KGZIP=gzip
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
+$KGZIP -9 >> "$XIPIMAGE.tmp"
 
 # replace kernel binary
 mv -f "$XIPIMAGE.tmp" "$XIPIMAGE"
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 32240000dc0c..2876a7df1b0a 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -40,7 +40,7 @@ $(error Sorry, you need a newer version of the assember, one that is built from
 endif
 
 quiet_cmd_gzip = GZIP    $@
-cmd_gzip = cat $(real-prereqs) | gzip -n -f -9 > $@
+cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
 
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 5d9288384096..e6c7c92aa72e 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
 ifndef CONFIG_KGDB
 	cp vmlinux vmlinux.tmp
 	$(STRIP) vmlinux.tmp
-	bzip2 -1c vmlinux.tmp >vmlinux.bz2
+	$(KBZIP2) -1c vmlinux.tmp >vmlinux.bz2
 	rm vmlinux.tmp
 else
-	bzip2 -1c vmlinux >vmlinux.bz2
+	$(KBZIP2) -1c vmlinux >vmlinux.bz2
 endif
 
 archclean:
diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makefile
index 78ce4cff1012..617ccb1659d5 100644
--- a/arch/mips/lasat/image/Makefile
+++ b/arch/mips/lasat/image/Makefile
@@ -44,7 +44,7 @@ $(obj)/%.o: $(obj)/%.gz
 	$(LD) -r -o $@ -b binary $<
 
 $(obj)/%.gz: $(obj)/%.bin
-	gzip -cf -9 $< > $@
+	$(KGZIP) -cf -9 $< > $@
 
 $(obj)/kImage.bin: $(KERNEL_IMAGE)
 	$(OBJCOPY) -O binary -S $^ $@
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 628cd8bb7ad8..412ddec0297d 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -162,7 +162,7 @@ vmlinuz: bzImage
 	$(OBJCOPY) $(boot)/bzImage $@
 else
 vmlinuz: vmlinux
-	@gzip -cf -9 $< > $@
+	@$(KGZIP) -cf -9 $< > $@
 endif
 
 install:
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index e13ca842eb7e..f3dfaf9f6647 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -9,6 +9,10 @@ outdir="$(pwd)"
 tarfile=$1
 cpio_dir=$outdir/$tarfile.tmp
 
+if [ x$KXZ = "x" ]; then
+	KXZ=xz
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
+    -I $KXZ -cf $tarfile -C $cpio_dir/ -T - > /dev/null
 
 echo $headers_md5 > kernel/kheaders.md5
 echo "$this_file_md5" >> kernel/kheaders.md5
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4b799737722c..dd38f5ac8d48 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -241,7 +241,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 # ---------------------------------------------------------------------------
 
 quiet_cmd_gzip = GZIP    $@
-      cmd_gzip = cat $(real-prereqs) | gzip -n -f -9 > $@
+      cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
 
 # DTC
 # ---------------------------------------------------------------------------
@@ -334,19 +334,19 @@ printf "%08x\n" $$dec_size |						\
 )
 
 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | $(KBZIP2) -9; $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
 
 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | $(KLZMA) -9; $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
+      cmd_lz4 = { cat $(real-prereqs) | $(KLZ4) -l -c1 stdin stdout; \
                   $(size_append); } > $@
 
 # U-Boot mkimage
@@ -393,7 +393,7 @@ quiet_cmd_xzkern = XZKERN  $@
                      $(size_append); } > $@
 
 quiet_cmd_xzmisc = XZMISC  $@
-      cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
+      cmd_xzmisc = cat $(real-prereqs) | $(KXZ) --check=crc32 --lzma2=dict=1MiB > $@
 
 # ASM offsets
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 02135d2671a6..1b91fe1bfcdb 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -127,9 +127,9 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-$(if $(findstring bz2,$@),bzip2,                                    \
-$(if $(findstring gz,$@),gzip,                                      \
-$(if $(findstring xz,$@),xz,                                        \
+$(if $(findstring bz2,$@),$(KBZIP2),                                \
+$(if $(findstring gz,$@),$(KGZIP),                                  \
+$(if $(findstring xz,$@),$(KXZ),                                    \
 $(error unknown target $@))))                                       \
 	-f -9 $(perf-tar).tar)
 
diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
index 7a2d372f4885..4922102dbfe7 100755
--- a/scripts/xz_wrap.sh
+++ b/scripts/xz_wrap.sh
@@ -9,6 +9,10 @@
 # You can do whatever you want with this file.
 #
 
+if [ x$KXZ = "x" ]; then
+	KXZ=xz
+fi
+
 BCJ=
 LZMA2OPTS=
 
@@ -20,4 +24,4 @@ case $SRCARCH in
 	sparc)          BCJ=--sparc ;;
 esac
 
-exec xz --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
+exec $KXZ --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
-- 
2.25.4

