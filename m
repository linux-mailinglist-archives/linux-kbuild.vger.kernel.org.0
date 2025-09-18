Return-Path: <linux-kbuild+bounces-8886-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB45B85249
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEC011888F60
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3E731AF20;
	Thu, 18 Sep 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VPIx3x4u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6E31A7F8
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204409; cv=none; b=Jk4B+JV96GDmJ8Ikl9nwezffONDYYRcVMwdJV7/IfYXiRp+X/e3m1DMLcXw4tgTxmUvMIDsLSah0//zJt8dopR+zQxruba1X27pGapWUOKLaPHdXAWshyG99E9xANRXGKEGmQ6LFgl0pQJ5DyYC17UdEwL8SHzZ9JVEjBE5QXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204409; c=relaxed/simple;
	bh=09yegzNXrPdaE2QBv4eeaEHV4r7ZH7ZlFO279+PRTFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZhcAYc1E+Zw9JD1Zt/VOuGf53NQtU3B1t5XGIqScITGreTGGlKWt5u6DK2CnEO2Ep+aegO+WrOuiVM4af0Y3kD5dp5aLq4C8tUhcnw/SsPwwOB9EY3uUwIV4c1E5mN35nLprGpGrtg0piGsPsHu6YDjEu8udiEY0tQePdx79dVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VPIx3x4u; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45f2f1a650dso7144575e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204405; x=1758809205; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bAfkPofnq3bpowTJFISAR394BQXpDstNh3Kk+W2FONk=;
        b=VPIx3x4u+PsvqORuwmu6lbo5QJYZrRSfi28JUIpq5ZVvHI6v0/Du8CmjsTvLsQyB/w
         ufhGehMrze7jUTMQ+8+iG8LM7/swCr6Z7cJyfiT74bXL15B/BZctYZxK+6tmzEgbGWr6
         TgR51+lExyas1JgIFn8Q8e10gSN+Ch/d6HDEVyqIQO9//1yUno69Eh7AAqNaXKsC5l49
         JZc397mIAlt0+zkSdDHzwEEmOpTIvp/NVryr3ahvBZ6UeTNg6aNWiNIHXKB4Wrao++hO
         oSba8rAumWakTLNaKaJ4PtbpIXbmxzzywhFae8ri32v0yXAsMu8MfpTNCPWsO59tX/1P
         VVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204405; x=1758809205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAfkPofnq3bpowTJFISAR394BQXpDstNh3Kk+W2FONk=;
        b=A12gbv8dIVYa+i6qMTHuEYMpSCx12MI1VUcgWG2+tvhCrDV91HRLZQ0FbZfJYpBtgh
         N1ufy8dWs41vwguIOqVgOqLk/4RdFkkSJXIMn9XkzO22blcK9FgewkFAwhNB/5Xh9WvQ
         RB6eu/vGzPAGOQ34NdupSIaPipv05516epS0oH0zMZzFptCv24GiOdyD/ks9WuuF/Eon
         m7t7V0xLzXI9M23wmwCjGClfIyH+HCij4rGGAnY+KYoBGYo3dKfXVUBh414tEOInxhN3
         AmHVootDIFB/TbxXIWb4+Uh4ouvKTDQGtpIG+B1NL+CgRBkS22xoSqoHjL2+oESLDHvA
         abjg==
X-Forwarded-Encrypted: i=1; AJvYcCUscI6EPgir9P4dhIum460N4L5bkDIrTtubUzAFxdnGUv7Z/hSmWhFIUx1VVlCXrJqVZmwJIlRUlSZ5le0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYCVwwGneN0YQidTpOqBCUGF1QTx5ofFmZHi5fzO5cv3i9UjDa
	acL/aE13/pyyDYgK/xqhb7yOJfn1uosUaFEwrVXlkc/Zoa9aaNLtYI6FOEaBdSaT2t6Pgx6JnBK
	9rA==
