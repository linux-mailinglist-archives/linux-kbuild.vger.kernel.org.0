Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B122B0CE1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Nov 2020 19:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgKLSlo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Nov 2020 13:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgKLSlo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Nov 2020 13:41:44 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEF7C0613D1;
        Thu, 12 Nov 2020 10:41:43 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id ek7so3277113qvb.6;
        Thu, 12 Nov 2020 10:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbwUCO9/Da3fkPFh1nSPQACB3eAOSELwsDKteGbFH3E=;
        b=myShStDYB2xgfHPQDqhUB8MFR/KTGdBAv1Kmmq5w82QO2mVKDvfJvgc8ym1D802pCZ
         /VX2iMAYNOrb+NsUP/jCSqCN+kLWfLDRGj9KoS3QKs8HUmhdBPv9MFtOCkcAw4cBT27M
         0yDWYlYkSwM9/fFLsOdUX4Qbx1n2qEtjLlnEouY0HHmjfGzwMeYkBl3r4oeJgDyW6pjJ
         Fa1LARv0b7nBbD4z13X+1N5nOi5ARvAskeoMiglpjzIKDHcmFG1o2NcY/SJ1MITStUBn
         3FpEmURTeFaSBHK390sy6B1jKjTTXeC01Vr3r/5H44MmYmtSQX4ivCl0HDmjkyrrMO0E
         qy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbwUCO9/Da3fkPFh1nSPQACB3eAOSELwsDKteGbFH3E=;
        b=KhClIHeLmgP2ESNYdbU4MDosSISP7Qm2lb6jafNOsWkS1KEY2jnnO3ICgUnzCzXwam
         oH+g6HjJR2YE7bwRcj+7GjbC2JIY+S8tMbGZtfhaPQd8VwkwnQH4WCzXMWZ7Pgt+FZnK
         HZ9MCtDJVTuTfCfGy4jFHic5bri/TqTFUDIy07w0bpltiq9iODLjsMMe4TprHzpkO5j+
         SC9hVavxX69rzZb58k6G8TfWU3Wc2ZeWSn0xpcFS3gwmZ6YhyEE2MMCe4VPrspizcIZ1
         dN4bQI0eOpVSWsga/H9SZLZoxgmBO3FgZQXb1xAGYcWCZ2NMMRDPDQCb1zo/eOw75aUL
         p1rw==
X-Gm-Message-State: AOAM532ImM/jJGum8O6HXRxJrcRDo7SO/kUGHwdw4Lz2uD8YSoEGkD5u
        nWi+LV4st5+dj9NJAGJCNWI=
X-Google-Smtp-Source: ABdhPJw4hRi7NpG5o3EaGOpeBH/XQ/iD8J7u0onTElKJ5yQng4S37msPhUXqPtYKnXUDaW7C3CthBw==
X-Received: by 2002:ad4:4bb2:: with SMTP id i18mr1151089qvw.52.1605206503106;
        Thu, 12 Nov 2020 10:41:43 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id s134sm5591710qke.99.2020.11.12.10.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 10:41:42 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jian Cai <jiancai@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] kbuild: Always link with '-z norelro'
Date:   Thu, 12 Nov 2020 11:38:40 -0700
Message-Id: <20201112183839.1009297-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
script and options") added '-z norelro' to the arm64 Makefile when
CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
defaults to '-z relro' but the kernel does not use program headers or
adhere to the section layout that is required for RELRO to work.

Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
unset.

As it turns out, ARM experiences the same error after CONFIG_KASAN was
implemented, meaning that '-z norelro' needs to be added to that
Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):

$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
ld.lld: error: section: .exit.data is not contiguous with other relro sections

To avoid playing whack-a-mole with different architectures over time,
hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
because '-z norelro' is the default for it.

Link: https://github.com/ClangBuiltLinux/linux/issues/1189
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Hi all,

This should probably go into Russell's tree with acks from the arm64 and
kbuild maintainers.

Cheers,
Nathan

 Makefile            | 2 ++
 arch/arm64/Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 008aba5f1a20..648bfb486244 100644
--- a/Makefile
+++ b/Makefile
@@ -984,6 +984,8 @@ ifeq ($(CONFIG_RELR),y)
 LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
 endif
 
+LDFLAGS_vmlinux += -z norelro
+
 # Align the bit size of userspace programs with the kernel
 KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 5789c2d18d43..85495ff8f0fd 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -10,7 +10,7 @@
 #
 # Copyright (C) 1995-2001 by Russell King
 
-LDFLAGS_vmlinux	:=--no-undefined -X -z norelro
+LDFLAGS_vmlinux	:=--no-undefined -X
 
 ifeq ($(CONFIG_RELOCATABLE), y)
 # Pass --no-apply-dynamic-relocs to restore pre-binutils-2.27 behaviour

base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
-- 
2.29.2

