Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0D8F410A
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 08:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfKHHL0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Nov 2019 02:11:26 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:13527 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729896AbfKHHLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 02:11:25 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04391;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0ThU5MwV_1573197070;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThU5MwV_1573197070)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Nov 2019 15:11:22 +0800
From:   shile.zhang@linux.alibaba.com
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v2 3/3] x86/unwind/orc: remove run-time ORC unwind tables sort
Date:   Fri,  8 Nov 2019 15:11:08 +0800
Message-Id: <20191108071108.72132-4-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
References: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Shile Zhang <shile.zhang@linux.alibaba.com>

The orc_unwind and orc_unwind_ip tables are sorted in vmlinux link phase
at build time, just remove the run-time sort.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/kernel/unwind_orc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 332ae6530fa8..eccb9ac1e2fe 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -273,9 +273,10 @@ void __init unwind_init(void)
 		return;
 	}
 
-	/* Sort the .orc_unwind and .orc_unwind_ip tables: */
-	sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
-	     orc_sort_swap);
+	/*
+	 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
+	 * vmlinux link phase at build time. Its ready for binary search.
+	 */
 
 	/* Initialize the fast lookup table: */
 	lookup_num_blocks = orc_lookup_end - orc_lookup;
-- 
2.24.0.rc2

