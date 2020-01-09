Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1D3135DB9
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2020 17:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733261AbgAIQIZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jan 2020 11:08:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42711 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1733250AbgAIQIY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578586103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XdbyLSo/LKwv0IS4UY8BmEznN2tnAhqPqp9PsERe1ZM=;
        b=ODQVEDcgbOoiLXSv4Wy9tqRH7MSY4o2tXwWHHNQg0mSVcqfaWT4SLIAcj144wJI2BLxTwP
        dRgvLdq0Ksj1ZzAikgCaoO8mBERib7ETKq9bb8gVzYcCIbzM7GyYIwJqcfBltq1JN2LUXb
        4Y9GfVfa6q/vJmI0n2zJW6s9YmdW1p8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-zwDNbS_pOmSjoBmAWAu0Wg-1; Thu, 09 Jan 2020 11:08:21 -0500
X-MC-Unique: zwDNbS_pOmSjoBmAWAu0Wg-1
Received: by mail-wr1-f69.google.com with SMTP id t3so3023800wrm.23
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XdbyLSo/LKwv0IS4UY8BmEznN2tnAhqPqp9PsERe1ZM=;
        b=mqozC82XPRMWt8EIwPuhk3UVKG2+tsJ7GTQIZStHzsFsEL3qfJ5mWy77LnZI8Ap5Va
         2NNEFXx59be6g/McYk+1c30p1OGTXk6n+ixqRQmeOcNnFJlrjhmc392glXpw2aFQ5v1X
         1vm8CeZDCsisUk6i+UtAye71T9TtS4y+66XMsDSJQ6eY/sCN+7bh72H3vC+hPQcUS4v6
         7xrxsMEDUh67PKabxRG/4TKVKB19FY4zbax+I+y5cpJAPHWeNOck76qwCZ1FV7PDjF/P
         y0TMD0JWz0JeiRaMSQqdqUIdVBz7j+NbB3KdyvKykjUxNi2xVgvSjEJ5DGLeE4ax2zNZ
         CBSQ==
X-Gm-Message-State: APjAAAVFEaegQG8WQ1rIF1iGmzMK+Hsij2onSj8agTMIwOgucjmFJrlU
        sk6YkwYIPlX1X3dt88EGBA6YqSbNWrXEicAO8QhFr47h1F+zwrHdL53443aMNpD13mRzpIiO+dh
        ppCFdtMqoh0cxnJ2MccTU56Dm
X-Received: by 2002:a7b:c935:: with SMTP id h21mr5629108wml.173.1578586100892;
        Thu, 09 Jan 2020 08:08:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqybaGwF2SifAH/vF/5c/Zg4lZFldMQtCNPmw+l0nkZ5ezrMFKLX54upiO65e6Aqyi7sdLTdig==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr5629084wml.173.1578586100669;
        Thu, 09 Jan 2020 08:08:20 -0800 (PST)
Received: from redfedo.redhat.com (host81-140-166-164.range81-140.btcentralplus.com. [81.140.166.164])
        by smtp.gmail.com with ESMTPSA id m10sm8562605wrx.19.2020.01.09.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 08:08:20 -0800 (PST)
From:   Julien Thierry <jthierry@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     jpoimboe@redhat.com, peterz@infradead.org, raphael.gault@arm.com,
        catalin.marinas@arm.com, will@kernel.org,
        Julien Thierry <jthierry@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>, linux-kbuild@vger.kernel.org,
        kernel-hardening@lists.openwall.com
Subject: [RFC v5 43/57] gcc-plugins: objtool: Add plugin to detect switch table on arm64
Date:   Thu,  9 Jan 2020 16:02:46 +0000
Message-Id: <20200109160300.26150-44-jthierry@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200109160300.26150-1-jthierry@redhat.com>
References: <20200109160300.26150-1-jthierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Raphael Gault <raphael.gault@arm.com>

This plugins comes into play before the final 2 RTL passes of GCC and
detects switch-tables that are to be outputed in the ELF and writes
information in an ".discard.switch_table_info" section which will be
used by objtool.

Signed-off-by: Raphael Gault <raphael.gault@arm.com>
[J.T.: Change section name to store switch table information,
       Make plugin Kconfig be selected rather than opt-in by user,
       Add a relocation in the switch_table_info that points to
       the jump operation itself]
Signed-off-by: Julien Thierry <jthierry@redhat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: Emese Revfy <re.emese@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Cc: kernel-hardening@lists.openwall.com
---
 arch/arm64/Kconfig                            |  1 +
 scripts/Makefile.gcc-plugins                  |  2 +
 scripts/gcc-plugins/Kconfig                   |  4 +
 .../arm64_switch_table_detection_plugin.c     | 94 +++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 scripts/gcc-plugins/arm64_switch_table_detection_plugin.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b1b4476ddb83..a7b2116d5d13 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -90,6 +90,7 @@ config ARM64
 	select DMA_DIRECT_REMAP
 	select EDAC_SUPPORT
 	select FRAME_POINTER
