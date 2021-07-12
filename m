Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C57C3C5B4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jul 2021 13:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbhGLLNG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jul 2021 07:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbhGLLNE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jul 2021 07:13:04 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B8AC0613DD;
        Mon, 12 Jul 2021 04:10:16 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4GNgz86l8BzQk9Q;
        Mon, 12 Jul 2021 13:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-language:content-type
        :content-type:mime-version:date:date:message-id:subject:subject
        :from:from:received; s=mail20150812; t=1626088209; bh=xOpulS9RVQ
        75hhiqo9JTOyo5JltLbEXsGU4c2Ixs/xI=; b=n1hP2uZjMni+RSeupiOSuAEAMa
        Ewd6T3z18AfQ6gLLcU09tIolFVg08Irpys2Xt6MnF4uwNpmdCzdpj/crk/5O1h3m
        pzugvBpz7mC40pG/xcKS+D0G9EwshiP6OzA6oq6BcOc9l70xMc4mcSPf+dCojd56
        sA5ObvCKZl943N9blJRA8WTZvHcMOTdD1U4Bm4lsGgTYCgRxEwucxl5CpFBpsn8z
        0ASuC8rYWeer+ykI41Sz7h4BNEOIYgKB7o/VpzugyPSEWcnlK6d4WDPcxo+JoF8W
        vKhtXy09zS5AuANcelEVpfeHt2vXjJWMCzS1SqlxyjqFFISqGJbqYcBaq/DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1626088210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=wOi1UYYQ8I3f24rxux4lFTLL6nRIrOruMYvcRjf03t4=;
        b=j30PfgR9w6FwvvDn7LyvfJoGL61zQ5pQKt+1ZQcIjpdgGybHP6252WhlTyOqbuMvkZ+nq0
        /59NEuVTHodqZS6AbDBa2UW19DY3DSASdpiZOAEpoDSTu0PU+H62YLCaTXdqJSIvYBmZuT
        Gvy7YawETJxNzSIeigxUZVRzEhdNmVhBctAyziPobz74/QWPmgSrXDZzAmO6j8Slo4x7Qk
        WL8mTWSLm9VTG9RFu6rHJdYC9hMGGE9ucx33jzcBD1Nq6oarUkVUXMulMYjtErAzDrY4/y
        up2tSzK5i1ls4NGc0zmn3w8OCYBnvKlzgyZh7iiONvNSTukCP5ob9uhBRC5l3g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id tO8fHc4YlX90; Mon, 12 Jul 2021 13:10:09 +0200 (CEST)
From:   Tor Vic <torvic9@mailbox.org>
Subject: [PATCH 1/1] Kbuild, clang: add option for choosing a ThinLTO cache
 directory
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        keescook@chromium.org
Cc:     linux-kbuild@vger.kernel.org,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Message-ID: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
Date:   Mon, 12 Jul 2021 11:10:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.54 / 15.00 / 15.00
X-Rspamd-Queue-Id: 88D25182B
X-Rspamd-UID: d25e57
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
 Makefile                  |  5 +++--
 arch/Kconfig              | 10 ++++++++++
 scripts/Makefile.lib      |  4 ++++
 scripts/Makefile.modfinal |  4 ++++
 4 files changed, 21 insertions(+), 2 deletions(-)

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
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 10950559b223..bca87a6aa35b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -197,6 +197,10 @@ endif
 part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
 quiet_modtag = $(if $(part-of-module),[M],   )

+ifdef CONFIG_LTO_CLANG_THIN
+KBUILD_LDFLAGS	+=
--thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
+endif
+
 modkern_cflags =                                          \
 	$(if $(part-of-module),                           \
 		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 5e9b8057fb24..ab0d72e21318 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -35,6 +35,10 @@ ifdef CONFIG_LTO_CLANG
 # avoid a second slow LTO link
 prelink-ext := .lto

+ifdef CONFIG_LTO_CLANG_THIN
+KBUILD_LDFLAGS	+=
--thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
+endif # CONFIG_LTO_CLANG_THIN
+
 # ELF processing was skipped earlier because we didn't have native code,
 # so let's now process the prelinked binary before we link the module.

-- 
2.32.0
