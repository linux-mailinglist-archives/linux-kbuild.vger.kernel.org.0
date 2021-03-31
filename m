Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5214350184
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhCaNj6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:39:58 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:40771 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235748AbhCaNj4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:39:56 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFeg003995;
        Wed, 31 Mar 2021 22:38:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFeg003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197900;
        bh=pCE5wN2vI2u3Kwh6WL4a96wk/4E/JAkH3HdxeyeF6/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ic3//E4K3/cu2nag2n4/Ajhe7CqLVbupolS58bydzuLMJeHk9lIvqnfKM00h97cK3
         U3Fi/W7OWzAkXbHeD5r+7oWl5LhMqPry+zbIX3sIadOjX6ukr9/SohR29JgXnCKJYf
         I+5ZJauheUfWFbbDf+2H4cBe+r+ybU86E6BwWglvOPxNuIQL+BlHAU30awzdA1Ee2x
         3Y2dkYX7bCkMbxTH8Eyj1uJWJh1Q+rqxlUM17C5bW2UHCwjn1jnL4OL18tIeafeEC1
         pSTPid5RbUyD3sLlsG2EOl2hZHBBbOqunVFmQ6KMHAdxTLRHEUioX1um3s/wl+GEHZ
         +1G9VGon/OLWQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 9/9] kbuild: remove CONFIG_MODULE_COMPRESS
Date:   Wed, 31 Mar 2021 22:38:10 +0900
Message-Id: <20210331133811.3221540-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CONFIG_MODULE_COMPRESS is only used to activate the choice for module
compression algorithm. It will be simpler to make the choice visible
all the time by adding CONFIG_MODULE_COMPRESS_NONE to allow the user to
disable module compression.

This is more consistent with the "Kernel compression mode" and "Built-in
initramfs compression mode" choices.

CONFIG_KERNEL_UNCOMPRESSED and CONFIG_INITRAMFS_COMPRESSION_NONE are
available to choose to not compress the kernel, initrd, respectively.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 019c1874e609..3ca1ffd219c4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2225,40 +2225,47 @@ config MODULE_SIG_HASH
 	default "sha384" if MODULE_SIG_SHA384
 	default "sha512" if MODULE_SIG_SHA512
 
-config MODULE_COMPRESS
-	bool "Compress modules on installation"
+choice
+	prompt "Module compression mode"
 	help
+	  This option allows you to choose the algorithm which will be used to
+	  compress modules when 'make modules_install' is run. (or, you can
+	  choose to not compress modules at all.)
 
-	  Compresses kernel modules when 'make modules_install' is run; gzip or
-	  xz depending on "Compression algorithm" below.
+	  External modules will also be compressed in the same way during the
+	  installation.
 
-	  module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
+	  For modules inside an initrd or initramfs, it's more efficient to
+	  compress the whole initrd or initramfs instead.
 
-	  Out-of-tree kernel modules installed using Kbuild will also be
-	  compressed upon installation.
+	  This is fully compatible with signed modules.
 
-	  Note: for modules inside an initrd or initramfs, it's more efficient
-	  to compress the whole initrd or initramfs instead.
+	  Please note that the tool used to load modules needs to support the
+	  corresponding algorithm. module-init-tools MAY support gzip, and kmod
+	  MAY support gzip and xz.
 
-	  Note: This is fully compatible with signed modules.
+	  Your build system needs to provide the appropriate compression tool
+	  to compress the modules.
 
-	  If in doubt, say N.
+	  If in doubt, select 'None'.
 
-choice
-	prompt "Compression algorithm"
-	depends on MODULE_COMPRESS
-	default MODULE_COMPRESS_GZIP
+config MODULE_COMPRESS_NONE
+	bool "None"
 	help
-	  This determines which sort of compression will be used during
-	  'make modules_install'.
-
-	  GZIP (default) and XZ are supported.
+	  Do not compress modules. The installed modules are suffixed
+	  with .ko.
 
 config MODULE_COMPRESS_GZIP
 	bool "GZIP"
+	help
+	  Compress modules with XZ. The installed modules are suffixed
+	  with .ko.gz.
 
 config MODULE_COMPRESS_XZ
 	bool "XZ"
+	help
+	  Compress modules with XZ. The installed modules are suffixed
+	  with .ko.xz.
 
 endchoice
 
-- 
2.27.0

