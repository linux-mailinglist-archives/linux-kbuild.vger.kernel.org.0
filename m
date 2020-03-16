Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4822B186D12
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2020 15:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731541AbgCPOam (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 10:30:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50193 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731465AbgCPOak (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:30:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id z13so1855355wml.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R+Gvs9hVDDCMOY336QoblV4ZIg4hz1Qc4pgjDVSYrZw=;
        b=pK4psSJaWvRH2ShNntRanlxFZciHpDRYht0XxCrDqbpXASnkX8hwZGkm+pAGRmIRE5
         EYCs81swbCNuLcnkFMX7lDn1MmRvSmA84ltkpxKWvKHFW1oFs+Sef7jDi7hfRFwsalKR
         SZGirVQLpL/Eh9zvjXI0s33o4t7okW7baFp/uSmbofDLUp8IunUjryBBbRraSND+HS8H
         dii3B7s2DSllNMsHgWVT0PZAxaA/A/QW50XMqp1n5ltKiXESHzKRZBUpY4Wq3goD/20X
         W1MqxSwts99LYy8f14jFSJkW2OUmB3kIoI/eko31fV7u5ExIVe5tQC6mjYAZAfQD+qvw
         PtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R+Gvs9hVDDCMOY336QoblV4ZIg4hz1Qc4pgjDVSYrZw=;
        b=e3x4JOkyCMeFS2UR97qsYKZASXPBTbMUc7/U1qSE6MsCTpAv66Nx7S80+zPbtQHps4
         DhNK2BQwQAUmcWQPO8jlcbL9c5BaecBbaqv5/qPo7TSynSfSsNX8GW73JTA3HAuXHGs0
         qCS2XI/nXUWwvTy+Cj2B2jlRastmVSS5uHqDDrQ4OVbqj9uK0OWZ051DzeEO+csNQ5Fp
         fZbK3BAEPBzib9tnIohIWX8ZR75AjDvfbRUul4hxRtCgFOFDqZZAQdOnmOAPJOLtqxoM
         PTv0KkGmhGbNDKfecuJOYCI6Z/zpYefallrAcry34Q49mNnbqt00xS2/WbJATUrf+YWB
         k+mg==
X-Gm-Message-State: ANhLgQ0kpjzGG798+6CacQxyp8jPKo8trcxheMqvRmvzIkErsnE762pV
        ne0qfFZXurS5xHB5oPDCBgB1BKkZDCtDfi5r
X-Google-Smtp-Source: ADFU+vtV83xhjIA0Tdy7spH4K8paaf1O0RSR60YNVgjS1x/u7IoiaFyGaHwTE03P7JDLOrQr5vAnuw==
X-Received: by 2002:a05:600c:2319:: with SMTP id 25mr28084151wmo.106.1584369036638;
        Mon, 16 Mar 2020 07:30:36 -0700 (PDT)
Received: from ntb.Speedport_W_921V_1_46_000 (p57AF9474.dip0.t-ipconnect.de. [87.175.148.116])
        by smtp.googlemail.com with ESMTPSA id z129sm31344330wmb.7.2020.03.16.07.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:30:35 -0700 (PDT)
From:   Petr Malat <oss@malat.biz>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc:     terrelln@fb.com, clm@fb.com, gregkh@linuxfoundation.org,
        keescook@chromium.org, Petr Malat <oss@malat.biz>
Subject: [PATCH v2 2/2] x86: Enable support for ZSTD-compressed kernel
Date:   Mon, 16 Mar 2020 15:30:17 +0100
Message-Id: <20200316143018.1366-2-oss@malat.biz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316143018.1366-1-oss@malat.biz>
References: <20200316140745.GB4041840@kroah.com>
 <20200316143018.1366-1-oss@malat.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ZSTD compression ratio is roughly 10% worst than xz, but the
decompression is 10x faster. Currently, this is one of the optimal
algorithms available in the kernel, as there isn't an algorithm,
which would provide a better compression ratio and a shorter
decompression time.

Signed-off-by: Petr Malat <oss@malat.biz>
---
 arch/x86/Kconfig                  | 1 +
 arch/x86/boot/compressed/Makefile | 5 ++++-
 arch/x86/boot/compressed/misc.c   | 4 ++++
 arch/x86/include/asm/boot.h       | 4 ++--
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5e8949953660..b22312aae674 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -180,6 +180,7 @@ config X86
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 1dac210f7d44..a87dc1e41772 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -24,7 +24,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 KCOV_INSTRUMENT		:= n
 
 targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
-	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4
+	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4 vmlinux.bin.zst
 
 KBUILD_CFLAGS := -m$(BITS) -O2
 KBUILD_CFLAGS += -fno-strict-aliasing $(call cc-option, -fPIE, -fPIC)
@@ -145,6 +145,8 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
+$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,zstd)
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
@@ -152,6 +154,7 @@ suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO) 	:= lzo
 suffix-$(CONFIG_KERNEL_LZ4) 	:= lz4
+suffix-$(CONFIG_KERNEL_ZSTD) 	:= zst
 
 quiet_cmd_mkpiggy = MKPIGGY $@
       cmd_mkpiggy = $(obj)/mkpiggy $< > $@
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 9652d5c2afda..39e592d0e0b4 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -77,6 +77,10 @@ static int lines, cols;
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif
+
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
 /*
  * NOTE: When adding a new decompressor, please update the analysis in
  * ../header.S.
diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
index 680c320363db..9838c183e9a8 100644
--- a/arch/x86/include/asm/boot.h
+++ b/arch/x86/include/asm/boot.h
@@ -24,9 +24,9 @@
 # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
+#if CONFIG_KERNEL_BZIP2 || CONFIG_KERNEL_ZSTD
 # define BOOT_HEAP_SIZE		0x400000
-#else /* !CONFIG_KERNEL_BZIP2 */
+#else /* !(CONFIG_KERNEL_BZIP2 || CONFIG_KERNEL_ZSTD)  */
 # define BOOT_HEAP_SIZE		 0x10000
 #endif
 
-- 
2.20.1

