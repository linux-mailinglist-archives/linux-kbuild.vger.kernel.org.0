Return-Path: <linux-kbuild+bounces-10082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26672CB899F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 11:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12BFA3031CCF
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8B931A54A;
	Fri, 12 Dec 2025 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kbkpTIwj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C831691A
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534569; cv=none; b=gXHsqMYMZO9DjIhfr9tNMKyO/KV9yV4N0jr6ZhNffgsRFri10bsg8zv+iDbRuBYGdGeuV9m+g4rE4PSM99Vghh8M1ZtMLNncQW4j65XKwxyKtrrAyAt4w0jLsuzWKdoz1kwVbxVAxS2loinHQKLq4WgFONr/ayMHxM/Vq4A+110=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534569; c=relaxed/simple;
	bh=Yy8AVUr1WzoEhC0gwViTyIIecU1pDeO+TdO72jBT6kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upW/oLr6nZwED4QWsWAro8eLE1Yya3YMd0tNe7RMYte3W+3CiTILWVX2ab3KiJiwQBuDrTYMEJZiBa0FM36qHsjG9WX0VMMHQJqHBnfPqcVqq56/xTyyieK5TBCZSlVnX54ZH3iyeSc9qdLG5HKEYpJC14JeAhvVwFRajeaOz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kbkpTIwj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so672143a12.3
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 02:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765534567; x=1766139367; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy8AVUr1WzoEhC0gwViTyIIecU1pDeO+TdO72jBT6kg=;
        b=kbkpTIwjpQS8ePNpRzQzmqynFKNs7/NxFbTXEqQxrUChBOEd0ClCuYdBQSv/22spWQ
         Mlau/Z1r7/t8B4xFGTNsO12c5ZTlO8IX7JmdNjWmjdVZ/Jjmk3SOeb81vSBizctBon6C
         b9PSWBQffnaVrZsxTpaFewgJOaV8M65WyBFjjc/d5LNfdNJtX504o4PmkXzgy9+JGpaR
         p+BOqszpjmfwPdF9SWGeFROnU0ow5OvvXnKcQ2WceWvfngjFOxfI5+Rs21yMoX+9CWFu
         9Pv3ZqG+EuPi3/Br8MUwkjm1WFmizI4Ur371xJf7pXnmBlKHwciyx1Eiw/6wKklL/E6/
         Jp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765534567; x=1766139367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy8AVUr1WzoEhC0gwViTyIIecU1pDeO+TdO72jBT6kg=;
        b=Mz8T/XckDS/1XnBzAZcZkPbVmwAIAWK6rDT0YvtRrbs0IDJyp3C8OvYxElPhDYGNa0
         10tiU35wIZqg9iCXOwSt3L8Dmyaz4bxWJWziPc2TO/BL3JCjx4hE/TKy+8sDkZ0YrTN3
         z9V+C7b5SFMpDT1Hl+M6n/3p7WJAllz0njMsoWQIHWHmvK4nS4kwra3xej076wweCSXW
         cA1naqesolEeyvTf2NP0kLEA0lEcGxfap1rNhFfgnbVfBgjiRBw485MqvqSh666QfRBE
         VIf34YiEjuzqumwH3nSEozZ9JqnJEtGCKXtkIKMN6BzYfXzT42FZaTYXK4q7PaBnSx9H
         /01g==
X-Forwarded-Encrypted: i=1; AJvYcCXkjw8bkaUO50MfldliAC06vDKpPHQCvSiIBmp92q3CL0CaR1EAkdrD8nEzy+BSXyz4RjDd5+2YJT7MgLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1OIW48SN2Uh8zuZKG+DmeN5p1BHykBhPR4wv0+WMI2N4EAlv
	oa8yCGMgzHSyMcIp5GWTmWMfYChgHQaf0+fHia0qloUFNzT1ZNKEb5UpWrvyg44zVL/J3WQSuFP
	UmF0pMsQXqQWfjMkTReMNq8nMBsSDR7/X3JLrCixl
