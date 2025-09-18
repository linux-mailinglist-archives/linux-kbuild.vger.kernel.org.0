Return-Path: <linux-kbuild+bounces-8863-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058EB85042
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F326F163D62
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1932430DD14;
	Thu, 18 Sep 2025 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NXs3TXzm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA530CD89
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204347; cv=none; b=HnpX+yWd4WlFiFP6Iv0ZZuVv5LhM4HZ9iZ3/hfY3apxoUXE4r2RqQKDra/wRafamcuiHNSV6gtEFSiyVrCrdudrYRrZUE0QYl5BHuwl21G5SNy4yIMwEJZ+/fbV/Wtp894cx11BULk5LIfHTlscYYqB4L2mf0N36EVEc9odqa84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204347; c=relaxed/simple;
	bh=SpXjZaCjy1x0daUBiuysZq16feeBwiZs5t3P+YC87y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eJggpBkVdGHlXqmnHsY96q4i3gOb5pxh6JVPZykRQC0BuVMUcG6yBmjAjJHTXYdHgt6d+kpkdXYRFiQRRmxpLuObdA90qFNkZTVx6bGuoyhrf+w5G8kClB7pvVr0dcC5WUDB5d2E3T9euPU2geGbg/j9WFpY00Eu6qMSF59yAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NXs3TXzm; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b0438a5f20fso87657266b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204343; x=1758809143; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UhQ+U9se/SSPfFCtaRf+8xWbg1y5S3svPblZWk1KYzo=;
        b=NXs3TXzmRMQUjMR67usmkSzDdwaYAB5oXUkfWWUDU+fx6y6/GKFHR1gqpEGtA/oZXp
         JZW+MRTcSDxM5hUQ9ML0to36X3S7xJjVBot/CfdRYYTipRRswCGKYkE5+tpBdWywbEUp
         cqPG3vcM66G7CS0k+5ywCIYhirq0Pr5+kdTaB+W7WLPMI6TWYCDYKZywEPrYLnQPNtzZ
         tdVcIBw820O1D4k2K0d07Gy/gz65vvppezDPpn5AB1A+0L+SWHFAaArYDagy50Nw5+SP
         +sUxTHK+l2WitnhrowuSPsKWGSAhxRIlpe5UAaddWj2SCSjJIezjQ/nuCgW4u4JM0iwX
         1CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204343; x=1758809143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhQ+U9se/SSPfFCtaRf+8xWbg1y5S3svPblZWk1KYzo=;
        b=OJuQGuEZcncf0/LWgPSz5nU1n43M420fIiiAAoNbmL/yEq7kLC1l8g+Wm2JqpgTAKS
         MAGEaQ2BgjYA6IUVtjpTVTEeaJZWPrJ9Q6DgZl/K4uMp0ujmmYJGEj0PgDAlkIaxakP6
         cR/KSs5h/XwWDwevDz2rd/AKBUv6vFnli31Vrgr+1cQGzZXXAZCiCkOMmHmSVeteccc0
         PgIEGg4BYm7edx+onMbTxfIMUVLeSwSL8CAV6F4MZ2cNxoR2oAV4UkQ0Bejwh8K60qKf
         vqqWOzMN0+wNJi+G6gau26TRpR0x7FpaqWLKEIg6+dBbWFdP79+3gLGYJGwMNBpksF8a
         njHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTengNzaZmdcQbFW9RznbrJE+SPm9pzMNhYUK7RcsoAoR/pRefQv8sZlxg5AcOMCJKtstSQXt/RfWEcXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq5WtyK25WxSZ/wZ/L0pnefPubHz+YKJu98YKRf5nI0tfCS892
	4MUTjr7jrKmgIPsmDr/BMcR8HEd1LChaNhcJ3V+hp+SW/g1i6ntEh6X5DTLduE4vlz28W97jND3
	7wA==
X-Google-Smtp-Source: AGHT+IHx20k8wpv+0CdEL8tKSP3AAmnqjSsLU77F74q4U9IVeOOTYh+6Sm2wrNtaQlemdoGnkvfY1U7RLg==
X-Received: from ejcth16.prod.google.com ([2002:a17:907:8e10:b0:b07:e1ab:ac42])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:86a0:b0:b07:dbf9:a002
 with SMTP id a640c23a62f3a-b1bba0036fcmr627925566b.47.1758204342817; Thu, 18
 Sep 2025 07:05:42 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:17 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-7-elver@google.com>
