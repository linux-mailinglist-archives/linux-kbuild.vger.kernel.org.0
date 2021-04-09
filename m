Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F93E359FCD
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhDIN2o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 09:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDIN2o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 09:28:44 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F873C061760;
        Fri,  9 Apr 2021 06:28:31 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4FGzV321Q0zQk1b;
        Fri,  9 Apr 2021 15:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:message-id:from:from:date:date:received; s=
        mail20150812; t=1617974904; bh=AgkOpgV5Fc2cPWeeeC5cK0+Ypi2yAhdE9
        Uac+kPGrzc=; b=T4Wu/bNnhNYsUOtcgSJazMb/y5I1b3Ce96kTU+gsw2tlvKY1U
        C7oT7eNe2TNkY+85Y5AChoS6usxJ8vqJvElp4G7zZe0VZOYbOfKt+loAUvUZM4Cn
        5sMwGKrK1F8cwxwd7POln/DEeeOhAwR9CD5G1RjSsVVMpRuDAoo1YhuroQoMPCIP
        0tuDlp+cNgrJy3CBtbBOI0YgwzoqO3ldFHWz5t42HDjrYOot5lxO5l7vuILdwh44
        0Sf23ppWOM3ToO9xBDfBXQhQ7VM298zYwDDvyJTGouq1di2Vfnz3yw31pKXML7M5
        mYrCqzMKLQDhrevE6qlMXH+Gk4VzoDWK0RzEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1617974905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=uUwqfRRZQovNuSAqVYPSHLzpotH8r/dvuT77yNbYt7Y=;
        b=ggnIJMrq8JeAkWx/XwKMp+hrYzFxFPAm5YpzqFEbHU7e7+HNyh6r5ub5ppVAS53I9WCI++
        cpK3EMehBiWKktm5ZZSfkEUJVtQatPkD+MefXpWRt+099g3QTNxK2UFHmNfV6B2zdJg1WL
        R+H4RTkPJtTOqRgYtpjCheTSxCjZXSDwHokJeoJCyWtK5yQj08XEh9kUhkCfFFptsi4/ha
        woPIL0sU8Q4k0ncuR0d8NKZTNlF6QSChPP2Z48S3RSJ5hVs+C1DK1rck+I0Y2rytL4OfO+
        fsOGADaZOZggD7Hb2CDt5Dcek8oROD+D/ZMebQOuL1VGVx6VL07Mv65M4FneaA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id RFvgcGJvakMQ; Fri,  9 Apr 2021 15:28:24 +0200 (CEST)
Date:   Fri, 9 Apr 2021 15:28:23 +0200 (CEST)
From:   torvic9@mailbox.org
To:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Piotr_G=C3=B3rski?= <lucjan.lucjanov@gmail.com>
Message-ID: <1557177615.69331.1617974903770@office.mailbox.org>
Subject: [PATCH 1/2] kbuild: allow setting zstd compression level for
 modules
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.80 / 15.00 / 15.00
X-Rspamd-Queue-Id: 64A7117FA
X-Rspamd-UID: 9b2d7a
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Zstd offers a very fine-grained control of compression ratios.
Add a Kconfig option that allows setting the desired compression
level for module compression.

Based on Masahiro's linux-kbuild.

Signed-off-by: Tor Vic <torvic9@mailbox.org>
Tested-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
---
 init/Kconfig             | 8 ++++++++
 scripts/Makefile.modinst | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index b5744d32c..15bb02c24 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2275,6 +2275,14 @@ config MODULE_COMPRESS_ZSTD
 
 endchoice
 
+config MODULE_COMPRESS_ZSTD_LEVEL
+    int "Compression level (1-19)"
+    depends on MODULE_COMPRESS_ZSTD
+    range 1 19
+    default 3
+    help
+        Compression level used by zstd for compressing modules.
+
 config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 	bool "Allow loading of modules with missing namespace imports"
 	help
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ff9b09e4c..0a0db2278 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -97,7 +97,7 @@ quiet_cmd_gzip = GZIP    $@
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
+      cmd_zstd = $(ZSTD) -$(CONFIG_MODULE_COMPRESS_ZSTD_LEVEL) -T0 --rm -f -q $<
 
 $(dst)/%.ko.gz: $(dst)/%.ko FORCE
 	$(call cmd,gzip)
-- 
2.31.1
