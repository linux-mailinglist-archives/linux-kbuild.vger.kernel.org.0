Return-Path: <linux-kbuild+bounces-10213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10DCD134F
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 18:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B15E3087F68
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 17:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C4D33EAEB;
	Fri, 19 Dec 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SCPq+aX0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAC633D6DE
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159155; cv=none; b=Hn3vhBFHFc9i8D2qeLjB8fmz9vqrNw0gl7zxk8i3A9lBvV+jK4P1MBXygH8VpDzUbLEHnf/h+42pWkqDwIqF5BuhWhCymWvKo2JmNm5Vpo03cgjo9azQaE/Mc0WA9hspunT2ZqXKIWBUHZ9p526Ijlw+STEHWcTWhPE7VBHKXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159155; c=relaxed/simple;
	bh=K1MLbs0Qjumx8D0debWXhxMk75D85FXOx4bTzsjHirc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rD1ZUSxHVVqED0g8ed2x+KPsxzZvhE8ss6AY8dCuvbjdyp/wnk+VT6UaZbbfmwk1tUtCYTwHM9FGH6PnZdAQbWU/8daLVVrePPsI7+Q0VGj1lII90opIESKoXmGVii+Nk7o0mP78S7UuvEByhsUTAva3L9QA6RW8sARfoOf4/4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SCPq+aX0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso10518265e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159150; x=1766763950; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEU3vt21POuxnmNi7TnVPUBkU2y1/pB0srZ9HoiLa4=;
        b=SCPq+aX06eDPCwDeGEac0nvmQvTdko0Uk4Lkys3Cgxsh+yamWuax8rkFsAQtda5Q3q
         KeFfPlS5RnuEkjSYlThTLASv3xWTo3DZlQRFbuXSWaV5Du9nBNevzykGaHks9PXuBI2v
         fwmU4R6jE7fiOvTQqyPNaCkqOi8P7PU5g3cyq4MseNX8pcEwn2O9ZspJvfP+WTp1M+F+
         HO26u08i/dMb2BXM7NtyhdhKf+pDjJdnlOk9hfOBnsI7tW4mL7UHeNebOLswbsjxyhsL
         CYJA1E9XyXDwlgfhFux9Mkb/i+EoPud3yK8Xsvtt1yKdaE/GJ0aUQDsiv6uEUWenf2Xj
         9NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159150; x=1766763950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppEU3vt21POuxnmNi7TnVPUBkU2y1/pB0srZ9HoiLa4=;
        b=uwRpMLd1ItoFfeLsEwj4qV3+yIX1MMj19HpHEcQTkNvXkVi+yIIMEtA+3R/7H4kpLJ
         FzC8WH206v0jJ/xlSRj8RmTrmNfPa2Lqy4XcQAhGd/FGEkFtDX2Cu+hR7gzFLBfbUoEl
         SgLrcjxhT+geNxPsFyPe9rMIL7TXq2MXn3LkeAX2kMmLzUIUBZQZilHPzj/yy6KjTKca
         ArxeMGlX5Io6PAtl/JCQdDyMJODdetZ8Hx5oD3PKIXrio7G9cT/Ls/fN+RtXH6XqP/6P
         IJw4yjWfNvxi5i3//XqjjieeM2X9zDcoiCqbcMrwL2jRE/Wnla6mJG20A/RaKqsQ32X7
         NhXw==
X-Forwarded-Encrypted: i=1; AJvYcCUuKMeKN1lEsaFPDIgqPx5esbo99nY1+gE9bfPvfPnsj0HBB2O8kZ3TsPQUDAaBQ5yNg+8audUXjFVPoio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPz1Fwch/mZYyKD2FLb//QjqPlvIBm58zUvbGVm3Li2svCeJ5
	XRo7iDHmufhxd0CLQIvEeC0jBTeLtFHrkKRhkjUV5V+hNhYVJUMgf6xL6PiM83DKaX8RoRlb1OE
	Tfg==
X-Google-Smtp-Source: AGHT+IFAZFqR3CocsGFs4abVuEztgsgnPQaBN0RWDQEu/FHy3Bb3a0zFWcTgbAs09JYX5Sh2VgApfT61VQ==
X-Received: from wmcq18.prod.google.com ([2002:a05:600c:c112:b0:47b:e2a9:2bd3])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c8:b0:475:de68:3c30
 with SMTP id 5b1f17b1804b1-47d1955797amr31569585e9.16.1766159149911; Fri, 19
 Dec 2025 07:45:49 -0800 (PST)
Date: Fri, 19 Dec 2025 16:39:56 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-8-elver@google.com>
Subject: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context analysis
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

Clang's context analysis can be made aware of functions that assert that
locks are held.

Presence of these annotations causes the analysis to assume the context
lock is held after calls to the annotated function, and avoid false
positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

Signed-off-by: Marco Elver <elver@google.com>
---
v5:
* Rename "context guard" -> "context lock".

v4:
* Rename capability -> context analysis.

v3:
* __assert -> __assume rename
---
 include/linux/lockdep.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index dd634103b014..621566345406 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
 #define lockdep_assert_held(l)		\
-	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+	do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
 
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
 #define lockdep_assert_held_write(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 0))
+	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_lock(l); } while (0)
 
 #define lockdep_assert_held_read(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 1))
+	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_ctx_lock(l); } while (0)
 
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
@@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
 
-#define lockdep_assert_held(l)			do { (void)(l); } while (0)
+#define lockdep_assert_held(l)			__assume_ctx_lock(l)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		__assume_ctx_lock(l)
+#define lockdep_assert_held_read(l)		__assume_shared_ctx_lock(l)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
 
-- 
2.52.0.322.g1dd061c0dc-goog


