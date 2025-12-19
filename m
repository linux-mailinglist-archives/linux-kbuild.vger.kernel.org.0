Return-Path: <linux-kbuild+bounces-10209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736ECD097D
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 16:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1451D304ADD5
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA4333AD8F;
	Fri, 19 Dec 2025 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="daBVCbPF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDE33987E
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159132; cv=none; b=nY18ozyB/P/oIyGldm9rr9nYbbawwej+zzBBQoIPkk8emPhli8WAT0ojprDfIk2WmAQxT0/xbwuDS+hVFdxYJIBpp0mgXoIuGTItOZYHLVBigYLVH24bxZIhd71BnIG/HZRECjBfteIVNi3N69FHww12WPv1hnm+sQlepLzscCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159132; c=relaxed/simple;
	bh=gnuFLX8kT8gqPaa+rke7bwea6K0Ca21iuuLPz3ICNfc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RsU4zQXtP4b11S6swnIL/s7CA1kaTqBuU4bB+p8+0T5xJmxnG0m2g8mNtoKMk0gJTuDafFY3EAV+X31gKJxQFBN0aG3H65O07BewSItuJubK51C/pbp5pjP6Uq73yfNrugER7sZG9nVXzn6lYLodKPo/cSrdPREwjtp8cI8ktVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=daBVCbPF; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so1208416f8f.3
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159128; x=1766763928; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIbRhS5yAElvokIR1MvQQLNlZ/WUUA5jS9gYnuf7mNE=;
        b=daBVCbPFfUXz9zEifF1ONdfb5QyEitFsgEPo/PJBmgHAgCmc6fSd624HkORoVkBnDH
         3qg+/Da6j+vcpfIx8cLsC9vw9rzT4f+IUxajpMmCJmidWN4YZCYGNuGqLq0YyTP/xdxM
         /biPhGxX2+Apo9J+2IzDVjTMRZ7ctgKY7GzUHry5fePeOowoBr3LEVJLSRF68SCucSg8
         BC7FmXIbUbIPbATg3GfcF5aIv7dD0pH7cIWScN1X853fT0Yz/z4bQ0UG5I08F6x1W865
         k/KBiyOl/pZKouk0lh+UzZbs7PKiIcO+zIVC3XHmd7W5V7bBwNU/73VmohAFkCd8zv8F
         CtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159128; x=1766763928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIbRhS5yAElvokIR1MvQQLNlZ/WUUA5jS9gYnuf7mNE=;
        b=M+Z6bjvIcHafPLd6/j1xZDC1Hkc8gsEZuGY1/JOGXGKhOI0EslrtRACJclJbHAnzO3
         QRMiIWRCrO1XhM21SJg8s8GeYYNuekRPN0vE3ljE9H3xoXkBQBC52fSDtapV3GKV7qP5
         hHmIn32MgRJpx6gYRBx7nqpJRUlJhLAWSQj73Osa/CtP/vixcSMnYwTSP+/S2z8OwhIl
         J5k+70ZYCePaUY69RKRGpQfWBPMpz3Ma/fQpluQz5U0iORuQhe3pR2DfwW4QY/xZ+a0/
         yDcI8gRiJir2IuHngN6IlxW6kgF/nCAdUumGFq4d5neVkjxpca12Jui+ndhMqHyY7fU2
         AzJA==
X-Forwarded-Encrypted: i=1; AJvYcCUN90S7HMIbjMhDC7yAYzgdzeEin9+lamEGbi4P/e8IL7S1tvub6Z4OkuUM+aYMEVm/4fOAxVCe6Za8+UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7083UVlzthLwA89WpwI3gH1Yov1/qzvSAGi50KzGXc9izkkq
	XYOnpYTsXTz9C71+ZBz+z0ooDO886tFmwWP7An2wmHJxCniLJLiPxoZSVwcudaIH39eM2qjoU9V
	gdA==
X-Google-Smtp-Source: AGHT+IEWqNQ8B2uikI0R3t/CQ7ZJwgcNL1VKKMu3VpcFkJfSPyjiMbOXjCZK3QVkgDbXUfaVN8BdAwmGKw==
X-Received: from wrbfu3.prod.google.com ([2002:a05:6000:25e3:b0:431:37f:7ba1])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d09:0:b0:42f:a025:92b3
 with SMTP id ffacd0b85a97d-4324e4c0dd4mr3283947f8f.2.1766159127887; Fri, 19
 Dec 2025 07:45:27 -0800 (PST)
Date: Fri, 19 Dec 2025 16:39:52 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-4-elver@google.com>
Subject: [PATCH v5 03/36] compiler-context-analysis: Add test stub
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a simple test stub where we will add common supported patterns that
should not generate false positives for each new supported context lock.

Signed-off-by: Marco Elver <elver@google.com>
---
v5:
* Rename "context guard" -> "context lock".

v4:
* Rename capability -> context analysis.
---
 lib/Kconfig.debug           | 14 ++++++++++++++
 lib/Makefile                |  3 +++
 lib/test_context-analysis.c | 18 ++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 lib/test_context-analysis.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cd557e7653a4..8ca42526ee43 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2835,6 +2835,20 @@ config LINEAR_RANGES_TEST
 
 	  If unsure, say N.
 
+config CONTEXT_ANALYSIS_TEST
+	bool "Compiler context-analysis warnings test"
+	depends on EXPERT
+	help
+	  This builds the test for compiler-based context analysis. The test
+	  does not add executable code to the kernel, but is meant to test that
+	  common patterns supported by the analysis do not result in false
+	  positive warnings.
+
+	  When adding support for new context locks, it is strongly recommended
+	  to add supported patterns to this test.
+
+	  If unsure, say N.
+
 config CMDLINE_KUNIT_TEST
 	tristate "KUnit test for cmdline API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/Makefile b/lib/Makefile
index aaf677cf4527..89defefbf6c0 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -331,4 +331,7 @@ obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
 obj-$(CONFIG_FIRMWARE_TABLE) += fw_table.o
 
+CONTEXT_ANALYSIS_test_context-analysis.o := y
+obj-$(CONFIG_CONTEXT_ANALYSIS_TEST) += test_context-analysis.o
+
 subdir-$(CONFIG_FORTIFY_SOURCE) += test_fortify
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
new file mode 100644
index 000000000000..68f075dec0e0
--- /dev/null
+++ b/lib/test_context-analysis.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Compile-only tests for common patterns that should not generate false
+ * positive errors when compiled with Clang's context analysis.
+ */
+
+#include <linux/build_bug.h>
+
+/*
+ * Test that helper macros work as expected.
+ */
+static void __used test_common_helpers(void)
+{
+	BUILD_BUG_ON(context_unsafe(3) != 3); /* plain expression */
+	BUILD_BUG_ON(context_unsafe((void)2; 3) != 3); /* does not swallow semi-colon */
+	BUILD_BUG_ON(context_unsafe((void)2, 3) != 3); /* does not swallow commas */
+	context_unsafe(do { } while (0)); /* works with void statements */
+}
-- 
2.52.0.322.g1dd061c0dc-goog


