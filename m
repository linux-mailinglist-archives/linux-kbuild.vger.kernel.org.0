Return-Path: <linux-kbuild+bounces-6421-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D91A7BD94
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5CF23BAF5A
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322391EDA0F;
	Fri,  4 Apr 2025 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKpj/gaa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA981EB9F4;
	Fri,  4 Apr 2025 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772655; cv=none; b=DG1djElpU3oNlFlpRdrYKE038rt6mNK2FXMOd43n99mwVhyl+CebgKweJYXcuSJkay5F6Jw+YlZYT4kc13io8iIR58facKp48vJpQeUYhadBaw3x/K8OUOG6K3bn3rDOHY1JaMnZWiIM0iXFcRfbYG2DE4GjLQunz8O+ZQEAzAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772655; c=relaxed/simple;
	bh=RSzN8akHhL4pnE/JPwS3fyp5Znr/igOnfk7xe5eymj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6uRUlOctAhfFyCAWIqcGMpe41s7TnDp8CtVSoMzpkSshNMFKaOsYSNlbk2PhxR+li4AK2bJ+J6DJ35E9jJ4k5X0QpR3AkdE+AyXSkhjlxQhysfZNxwDmNNWvHCCu2XmWNLKjHObldFfNvNXPtuNJuG3hA9ges/b722Tzk69BNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKpj/gaa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772654; x=1775308654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RSzN8akHhL4pnE/JPwS3fyp5Znr/igOnfk7xe5eymj4=;
  b=ZKpj/gaaMZiZpQE/oKr5bH5OUpuvCAWdQZKjHYpWIVHo1pnh2FM9/1bC
   O9VB2QjuGCGCiROrJCoXOnLH3VZJgk1wd5sPUGzCnjhgxzfMkVxmqYvGE
   aGzZUGMZdnEP5gMSnsoML/Ui+PEQgNaq0T93mTBJNWUVRI2VbUsUavtWK
   jgiAZnUdbT+jwt6Xf4qT01ygzedxgwY8Pm6x901hHpAWw76H0Flx1RC/J
   xC+DsL/RYk8g2kZo/4ZLAW5Z8y2GH7NROwIQps20hXe49oq0nIPSMvHXT
   VthJ6wI6kd7yB344Cm77YuZ/Ci44Hi6U+K8tFixKYImNvRJxxJn6s+xkz
   g==;
X-CSE-ConnectionGUID: NK34ydVEQiyw6fb52+rpjg==
X-CSE-MsgGUID: CSlSlerXRjOY+Ut8BfQuag==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55401988"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55401988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:33 -0700
X-CSE-ConnectionGUID: FCqpUyFdSE+x8MZMxgr8BA==
X-CSE-MsgGUID: 2YHQdmbJQX2GJD9jL/iewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128157352"
Received: from opintica-mobl1 (HELO wieczorr-mobl1.intel.com) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:18 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: hpa@zytor.com,
	hch@infradead.org,
	nick.desaulniers+lkml@gmail.com,
	kuan-ying.lee@canonical.com,
	masahiroy@kernel.org,
	samuel.holland@sifive.com,
	mingo@redhat.com,
	corbet@lwn.net,
	ryabinin.a.a@gmail.com,
	guoweikang.kernel@gmail.com,
	jpoimboe@kernel.org,
	ardb@kernel.org,
	vincenzo.frascino@arm.com,
	glider@google.com,
	kirill.shutemov@linux.intel.com,
	apopple@nvidia.com,
	samitolvanen@google.com,
	maciej.wieczor-retman@intel.com,
	kaleshsingh@google.com,
	jgross@suse.com,
	andreyknvl@gmail.com,
	scott@os.amperecomputing.com,
	tony.luck@intel.com,
	dvyukov@google.com,
	pasha.tatashin@soleen.com,
	ziy@nvidia.com,
	broonie@kernel.org,
	gatlin.newhouse@gmail.com,
	jackmanb@google.com,
	wangkefeng.wang@huawei.com,
	thiago.bauermann@linaro.org,
	tglx@linutronix.de,
	kees@kernel.org,
	akpm@linux-foundation.org,
	jason.andryuk@amd.com,
	snovitoll@gmail.com,
	xin@zytor.com,
	jan.kiszka@siemens.com,
	bp@alien8.de,
	rppt@kernel.org,
	peterz@infradead.org,
	pankaj.gupta@amd.com,
	thuth@redhat.com,
	andriy.shevchenko@linux.intel.com,
	joel.granados@kernel.org,
	kbingham@kernel.org,
	nicolas@fjasle.eu,
	mark.rutland@arm.com,
	surenb@google.com,
	catalin.marinas@arm.com,
	morbo@google.com,
	justinstitt@google.com,
	ubizjak@gmail.com,
	jhubbard@nvidia.com,
	urezki@gmail.com,
	dave.hansen@linux.intel.com,
	bhe@redhat.com,
	luto@kernel.org,
	baohua@kernel.org,
	nathan@kernel.org,
	will@kernel.org,
	brgerst@gmail.com
