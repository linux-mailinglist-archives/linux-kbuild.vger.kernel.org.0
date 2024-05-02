Return-Path: <linux-kbuild+bounces-1724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C32658B99DD
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 13:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1EF7B227E1
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E64460BB6;
	Thu,  2 May 2024 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="pYrMeTHQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB15FB9C
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714648583; cv=none; b=AskNVmImG7KmjW1Ou4xPZ4A7E0w/9PTH0lhhw9W4p4d2eA7r4ziYn9vxNk8wmUyX3sidhN49H5RUskil39uZxr4PR2NInO+XpkQ4w4zH8VjkBCWJfoXhqScsBR72Ep8kNrO3+lYQ22xaLbMMPpqHI6a/IVyhX2211IMvo9LofbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714648583; c=relaxed/simple;
	bh=7s1M5OYDc+LWVWpSbYQemQMh9geLdoxMPq2vKB3i6UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfdZz7py1MYRrxSxiFyDjdb0pnYUY36s+JC2jvBuiejJUs0jKNhiextYj7cgReV3DhM/zHLRu5bIOLB7gizpdeTuAYKgi98+zaUuXz98yRgvo+kkp93o9RsPwo/iik+OQy5l859K8wiEJeOqHWQV3Tf73/eV885kzhtci9AisXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=pYrMeTHQ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 79B99424A6
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648577;
	bh=MK9pS8zh0OAd8/YKYBCNbvjlHmkQLgxQ6JtcNKhjMOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=pYrMeTHQdc/GAlzvqrj7eE9T2mEidGKOMlWp2p9m1OtcLvEY7gHd8y+s6DbpnS8uL
	 LHi+K3f7230giwlz0lPBtJBwiCkfv+ylroSwipXW54fs/mzEwgdTaos04gtmaDacTW
	 Fya3tiwEfTxTgqCRgFX0XGoWovqTNQs60VmBoe9vySPgdEIyMBVAcKZBjAem+zVMcf
	 sQCsVlwHbn9yVH9HhPoPNxjs3jWOTDmM7t/I0wyxZktamGf+ET8/NK3ArmXfJDmaxV
	 3PjDoMX5ZB5Nn3PuSCQCw4GF42yy+3DTjCaQoRWRGEMA+8MBoaK1S/0APUodC5Du7q
	 SSw3iRA//nZsA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a592c35ac06so180905666b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 04:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648577; x=1715253377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK9pS8zh0OAd8/YKYBCNbvjlHmkQLgxQ6JtcNKhjMOU=;
        b=xS6NFDRBgO2AtlFYxKChYUC9AiUNX/EbsftRpcwSovR3JI5D9DCtA02AIUsc+jCH3B
         +XyArJ0aWPbnSiMy9dZauVA/cwpi8KtyJAr6SJ9uF+l0euJ4QcmkVvwSCXceuAKEkS/T
         q6bwcKz2i+G9l8TzO8oL+gmVyj9rurWC7XPh4W5aC87jAIMI+ARYL6XPVn4Mq+y6FDmG
         91Awm40h4+aVcFoaQwDNG3WIki0lLf1b1yyoc0mebxD6LTfaYtYnsIZmWhVGwPdsTK2O
         X+CENEX3fZ4MFHjkrBs6lNJS4h8yFXkoQ7yWF4xydkFAwsYAsiI9kvYGU2LVvr2Xf9fx
         /wRg==
X-Forwarded-Encrypted: i=1; AJvYcCVp7b/7EaZ9U/MT33S+2Idtef6laRKX/19ohmTlmT/jG9C5ipT3hzUiI/SHc6ROxq2Kgwx74FRSoN3qf7gXU4R2BH/6cpjG3Y/jchIW
X-Gm-Message-State: AOJu0Yynu4tKq+NALsHSxc9WjHw9k9Vm5VC5UKKW5/YeZ+ttn4zxdP7a
	nDqbvi3ceQ4Vtvbn5YgKbKC8Ss1qbxB1pbheAYQUhn/hmdGLJ6bapdkwiKdW37l7Npr0fL0KRgG
	G+PLHMsthuRBeAe2pnpg9Wh7PBHdGnBPVizA9kfqd5q91tisNI+uVEaFCo5vtiYkvrgFVVR0pde
	G5bA==
X-Received: by 2002:a17:906:248b:b0:a58:eb0d:f2a6 with SMTP id e11-20020a170906248b00b00a58eb0df2a6mr1882992ejb.31.1714648576877;
        Thu, 02 May 2024 04:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7LnYqMf09AgSTE93ChylTc81npf1nJHpjVmGmIFbInD5oUeTRsn+ecAVqhExu0Tv8wF6tLQ==
