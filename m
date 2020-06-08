Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDFE1F161D
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 12:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgFHKAM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jun 2020 06:00:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44485 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729294AbgFHKAG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 06:00:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id c17so19643468lji.11;
        Mon, 08 Jun 2020 03:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GDL+9v6/r8rDz1rWGwzjuZhMoepSVICM/XC9cVTvMJs=;
        b=IDxfRe+iXK/w0pbYKOdf+gOq3ApHB6PCGrNsUjc5Qx59BCOF3w4tXHnAKfVrpfY0vz
         prfaa+6YQ6Ivm4xK/fNwWyJ/WoBTQrygEhjwQfBj1lXxjeJSejPVuCvmvIPVWyFX27mU
         22yfa1MRY0xXTt1UOozs/zq7tOzOiyOpqK2XzBHw7hXHVKk8paOG58RJ++C02UlVzcyd
         bLlLuYE+YTijz8QYxrGxebiHgl+WBOLkBpChUjQ8JT41hMr9ZxFnVAj5f/JcsWxXzsnr
         YmPKouqcoOlql+gsyzqrPXsr15qzqYaNndCiOtBgzfAJ0F3fdKqBKRBdtR+lkb5GokrV
         g72g==
X-Gm-Message-State: AOAM533ZAIviwR7AwHdK6vB5aYbcXyRSc93YRLP2lIkcJ6TpaYCNqSDP
        OQlEjLlwHbSLxmfZObYX8to=
X-Google-Smtp-Source: ABdhPJyXubhGjsSL+f7GiF9bXvnf/0U/blKX2JaiCYxoqGnrG1tUFeu8tEmJ+MeDsJnKUP4+WdWzRQ==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr11005089lji.75.1591610403818;
        Mon, 08 Jun 2020 03:00:03 -0700 (PDT)
Received: from localhost.localdomain ([213.87.137.116])
        by smtp.googlemail.com with ESMTPSA id c20sm4274102lfb.33.2020.06.08.03.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 03:00:03 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Denis Efremov <efremov@linux.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: [PATCH] kbuild: fix broken builds because of GZIP,BZIP2,LZOP variables
Date:   Mon,  8 Jun 2020 12:59:44 +0300
Message-Id: <20200608095944.140779-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
References: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Redefine GZIP, BZIP2, LZOP variables as KGZIP, KBZIP2, KLZOP resp.
GZIP, BZIP2, LZOP env variables are reserved by the tools. The original
attempt to redefine them internally doesn't work in makefiles/scripts
intercall scenarios, e.g., "make GZIP=gzip bindeb-pkg" and results in
broken builds. There can be other broken build commands because of this,
so the universal solution is to use non-reserved env variables for the
compression tools.

Fixes: 8dfb61dcbace ("kbuild: add variables for compression tools")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 Makefile                          | 24 +++++-------------------
 arch/arm/boot/deflate_xip_data.sh |  2 +-
 arch/ia64/Makefile                |  2 +-
 arch/m68k/Makefile                |  8 ++++----
 arch/parisc/Makefile              |  2 +-
 scripts/Makefile.lib              |  6 +++---
 scripts/Makefile.package          |  6 +++---
 scripts/package/buildtar          |  4 ++--
 8 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/Makefile b/Makefile
index 839f9fee22cb..e43d193bb3b2 100644
--- a/Makefile
+++ b/Makefile
@@ -458,27 +458,13 @@ PYTHON		= python
 PYTHON3		= python3
 CHECK		= sparse
 BASH		= bash
-GZIP		= gzip
-BZIP2		= bzip2
-LZOP		= lzop
+KGZIP		= gzip
+KBZIP2		= bzip2
+KLZOP		= lzop
 LZMA		= lzma
 LZ4		= lz4c
 XZ		= xz
 
-# GZIP, BZIP2, LZOP env vars are used by the tools. Support them as the command
-# line interface, but use _GZIP, _BZIP2, _LZOP internally.
-_GZIP          := $(GZIP)
-_BZIP2         := $(BZIP2)
-_LZOP          := $(LZOP)
-
-# Reset GZIP, BZIP2, LZOP in this Makefile
-override GZIP=
-override BZIP2=
-override LZOP=
-
-# Reset GZIP, BZIP2, LZOP in recursive invocations
-MAKEOVERRIDES += GZIP= BZIP2= LZOP=
-
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
 NOSTDINC_FLAGS :=
@@ -526,7 +512,7 @@ CLANG_FLAGS :=
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
-export _GZIP _BZIP2 _LZOP LZMA LZ4 XZ
+export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
@@ -1047,7 +1033,7 @@ export mod_strip_cmd
 mod_compress_cmd = true
 ifdef CONFIG_MODULE_COMPRESS
   ifdef CONFIG_MODULE_COMPRESS_GZIP
