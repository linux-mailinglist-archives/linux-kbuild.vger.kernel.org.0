Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346F01120C2
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 01:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfLDArg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Dec 2019 19:47:36 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:36382 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726086AbfLDArg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 19:47:36 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07417;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Tjr6d8u_1575420394;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Tjr6d8u_1575420394)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 04 Dec 2019 08:46:43 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v6 3/7] scripts/sortextable: Remove dead code
Date:   Wed,  4 Dec 2019 08:46:29 +0800
Message-Id: <20191204004633.88660-4-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove the comment out dead code, no functional changes.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 scripts/sortextable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/sortextable.h b/scripts/sortextable.h
index b7e407e09f59..a2e3af7bf211 100644
--- a/scripts/sortextable.h
+++ b/scripts/sortextable.h
@@ -201,10 +201,6 @@ static int do_func(Elf_Ehdr *ehdr,
 		_r(&sort_needed_sym->st_value) -
 		_r(&sort_needed_sec->sh_addr);
 
-#if 0
-	printf("sort done marker at %lx\n",
-	       (unsigned long)((char *)sort_done_location - (char *)ehdr));
-#endif
 	/* We sorted it, clear the flag. */
 	w(0, sort_done_location);
 	return 0;
-- 
2.24.0.rc2

