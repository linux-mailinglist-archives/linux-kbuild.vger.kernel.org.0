Return-Path: <linux-kbuild+bounces-10254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0DCD1831
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 20:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A82973011EE7
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 19:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF03B346FB9;
	Fri, 19 Dec 2025 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u8GVrye0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9C3446CF
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170810; cv=none; b=GkoreaIWqXhO3O37ILyJ45v2DCi2eQxuzz35Q/S6PrbPMUaFyDYrLIw674OrtUU4kbtkttzbFqnUdorXqhTTPQElm+sf3pmmXSIqf9lg+Q/48o6rMxkyM895t6axd4KRVeVmF5XHsw7ZKoBd8xZoEqSdxdI5sJ69/K0j44LP3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170810; c=relaxed/simple;
	bh=6nVwYAr/28iXfyAKwK1DX5nbqNqngIVOUPH7BBKBWP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3bZu5d2b7ARxYDgxAJkYbKWYL0/sdVCH4GJ/Lr+0TWStw26jDLQ8mK1J2cZFLRDl0cPBMBus9JriwzyXCh54o8AXD6TDVgGI8kQ4Gk3odjnJ3dyS48FFmZp7m7u/LvXtMzucehj8eiSUKSo1khEJI6/L1oE+eReUrjtovg4t6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u8GVrye0; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-11b6bc976d6so4672661c88.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 11:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766170807; x=1766775607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D/odPIAsEqnlw6wHnS+qyMx9or3tLcz+4e0MlLzaxNc=;
        b=u8GVrye0GBKrdyDLvnAKwGoag1oRfFV6RzNFTWTT8ok/wwYePBg4VuV+HUkBZQSPa7
         taNhFgQzwZse7qK9c7XA65nvO/nwvuwQwJKKjm29xLaPJYaIOscAWzurpL0OPKKjXLb6
         oPfS0V1VdbpafeRkUiFBraX0Hj0m8D3MsOE7UfXNoEGOt0LUcerCeUHVrQStgV3aZPsd
         TEjQ8Ab5Et/fLANBKVI1qTdEJ0tTBAZFF0yJnefR9d5+e+BF1N73azpotqS9dilWWGJ1
         MczJZ26bdpYL7FYPsvygwP8bTyhsPvwuZjgSdIPtKaFtCXgqFsb+lmQjvzqAKbXQu+ZZ
         URtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766170807; x=1766775607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/odPIAsEqnlw6wHnS+qyMx9or3tLcz+4e0MlLzaxNc=;
        b=CZHHBnIFM5Jz5OYaRmmJDKr+s4ETCHF9XU9OnUridmXbOjC/bGy3IxcKiDp/yhpWCb
         oxaR43zyNeYIgJOcJPUOW06vXW/NvCshgFOPatxaDs5+MNDc/Qqqp50MTtfKqWTmsEp2
         mQvWRh9yW9PtXrbX30FqhnSmkQU3qpsc1rkKLK8T9ow4EpobZbmHYXTlQnEhJqrFrTA1
         N4TW4fK4aDcDbrKpPdbXT2np65u7XFpdXPh9zoK2wufmzwvnhfEqDxGBFinU3sBRemUl
         VeueIdXm2qI9krWXA5DCvDQtlnrTOj5EelO67MtJWiQWTGm6H5qCqVzQthoU+bQWHXhw
         X0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXG2va7t7z/aKcxsme/vMdChOCic4wpdHlh3Mf4wxHe0gJRwi7zVYZtu+LFicammZhb5Nym59JBzkWC/MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPbHmt556SEtQdDSuLY7J0O73ixES4+qD5ow8CMyedC19uFHL
	aVo5SvUhSfZYSs0REiDVhOISE+ol3Dj0m32XxfyxDMdgvC2107UubPF/UDpuGoNGat7NT/97Z0u
	N3/0EAqjzIWlfJsb9FXGH7Fd7oaSESNFZk99ZDWK8
X-Gm-Gg: AY/fxX76Hh2g0R4Wo3NKiphxNEPgTFVZGMZ9YRfolop0JSTWaMvbSX9p2mGBoZrNaWg
	8R/mvKSbTFBtJG9TWGkOjLZUSkB0wEpfUkeoEiCTvHyrSqyFBXG9ZZ87ZNeLsQObMV3MsVIk066
	ygiM3pIE2cgR+O4VCwxiWGSpY6mkTLSlxbAriXRamMnWcp/xwlHrRemav+NYKhM6i0rWEo6GONQ
	UKreB2hbHoIhq6JvToX5sSIaHqP6ApagaC0O9bRA4CAfTfL1j3pwlQUmSVoj4rH55gXAzY73iQJ
	cArhBfeMtWOltlwvNuCsZP87mjc=
X-Google-Smtp-Source: AGHT+IGI6fhGlCAK5gIWEv2jikK+I6nNqMuicJ/gn32IfnfyLg/3iMMiK5+5k7SD7xWkO1DmvhdstHNBA0RnTPGiyR4=
X-Received: by 2002:a05:7022:688:b0:119:e569:f86c with SMTP id
 a92af1059eb24-12171a75857mr5077504c88.9.1766170806408; Fri, 19 Dec 2025
 11:00:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-3-elver@google.com>
 <97e832b7-04a9-49cb-973a-bf9870c21c2f@acm.org>
In-Reply-To: <97e832b7-04a9-49cb-973a-bf9870c21c2f@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 19:59:29 +0100
X-Gm-Features: AQt7F2ouc-8nhWnrDvuFRBnm-IOIeCWwTeXWCxaDLix1ft6mKkghBhqY0U-N9rY
Message-ID: <CANpmjNM=4baTiSWGOiSWLfQV2YqMt6qkdV__uj+QtD4zAY8Weg@mail.gmail.com>
Subject: Re: [PATCH v5 02/36] compiler-context-analysis: Add infrastructure
 for Context Analysis with Clang
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

