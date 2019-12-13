Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9F011E170
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfLMKDx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:03:53 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47770 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfLMKDx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:03:53 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1ifhnN-0008KJ-MA; Fri, 13 Dec 2019 11:03:37 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 340CA1C0051;
        Fri, 13 Dec 2019 11:03:37 +0100 (CET)
Date:   Fri, 13 Dec 2019 10:03:37 -0000
From:   "tip-bot2 for Shile Zhang" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: core/objtool] x86/unwind/orc: Remove boot-time ORC unwind
 tables sorting
Cc:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191204004633.88660-8-shile.zhang@linux.alibaba.com>
References: <20191204004633.88660-8-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Message-ID: <157623141704.30329.9522840249744393883.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The following commit has been merged into the core/objtool branch of tip:

Commit-ID:     f14bf6a350dfd6613dbf91be5b423bc7eab690da
Gitweb:        https://git.kernel.org/tip/f14bf6a350dfd6613dbf91be5b423bc7eab690da
Author:        Shile Zhang <shile.zhang@linux.alibaba.com>
AuthorDate:    Wed, 04 Dec 2019 08:46:33 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 13 Dec 2019 10:47:58 +01:00

x86/unwind/orc: Remove boot-time ORC unwind tables sorting

Now that the orc_unwind and orc_unwind_ip tables are sorted at build time,
remove the boot time sorting pass.

No change in functionality.

[ mingo: Rewrote the changelog and code comments. ]

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org
Link: https://lkml.kernel.org/r/20191204004633.88660-8-shile.zhang@linux.alibaba.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/unwind_orc.c | 8 +++++---
 scripts/link-vmlinux.sh      | 5 ++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index 332ae65..abdf891 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -273,9 +273,11 @@ void __init unwind_init(void)
 		return;
 	}
 
-	/* Sort the .orc_unwind and .orc_unwind_ip tables: */
-	sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
-	     orc_sort_swap);
+	/*
+	 * Note, the orc_unwind and orc_unwind_ip tables were already
+	 * sorted at build time via the 'sorttable' tool.
+	 * It's ready for binary search straight away, no need to sort it.
+	 */
 
 	/* Initialize the fast lookup table: */
 	lookup_num_blocks = orc_lookup_end - orc_lookup;
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a81aa76..c287ad9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -306,7 +306,10 @@ vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
 
 if [ -n "${CONFIG_BUILDTIME_TABLE_SORT}" ]; then
 	info SORTTAB vmlinux
-	sorttable vmlinux
+	if ! sorttable vmlinux; then
+		echo >&2 Failed to sort kernel tables
+		exit 1
+	fi
 fi
 
 info SYSMAP System.map