Cc: llvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	x86@kernel.org
Subject: [PATCH v3 11/14] x86: Handle int3 for inline KASAN reports
Date: Fri,  4 Apr 2025 15:14:15 +0200
Message-ID: <012c84049b853d6853a7d6c887ce0c2323bcd80a.1743772053.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a tag mismatch happens in inline software tag-based KASAN on x86 an
int3 instruction is executed and needs proper handling.

Call kasan_report() from the int3 handler and pass down the proper
information from registers - RDI should contain the problematic address
and RAX other metadata.

Also early return from the int3 selftest if inline KASAN is enabled
since it will cause a kernel panic otherwise.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Add this patch to the series.

 arch/x86/kernel/alternative.c |  3 ++
 arch/x86/kernel/traps.c       | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index bf82c6f7d690..ba277a25b57f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1979,6 +1979,9 @@ static noinline void __init int3_selftest(void)
 	};
 	unsigned int val = 0;
 
+	if (IS_ENABLED(CONFIG_KASAN_INLINE))
+		return;
+
 	BUG_ON(register_die_notifier(&int3_exception_nb));
 
 	/*
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..32c81fc2d439 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/kallsyms.h>
 #include <linux/kmsan.h>
+#include <linux/kasan.h>
 #include <linux/spinlock.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
@@ -849,6 +850,51 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
 	cond_local_irq_disable(regs);
 }
 
+#ifdef CONFIG_KASAN_SW_TAGS
+
+#define KASAN_RAX_RECOVER	0x20
+#define KASAN_RAX_WRITE	0x10
+#define KASAN_RAX_SIZE_MASK	0x0f
+#define KASAN_RAX_SIZE(rax)	(1 << ((rax) & KASAN_RAX_SIZE_MASK))
+
+static bool kasan_handler(struct pt_regs *regs)
+{
+	int metadata = regs->ax;
+	u64 addr = regs->di;
+	u64 pc = regs->ip;
+	bool recover = metadata & KASAN_RAX_RECOVER;
+	bool write = metadata & KASAN_RAX_WRITE;
+	size_t size = KASAN_RAX_SIZE(metadata);
+
+	if (!IS_ENABLED(CONFIG_KASAN_INLINE))
+		return false;
+
+	if (user_mode(regs))
+		return false;
+
+	kasan_report((void *)addr, size, write, pc);
+
+	/*
+	 * The instrumentation allows to control whether we can proceed after
+	 * a crash was detected. This is done by passing the -recover flag to
+	 * the compiler. Disabling recovery allows to generate more compact
+	 * code.
+	 *
+	 * Unfortunately disabling recovery doesn't work for the kernel right
+	 * now. KASAN reporting is disabled in some contexts (for example when
+	 * the allocator accesses slab object metadata; this is controlled by
+	 * current->kasan_depth). All these accesses are detected by the tool,
+	 * even though the reports for them are not printed.
+	 *
+	 * This is something that might be fixed at some point in the future.
+	 */
+	if (!recover)
+		die("Oops - KASAN", regs, 0);
+	return true;
+}
+
+#endif
+
 static bool do_int3(struct pt_regs *regs)
 {
 	int res;
@@ -863,6 +909,12 @@ static bool do_int3(struct pt_regs *regs)
 	if (kprobe_int3_handler(regs))
 		return true;
 #endif
+
+#ifdef CONFIG_KASAN_SW_TAGS
+	if (kasan_handler(regs))
+		return true;
+#endif
+
 	res = notify_die(DIE_INT3, "int3", regs, 0, X86_TRAP_BP, SIGTRAP);
 
 	return res == NOTIFY_STOP;
-- 
2.49.0


