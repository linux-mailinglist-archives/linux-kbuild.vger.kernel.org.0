Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5101D22A641
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 05:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgGWDrE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 23:47:04 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:32589 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725843AbgGWDrE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 23:47:04 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U3YAYRP_1595476011;
Received: from localhost(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0U3YAYRP_1595476011)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 23 Jul 2020 11:46:51 +0800
From:   Huaixin Chang <changhuaixin@linux.alibaba.com>
To:     jpoimboe@redhat.com
Cc:     bp@alien8.de, changhuaixin@linux.alibaba.com, hpa@zytor.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: [PATCH 3/3] x86/unwind/orc: Simplify unwind_init() for x86 boot
Date:   Thu, 23 Jul 2020 11:46:43 +0800
Message-Id: <20200723034643.33537-4-changhuaixin@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
In-Reply-To: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The orc fast lookup table is built by scripts/sorttable tool. All that
is left is setting lookup_num_blocks.

Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/kernel/unwind_orc.c | 41 ++---------------------------------------
 1 file changed, 2 insertions(+), 39 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 7f969b2d240f..0ca4d02d1a69 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -264,48 +264,11 @@ void unwind_module_init(struct module *mod, void *_orc_ip, size_t orc_ip_size,
 
 void __init unwind_init(void)
 {
-	size_t orc_ip_size = (void *)__stop_orc_unwind_ip - (void *)__start_orc_unwind_ip;
-	size_t orc_size = (void *)__stop_orc_unwind - (void *)__start_orc_unwind;
-	size_t num_entries = orc_ip_size / sizeof(int);
-	struct orc_entry *orc;
-	int i;
-
-	if (!num_entries || orc_ip_size % sizeof(int) != 0 ||
-	    orc_size % sizeof(struct orc_entry) != 0 ||
-	    num_entries != orc_size / sizeof(struct orc_entry)) {
-		orc_warn("WARNING: Bad or missing .orc_unwind table.  Disabling unwinder.\n");
-		return;
-	}
-
 	/*
-	 * Note, the orc_unwind and orc_unwind_ip tables were already
-	 * sorted at build time via the 'sorttable' tool.
-	 * It's ready for binary search straight away, no need to sort it.
+	 * All orc tables are sorted and built via sorttable tool. Initialize
+	 * lookup_num_blocks only.
 	 */
-
-	/* Initialize the fast lookup table: */
 	lookup_num_blocks = orc_lookup_end - orc_lookup;
-	for (i = 0; i < lookup_num_blocks-1; i++) {
-		orc = __orc_find(__start_orc_unwind_ip, __start_orc_unwind,
-				 num_entries,
-				 LOOKUP_START_IP + (LOOKUP_BLOCK_SIZE * i));
-		if (!orc) {
-			orc_warn("WARNING: Corrupt .orc_unwind table.  Disabling unwinder.\n");
-			return;
-		}
-
-		orc_lookup[i] = orc - __start_orc_unwind;
-	}
-
-	/* Initialize the ending block: */
-	orc = __orc_find(__start_orc_unwind_ip, __start_orc_unwind, num_entries,
-			 LOOKUP_STOP_IP);
-	if (!orc) {
-		orc_warn("WARNING: Corrupt .orc_unwind table.  Disabling unwinder.\n");
-		return;
-	}
-	orc_lookup[lookup_num_blocks-1] = orc - __start_orc_unwind;
-
 	orc_init = true;
 }
 
-- 
2.14.4.44.g2045bb6

