Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29088359FD3
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 15:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhDINb0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 09:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDINb0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 09:31:26 -0400
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64ED8C061761;
        Fri,  9 Apr 2021 06:31:13 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4FGzYC47VgzQjx3;
        Fri,  9 Apr 2021 15:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:from:from
        :date:date:received; s=mail20150812; t=1617975065; bh=PpPDzBaifE
        tkZlonBqPbEjzUn9F7Q+H3PT2vmw7Iq6g=; b=pXEdTHuVxVuIm3izAYfatWmUPb
        aLszVGub/YPRwnVpX6uc6xierFdDd2llm74OTw6P2P7lylaCfGfATbN/AMpRMyH0
        HadnWiSdlT+ARvAHkqi4PJ5mc+AzIrejCqZoij4RtlFQUuYbxH1VTDeblXXAPNqF
        z2hrN9qgdB77g5El2viQFJX5RfjaT88Q11tujW9a5inuRJ/W6Pn+ajkNXaDxJmCV
        zLnCifCt25p035P65JlzFi5lcDN+p4LL6ehvuPMMpTflqYk31LS+IazOEYKhK+Wh
        LCWTmSnFJ/+XhJexnXLT/L+Ydsrumkibl9wg6IjOcGYV9ZfKcOOLBb3TjHmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1617975069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O760yRcwt7n2sx3necIavnUPiURJl6AJeR9OvM52rLk=;
        b=Zxue1oUlDfb31XU4iqR077EoGeFsFjtf4tU4eeJ/axI+NkE621XNUiTbO7gMewHcKXWtFO
        mmCr8q8JHnTUE3qCN3dfZ2ZRksL7hfNCqpeS/63Xyi+0797dKXvOcN6VNN11yAG0jAhxg+
        B7nZ4VmmcfL3Pg3IJtLHWUp7q5E80xjfcwdobs/2nMxubyJvxVYNdkfKj6RFXxJWlC1uui
        nBK6ryjoxVjK3tm3Z/q8u7IlsLTCgLLLQRSNaMTZK350zJO1ZdI+5APZqdeqUCUptr2V8O
        F/pUOvz2pwmDLHkQD28BX7dNotJIdyCww/5yD86litUr1saj8O1QfrYZiaYzCQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id uBq6-GA7m_3V; Fri,  9 Apr 2021 15:31:05 +0200 (CEST)
Date:   Fri, 9 Apr 2021 15:31:05 +0200 (CEST)
From:   torvic9@mailbox.org
To:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Piotr_G=C3=B3rski?= <lucjan.lucjanov@gmail.com>
Message-ID: <1637052983.69379.1617975065141@office.mailbox.org>
In-Reply-To: <1557177615.69331.1617974903770@office.mailbox.org>
References: <1557177615.69331.1617974903770@office.mailbox.org>
Subject: [PATCH 2/2] kbuild: allow setting zstd compression level for kernel
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.44 / 15.00 / 15.00
X-Rspamd-Queue-Id: A99C1186A
X-Rspamd-UID: 2aadda
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In a similar way to the first patch in this series, add another Kconfig
option that allows setting the zstd compression level for the kernel
as well.
This enables users to choose either a compression level between 1 and 19,
or instead use the highest possible level (ultra-22).
Also add '-T0' parameter in both cases.

Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
 arch/x86/boot/compressed/Makefile |  5 +++++
 init/Kconfig                      | 19 +++++++++++++++++++
 scripts/Makefile.lib              |  4 ++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index e0bc3988c..59ed10c61 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -130,8 +130,13 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
+ifdef CONFIG_KERNEL_ZSTD_ULTRA
 $(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,zstd22)
+else
+$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,zstd)
+endif
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
diff --git a/init/Kconfig b/init/Kconfig
index 15bb02c24..1d3c5eebf 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -321,6 +321,25 @@ config KERNEL_UNCOMPRESSED
 
 endchoice
 
+menu "ZSTD compression options"
+    depends on KERNEL_ZSTD
+
+config KERNEL_ZSTD_LEVEL
+    int "Compression level (1-19)"
+    range 1 19
+    default 19
+    help
+        Choose a compression level for zstd kernel compression.
+        Default is 19.
+
+config KERNEL_ZSTD_LEVEL_ULTRA
+    bool "Ultra compression"
+    help
+        Selecting this overrides the chosen compression level and enables
+        the highest possible compression level for zstd (ultra-22).
+
+endmenu
+
 config DEFAULT_INIT
 	string "Default init path"
 	default ""
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a4fbaf888..aa29b97fb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -455,10 +455,10 @@ quiet_cmd_xzmisc = XZMISC  $@
 # be used because it would require zstd to allocate a 128 MB buffer.
 
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) -19; $(size_append); } > $@
+      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) -$(CONFIG_KERNEL_ZSTD_LEVEL) -T0; $(size_append); } > $@
 
 quiet_cmd_zstd22 = ZSTD22  $@
-      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
+      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) -22 --ultra -T0; $(size_append); } > $@
 
 # ASM offsets
 # ---------------------------------------------------------------------------
-- 
2.31.1
