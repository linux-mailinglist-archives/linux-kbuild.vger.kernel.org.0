Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39162B24FE
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Nov 2020 20:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgKMT4M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Nov 2020 14:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgKMT4K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Nov 2020 14:56:10 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B3AC0613D1;
        Fri, 13 Nov 2020 11:56:10 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id k4so18207qko.13;
        Fri, 13 Nov 2020 11:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BuSBR3W0Up+xs4RMbJtfRRlgixduLeoiJlhk7xnEIR0=;
        b=Rz7bo5155yveyQ9ZrU3UXRmgFVAlpmKkI/wTgDabwLcf/AW274xZWtGwKaoFUHCuWV
         AlUe5BkWT/spMfkjOhGCLbH/P6zUhfVdE0Ya0L1jSSCP5uofyayDsp4lUMXVQtrOM4iq
         ymSNPlt7IqY/MlDkIJMQo1VjmPcK94pRwWf4QkNu+vVjHunZEg9cnxjY4plQCq/MKl+H
         cCHXsuMrxAVYpHLpMIehHAJKLLkv6OrYRA/SZyIZR3JxxDw5jpL2lTKg1vC3GAVhk/rE
         /vPKiSV5CAXK/3t0WeX1/3ZNsY/Ul5dLS8lV0uol/Cj+UtRt/Zk4sIh6yididMuf64Ba
         GLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BuSBR3W0Up+xs4RMbJtfRRlgixduLeoiJlhk7xnEIR0=;
        b=BLzRq/P/QWekU+gDPg7eza519SYU+aSLpb/osMB1xMepK0o3AYRfwyDDv8ekGtRjMG
         bB7FD790pTZOH+E6WVcEAgVU4VHWozdreoJpkcrX6DGQlZy5OuiV4YqnXr7LIGNUVuFN
         0WG6tQY4qHH7NFxCDNWnJ9FTJnxSp5zPEai3bk3flezcv3tcS1AN67NU0/i3DwJ6yLgW
         SoPshUedqnymvoWbiY3XE94bv1FsFTCBBl9xFxkPyTAg91tzsCqM/TFg8iKADcCZkWBz
         gd6XE4e7dMU52zK8gFUjcZRqCaJVAwspJDcEZkqL52y475wEEMDgq4IcX+YO/dUDeLy9
         ih2w==
X-Gm-Message-State: AOAM530j8ncCxRGYXJeuYa6mX/a+KxFwQiF1vcKYt6Mhv/MYLlx0d5m1
        GpeePJwcMdKEfWIUZJUYAfs=
X-Google-Smtp-Source: ABdhPJzdFZIQVJ1DipALLbMQzdXhQ7LqTzyxp6paaFlRduPmNj6wrsGfChmfjhdHmK67f9IFeZWQKQ==
X-Received: by 2002:ae9:dec5:: with SMTP id s188mr3767153qkf.250.1605297369148;
        Fri, 13 Nov 2020 11:56:09 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id z26sm6977757qki.40.2020.11.13.11.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 11:56:08 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
Date:   Fri, 13 Nov 2020 12:55:53 -0700
Message-Id: <20201113195553.1487659-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
along with a few others. Newer versions of ld.lld do not have these
warnings. As a result, do not add '--orphan-handling=warn' to
LDFLAGS_vmlinux if ld.lld's version is not new enough.

Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
Reported-by: kernelci.org bot <bot@kernelci.org>
Reported-by: Mark Brown <broonie@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1187
Link: https://github.com/ClangBuiltLinux/linux/issues/1193
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 MAINTAINERS            |  1 +
 init/Kconfig           |  6 +++++-
 scripts/lld-version.sh | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100755 scripts/lld-version.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da6d8c154e4..4b83d3591ec7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4284,6 +4284,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	scripts/clang-tools/
+F:	scripts/lld-version.sh
 K:	\b(?i:clang|llvm)\b
 
 CLEANCACHE API
diff --git a/init/Kconfig b/init/Kconfig
index a270716562de..40c9ca60ac1d 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -47,6 +47,10 @@ config CLANG_VERSION
 	int
 	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
+config LLD_VERSION
+	int
+	default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
@@ -1349,7 +1353,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	  own risk.
 
 config LD_ORPHAN_WARN
-	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
+	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
 
 config SYSCTL
 	bool
diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
new file mode 100755
index 000000000000..cc779f412e39
--- /dev/null
+++ b/scripts/lld-version.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# ld.lld-version ld.lld-command
+#
+# Print the linker version of `ld.lld-command' in a 5 or 6-digit form
+# such as `100001' for ld.lld 10.0.1 etc.
+
+linker="$*"
+
+if ! ( $linker --version | grep -q LLD ); then
+	echo 0
+	exit 1
+fi
+
+VERSION=$($linker --version | cut -d ' ' -f 2)
+MAJOR=$(echo $VERSION | cut -d . -f 1)
+MINOR=$(echo $VERSION | cut -d . -f 2)
+PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.29.2

