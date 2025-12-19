Return-Path: <linux-kbuild+bounces-10239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D457FCD0B32
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 17:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71AC1304E609
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 16:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79852350D6D;
	Fri, 19 Dec 2025 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eopN3Kio"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA218350D78
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159261; cv=none; b=udw3HZiJWFFpOHG8VexpPFFJrXh8wJ3CVMvgv4aKIY7vHPJXBVXaRzkNONQ6qkT9kGCMeGH3+eeD9oSjNMCTN7UxDrVfMZU1yschlAztL1xZkEse4oy2v+p2hqJhpyOueZEOZsmaC22qVeRF00mz1wDK0yu7V8uGmCezBZol49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159261; c=relaxed/simple;
	bh=HdEYfRQpYHFb9w9gX7p78a4F95WuBREWga8Uk5sCvhI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uK674eTOzg+TtpQxNc1nRglHwCAUwcHYY9nf4NStak2a7HfEUJjsMWowY5peEeRnOgBYQuN1RUqYjUAyvkrtQ6ECcOtqVrFX8tovLZl9pGM1laTDc8AEVAPHE67qmgIeLmd92iAs7/HbwZsRTS0eOt7pQk8JaqPM2BzSBvrbxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eopN3Kio; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775d110fabso15690625e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159257; x=1766764057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=raJvaZBiGWdUURg4IuOfBi51C0gZUEAs+Zv74eOTMUU=;
        b=eopN3KioUAwlrV9Qb2lwQX3bDnxr6J/7foj0X4kudK+RmsBZ9dt0tfgPHtQx95hgXj
         gCo3DOKxIvuqM+uLzxmvBHvBL+dHFzb/+Q4FcumxYPc47yaw+BpRhseIbCKHtdOafJ7u
         3TIUyjTHH3hwYMbBBd000G25cImWYyJqHQtYCFtcMM1FF/s1RwuxW1Vm7TkM5EN2Ywfg
         YbLe5kA2YpQdwlkDEP4fL8Nip4Cp9705ckpbInLh0ELbkJhkwYoluIUnPBvWheZyrgMf
         K7tEr5GCZrtOwUwscbY4c1noUY7VYQ6z17+6Pzt21ErXE8UxUWrvspUB7N022qtWoSXK
         GfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159257; x=1766764057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raJvaZBiGWdUURg4IuOfBi51C0gZUEAs+Zv74eOTMUU=;
        b=d5KLu0Ie+G2fwPcz567aG7zV2NmoPBOJDzgGR+bV10xjLehGPPRDXiIYQnkxdDOObW
         jbd9QLOVNOEt+0lsNxR8LAb/MAx1XRBZFcxY52Vv+gkR3MQzg1yYsIfM4iwhOT0MC/Xh
         XuN5Y2tPcBsTl8b2IeVtAUMmteZ2Q80Yz9oI+HC19Kk7DRx/HJ1Q9olU0eiYjdTyFDII
         tRYoUht482GP3Ya4R1TRIxmFhDzDozkZLRM+e0DLcEzfRwYzNn/64Hu3OOwxDJHY4vf8
         cP/H9eL529geVp2faA/tOwGZiC3dhqjoJhhO/uuiItZEsA73agqzRdfcP4ehYkO38YHY
         vbyA==
X-Forwarded-Encrypted: i=1; AJvYcCWgfTSHnXhf5GA7RDimbn3qqNyahMdV3T18zGWZkOT+Bhr/z3so9A9YEUeAGc+PI+VTarExks4G0LeR+AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1slzP+irsSX9cYFpC8zwBFpQq3S9mzfxO+eLujQh/QEQY5+/h
	xabsJ4GAgwp5U/x+KNpagAG99kEN/nczWC8Obl/ZDuaUS3Hc1iiolONnpqWeyIiT+wn2T+vUMuO
	IKg==
X-Google-Smtp-Source: AGHT+IE0DEBcqLPgB304KpuFyDFpAT0dXyCoUrk6DMEYAY2UUiewWpU8NKx93qOTNkEiLpHlSHZUKGwdGA==
X-Received: from wmsm38.prod.google.com ([2002:a05:600c:3b26:b0:477:a1f9:138c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f4a:b0:477:58:7cf4
 with SMTP id 5b1f17b1804b1-47d1953b79dmr33800655e9.4.1766159256728; Fri, 19
 Dec 2025 07:47:36 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:22 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-34-elver@google.com>
Subject: [PATCH v5 33/36] printk: Move locking annotation to printk.c
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

With Sparse support gone, Clang is a bit more strict and warns:

./include/linux/console.h:492:50: error: use of undeclared identifier 'console_mutex'
  492 | extern void console_list_unlock(void) __releases(console_mutex);

Since it does not make sense to make console_mutex itself global, move
the annotation to printk.c. Context analysis remains disabled for
printk.c.

This is needed to enable context analysis for modules that include
<linux/console.h>.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* New patch.
---
 include/linux/console.h | 4 ++--
 kernel/printk/printk.c  | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index fc9f5c5c1b04..f882833bedf0 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -492,8 +492,8 @@ static inline bool console_srcu_read_lock_is_held(void)
 extern int console_srcu_read_lock(void);
 extern void console_srcu_read_unlock(int cookie);
 
-extern void console_list_lock(void) __acquires(console_mutex);
-extern void console_list_unlock(void) __releases(console_mutex);
+extern void console_list_lock(void);
+extern void console_list_unlock(void);
 
 extern struct hlist_head console_list;
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1d765ad242b8..37d16ef27f13 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -245,6 +245,7 @@ int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
  * For console list or console->flags updates
  */
 void console_list_lock(void)
+	__acquires(&console_mutex)
 {
 	/*
 	 * In unregister_console() and console_force_preferred_locked(),
@@ -269,6 +270,7 @@ EXPORT_SYMBOL(console_list_lock);
  * Counterpart to console_list_lock()
  */
 void console_list_unlock(void)
+	__releases(&console_mutex)
 {
 	mutex_unlock(&console_mutex);
 }
-- 
2.52.0.322.g1dd061c0dc-goog