X-Received: by 2002:a17:906:248b:b0:a58:eb0d:f2a6 with SMTP id e11-20020a170906248b00b00a58eb0df2a6mr1882976ejb.31.1714648576542;
        Thu, 02 May 2024 04:16:16 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:15 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 1/3] riscv: make image compression configurable
Date: Thu,  2 May 2024 13:16:06 +0200
Message-ID: <20240502111613.1380453-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the build process would always set KBUILD_IMAGE to the
uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled) and
unconditionally compress it into Image.gz. However there are already
build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
Image.zstd, so let's make use of those, make the compression method
configurable and set KBUILD_IMAGE accordingly so that targets like
'make install' and 'make bindeb-pkg' will use the chosen image.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Kconfig         |  7 +++++++
 arch/riscv/Makefile        | 43 ++++++++++++++++++++------------------
 arch/riscv/boot/install.sh |  9 +++++---
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..6c092d1ea7db 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -138,6 +138,13 @@ config RISCV
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_IRQ_TIME_ACCOUNTING
+	select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_LZ4 if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_LZMA if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
+	select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..29be676415d6 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -129,11 +129,27 @@ endif
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
 
 # Default target when executing plain make
-boot		:= arch/riscv/boot
+boot := arch/riscv/boot
 ifeq ($(CONFIG_XIP_KERNEL),y)
 KBUILD_IMAGE := $(boot)/xipImage
+else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
+KBUILD_IMAGE := $(boot)/loader.bin
+else ifeq ($(CONFIG_EFI_ZBOOT),y)
+KBUILD_IMAGE := $(boot)/vmlinuz.efi
+else ifeq ($(CONFIG_KERNEL_GZIP),y)
+KBUILD_IMAGE := $(boot)/Image.gz
+else ifeq ($(CONFIG_KERNEL_BZIP2),y)
+KBUILD_IMAGE := $(boot)/Image.bz2
+else ifeq ($(CONFIG_KERNEL_LZ4),y)
+KBUILD_IMAGE := $(boot)/Image.lz4
+else ifeq ($(CONFIG_KERNEL_LZMA),y)
+KBUILD_IMAGE := $(boot)/Image.lzma
+else ifeq ($(CONFIG_KERNEL_LZO),y)
+KBUILD_IMAGE := $(boot)/Image.lzo
+else ifeq ($(CONFIG_KERNEL_ZSTD),y)
+KBUILD_IMAGE := $(boot)/Image.zst
 else
-KBUILD_IMAGE	:= $(boot)/Image.gz
+KBUILD_IMAGE := $(boot)/Image
 endif
 
 libs-y += arch/riscv/lib/
@@ -153,32 +169,19 @@ endif
 vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
 
-ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
-KBUILD_IMAGE := $(boot)/loader.bin
-else
-ifeq ($(CONFIG_EFI_ZBOOT),)
-KBUILD_IMAGE := $(boot)/Image.gz
-else
-KBUILD_IMAGE := $(boot)/vmlinuz.efi
-endif
-endif
-endif
-BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
+BOOT_TARGETS := Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
 
 all:	$(notdir $(KBUILD_IMAGE))
 
 loader.bin: loader
-Image.gz loader vmlinuz.efi: Image
+Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo Image.zst loader xipImage vmlinuz.efi: Image
+
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 	@$(kecho) '  Kernel: $(boot)/$@ is ready'
 
-Image.%: Image
-	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-
-install: KBUILD_IMAGE := $(boot)/Image
-zinstall: KBUILD_IMAGE := $(boot)/Image.gz
+# the install target always installs KBUILD_IMAGE (which may be compressed)
+# but keep the zinstall target for compatibility with older releases
 install zinstall:
 	$(call cmd,install)
 
diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
index 4c63f3f0643d..a8df7591513a 100755
--- a/arch/riscv/boot/install.sh
+++ b/arch/riscv/boot/install.sh
@@ -17,15 +17,18 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
-if [ "$(basename $2)" = "Image.gz" ]; then
+case "${2##*/}" in
 # Compressed install
+Image.*|vmlinuz.efi)
   echo "Installing compressed kernel"
   base=vmlinuz
-else
+  ;;
 # Normal install
+*)
   echo "Installing normal kernel"
   base=vmlinux
-fi
+  ;;
+esac
 
 if [ -f $4/$base-$1 ]; then
   mv $4/$base-$1 $4/$base-$1.old
-- 
2.43.0


