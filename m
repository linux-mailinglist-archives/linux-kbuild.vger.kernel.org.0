Return-Path: <linux-kbuild+bounces-10064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F989CB5FBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 14:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AC18303A094
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5873128D8;
	Thu, 11 Dec 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+P7Ofz5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF43128AB
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458780; cv=none; b=VNWYREGYUguSks23HFbe6Ms80MS841u5wvm1/qg06f1uatLj9teR0HfZFyzpjtaNfH3e6D7Zh4+VwpDCcar0HviHLMuQmrekrp2KWHgUAnwoto7pCuOiDsT+4RBISvNPRGgbf5u2l3/A7yrmhqqZSnm1Yith4nfwGC6yEdqH77o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458780; c=relaxed/simple;
	bh=v+ZQdnBsG3Jds4SOxdBrDPR7IaFiwIcDFZln0Uu2MNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTPbBl2Vk2be4GsmUuvC9Eg4TRGqtAfLQq9GmndPRX9IQDvO4/NKvvFop08hotHfSb9w17BK0ztYOH1jvyplLVyV8iX4TIH1eo0fTTX5t4NufDoRk5ihS9NuJpPgbqrSYXSs5C/mIf4nlgzv8XIf6L+8z5B+KMX7IClglKtCVe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+P7Ofz5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f1243792f2so33678b3a.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765458777; x=1766063577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aSAWeLhswH6DwjvXpmjx7xXAiszMCLjSPlHn40Ul7IQ=;
        b=f+P7Ofz5GvNDqM11PpoM73HtcOSq+PXPnz1Wn4vDScEqJAf0blvok2y+9qhtzuGGol
         g3+2lLtll5Tb9cGXC8R9v6zYlWmrY25cxLGr4IH1k/t8/PgtrAkCwyeXqsbcnIcbjMPs
         Eq3n4uIZ2rc57yVIjhUaW47rj7UYk/v8LtDQdbzto6SrolDCFxrbO912J5QyZleZjvoT
         B+sXSjiWLOW2hIrm2jQFWW7+irMgNRudUcExYjlDdWX/iIzIaXV0pvdARMoYg4ZCDIeI
         zaPYn8ZAKUkvqTGnZeIfqtjwGMGSq5hLaVGt3aGhDWxXgmKFW7Urv7I7OQghOXagcbCu
         G6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765458777; x=1766063577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSAWeLhswH6DwjvXpmjx7xXAiszMCLjSPlHn40Ul7IQ=;
        b=ru0C7Hp5Bcn+Z2aHVLkFLd2j2ug/jkN9wsDhMOS70peYDjLBpCCPyyniJjS0Ijh8Ja
         OKeaPdxcnn7dTD/yvg/0Gul+gkNbdfToLckKFyTbdZ4DPsrPlv9KwT86WE4I5LGu3dlN
         84/pufBhMGFKKLbmYIC1JRe3EuTSSaHpLQ1LXnBL5aD8G7mbOqieP+/v3Y+yA42eyBmh
         rOMF1GM5HyPPmu3uQ9slnSSjUrRZcHre1fiJQj2NSw/JQXp6QP2gPLOOu7UjXmUCieAd
         zAcdKSNI4u5CHfddzt1Ete39KbipbiT6gTdxf5GWlVOvxJh8QESa+joA9jMrKjmMophn
         CoEw==
X-Forwarded-Encrypted: i=1; AJvYcCVKPCE5IOnQteQJrzW4m/1L04K7NvNkA2LtY9cwbL2zNrOkXXL+pvptDLItp+jaUj6ym1fPd3YfLlTOVCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp157a5yYKXxx6HWjomYqsRcqW5K9TrzO3QWs04SY3xK2Tt++p
	7gugn8/3izJSXN//envGZJYAD3PdvL9wOCjajRWeEKihsHSXGb9EKjyEPqNCrE7rgOBMpmAX3Aq
	lyPCLY0McugxmvWTXtIacfihod+bF5WoFekNcSfAW
X-Gm-Gg: AY/fxX7eCoaOGX3dqL8Qpv4jGW5qbXgP9dl9hM5PCxDbDaqE2dB1xyXn6v/cOPvGJcy
	spXxvS3EZiCJ+WCpohRtOmPAnaaVx7TBUikh1rcC0Vmunme0kIn2m64tAUsC0wPKt5ezWo7j815
	z54L5x4vcPhF3+C69NeGAcxg+Pk7y9dLbnfnSoIu1xGe7D7q6FLEvot5gCUY0bAqgsRMaA8W/md
	G3b/vT/3hJdPGSKi3PKX3yZBcfSr8HJkTpaeJXSvbQ7jPmseOqyeZXQuus2Twt5Sejl/JalRmj3
	C7qfYOYhXzXT4jxmLbBAacZr
