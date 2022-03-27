Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1764E84B3
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Mar 2022 00:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiCZXzJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 26 Mar 2022 19:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbiCZXzJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Mar 2022 19:55:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E3A2DD47;
        Sat, 26 Mar 2022 16:53:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 08B2CB80B3F;
        Sat, 26 Mar 2022 23:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65069C340F0;
        Sat, 26 Mar 2022 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648338803;
        bh=SFAoQoDCZH9+H/cOjK0kYrO4Z6OtnYYL4lqW44mHkAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rgjq4kDTzv0x087ZZZGxYa4cBD9L/g/GyfOmArtVkaKzXAJHQJz/PeLS5URqDrhTO
         yhNQGANls19RviIlIqovJz9ZnNXOR0owPJHwmnBLl3Fh1AALz31XJSdbb5/2+P2ViR
         u1igf5ulkC5uW1Qjj1OVCgGeBFlM7T/BtlOk3EqrmWnbH6UEmopoqVjiw7Q1bsQhT2
         a17zbuVzJ9mn5g1wsRMSbe9APw2+BNb+nh3/xhU60aW+Du9DmE6tRWoRBFCqa+/NdN
         dOn+tZJe4IqxpNkZBEwQq6k+6CzjyOf/Z7hNCS3t3jRUA3V3HLHiog92c7Dyc4zYPH
         8yFs2zv8gYvCw==
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: [PATCH v4 1/3] bootconfig: Check the checksum before removing the bootconfig from initrd
Date:   Sun, 27 Mar 2022 08:53:18 +0900
Message-Id: <164833879781.2575750.8980132935605494939.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <164833878595.2575750.1483106296151574233.stgit@devnote2>
References: <164833878595.2575750.1483106296151574233.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Check the bootconfig's checksum before removing the bootcinfig data
from initrd to avoid modifying initrd by mistake.
This will also simplifies the get_boot_config_from_initrd() interface.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 init/main.c |   22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/init/main.c b/init/main.c
index 560f45c27ffe..4f3ba3b84e34 100644
--- a/init/main.c
+++ b/init/main.c
@@ -265,7 +265,7 @@ static int __init loglevel(char *str)
 early_param("loglevel", loglevel);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-static void * __init get_boot_config_from_initrd(u32 *_size, u32 *_csum)
+static void * __init get_boot_config_from_initrd(u32 *_size)
 {
 	u32 size, csum;
 	char *data;
@@ -299,17 +299,20 @@ static void * __init get_boot_config_from_initrd(u32 *_size, u32 *_csum)
 		return NULL;
 	}
 
+	if (xbc_calc_checksum(data, size) != csum) {
+		pr_err("bootconfig checksum failed\n");
+		return NULL;
+	}
+
 	/* Remove bootconfig from initramfs/initrd */
 	initrd_end = (unsigned long)data;
 	if (_size)
 		*_size = size;
-	if (_csum)
-		*_csum = csum;
 
 	return data;
 }
 #else
-static void * __init get_boot_config_from_initrd(u32 *_size, u32 *_csum)
+static void * __init get_boot_config_from_initrd(u32 *_size)
 {
 	return NULL;
 }
@@ -408,12 +411,12 @@ static void __init setup_boot_config(void)
 	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
 	const char *msg;
 	int pos;
-	u32 size, csum;
+	u32 size;
 	char *data, *err;
 	int ret;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
-	data = get_boot_config_from_initrd(&size, &csum);
+	data = get_boot_config_from_initrd(&size);
 
 	strlcpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
 	err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
@@ -437,11 +440,6 @@ static void __init setup_boot_config(void)
 		return;
 	}
 
-	if (xbc_calc_checksum(data, size) != csum) {
-		pr_err("bootconfig checksum failed\n");
-		return;
-	}
-
 	ret = xbc_init(data, size, &msg, &pos);
 	if (ret < 0) {
 		if (pos < 0)
@@ -470,7 +468,7 @@ static void __init exit_boot_config(void)
 static void __init setup_boot_config(void)
 {
 	/* Remove bootconfig data from initrd */
-	get_boot_config_from_initrd(NULL, NULL);
+	get_boot_config_from_initrd(NULL);
 }
 
 static int __init warn_bootconfig(char *str)

