Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51C1F3183
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2019 15:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389263AbfKGOdB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 09:33:01 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:60222 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389190AbfKGOdB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 09:33:01 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07487;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0ThQoCKT_1573137161;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThQoCKT_1573137161)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 07 Nov 2019 22:32:58 +0800
From:   shile.zhang@linux.alibaba.com
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH 4/4] x86/Kconfig: Add a Kconfig option to sort ORC tables at build time
Date:   Thu,  7 Nov 2019 22:32:05 +0800
Message-Id: <20191107143205.206606-5-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Shile Zhang <shile.zhang@linux.alibaba.com>

Add a new Kconfig BUILDTIME_ORCTABLE_SORT to control the ORC unwind
tables at build time. Select for ORC unwinder on x86_64 by default.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/Kconfig.debug | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index bf9cd83de777..320ff2af4837 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -335,6 +335,15 @@ config UNWINDER_GUESS
 
 endchoice
 
+config BUILDTIME_ORCTABLE_SORT
+	bool "Sort ORC unwind tables at build time"
+	depends on X86_64
+	depends on UNWINDER_ORC
+	default y
+	help
+	This option enables the build-time sorting for ORC unwind tables. It
+	can help to speed up kernel boot by skip the runtime sorting.
+
 config FRAME_POINTER
 	depends on !UNWINDER_ORC && !UNWINDER_GUESS
 	bool
-- 
2.24.0.rc2

