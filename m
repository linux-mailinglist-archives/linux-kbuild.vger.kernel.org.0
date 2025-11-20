Return-Path: <linux-kbuild+bounces-9704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD10C74C42
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 16:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 3243A2B696
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 15:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DDC357A4B;
	Thu, 20 Nov 2025 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKXituHo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F6357A3E
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 15:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651534; cv=none; b=VX0w3HiQrWDrgIQ76pvwBI7O5SMlY5tAq20aUi2k/iwrhrJX2rvzA88cBTfTVkmgle1IUx83DjSQ0+YcPtpAXPnFjby4WaFIyqik/NTJ+zZDv1jFeFiD1JeVwG4FO1luWEHToMxv9KFIgImRH6Rh+j0NGP8CC2KiBGBBHwQTn4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651534; c=relaxed/simple;
	bh=EwfXd6yRg4bFKtUUrXe0W+ENNOKQmqy6Ot7CBhxbXoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KVzsuY3HonzRbd6pjJu+TX5ESjGoeNM/DRN9g6OUZno080zpjVPOiHCEoRLz6/NdqRbtY8qIYDvCDcmgRKa+VwFnTLqo/c3Z9MGhs4CATaqGiHfiz43VxYvC9osJN+nxShTwq+8vP9sYyKF9eZYDZlp6v+IUrxm4o0deulntLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IKXituHo; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b5556d80bso773217f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 07:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651519; x=1764256319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5aRQBUT1YS/p7X2M8vu94/jdaGEDQWZc189ONsN2k=;
        b=IKXituHozgqyNbK+KjWaX/Tinx4O4O7aSbR/oHa+EADAVCu7lFCnYiYi4skqxGbSI/
         0Se2VAMJYPj6gD6b97R973H+fypzOH45mJ2cCecZDl5dUn6HpwkGx/7TnPvi93/GCzhY
         +b/19F2kxunBpKtEndwE10N025eEMk9m+Y2ssUWIXNQJW8wU94V7FaU9Ldyk8Xtowyzc
         bbGl5+AsNqjtHXCanoG2VnG+W+Rp/1+/5Ep3/5klAnN7S9Up2jlQwACuAIfRhOXHV4Az
         dmdKE2RKGh98OcCt1Qi568IYsfXtfJCd8Ha88THG012a1Dc4ULxPwAMSAcOESbYFZLTI
         eGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651519; x=1764256319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5aRQBUT1YS/p7X2M8vu94/jdaGEDQWZc189ONsN2k=;
        b=BWjECrqD+f+S7jyq5Mmug/SQuoNPtGjPFFFcpLuCC0FYYnqP1UM16FfW62ycfiyfOm
         d14Z6EOJlKfn9j6wCEogWvtJ+TUvje6gC9imR/u8ZgeEZK/mHnHqOrZbDP9a9SSbvAvA
         qmuRL32l8b6breEo0Aua12R0cbbdpFttIovQQ6ohysmyST2wB74HAUCTL3cNDmr6Fbqx
         TdOiMiId+WjRbRig596xYa8Y6lx86JlcjXJeYYUWTAmdQS4gmAjQn9en0aToRgIoPbF3
         K0wrh39tFg5TYVUcu4iyNBLeXuVD3zPEmMx4nKSWDg3RAZQNTl+FpbIYJ1T3spIa82rd
         HOLw==
X-Forwarded-Encrypted: i=1; AJvYcCVF71Vy3xznj7D4/Y+fW9rFwGHNVwHkRaxldod97SrjfPB8DmZUYs63kvSqCredVOXUjs/m2r6nUGHaQJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7N35oyVA/n8NvP42r6drvcWgZg5xS2K6ofi/BidIHLF9sI21a
	rmzD6SC3z7hZaAnbO0A+SEM+P9L1xHUt2hIySVhWYz3y04OpXTXP9q+EaqbdxZ3/j7o1jt6LCQZ
	XfA==
X-Google-Smtp-Source: AGHT+IER1f7gc9WQ7LnpbrPIA/y0BLZGbO4bUsdn+Ne1pOxE592x9Yu2PvTpMRh0Noc8+8JrQHGkxnvByA==
X-Received: from wrsz10.prod.google.com ([2002:a5d:4c8a:0:b0:42b:3a01:7808])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f290:0:b0:42b:3e0a:64b7
 with SMTP id ffacd0b85a97d-42cb9a560c2mr2413997f8f.53.1763651508025; Thu, 20
 Nov 2025 07:11:48 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:32 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-8-elver@google.com>
Subject: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
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
guard is held after calls to the annotated function, and avoid false
positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v3:
* __assert -> __assume rename
---
 include/linux/lockdep.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 67964dc4db95..2c99a6823161 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
 #define lockdep_assert_held(l)		\
-	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+	do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_guard(l); } while (0)
 
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
 #define lockdep_assert_held_write(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 0))
+	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_guard(l); } while (0)
 
 #define lockdep_assert_held_read(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 1))
+	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_ctx_guard(l); } while (0)
 
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
@@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
 
-#define lockdep_assert_held(l)			do { (void)(l); } while (0)
+#define lockdep_assert_held(l)			__assume_ctx_guard(l)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		__assume_ctx_guard(l)
+#define lockdep_assert_held_read(l)		__assume_shared_ctx_guard(l)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
 
-- 
2.52.0.rc1.455.g30608eb744-goog


