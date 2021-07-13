Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51FD3C751E
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jul 2021 18:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbhGMQom (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 12:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhGMQom (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 12:44:42 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485A5C0613DD;
        Tue, 13 Jul 2021 09:41:52 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4GPRHK3bh8zQkBw;
        Tue, 13 Jul 2021 18:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-language:content-type
        :content-type:mime-version:date:date:message-id:subject:subject
        :from:from:received; s=mail20150812; t=1626194506; bh=bV2Ub8Dl4O
        AgCpbhC2OayemUg8DzgSFkQuYDlxX+F58=; b=L3LEee6PizP4XDGS0wMtxrgVgH
        +v5Ghs4n+tUkwimR/vJ+4nyBMEHCAv4kG//HzA8obWQ7ccZBkSvImCHGvSLU3UGU
        WBJDvvnHP61F1CMyBVl7BjDTnsANnY53dx0f7T7UDindB5LYquiyOT6vgUmXPmBE
        HpRaSn7nY8isBlkk2Ue2zw6pH2fzRhswvXy8EJ5HKikYjP3WQ0EAUgc4y20o8yaS
        eEvZjT0NImfmUHFvECLJhar/ePy+NuWRgo3wRYSeu/r9XmN+oho29ZDyW+LNFwkI
        342F81cnKI8h+XS9fPYwI899clU4BzIGxmiYbjQ1C3DZ7KtoMaNa+R2Zpv8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1626194507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=AdGwqYiU2Exy6QI/bwNjAGF2kjHGEu0qjw5lXgO0IGQ=;
        b=oVta/ZFqucfokDYWa7xAKmuJfepzbUlhW3Vo/G4xHI7xHXjpRTmQZO5uaCrXDtGDC8GWfd
        yk7GkgH5O3tTYiREVfZDkJ3Tuqh5odbMr7jG0KeJBbA4K5DNeowyfVOMP++a9F8AGPiOek
        9zYfKjUd1Zzva63+LcLxva6ABMsMtagY5HVTaCCoAIpwJP7Wdbpv04gzeoX6x7w9bApR9I
        Fz8srvKaX819/mTO77z+zATSLwN4pRY+2pNopQX75mgtJTecRPecq1uLtzfgJqH3icCLEY
        MqLXw8kXJWENGZi9GzQSR5U1G/vhCifDjzuEaWzbB0Zcj8GxDRJezXheovkbQA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id Bf6s8kN6VwLN; Tue, 13 Jul 2021 18:41:46 +0200 (CEST)
From:   Tor Vic <torvic9@mailbox.org>
Subject: [PATCH v2 1/1] Kbuild, clang: add option for choosing a ThinLTO cache
 directory
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        keescook@chromium.org
Cc:     linux-kbuild@vger.kernel.org,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Message-ID: <a6eea2c4-6d90-3ddf-33d6-973d1ae917e7@mailbox.org>
Date:   Tue, 13 Jul 2021 16:41:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.69 / 15.00 / 15.00
X-Rspamd-Queue-Id: 478F21819
X-Rspamd-UID: 1fac34
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On some distros and configurations, it might be useful to allow for
specifying a directory where Clang stores its ThinLTO cache.

More specifically, when building the VirtualBox extramodules on Arch with
its proper 'makepkg' build system and DKMS, against an already installed
ThinLTO kernel, the build fails because it tries to create the ThinLTO
cache in a directory that is not user-writable.

A similar problem has been reported with openSUSE's OBS build system.

Add a Kconfig option that allows users to choose a directory in which
Clang's ThinLTO can store its cache.

Link: https://github.com/ClangBuiltLinux/linux/issues/1104
Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
Changes from v1 to v2: remove unneeded changes in scripts/Makefile

 Makefile     |  5 +++--
 arch/Kconfig | 10 ++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c3f9bd191b89..472bc8bfff03 100644
--- a/Makefile
+++ b/Makefile
@@ -932,7 +932,8 @@ endif
 ifdef CONFIG_LTO_CLANG
 ifdef CONFIG_LTO_CLANG_THIN
 CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
-KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
+export thinlto-dir = $(if
$(CONFIG_LTO_CLANG_THIN_CACHEDIR),$(CONFIG_LTO_CLANG_THIN_CACHEDIR)/)
+KBUILD_LDFLAGS	+=
--thinlto-cache-dir=$(thinlto-dir)$(extmod_prefix).thinlto-cache
 else
 CC_FLAGS_LTO	:= -flto
 endif
@@ -1728,7 +1729,7 @@ PHONY += compile_commands.json

 clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
$(KBUILD_EXTMOD)/modules.nsdeps \
-	$(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
+	$(KBUILD_EXTMOD)/compile_commands.json
$(thinlto-dir)$(KBUILD_EXTMOD)/.thinlto-cache

 PHONY += help
 help:
diff --git a/arch/Kconfig b/arch/Kconfig
index 129df498a8e1..19e4d140e12a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -696,6 +696,16 @@ config LTO_CLANG_THIN
 	    https://clang.llvm.org/docs/ThinLTO.html

 	  If unsure, say Y.
+
+config LTO_CLANG_THIN_CACHEDIR
+	string "Clang ThinLTO cache directory"
+	depends on LTO_CLANG_THIN
+	default ""
+	help
+	  This option allows users to choose a directory that stores
+	  Clang's ThinLTO cache.
+	  Leave empty for default.
+
 endchoice

 config ARCH_SUPPORTS_CFI_CLANG
-- 
2.32.0

