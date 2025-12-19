Return-Path: <linux-kbuild+bounces-10232-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4245ECD0DAC
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 17:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E5393135F08
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 16:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EBD34E244;
	Fri, 19 Dec 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UeVmInqN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731F34DB46
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159238; cv=none; b=KxlC4GY3EqL5UJ+hAtHabDsYlL4a4ZJcpig6BsXJK1tlt99MsuEZxa8v/xX6Q0VYAhyh4mDexIf4R/ZWHhBuCMff34sZOBkb7cmtbfx+RJ0benE4Sooy0qn1L8FQSJsgAxW7dtXeHhYcojwVaCVohV5isyomzojeVqt8M+6LOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159238; c=relaxed/simple;
	bh=3+1d1G/TatPrxyV3VzGXDrwt3WtPBe3HR66XpxkDFKg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O4rzhvOPm9GpypEzH0R+VJtK5RslnAx8uUwTIe7emoQkD7Oalnm5d5MpmhgQ//Fz7TcRLdVXHVXWXYPSCGgKqC+Mv5NiIF1ITx1YfqJI6DxzijN7R8r2Q1cfksgj1l4FgelGpInT/g4a96Xh8fK4zahYlsTCMSIgMoxYPrT4tyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UeVmInqN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d17fff653so4525945e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159230; x=1766764030; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3sgEnhMWMLOYj1/OofGWKavVFtW6YP1ndiLQ0rOu/8=;
        b=UeVmInqN+zRzaV1DoaJ5xk38ZeTcI15hO/ufaIB7iBK97Q+sQ+VHV1hcdhF/IXZQID
         Tv3WTtE654uvE7a09mzxhVa5xAHdhdtrXuBsUXoIRdGqgOgMZM01CyOWqQLw7R54hAmM
         GbQ4OuIx+5y3q1oy/fDPtIO43s3J6svaSt+EHJ6UGgc7I3BvlG6PW0PdJFjXBMzNg/2u
         09Ooy/s7Wkz2yhboTtlRwfMMypePHzvOb0jOrQ/WyILXWdAAMh1zA5aH4V0COupCyjMa
         /X96nsSaRjT9OxcDKE53ynaqi0+BllPWcpW1/Txn0XSeSx+ucBD5iarKYzo4yOqbpAX+
         LGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159230; x=1766764030;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3sgEnhMWMLOYj1/OofGWKavVFtW6YP1ndiLQ0rOu/8=;
        b=X2TcCD0UMau6Exty3xNS7zJB5oW2N3Dvyt0s7PakIPcFCD4Ay6egvecCRtfS75CpPf
         Kb0KWbVx0ZPH9HHyBSoOgIt17RXLQzBQVshlyt3YS3sbUAkHTc/BWUn9kEbkzDD+o7t0
         PX1ael1lr+eaTGSFAVxdhooCzaLJYTY0TJB3PrmuyWw5z611vdOOaDvdl7lUHuaS5nga
         P1Ll6UctYRlD7s74xonCX2eR5Rizf8ZoAFqMUXLaZHmskjpq49qJjRD9K2tvAUiOLrSS
         nmxkC3l5Z8W5NcB9nCtELnafKlaAGfbkzdiRAigx5RL3XXW9DjxTfLKRWcG1Jflp1+Fl
         86eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDSCmP0sL3nRYqjrP+UXj2uDo/yZSSSZasRFmgH5OVh/VfftzuSQUEMKgp6qmC2aQgLVRXaZTquuHBWo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLFcXSpx9utJUufyZmcsBWSFqCy6ETx/AfiFaRshnoYTpf+6E1
	qJ5W49l6/6nHbNINRU5ShYYxJN2O4Pmi8sFse8tlTvpTVppBRLFiiWQUOdkeqUrsorRSha02fo7
	egQ==
X-Google-Smtp-Source: AGHT+IG6Z5Tj65gpnRG9ZfygNEOWxPYymEwwgB1rgfvjvus65EDRt+hfREOXwzDTtwSRis3WLEZWS8/1FQ==
X-Received: from wmcq18.prod.google.com ([2002:a05:600c:c112:b0:47b:e2a9:2bd3])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46d1:b0:47a:8088:439c
 with SMTP id 5b1f17b1804b1-47d1959d6a0mr26330495e9.35.1766159230294; Fri, 19
 Dec 2025 07:47:10 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:15 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-27-elver@google.com>
Subject: [PATCH v5 26/36] compiler: Let data_race() imply disabled context analysis
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

Many patterns that involve data-racy accesses often deliberately ignore
normal synchronization rules to avoid taking a lock.

If we have a lock-guarded variable on which we do a lock-less data-racy
access, rather than having to write context_unsafe(data_race(..)),
simply make the data_race(..) macro imply context-unsafety. The
data_race() macro already denotes the intent that something subtly
unsafe is about to happen, so it should be clear enough as-is.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v2:
* New patch.
---
 include/linux/compiler.h    | 2 ++
 lib/test_context-analysis.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 04487c9bd751..110b28dfd1d1 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -190,7 +190,9 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define data_race(expr)							\
 ({									\
 	__kcsan_disable_current();					\
+	disable_context_analysis();					\
 	auto __v = (expr);						\
+	enable_context_analysis();					\
 	__kcsan_enable_current();					\
 	__v;								\
 })
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 2dc404456497..1c5a381461fc 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -92,6 +92,8 @@ static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data
 {
 	unsigned long flags;
 
+	data_race(d->counter++); /* no warning */
+
 	if (raw_spin_trylock_irq(&d->lock)) {
 		d->counter++;
 		raw_spin_unlock_irq(&d->lock);
-- 
2.52.0.322.g1dd061c0dc-goog