X-Google-Smtp-Source: AGHT+IFKUTpUZDJYgmni8n60xNJbrbAVNuDkEgVCtA4vIsV0NrU5sPU9y26HNSVsbHocOOsMdXB5E5HCLF6JNhBBnMQ=
X-Received: by 2002:a05:7022:685:b0:11a:5065:8763 with SMTP id
 a92af1059eb24-11f2966a3c7mr5044765c88.5.1765458776836; Thu, 11 Dec 2025
 05:12:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120145835.3833031-4-elver@google.com>
 <20251211120441.GG3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251211120441.GG3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Dec 2025 14:12:19 +0100
X-Gm-Features: AQt7F2ok29a5Gxu0w202jEvGPrWPxaH5LVi0EBv48F585MyX9KePj1tDpUehhNc
Message-ID: <CANpmjNOyDW7-G5Op5nw722ecPEv=Ys5TPbJnVBB1_WGiM2LeWQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/35] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
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

On Thu, 11 Dec 2025 at 13:04, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 20, 2025 at 03:49:04PM +0100, Marco Elver wrote:
>
> > +/**
> > + * context_guard_struct() - declare or define a context guard struct
> > + * @name: struct name
> > + *
> > + * Helper to declare or define a struct type that is also a context guard.
> > + *
> > + * .. code-block:: c
> > + *
> > + *   context_guard_struct(my_handle) {
> > + *           int foo;
> > + *           long bar;
> > + *   };
> > + *
> > + *   struct some_state {
> > + *           ...
> > + *   };
> > + *   // ... declared elsewhere ...
> > + *   context_guard_struct(some_state);
> > + *
> > + * Note: The implementation defines several helper functions that can acquire
> > + * and release the context guard.
> > + */
> > +# define context_guard_struct(name, ...)                                                             \
> > +     struct __ctx_guard_type(name) __VA_ARGS__ name;                                                 \
> > +     static __always_inline void __acquire_ctx_guard(const struct name *var)                         \
> > +             __attribute__((overloadable)) __no_context_analysis __acquires_ctx_guard(var) { }       \
> > +     static __always_inline void __acquire_shared_ctx_guard(const struct name *var)                  \
> > +             __attribute__((overloadable)) __no_context_analysis __acquires_shared_ctx_guard(var) { } \
> > +     static __always_inline bool __try_acquire_ctx_guard(const struct name *var, bool ret)           \
> > +             __attribute__((overloadable)) __no_context_analysis __try_acquires_ctx_guard(1, var)    \
> > +     { return ret; }                                                                                 \
> > +     static __always_inline bool __try_acquire_shared_ctx_guard(const struct name *var, bool ret)    \
> > +             __attribute__((overloadable)) __no_context_analysis __try_acquires_shared_ctx_guard(1, var) \
> > +     { return ret; }                                                                                 \
> > +     static __always_inline void __release_ctx_guard(const struct name *var)                         \
> > +             __attribute__((overloadable)) __no_context_analysis __releases_ctx_guard(var) { }       \
> > +     static __always_inline void __release_shared_ctx_guard(const struct name *var)                  \
> > +             __attribute__((overloadable)) __no_context_analysis __releases_shared_ctx_guard(var) { } \
> > +     static __always_inline void __assume_ctx_guard(const struct name *var)                          \
> > +             __attribute__((overloadable)) __assumes_ctx_guard(var) { }                              \
> > +     static __always_inline void __assume_shared_ctx_guard(const struct name *var)                   \
> > +             __attribute__((overloadable)) __assumes_shared_ctx_guard(var) { }                       \
> > +     struct name
>
> -typedef struct {
> +context_guard_struct(rwlock) {
>         struct rwbase_rt        rwbase;
>         atomic_t                readers;
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         struct lockdep_map      dep_map;
>  #endif
> -} rwlock_t;
> +};
> +typedef struct rwlock rwlock_t;
>
>
> I must say I find the 'guard' naming here somewhat confusing. This is
> not a guard, but an actual lock type.

The switch to "context analysis" required us coming up with a name for
the actual objects (previously: "capability") that "guard" those
contexts.

The reasoning was that these are guards for entering a particular
context. The lock guards the given context, but the context itself !=
lock. Clang's naming of "capability" was a lot clearer in isolation,
but the problem that Linus raised is that "capability" is already
overloaded in the kernel.

The fact it overlaps in naming with the other guard(..) infrastructure
is not entirely coincidental, but I see the confusion.

What's a better name?

context_lock_struct -> and call it "context lock" rather than "context
guard"; it might work also for things like RCU, PREEMPT, BH, etc. that
aren't normal "locks", but could claim they are "context locks".

context_handle_struct -> "context handle" ...

?