X-Google-Smtp-Source: AGHT+IHCd+6pMztfopQyMqTVF5ILMdjFqjMumE3Akb/gsh5QUO16zCcVDRf5E/33xR5ffjMWNycUEXU4ag==
X-Received: from wmbfp9.prod.google.com ([2002:a05:600c:6989:b0:45f:27a7:738d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ed1:b0:45d:dae8:b137
 with SMTP id 5b1f17b1804b1-46205cc86damr55535755e9.22.1758204405297; Thu, 18
 Sep 2025 07:06:45 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:40 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-30-elver@google.com>
Subject: [PATCH v3 29/35] kcsan: Enable capability analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Enable capability analysis for the KCSAN subsystem.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* New patch.
---
 kernel/kcsan/Makefile |  2 ++
 kernel/kcsan/report.c | 11 ++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
index a45f3dfc8d14..b088aa01409f 100644
--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+CAPABILITY_ANALYSIS := y
+
 KCSAN_SANITIZE := n
 KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index e95ce7d7a76e..11a48b78f8d1 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -116,6 +116,7 @@ static DEFINE_RAW_SPINLOCK(report_lock);
  * been reported since (now - KCSAN_REPORT_ONCE_IN_MS).
  */
 static bool rate_limit_report(unsigned long frame1, unsigned long frame2)
+	__must_hold(&report_lock)
 {
 	struct report_time *use_entry = &report_times[0];
 	unsigned long invalid_before;
@@ -366,6 +367,7 @@ static int sym_strcmp(void *addr1, void *addr2)
 
 static void
 print_stack_trace(unsigned long stack_entries[], int num_entries, unsigned long reordered_to)
+	__must_hold(&report_lock)
 {
 	stack_trace_print(stack_entries, num_entries, 0);
 	if (reordered_to)
@@ -373,6 +375,7 @@ print_stack_trace(unsigned long stack_entries[], int num_entries, unsigned long
 }
 
 static void print_verbose_info(struct task_struct *task)
+	__must_hold(&report_lock)
 {
 	if (!task)
 		return;
@@ -389,6 +392,7 @@ static void print_report(enum kcsan_value_change value_change,
 			 const struct access_info *ai,
 			 struct other_info *other_info,
 			 u64 old, u64 new, u64 mask)
+	__must_hold(&report_lock)
 {
 	unsigned long reordered_to = 0;
 	unsigned long stack_entries[NUM_STACK_ENTRIES] = { 0 };
@@ -496,6 +500,7 @@ static void print_report(enum kcsan_value_change value_change,
 }
 
 static void release_report(unsigned long *flags, struct other_info *other_info)
+	__releases(&report_lock)
 {
 	/*
 	 * Use size to denote valid/invalid, since KCSAN entirely ignores
@@ -507,13 +512,11 @@ static void release_report(unsigned long *flags, struct other_info *other_info)
 
 /*
  * Sets @other_info->task and awaits consumption of @other_info.
- *
- * Precondition: report_lock is held.
- * Postcondition: report_lock is held.
  */
 static void set_other_info_task_blocking(unsigned long *flags,
 					 const struct access_info *ai,
 					 struct other_info *other_info)
+	__must_hold(&report_lock)
 {
 	/*
 	 * We may be instrumenting a code-path where current->state is already
@@ -572,6 +575,7 @@ static void set_other_info_task_blocking(unsigned long *flags,
 static void prepare_report_producer(unsigned long *flags,
 				    const struct access_info *ai,
 				    struct other_info *other_info)
+	__must_not_hold(&report_lock)
 {
 	raw_spin_lock_irqsave(&report_lock, *flags);
 
@@ -603,6 +607,7 @@ static void prepare_report_producer(unsigned long *flags,
 static bool prepare_report_consumer(unsigned long *flags,
 				    const struct access_info *ai,
 				    struct other_info *other_info)
+	__cond_acquires(true, &report_lock)
 {
 
 	raw_spin_lock_irqsave(&report_lock, *flags);
-- 
2.51.0.384.g4c02a37b29-goog