On Fri, 19 Dec 2025 at 19:39, 'Bart Van Assche' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On 12/19/25 7:39 AM, Marco Elver wrote:
> > +#if defined(WARN_CONTEXT_ANALYSIS)
> > +
> > +/*
> > + * These attributes define new context lock (Clang: capability) types.
> > + * Internal only.
> > + */
>
> How can macros be "internal only" that are defined in a header file that
> will be included by almost all kernel code? Please consider changing
> "internal only" into something that is more clear, e.g. "should only be
> used in the macro definitions in this header file".

Sure, comment could be improved.

Let's say they aren't for general use by normal code that just enables
the analysis for checking; for that we define the shorter (retaining
previous names already in use) ones below. But some of these
attributes can and are used by implementing support for some of the
synchronization primitives.

> > +/*
> > + * The below are used to annotate code being checked. Internal only.
> > + */
>
> Same comment here about "internal only".

Sure, can be clarified.

> > +/**
> > + * context_lock_struct() - declare or define a context lock struct
> > + * @name: struct name
> > + *
> > + * Helper to declare or define a struct type that is also a context lock.
> > + *
> > + * .. code-block:: c
> > + *
> > + *   context_lock_struct(my_handle) {
> > + *           int foo;
> > + *           long bar;
> > + *   };
> > + *
> > + *   struct some_state {
> > + *           ...
> > + *   };
> > + *   // ... declared elsewhere ...
> > + *   context_lock_struct(some_state);
> > + *
> > + * Note: The implementation defines several helper functions that can acquire
> > + * and release the context lock.
> > + */
> > +# define context_lock_struct(name, ...)                                                                      \
> > +     struct __ctx_lock_type(name) __VA_ARGS__ name;                                                  \
> > +     static __always_inline void __acquire_ctx_lock(const struct name *var)                          \
> > +             __attribute__((overloadable)) __no_context_analysis __acquires_ctx_lock(var) { }        \
> > +     static __always_inline void __acquire_shared_ctx_lock(const struct name *var)                   \
> > +             __attribute__((overloadable)) __no_context_analysis __acquires_shared_ctx_lock(var) { } \
> > +     static __always_inline bool __try_acquire_ctx_lock(const struct name *var, bool ret)            \
> > +             __attribute__((overloadable)) __no_context_analysis __try_acquires_ctx_lock(1, var)     \
> > +     { return ret; }                                                                                 \
> > +     static __always_inline bool __try_acquire_shared_ctx_lock(const struct name *var, bool ret)     \
> > +             __attribute__((overloadable)) __no_context_analysis __try_acquires_shared_ctx_lock(1, var) \
> > +     { return ret; }                                                                                 \
> > +     static __always_inline void __release_ctx_lock(const struct name *var)                          \
> > +             __attribute__((overloadable)) __no_context_analysis __releases_ctx_lock(var) { }        \
> > +     static __always_inline void __release_shared_ctx_lock(const struct name *var)                   \
> > +             __attribute__((overloadable)) __no_context_analysis __releases_shared_ctx_lock(var) { } \
> > +     static __always_inline void __assume_ctx_lock(const struct name *var)                           \
> > +             __attribute__((overloadable)) __assumes_ctx_lock(var) { }                               \
> > +     static __always_inline void __assume_shared_ctx_lock(const struct name *var)                    \
> > +             __attribute__((overloadable)) __assumes_shared_ctx_lock(var) { }                        \
> > +     struct name
>
> I'm concerned that the context_lock_struct() macro will make code harder
> to read. Anyone who encounters the context_lock_struct() macro will have
> to look up its definition to learn what it does. I propose to split this
> macro into two macros:
> * One macro that expands into "__ctx_lock_type(name)".
> * A second macro that expands into the rest of the above macro.
>
> In other words, instead of having to write
> context_lock_struct(struct_name, { ... }); developers will have to write
>
> struct context_lock_type struct_name {
>      ...;
> };
> context_struct_helper_functions(struct_name);

This doesn't necessarily help with not having to look up its
definition to learn what it does.

If this is the common pattern, it will blindly be repeated, and this
adds 1 more line and makes this a bit more verbose. Maybe the helper
functions aren't always needed, but I also think that context lock
types should remain relatively few.  For all synchronization
primitives that were enabled in this series, the helpers are required.

The current usage is simply:

context_lock_struct(name) {
   ... struct goes here ...
};  // note no awkward ) brace

I don't know which way the current kernel style is leaning towards,
but if we take <linux/cleanup.h> as an example, a simple programming
model / API is actually preferred.

> My opinion is that the alternative that I'm proposing is easier to read.
> Additionally, it doesn't break existing tools that support jumping from
> the name of a struct to its definition, e.g. ctags and etags.
>
> > +config WARN_CONTEXT_ANALYSIS_ALL
> > +     bool "Enable context analysis for all source files"
> > +     depends on WARN_CONTEXT_ANALYSIS
> > +     depends on EXPERT && !COMPILE_TEST
> > +     help
> > +       Enable tree-wide context analysis. This is likely to produce a
> > +       large number of false positives - enable at your own risk.
> > +
> > +       If unsure, say N.
>
> Why !COMPILE_TEST?

That's the idiomatic way to prevent this being enabled in allyesconfig
builds, and other compile-only random configs enabling this and then
stumbling over 1000s of warnings.

Thanks,
-- Marco

