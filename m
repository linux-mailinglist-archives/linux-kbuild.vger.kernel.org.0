Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF5AFE316
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 17:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfKOQp7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 11:45:59 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:41440 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727615AbfKOQp6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 11:45:58 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0TiAOFJs_1573836341;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0TiAOFJs_1573836341)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 16 Nov 2019 00:45:51 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v4 7/7] x86/unwind/orc: remove run-time ORC unwind tables sort
Date:   Sat, 16 Nov 2019 00:45:39 +0800
Message-Id: <20191115164539.57930-8-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
References: <20191115164539.57930-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The orc_unwind and orc_unwind_ip tables are sorted in vmlinux link phase
at build time, just remove the run-time sort.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/kernel/unwind_orc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 332ae6530fa8..280da6fa9922 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -273,9 +273,11 @@ void __init unwind_init(void)
 		return;
 	}
 
-	/* Sort the .orc_unwind and .orc_unwind_ip tables: */
-	sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
-	     orc_sort_swap);
+	/*
+	 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
+	 * vmlinux link phase by sorttable tool at build time.
+	 * Its ready for binary search now.
+	 */
 
 	/* Initialize the fast lookup table: */
 	lookup_num_blocks = orc_lookup_end - orc_lookup;
-- 
2.24.0.rc2