X-Gm-Gg: AY/fxX7XPiKZQbJPiXSnllQQeMSxfLHWdlJE+kVXY/4tThbgCkQhXhYa1D8+9a8uAMV
	7j0VJjPwAqsUtBtw3oMowyG1LTh1cDaV1tb+HyUq7fr7Yxg3pqRV6TUT+2UVRLAqixWDObQp4Ti
	c0AttjZwsWhNpfjHfPVFBWdafXJN72NcAzmqOh8rtZB6+v2ByMEGfJWEh4f/ixsVHpxRLyPqmYv
	9wi2u5YJ02e+3ODtBQcwsqGRyhaHJgO7LIYrsE8js1rQym7vwRHq1Egm/oEfhboehS0AdlaLvBR
	D475RXkG8wP34yZO+NWzCKrV7blqzkXP/U5e6A==
X-Google-Smtp-Source: AGHT+IH8fq53xzz4VEeZIfjpPn2aDZft0vSRUPpE08Jgar7Bwxv93jAlmI/oD2Bc5sYJ04yKuPnrNx+rDd5kmEFlwB8=
X-Received: by 2002:a05:7300:2aa5:b0:2ab:ca55:89b4 with SMTP id
 5a478bee46e88-2ac303f2fbcmr872533eec.43.1765534566419; Fri, 12 Dec 2025
 02:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251211121659.GH3911114@noisy.programming.kicks-ass.net>
 <CANpmjNOmAYFj518rH0FdPp=cqK8EeKEgh1ok_zFUwHU5Fu92=w@mail.gmail.com> <20251212094352.GL3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251212094352.GL3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 12 Dec 2025 11:15:29 +0100
X-Gm-Features: AQt7F2qb9ENq_mtkRfqCrKNBJnxHOwKNFDuSBIrcF4bjbeWckbG0712gmoUp-Ao
Message-ID: <CANpmjNP=s33L6LgYWHygEuLtWTq-s2n4yFDvvGcF3HjbGH+hqw@mail.gmail.com>
Subject: Re: [PATCH v4 06/35] cleanup: Basic compatibility with context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Dec 2025 at 10:43, Peter Zijlstra <peterz@infradead.org> wrote:
[..]
> > Correct. We're trading false negatives over false positives at this
> > point, just to get things to compile cleanly.
>
> Right, and this all 'works' right up to the point someone sticks a
> must_not_hold somewhere.
>
> > > > Better support for Linux's scoped guard design could be added in
> > > > future if deemed critical.
> > >
> > > I would think so, per the above I don't think this is 'right'.
> >
> > It's not sound, but we'll avoid false positives for the time being.
> > Maybe we can wrangle the jigsaw of macros to let it correctly acquire
> > and then release (via a 2nd cleanup function), it might be as simple
> > as marking the 'constructor' with the right __acquires(..), and then
> > have a 2nd __attribute__((cleanup)) variable that just does a no-op
> > release via __release(..) so we get the already supported pattern
> > above.
>
> Right, like I mentioned in my previous email; it would be lovely if at
> the very least __always_inline would get a *very* early pass such that
> the above could be resolved without inter-procedural bits. I really
> don't consider an __always_inline as another procedure.
>
> Because as I already noted yesterday, cleanup is now all
> __always_inline, and as such *should* all end up in the one function.
>
> But yes, if we can get a magical mash-up of __cleanup and __release (let
> it be knows as __release_on_cleanup ?) that might also work I suppose.
> But I vastly prefer __always_inline actually 'working' ;-)

The truth is that __always_inline working in this way is currently
infeasible. Clang and LLVM's architecture simply disallow this today:
the semantic analysis that -Wthread-safety does happens over the AST,
whereas always_inline is processed by early passes in the middle-end
already within LLVM's pipeline, well after semantic analysis. There's
a complexity budget limit for semantic analysis (type checking,
warnings, assorted other errors), and path-sensitive &
intra-procedural analysis over the plain AST is outside that budget.
Which is why tools like clang-analyzer exist (symbolic execution),
where it's possible to afford that complexity since that's not
something that runs for a normal compile.

I think I've pushed the current version of Clang's -Wthread-safety
already far beyond what folks were thinking is possible (a variant of
alias analysis), but even my healthy disregard for the impossible
tells me that making path-sensitive intra-procedural analysis even if
just for __always_inline functions is quite possibly a fool's errand.

So either we get it to work with what we have, or give up.

Thanks,
-- Marco

