Return-Path: <linux-kbuild+bounces-10306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84313CD2F0F
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 13:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DA433009280
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 12:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E559C2E11B9;
	Sat, 20 Dec 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bPzgDfq9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8B274676
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Dec 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766235172; cv=none; b=eQw8W7Uh/vQA3fhYlWsRgI4AxnMdqYT+mP9MNuL6T7aNpbSRcoWV/eCEPVz0Hkl3kPIDygD//hu95MufhMv1ePLDOjmr8dqA9OgHpz2EMIgh6XnY1pQD+eTANyQXVKo7AEPJKsoX2qG5JQ/bxqQBsw75m116cAA8FsUVx9d7tAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766235172; c=relaxed/simple;
	bh=mfOXg447RAZ1jn16CEUFd8WZttm8IVc21yuyK4Wgy4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPjdSBYpHkt8Kw3+bsnFR/KEiZwVOed1mJ8Thwa+q7gn1qEDarEGhroYHd1QdB+baH/YQFrqfNHr7+VUwnGhfjp3pDYfXoUkwRAG+tw4kvonBBtBBY+puMpBLn1Smg67aoAJO2XKqIJ/fFWS9qm+KVPFS54igpBjT7K+eO/mg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bPzgDfq9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f2676bb21so33212435ad.0
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Dec 2025 04:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766235170; x=1766839970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbJUZ0xTndCf3VdowDat4Wdfn4Fu9I8D0dKSNYqhcFE=;
        b=bPzgDfq9fMDn8+Wn6skuS1G73sQ7mE/xuR3bGKFzGvscKj8iRm0krkBQC4xdEiAPxV
         ZgEPCvrPT2Arb/NySSwQ8QY7P/pNlxxsZ39TCWDGVlX0JAfv2rMtl7PXOfFmE3N3wUGi
         SD+OdfZIgvaxPIXDF2CL862Vj6b4GgMJZW5jW5BYu5yxJMW1ehcAPXSv73kkyTPQolwA
         XjvfeSm9iU/cCN1Bqf04WXgqf6kZtWVfMNLWto5sjqhp1BB/ksyKF7nwz/oaBh80+Eqg
         suwEhsZ3pfiPNoO8lC3KPrBhJqFsIdRNnSdloBwNQtZSLmZJuoWdwljVoUg/gdhozOh1
         WhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766235170; x=1766839970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbJUZ0xTndCf3VdowDat4Wdfn4Fu9I8D0dKSNYqhcFE=;
        b=sa5Ui/z3mAK+QCjpf4h9AtVdLm8vMGQ2lYyeef303tQ42ONlLINy1Byg92IDIqNOop
         g12tR26Y2N8ICpr5nYxM+s+sP0Or12MAh1ePQVkM6IaDyK8Xb72WqpdJ2OXsEferxENO
         9GV/V8lEQSCzQMJWZjL4KBDpLe/dBzpNRZbU3GsEFcfudV+a6hQjp9IIWjPdFBibaw9r
         fk5EHhaWgwK6Ri7RATD+bn3kfqdvxV/9S1NLoaQIMcesoVB+ZlurTOUX6TYpxI6F+QNF
         QosFXepuQXh+WOLiNf52xYJUxMEBUV0dL9GUKuVFcXJQE3RdDY5B/U1E08l86EKRVxM/
         41Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUO5xXpxGLVL03D0uSIjcRyXYNfnpG83jkq6avMhbfXkJY6qxt3jv8XL/9cxw5Iw0WN8WazoOlbT2A+M8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzefiAmHvfFWuuBmqPH7dQGHxAtp+rMAULvPQMQtWB8UIff7i51
	vmdPvFGD3epSCjIqbbzjxVedzBcb4cCby13DI9/G2tpGP5BPrYlMw3irCtRxUHpn+PFUaB5yJLF
	DDCJlwjeEhmlmgrRqjsqt1n1S//jgajRiaJKY+vmR
X-Gm-Gg: AY/fxX47DwZVTnG/P+FpgQ0rP4T5up8nUl0PlcacMuPh0edThIRToI9mhXPixNQZLmV
	OWKkk9Go+uaiFfTn2WQ93y+48PljEhXnIQ16jiaRRWYqTMl2+0P1LkRCQaCOHJI8IQcS8IT7D0w
	hYupHS0dJF0sHzskhlV6h9NsB0wI2U57JGoWqsyxHcPbc4sU4fSqeEuULzCJkHxsJzGsYGQtfga
	+WVDafUEDITDIIEehj+Zx75Ed8a7YIxRByhTm/b04VN78YkOMrtl9JsPyz1RebbNUi1hrcppoix
	KgGHsTL4cStkZDuydh+jE1E1D5w=
X-Google-Smtp-Source: AGHT+IETmgOAcDHbF6MqcLCKTf5epOZwA9tGllY35Ia+ZmQjsZsBscMmnIOEXdoPmuZFimi3nJyivgIHK6DMRk5k25A=
X-Received: by 2002:a05:7022:6722:b0:119:e569:f626 with SMTP id
 a92af1059eb24-121722e0444mr6670285c88.31.1766235169708; Sat, 20 Dec 2025
 04:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-18-elver@google.com>
 <81d2defc-8980-4022-a464-3d285aff199c@acm.org>
In-Reply-To: <81d2defc-8980-4022-a464-3d285aff199c@acm.org>
From: Marco Elver <elver@google.com>
Date: Sat, 20 Dec 2025 13:52:13 +0100
X-Gm-Features: AQt7F2oG2tk1HNWJ4txFgkKVTgQOAoxLExF81nhreitjIuVCBm-zQmVADhDjpfw
Message-ID: <CANpmjNMAGYeFK-jYafSihmA+T7wi3zC8Sb4fJ+ZjzDK5jGuMvQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/36] locking/rwsem: Support Clang's context analysis
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
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
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 21:55, 'Bart Van Assche' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On 12/19/25 7:40 AM, Marco Elver wrote:
> >   static inline void rwsem_assert_held_nolockdep(const struct rw_semaphore *sem)
> > +     __assumes_ctx_lock(sem)
> >   {
> >       WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
> >   }
> >
> >   static inline void rwsem_assert_held_write_nolockdep(const struct rw_semaphore *sem)
> > +     __assumes_ctx_lock(sem)
> >   {
> >       WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
> >   }
> > @@ -119,6 +121,7 @@ do {                                                              \
> >       static struct lock_class_key __key;                     \
> >                                                               \
> >       __init_rwsem((sem), #sem, &__key);                      \
> > +     __assume_ctx_lock(sem);                                 \
> >   } while (0)
>
> Just like as for lockdep.h, I think that the above annotations should be
> changed into __must_hold().

My point is the same: we use it to delegate to dynamic analysis where
we reach the limits of static analysis, to avoid false positives [1].
Code should apply __must_hold() or __guarded_by() to called or
protected variables respectively, which is both cleaner and the
idiomatic way to use all this.

[1] https://lore.kernel.org/all/CANpmjNPp6Gkz3rdaD0V7EkPrm60sA5tPpw+m8Xg3u8MTXuc2mg@mail.gmail.com/

