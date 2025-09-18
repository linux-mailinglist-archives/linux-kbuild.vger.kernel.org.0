Return-Path: <linux-kbuild+bounces-8875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142ACB8514F
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D088F3A8521
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8838F314B93;
	Thu, 18 Sep 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="InvjCD/X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B96313D75
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204380; cv=none; b=EHWZLgX9z47imodZIoX5SlnWqiJwt0fXpkiUI/HhwGl1wLVBwIL5f1/6VNXUZj92F8vNvm2kGvTyVFIpMhZKRbQt5QntTcQeEBvmTXGMxGM0u67szAT7UUA5Zh4dXBKf9IlCosxFgUoxVz3Tp30D5boEB11hIu8xizFn22li5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204380; c=relaxed/simple;
	bh=M7ok2X4q9BaV5FdmhL+Ak/jOM04u25Zhy+lmS+STqV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ToCuDn1+jZ0z2R1dKQAR+F9HXeRqe20wZjIN6MY0X8CD81og879/3UAQ5mcBFEKcrDvpcoXwtKjw8NZH1ftxn+59F5A5o7oMcZcvqIXZp/h+J4lLp3uBWj1MCckmDLLSFGpqsdCCDMG15I5Qz4oYCq97sZoXl9HZKI57qduFsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=InvjCD/X; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ece14b9231so561491f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204376; x=1758809176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPOyraitAoGllB7BsvSWOoZaTAjW0zjsOFJLH9vcrlI=;
        b=InvjCD/XiQSGMpUL8jB7LQnuIqesRwUngNVVqiWJnDZ0qub8TJXiTR51KBSySGlPuE
         DHFQzoArrlNlz/HD2SVRGGHe1OKx3bdQ3ekgYkJsaQLNkkUUvKBq7RuXmkfBjxs6MldQ
         YeNW5w+BEmJZE0iP5COZFaP6Hd/EkE8c6fxnBeWH/oEzU9YEeHsIzv6nzvmZJFfX3syz
         MYgTG3l4JzL53p2fM9LI4MYdAv35/nVJmPcDFaicTBj0iFMhfNwMjJXgSbbM1KSnC0IM
         d5+iV9fRUr4QYcIYXQV5XVZJvRxpiJ7vHIMKZ3r6eG7yCTgzAwRT0Rcrz0yTL0Vwh6rZ
         p/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204376; x=1758809176;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YPOyraitAoGllB7BsvSWOoZaTAjW0zjsOFJLH9vcrlI=;
        b=ZMhsMeAnARUGDevoiuB3FOvw4bRwvDAutZW8iDdPJxwjqwZ8l2ZjMkVdIYwK9DDXY9
         RZQ0iYLwQvOrQQ/GqeSBeDxWKSUe8njRmGVqfNhCu8GrZe8XqujsdaITEE2FxhOBpqU5
         54BJMdiaDzlwF2xIyEDBiTUEF3Fvu0gX2pHBiBSlFWwvll7QjO88xViE+675m2PxkVxA
         OdMuYyj7/SzRjATUM4nZkBkstVjLoLnkn5AmTWoGCjOnkdP3XH1+qVvxcZ4NG9brDcSC
         T72ucobtUkPL8uHEMWh+GIQVevCofgSGc+6ucUiDS257cDiluhyr/V3ZV8GABGc8CbuK
         v2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK7JlIn7ZsAE85udWL92OX44XiJRJoIDexQ9anYFOkYVYoXJp8UI3BvcJCHXTuuakyO9YT7WUmG6fqtYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FZiPhNbJe7P1rxXIfTjRnHEgrFZW6pWcgcWq7vEpC7dLNvc3
	KJe3M8CYeE92HGL8RwL0NpbDq1/sz/pvwTgLK8wNQEcB9q/Sr9oA/q9HaJa4DZVuDYvdQPi5idM
	EwQ==
X-Google-Smtp-Source: AGHT+IF8aLIhn34LgaGAnLK+69nAB2mIA60sJ6OJu7Vgj9ULaNgMfzBmpj6zQNDNkmaJ1Aacoswwf832Yw==
X-Received: from wrd21.prod.google.com ([2002:a05:6000:4a15:b0:3ec:defc:12db])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4284:b0:3ec:b384:322b
 with SMTP id ffacd0b85a97d-3ecdfa3d37emr5318506f8f.46.1758204376079; Thu, 18
 Sep 2025 07:06:16 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:29 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-19-elver@google.com>
Subject: [PATCH v3 18/35] locking/local_lock: Include missing headers
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
index d80b5306a2c0..4c0e117d2d08 100644
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
2.51.0.384.g4c02a37b29-goog