+	select GCC_PLUGIN_SWITCH_TABLES if STACK_VALIDATION
 	select GENERIC_ALLOCATOR
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_CLOCKEVENTS
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 5f7df50cfe7a..a56736df9dc2 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -44,6 +44,8 @@ ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
 endif
 export DISABLE_ARM_SSP_PER_TASK_PLUGIN

+gcc-plugin-$(CONFIG_GCC_PLUGIN_SWITCH_TABLES)	+= arm64_switch_table_detection_plugin.so
+
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
 GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index e3569543bdac..f50047939660 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -112,4 +112,8 @@ config GCC_PLUGIN_ARM_SSP_PER_TASK
 	bool
 	depends on GCC_PLUGINS && ARM

+config GCC_PLUGIN_SWITCH_TABLES
+	bool
+	depends on GCC_PLUGINS && ARM64
+
 endif
diff --git a/scripts/gcc-plugins/arm64_switch_table_detection_plugin.c b/scripts/gcc-plugins/arm64_switch_table_detection_plugin.c
new file mode 100644
index 000000000000..9b8b2ec6a3c8
--- /dev/null
+++ b/scripts/gcc-plugins/arm64_switch_table_detection_plugin.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdio.h>
+#include "gcc-common.h"
+
+__visible int plugin_is_GPL_compatible;
+
+#define GEN_QUAD(rtx)	assemble_integer_with_op(".quad ", rtx)
+
+/*
+ * Create an array of metadata for each jump table found in the rtl.
+ * The metadata contains:
+ * - A pointer to the table of offsets used for the actual branch
+ * - A pointer to first instruction of the group getting expanded into an
+ *   acutal jump
+ * - The number of entries in the table of offsets
+ * - Whether the offsets in the table are signed or not
+ */
+static unsigned int arm64_switchtbl_rtl_execute(void)
+{
+	rtx_insn *insn;
+	rtx_insn *labelp = NULL;
+	rtx_jump_table_data *tablep = NULL;
+	section *swt_sec;
+	section *curr_sec = current_function_section();
+
+	swt_sec = get_section(".discard.switch_table_info",
+			      SECTION_EXCLUDE | SECTION_COMMON, NULL);
+
+	for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
+		/*
+		 * Find a tablejump_p INSN (using a dispatch table)
+		 */
+		if (!tablejump_p(insn, &labelp, &tablep))
+			continue;
+
+		if (labelp && tablep) {
+			rtx_code_label *label_to_jump;
+
+			/*
+			 * GCC is a bit touchy about adding the label right
+			 * before the jump rtx_insn as it modifies the
+			 * basic_block created for the jump table.
+			 * Make sure we create the label before the whole
+			 * basic_block of the jump table.
+			 */
+			label_to_jump = gen_label_rtx();
+			SET_LABEL_KIND(label_to_jump, LABEL_NORMAL);
+			emit_label_before(label_to_jump, insn);
+			/* Force label to be kept, apparently LABEL_PRESERVE_P is an rvalue :) */
+			LABEL_PRESERVE_P(label_to_jump) = 1;
+
+			switch_to_section(swt_sec);
+			GEN_QUAD(gen_rtx_LABEL_REF(Pmode, labelp));
+			GEN_QUAD(gen_rtx_LABEL_REF(Pmode, label_to_jump));
+			GEN_QUAD(GEN_INT(GET_NUM_ELEM(tablep->get_labels())));
+			GEN_QUAD(GEN_INT(ADDR_DIFF_VEC_FLAGS(tablep).offset_unsigned));
+			switch_to_section(curr_sec);
+
+			/*
+			 * Scheduler isn't very happy about leaving labels in
+			 * the middle of jump table basic blocks.
+			 */
+			delete_insn(label_to_jump);
+		}
+	}
+	return 0;
+}
+
+#define PASS_NAME arm64_switchtbl_rtl
+
+#define NO_GATE
+#include "gcc-generate-rtl-pass.h"
+
+__visible int plugin_init(struct plugin_name_args *plugin_info,
+			  struct plugin_gcc_version *version)
+{
+	const char * const plugin_name = plugin_info->base_name;
+	int tso = 0;
+	int i;
+
+	if (!plugin_default_version_check(version, &gcc_version)) {
+		error(G_("incompatible gcc/plugin versions"));
+		return 1;
+	}
+
+	PASS_INFO(arm64_switchtbl_rtl, "expand", 1,
+		  PASS_POS_INSERT_AFTER);
+
+	register_callback(plugin_info->base_name, PLUGIN_PASS_MANAGER_SETUP,
+			  NULL, &arm64_switchtbl_rtl_pass_info);
+
+	return 0;
+}
--
2.21.0

