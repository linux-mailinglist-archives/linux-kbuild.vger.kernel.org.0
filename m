Return-Path: <linux-kbuild+bounces-9715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF9C74DCB
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 16:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A219C32265
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 15:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A9735B152;
	Thu, 20 Nov 2025 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ltyF7FvA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CF35A956
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651602; cv=none; b=cJGiDWVQ8FikrLFNy93xHmq37iYEYPbteDQdLCLaZ9tN3P2KjZmLCdBqYR35ShPS19tcyo6gzPvk2dZYHQIAAloIvy8IjaJ4XNRvz3qjbBkvBjTf7w0YmLCr6oL42uan3LqS001U9I18PvbqJV/RienM9OYS+PqIIbP1ERijKR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651602; c=relaxed/simple;
	bh=07zfwwibr87pzthwGbH+0Y0kGO/abbdb5ZEhTTNkhyA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mER9Zps/Ze5Z+MqLEMJe0KF6+zytgE+/JVncpQQlXQFsSBJ3dFOsaancUhaH9PBU0S25Id10cop7Z8cSZyQ5HbBIp+KfH7dpsk0TnE/L1Fy2cDzwbNo6X2FGvqkVS+okEncNgCja57/I1oBH+n+FghPXmjZYwZCtV/CmuEe8lfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ltyF7FvA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47788165c97so6583135e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651580; x=1764256380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTo30xRtk3dNAYk+WcMlGzrXIDi8Fd3AcvMY0oMy4/o=;
        b=ltyF7FvAG6OgN0LcS78W84ax541CxFrE8utJs/0/ke8m5aqrP3352ZUx86FV0kzR7V
         fw1zF84Bl+Svig7h1nusl1SdfpLU8dcT+sRfvUGgdusSVeBhup9jElD6ai63ieXyS/n6
         OLNtDua3PdYcVbaGxA3XV/RfRMPjGWoeGj8Pyh5p3WcHL7kU0g2WigB1evg/biaKQURV
         58WrJ+g7zffVX05xtUxITBZgThTY3tQeyFl3E+XlBQMfjPCOUw5SbPfxuduIMD2JITqn
         5g3M5vRFEXx5FZABV6HGefW8grmNTWyoV11BAaOHracqUN4DkX2/tEwrEzMlAJocRn8b
         JyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651580; x=1764256380;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LTo30xRtk3dNAYk+WcMlGzrXIDi8Fd3AcvMY0oMy4/o=;
        b=fNMCYkTXQ6c1Ey+J/nGXJoVoRG6EvBQ9+Q5Tu3yYAvTYoE8MqhP+PN1dXZ469sNF9s
         9zfBqijsntelIOqo6LzbD6nlljOKXN6HvZS0loeogK/vyKw+XT3PGLQRRcLPhF/Yunz9
         fOdDWUgf1UhH5YOpuFELh9kO+P3LOqU+Z/jKtwnQKx3q7S++b1q4yQhd4jrT7fwUmPe/
         r6C/yxDyPs21zaeWP+URE8Tum3ooev5eRGfPUU899rudO5MulujfvIimkL4IEj2NRTlR
         VDjVMWolwKt0ngMatYY8ZcJw2O0YuJToSomIXkLqTfaTuIRjwZ9aDRMF3QHDNFjT96oY
         PHdw==
X-Forwarded-Encrypted: i=1; AJvYcCVIRTIa5KoMsjRBkG7vaCtunu1PXWyEybo0Y5HIqQBQKEWdO8guHMTSAOgK5asHomemLH3gk3l4N3XAPfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5w/qLqREwn6hbS12FuQtDYpOar+mOwT9ZHexlOtghZs7Vy4k
	Y6xlyZuyn9bZ5egmhS4gwlN7nWNnKHAMNJYBxJbdPDjc1GBQYdvDJ2nuQ8p3I+0Z1uOTg1JQHni
	wdQ==
X-Google-Smtp-Source: AGHT+IFrGgNPktKG3H23bhC9w6XQyJEAaYXs0SazZ2yQkYIVJL1b09kjJ5fLN+jez2xgS5LZ8SbpXS+XSg==
X-Received: from wmqo14.prod.google.com ([2002:a05:600c:4fce:b0:46e:1e57:dbd6])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ec6:b0:46e:32dd:1b1a
 with SMTP id 5b1f17b1804b1-477babc1fcfmr26767175e9.7.1763651580311; Thu, 20
 Nov 2025 07:13:00 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:43 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-19-elver@google.com>
Subject: [PATCH v4 18/35] locking/local_lock: Include missing headers
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
Content-Transfer-Encoding: quoted-printable

Including <linux/local_lock.h> into an empty TU will result in the
compiler complaining:

./include/linux/local_lock.h: In function =E2=80=98class_local_lock_irqsave=
_constructor=E2=80=99:
./include/linux/local_lock_internal.h:95:17: error: implicit declaration of=
 function =E2=80=98local_irq_save=E2=80=99; <...>
   95 |                 local_irq_save(flags);                          \
      |                 ^~~~~~~~~~~~~~

As well as (some architectures only, such as 'sh'):

./include/linux/local_lock_internal.h: In function =E2=80=98local_lock_acqu=
ire=E2=80=99:
./include/linux/local_lock_internal.h:33:20: error: =E2=80=98current=E2=80=
=99 undeclared (first use in this function)
   33 |         l->owner =3D current;

Include missing headers to allow including local_lock.h where the
required headers are not otherwise included.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/local_lock_internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock=
_internal.h
index a4dc479157b5..9f6cb32f04b0 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -4,7 +4,9 @@
 #endif
=20
 #include <linux/percpu-defs.h>
+#include <linux/irqflags.h>
 #include <linux/lockdep.h>
+#include <asm/current.h>
=20
 #ifndef CONFIG_PREEMPT_RT
=20
--=20
2.52.0.rc1.455.g30608eb744-goog