Subject: [PATCH v3 06/35] cleanup: Basic compatibility with capability analysis
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

Introduce basic compatibility with cleanup.h infrastructure: introduce
DECLARE_LOCK_GUARD_*_ATTRS() helpers to add attributes to constructors
and destructors respectively.

Note: Due to the scoped cleanup helpers used for lock guards wrapping
acquire and release around their own constructors/destructors that store
pointers to the passed locks in a separate struct, we currently cannot
accurately annotate *destructors* which lock was released. While it's
possible to annotate the constructor to say which lock was acquired,
that alone would result in false positives claiming the lock was not
released on function return.

Instead, to avoid false positives, we can claim that the constructor
"assumes" that the taken lock is held via __assumes_cap().

This will ensure we can still benefit from the analysis where scoped
guards are used to protect access to guarded variables, while avoiding
false positives. The only downside are false negatives where we might
accidentally lock the same lock again:

	raw_spin_lock(&my_lock);
	...
	guard(raw_spinlock)(&my_lock);  // no warning

Arguably, lockdep will immediately catch issues like this.

While Clang's analysis supports scoped guards in C++ [1], there's no way
to apply this to C right now. Better support for Linux's scoped guard
design could be added in future if deemed critical.

[1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#scoped-capability

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Add *_ATTRS helpers instead of implicit __assumes_cap (suggested by Peter)
* __assert -> __assume rename
---
 include/linux/cleanup.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 2573585b7f06..54fc70d8da27 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -274,16 +274,21 @@ const volatile void * __must_check_fn(const volatile void *val)
 
 #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
 typedef _type class_##_name##_t;					\
+typedef _type lock_##_name##_t;						\
 static inline void class_##_name##_destructor(_type *p)			\
+	__no_capability_analysis					\
 { _type _T = *p; _exit; }						\
 static inline _type class_##_name##_constructor(_init_args)		\
+	__no_capability_analysis					\
 { _type t = _init; return t; }
 
 #define EXTEND_CLASS(_name, ext, _init, _init_args...)			\
+typedef lock_##_name##_t lock_##_name##ext##_t;				\
 typedef class_##_name##_t class_##_name##ext##_t;			\
 static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
 { class_##_name##_destructor(p); }					\
 static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
+	__no_capability_analysis \
 { class_##_name##_t t = _init; return t; }
 
 #define CLASS(_name, var)						\
@@ -461,12 +466,14 @@ _label:									\
  */
 
 #define __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, ...)		\
+typedef _type lock_##_name##_t;						\
 typedef struct {							\
 	_type *lock;							\
 	__VA_ARGS__;							\
 } class_##_name##_t;							\
 									\
 static inline void class_##_name##_destructor(class_##_name##_t *_T)	\
+	__no_capability_analysis					\
 {									\
 	if (!__GUARD_IS_ERR(_T->lock)) { _unlock; }			\
 }									\
@@ -475,6 +482,7 @@ __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
 
 #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
 static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
+	__no_capability_analysis 					\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
 	_lock;								\
@@ -483,6 +491,7 @@ static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
 
 #define __DEFINE_LOCK_GUARD_0(_name, _lock)				\
 static inline class_##_name##_t class_##_name##_constructor(void)	\
+	__no_capability_analysis					\
 {									\
 	class_##_name##_t _t = { .lock = (void*)1 },			\
 			 *_T __maybe_unused = &_t;			\
@@ -490,6 +499,14 @@ static inline class_##_name##_t class_##_name##_constructor(void)	\
 	return _t;							\
 }
 
+#define DECLARE_LOCK_GUARD_0_ATTRS(_name, _lock, _unlock)		\
+static inline class_##_name##_t class_##_name##_constructor(void) _lock;\
+static inline void class_##_name##_destructor(class_##_name##_t *_T) _unlock;
+
+#define DECLARE_LOCK_GUARD_1_ATTRS(_name, _lock, _unlock)		\
+static inline class_##_name##_t class_##_name##_constructor(lock_##_name##_t *_T) _lock;\
+static inline void class_##_name##_destructor(class_##_name##_t *_T) _unlock;
+
 #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
 __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)		\
-- 
2.51.0.384.g4c02a37b29-goog