-    mod_compress_cmd = $(_GZIP) -n -f
+    mod_compress_cmd = $(KGZIP) -n -f
   endif # CONFIG_MODULE_COMPRESS_GZIP
   ifdef CONFIG_MODULE_COMPRESS_XZ
     mod_compress_cmd = $(XZ) -f
diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
index 739f0464321e..304495c3c2c5 100755
--- a/arch/arm/boot/deflate_xip_data.sh
+++ b/arch/arm/boot/deflate_xip_data.sh
@@ -56,7 +56,7 @@ trap 'rm -f "$XIPIMAGE.tmp"; exit 1' 1 2 3
 # substitute the data section by a compressed version
 $DD if="$XIPIMAGE" count=$data_start iflag=count_bytes of="$XIPIMAGE.tmp"
 $DD if="$XIPIMAGE"  skip=$data_start iflag=skip_bytes |
-$_GZIP -9 >> "$XIPIMAGE.tmp"
+$KGZIP -9 >> "$XIPIMAGE.tmp"
 
 # replace kernel binary
 mv -f "$XIPIMAGE.tmp" "$XIPIMAGE"
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index f817f3d5e758..2876a7df1b0a 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -40,7 +40,7 @@ $(error Sorry, you need a newer version of the assember, one that is built from
 endif
 
 quiet_cmd_gzip = GZIP    $@
-cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
+cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
 
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index ce6db5e5a5a3..0415d28dbe4f 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -135,10 +135,10 @@ vmlinux.gz: vmlinux
 ifndef CONFIG_KGDB
 	cp vmlinux vmlinux.tmp
 	$(STRIP) vmlinux.tmp
-	$(_GZIP) -9c vmlinux.tmp >vmlinux.gz
+	$(KGZIP) -9c vmlinux.tmp >vmlinux.gz
 	rm vmlinux.tmp
 else
-	$(_GZIP) -9c vmlinux >vmlinux.gz
+	$(KGZIP) -9c vmlinux >vmlinux.gz
 endif
 
 bzImage: vmlinux.bz2
@@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
 ifndef CONFIG_KGDB
 	cp vmlinux vmlinux.tmp
 	$(STRIP) vmlinux.tmp
-	$(_BZIP2) -1c vmlinux.tmp >vmlinux.bz2
+	$(KBZIP2) -1c vmlinux.tmp >vmlinux.bz2
 	rm vmlinux.tmp
 else
-	$(_BZIP2) -1c vmlinux >vmlinux.bz2
+	$(KBZIP2) -1c vmlinux >vmlinux.bz2
 endif
 
 archclean:
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 182a5bca3e2c..5140c602207f 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -162,7 +162,7 @@ vmlinuz: bzImage
 	$(OBJCOPY) $(boot)/bzImage $@
 else
 vmlinuz: vmlinux
-	@$(_GZIP) -cf -9 $< > $@
+	@$(KGZIP) -cf -9 $< > $@
 endif
 
 install:
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 127f2a7e3ced..94eeddb2e599 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -244,7 +244,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 # ---------------------------------------------------------------------------
 
 quiet_cmd_gzip = GZIP    $@
-      cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
+      cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
 
 # DTC
 # ---------------------------------------------------------------------------
@@ -337,7 +337,7 @@ printf "%08x\n" $$dec_size |						\
 )
 
 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | $(_BZIP2) -9; $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | $(KBZIP2) -9; $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
@@ -346,7 +346,7 @@ quiet_cmd_lzma = LZMA    $@
       cmd_lzma = { cat $(real-prereqs) | $(LZMA) -9; $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | $(_LZOP) -9; $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
       cmd_lz4 = { cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout; \
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index b2b6153af63a..f952fb64789d 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -45,7 +45,7 @@ if test "$(objtree)" != "$(srctree)"; then \
 	false; \
 fi ; \
 $(srctree)/scripts/setlocalversion --save-scmversion; \
-tar -I $(_GZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
+tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
 rm -f $(objtree)/.scmversion
 
@@ -127,8 +127,8 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-$(if $(findstring bz2,$@),$(_BZIP2),                                 \
-$(if $(findstring gz,$@),$(_GZIP),                                  \
+$(if $(findstring bz2,$@),$(KBZIP2),                                 \
+$(if $(findstring gz,$@),$(KGZIP),                                  \
 $(if $(findstring xz,$@),$(XZ),                                     \
 $(error unknown target $@))))                                       \
 	-f -9 $(perf-tar).tar)
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index ad62c6879622..fb1578e72ab9 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -28,11 +28,11 @@ case "${1}" in
 		opts=
 		;;
 	targz-pkg)
-		opts="-I ${_GZIP}"
+		opts="-I ${KGZIP}"
 		tarball=${tarball}.gz
 		;;
 	tarbz2-pkg)
-		opts="-I ${_BZIP2}"
+		opts="-I ${KBZIP2}"
 		tarball=${tarball}.bz2
 		;;
 	tarxz-pkg)
-- 
2.26.2

