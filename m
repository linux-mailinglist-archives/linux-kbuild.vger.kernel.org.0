Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4A07E29B6
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Nov 2023 17:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbjKFQ0p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Nov 2023 11:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjKFQ0n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2023 11:26:43 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F7AD6E;
        Mon,  6 Nov 2023 08:26:37 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 4A44B21FB1;
        Mon,  6 Nov 2023 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699287996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yzy6WdAu4zUhGh00Y0VCC7JcjKgDFG4rvSRes5x9/wE=;
        b=NCk+r0Y4zoBU6ywtEqoW+/+WJBBg1rXmewOi0LEv6MP6U8+nalS0XyEqUleJvtrjN8WVZV
        OwjEj4inL8x0zlfJTn0LbpbT0+SkBbppP3mxMPbL9/+F34QI2itmWniSrbJyzOYk3IJfNA
        yN4FW/E8Dv6SX/sLMT9+ZDutI8Z/5uE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699287996;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yzy6WdAu4zUhGh00Y0VCC7JcjKgDFG4rvSRes5x9/wE=;
        b=DPkgDCIO8Kxi7hEJ3ed4g4OBpNmgdEGMOd89nz+SXMI+rwzd5r6hHSno/mMeWYBNVRz3Zo
        fP8eIP3Iz0B41zBw==
Received: from localhost.cz (lhruska.udp.ovpn2.prg.suse.de [10.100.204.118])
        by relay2.suse.de (Postfix) with ESMTP id D95612C1D6;
        Mon,  6 Nov 2023 16:26:35 +0000 (UTC)
From:   Lukas Hruska <lhruska@suse.cz>
To:     Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>,
        Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Marcos Paulo de Souza <mpdesouza@suse.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Lukas Hruska <lhruska@suse.cz>
Subject: [PATCH v1 4/5] livepatch: Add sample livepatch module
Date:   Mon,  6 Nov 2023 17:25:12 +0100
Message-ID: <20231106162513.17556-5-lhruska@suse.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106162513.17556-1-lhruska@suse.cz>
References: <20231106162513.17556-1-lhruska@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Josh Poimboeuf <jpoimboe@redhat.com>

Add a new livepatch sample in samples/livepatch/ to make use of symbols
that must be post-processed to enable load-time relocation resolution.
As the new sample is to be used as an example, it is annotated with
KLP_RELOC_SYMBOL macro.

The livepatch sample updates the function cmdline_proc_show to print the
string referenced by the symbol saved_command_line appended by the
string "livepatch=1".

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Lukas Hruska <lhruska@suse.cz>
---
 samples/livepatch/Makefile                    |  1 +
 .../livepatch/livepatch-annotated-sample.c    | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 samples/livepatch/livepatch-annotated-sample.c

diff --git a/samples/livepatch/Makefile b/samples/livepatch/Makefile
index 9f853eeb6140..f2b41f4d6c16 100644
--- a/samples/livepatch/Makefile
+++ b/samples/livepatch/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-fix2.o
 obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-callbacks-demo.o
 obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-callbacks-mod.o
 obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-callbacks-busymod.o
+obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-annotated-sample.o
diff --git a/samples/livepatch/livepatch-annotated-sample.c b/samples/livepatch/livepatch-annotated-sample.c
new file mode 100644
index 000000000000..36056670f0fa
--- /dev/null
+++ b/samples/livepatch/livepatch-annotated-sample.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2014 Seth Jennings <sjenning@redhat.com>
+ */
+
+/*
+ * livepatch-annotated-sample.c - Kernel Live Patching Sample Module
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/livepatch.h>
+
+/*
+ * This (dumb) live patch overrides the function that prints the
+ * kernel boot cmdline when /proc/cmdline is read.
+ *
+ * This livepatch uses the symbol saved_command_line whose relocation
+ * must be resolved during load time. To enable that, this module
+ * must be post-processed by a tool called klp-convert, which embeds
+ * information to be used by the loader to solve the relocation.
+ *
+ * The module is annotated with KLP_RELOC_SYMBOL macros.
+ * These annotations are used by klp-convert to infer that the symbol
+ * saved_command_line is in the object vmlinux.
+ *
+ * Example:
+ *
+ * $ cat /proc/cmdline
+ * <your cmdline>
+ *
+ * $ insmod livepatch-sample.ko
+ * $ cat /proc/cmdline
+ * <your cmdline> livepatch=1
+ *
+ * $ echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled
+ * $ cat /proc/cmdline
+ * <your cmdline>
+ */
+
+extern char *saved_command_line \
+	       KLP_RELOC_SYMBOL(vmlinux, vmlinux, saved_command_line);
+
+#include <linux/seq_file.h>
+static int livepatch_cmdline_proc_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%s livepatch=1\n", saved_command_line);
+	return 0;
+}
+
+static struct klp_func funcs[] = {
+	{
+		.old_name = "cmdline_proc_show",
+		.new_func = livepatch_cmdline_proc_show,
+	}, { }
+};
+
+static struct klp_object objs[] = {
+	{
+		/* name being NULL means vmlinux */
+		.funcs = funcs,
+	}, { }
+};
+
+static struct klp_patch patch = {
+	.mod = THIS_MODULE,
+	.objs = objs,
+};
+
+static int livepatch_init(void)
+{
+	return klp_enable_patch(&patch);
+}
+
+static void livepatch_exit(void)
+{
+}
+
+module_init(livepatch_init);
+module_exit(livepatch_exit);
+MODULE_LICENSE("GPL");
+MODULE_INFO(livepatch, "Y");
-- 
2.42.0

