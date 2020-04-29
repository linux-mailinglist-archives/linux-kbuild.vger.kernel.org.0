Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CF01BD502
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2020 08:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgD2Gqw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Apr 2020 02:46:52 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:51486 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726476AbgD2Gqu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 02:46:50 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07425;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Tx.9LiV_1588142803;
Received: from localhost(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0Tx.9LiV_1588142803)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 29 Apr 2020 14:46:46 +0800
From:   Huaixin Chang <changhuaixin@linux.alibaba.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: [PATCH 2/2] x86/unwind/orc: Remove unwind_init() from x86 boot
Date:   Wed, 29 Apr 2020 14:46:26 +0800
Message-Id: <20200429064626.16389-3-changhuaixin@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
In-Reply-To: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

All preparation has been moved to scripts/sorttable tool. No need to
init unwind on boot now.

Signed-off-by: Huaixin Chang <changhuaixin@linux.alibaba.com>
Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/include/asm/unwind.h |  2 --
 arch/x86/kernel/setup.c       |  2 --
 arch/x86/kernel/unwind_orc.c  | 51 -------------------------------------------
 3 files changed, 55 deletions(-)

diff --git a/arch/x86/include/asm/unwind.h b/arch/x86/include/asm/unwind.h
index 499578f7e6d7..db5aea8c9d98 100644
--- a/arch/x86/include/asm/unwind.h
+++ b/arch/x86/include/asm/unwind.h
@@ -89,11 +89,9 @@ static inline struct pt_regs *unwind_get_entry_regs(struct unwind_state *state,
 #endif
 
 #ifdef CONFIG_UNWINDER_ORC
-void unwind_init(void);
 void unwind_module_init(struct module *mod, void *orc_ip, size_t orc_ip_size,
 			void *orc, size_t orc_size);
 #else
-static inline void unwind_init(void) {}
 static inline
 void unwind_module_init(struct module *mod, void *orc_ip, size_t orc_ip_size,
 			void *orc, size_t orc_size) {}
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 4b3fa6cd3106..4a17026c6550 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1243,8 +1243,6 @@ void __init setup_arch(char **cmdline_p)
 	if (efi_enabled(EFI_BOOT))
 		efi_apply_memmap_quirks();
 #endif
-
-	unwind_init();
 }
 
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index e9cc182aa97e..3db43e6e75f2 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -20,7 +20,6 @@ int *cur_orc_ip_table = __start_orc_unwind_ip;
 struct orc_entry *cur_orc_table = __start_orc_unwind;
 
 unsigned int lookup_num_blocks;
-bool orc_init;
 
 static inline unsigned long orc_ip(const int *ip)
 {
@@ -142,9 +141,6 @@ static struct orc_entry *orc_find(unsigned long ip)
 {
 	static struct orc_entry *orc;
 
-	if (!orc_init)
-		return NULL;
-
 	if (ip == 0)
 		return &null_orc_entry;
 
@@ -259,53 +255,6 @@ void unwind_module_init(struct module *mod, void *_orc_ip, size_t orc_ip_size,
 }
 #endif
 
-void __init unwind_init(void)
-{
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
-	/*
-	 * Note, the orc_unwind and orc_unwind_ip tables were already
-	 * sorted at build time via the 'sorttable' tool.
-	 * It's ready for binary search straight away, no need to sort it.
-	 */
-
-	/* Initialize the fast lookup table: */
-	lookup_num_blocks = orc_lookup_end - orc_lookup;
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
-	orc_init = true;
-}
-
 unsigned long unwind_get_return_address(struct unwind_state *state)
 {
 	if (unwind_done(state))
-- 
2.14.4.44.g2045bb6

