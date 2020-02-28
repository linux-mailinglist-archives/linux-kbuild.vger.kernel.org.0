Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7406172D21
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 01:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbgB1AXN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 19:23:13 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34139 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730432AbgB1AWy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 19:22:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id j7so499165plt.1
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2020 16:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVpHeuxipIPK/qd0iCdiGqFiQMqEhmX8CGXx2I34f0o=;
        b=krC6xmNgw5C2QYlaOO7YN2OpvJP+ov9IyIlPgq0DXWrHV9QPfrB/V2c9HARqDeyVlZ
         sbobrSdf3PuOxYRxxISvcUJUmQP1jaLlm2A+bGY0UwvmvfbkOinG7qJ0aqiD+JNnfd8f
         ebMF68HeaLLIxb73BOCWdAV1jFz++pJGNFM2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVpHeuxipIPK/qd0iCdiGqFiQMqEhmX8CGXx2I34f0o=;
        b=tnZpf0ngwqz/CgLNuZWPX/ZpPJ7yN0mVQGGXtcp82XlD4RLzCVmOkHm/eTOcQtqrmn
         yeRq54UTW2PiNxbHIU7Duwv5ICbT0ZZNiDJMGVVFbWwP4jGWFtXUDlS2IgdMIVRkAbkb
         /YSsnJTjDueyw0ZgugCC0f/MfERLm78CNA8aXMWGnIkK/O0aWW1r8umAVTDAEnlzRfg3
         /ZS5APDdtYYu+4l6lSVZJZShvU31PSMAGnGBq7uJTzlSXDFcDQ4M6CxvwJ8M120Reisi
         FPprxatS+L1cDxWR2fLxrlJ0bwSCR9UzMRWfwgxq5ZL7tUp7vzndeOZBQiaZMr52w1qZ
         /c9g==
X-Gm-Message-State: APjAAAWhnKDGFCKcetUffdo04Pj/H+uO8NmwEFKO+eXRuZxZZkAylS6i
        Ac9aZ5jGEQBvdnYAG6NUssaOJQ==
X-Google-Smtp-Source: APXvYqwL7Pts9z/sbRgRZgMFUPPpjfZxHHeQCL3ybGBJta4uKv6RUba5OOEn0ffoF3CqGS5GRVG4Qw==
X-Received: by 2002:a17:902:a588:: with SMTP id az8mr1413232plb.123.1582849373376;
        Thu, 27 Feb 2020 16:22:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e28sm8072097pgn.21.2020.02.27.16.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 16:22:52 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Kees Cook <keescook@chromium.org>, "H.J. Lu" <hjl.tools@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        James Morse <james.morse@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] arm64/build: Warn on orphan section placement
Date:   Thu, 27 Feb 2020 16:22:42 -0800
Message-Id: <20200228002244.15240-8-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228002244.15240-1-keescook@chromium.org>
References: <20200228002244.15240-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We don't want to depend on the linker's orphan section placement
heuristics as these can vary between linkers, and may change between
versions. All sections need to be explicitly named in the linker
script.

Explicitly include debug sections when they're present. Add .eh_frame*
to discard as it seems that these are still generated even though
-fno-asynchronous-unwind-tables is being specified. Add .plt and
.data.rel.ro to discards as they are not actually used. Add .got.plt
to the image as it does appear to be mapped near .data. Finally enable
orphan section warnings.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/Makefile             | 4 ++++
 arch/arm64/kernel/vmlinux.lds.S | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index dca1a97751ab..c682a65b3ab8 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -30,6 +30,10 @@ LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
   endif
 endif
 
+# We never want expected sections to be placed heuristically by the
+# linker. All sections should be explicitly named in the linker script.
+LDFLAGS_vmlinux += --orphan-handling=warn
+
 ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS), y)
   ifneq ($(CONFIG_ARM64_LSE_ATOMICS), y)
 $(warning LSE atomics not supported by binutils)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index c61d9ab3211c..6141d5b72f8f 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -98,7 +98,8 @@ SECTIONS
 	/DISCARD/ : {
 		*(.interp .dynamic)
 		*(.dynsym .dynstr .hash .gnu.hash)
-		*(.eh_frame)
+		*(.plt) *(.data.rel.ro)
+		*(.eh_frame) *(.init.eh_frame)
 	}
 
 	. = KIMAGE_VADDR + TEXT_OFFSET;
@@ -212,6 +213,7 @@ SECTIONS
 	_data = .;
 	_sdata = .;
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
+	.got.plt : ALIGN(8) { *(.got.plt) }
 
 	/*
 	 * Data written with the MMU off but read with the MMU on requires
@@ -246,6 +248,7 @@ SECTIONS
 	_end = .;
 
 	STABS_DEBUG
+	DWARF_DEBUG
 
 	HEAD_SYMBOLS
 }
-- 
2.20.1

