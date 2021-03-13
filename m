Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0334F33A0B5
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhCMTuP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:50:15 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:40529 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbhCMTtw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:52 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmefA018162;
        Sun, 14 Mar 2021 04:48:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmefA018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664928;
        bh=BoV7rQt3otMDa4/M9ZBYg5E50q0T2O3QrpDy19gqxBQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MHyU9zjJh2rmeEstb+T7psR6ioHo20BFIP8zFBDmtRkLciPl0JwWjSvbFKDXyaCCl
         xKWumjSTG0apaHNnsrCRobSvwh7+UdWI+zAg9Ck/CwLhdgw/l88S3sXxzhoFSG9YE+
         HTIWEgAaLidBVMY8UZvJUAzuBgzBfQbBKV3KMMK5bXDZiyxsNazjL9+MySwTrJDk0h
         swCyZXSJex0IQ7Tu3xsFV7b9C3nFjrlEJvZIS5pafOyRVay3Ud+jPvohswhrqv0Qph
         Qds4PdfdIai0q8T1QrNwMyMv2KJixoIhsuYBd9uDGoqhDlTc/smLdtZxxYa8J46izQ
         SJUR/UJW3GDBg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] kconfig: do not use allnoconfig_y option
Date:   Sun, 14 Mar 2021 04:48:34 +0900
Message-Id: <20210313194836.372585-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

allnoconfig_y is a bad hack that sets a symbol to 'y' by allnoconfig.

allnoconfig does not mean a minimum set of CONFIG options because a
bunch of prompts are hidden by 'if EMBEDDED' or 'if EXPERT', but I do
not like to do a workaround this way.

Use the pre-existing feature, KCONFIG_ALLCONFIG, to provide a one
liner config fragment. CONFIG_EMBEDDED=y is still forced under
allnoconfig.

No change in the .config file produced by 'make tinyconfig'.

The output of 'make allnoconfig' will be changed; we will get
CONFIG_EMBEDDED=n because allnoconfig literally sets all symbols to n.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig                    | 1 -
 kernel/configs/tiny-base.config | 1 +
 scripts/kconfig/Makefile        | 3 ++-
 3 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 kernel/configs/tiny-base.config

diff --git a/init/Kconfig b/init/Kconfig
index 46b87ad73f6a..beb8314fdf96 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1769,7 +1769,6 @@ config DEBUG_RSEQ
 
 config EMBEDDED
 	bool "Embedded system"
-	option allnoconfig_y
 	select EXPERT
 	help
 	  This option should be enabled if compiling the kernel for
diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
new file mode 100644
index 000000000000..2f0e6bf6db2c
--- /dev/null
+++ b/kernel/configs/tiny-base.config
@@ -0,0 +1 @@
+CONFIG_EMBEDDED=y
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7df3c0e4c52e..46f2465177f0 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -102,7 +102,8 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 
 PHONY += tinyconfig
 tinyconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
+	$(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
+	$(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
 
 # CHECK: -o cache_dir=<path> working?
 PHONY += testconfig
-- 
2.27.0

