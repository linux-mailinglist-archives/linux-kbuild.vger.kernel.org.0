Return-Path: <linux-kbuild+bounces-8898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E536FB85E0E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 18:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0F61C86921
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A16312811;
	Thu, 18 Sep 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mc6oyTQI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73230BB98
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211119; cv=none; b=nq8YrKeta/weRtrqppi3Pw+SDFvf36zmi+OU5Rykm8ymPnGIwLd+dHPc49DscBxlQR9n0EOLE70e74X6CpIjFvnUf0JDVkgwFZ6/jtmCFkTbh1prlWUWdbHhYoLqm6JRtSIb3nA4LqksUNllDEk82KYWiyRDFy4jAahdD5UGxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211119; c=relaxed/simple;
	bh=I8UEtjXU46jJhuEKLiJdBTNXeGheuAWIiwiVrxqmA64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhjCVQrhUNEH9AEvGPreEo+qO0ZWQG1bntuDBxV62Ff4aZtUOgo+SPDpVo5TEnbjDYj5AHoNDkD/qeTLr+lkgucyxVmabuaZ6UCdxMYDUTpiVsZ15+Mu5EmupbN1JhhFLIksVvRE0ib8pppTpYEyq1ECMtYLzo9glFuZTz3rZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mc6oyTQI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2699ed6d473so142115ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 08:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758211116; x=1758815916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=895yZWLFbl1D+NZ1+1PqGczhz6l6vISR4vdW5wFU+tM=;
        b=mc6oyTQIlsJ8uOTPAiztdcSZm0ZfPc7bpcyIEGuE5FgLQJDi+VjBPKHo9E6drGdNpD
         HqPO9nUM68CWSSQl98a7dLc6cN67RCFEQbkBilrt6/CMVX6cCkXednLu1HdsUfexXadp
         /w1WiCY2KNPMh2CtlO4Q0/tCGAnz+AIsab4qyT7D1ttsiOHTwMah0STmEPR6cZMxGz2T
         9XoNssN699E90o8hOMzn3osWEWOjV55UNsAr5uZNAtLS7G/5un/Ebxy+s3m3awgaL0r0
         UKi5Qkl7kVkYSEKgeDhzM5ga5hoQW1K2W7BQpkVbje5VtqpGf1jvncQZ1vrGibuiqJeD
         Nc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758211116; x=1758815916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=895yZWLFbl1D+NZ1+1PqGczhz6l6vISR4vdW5wFU+tM=;
        b=Ap7Z8fk2iRLZL58nMwvESrqcJxXzSLqvVfD8XKGUGjmsY9ToQ9KDxYD7y1i05DCEFc
         YHYvRZWFNDGvoUYiaE8HOKwDPqh9DSIEqtB8mBlW/RLOuk4VEdOGS0+twV8yj2etNDPz
         OE8zwcmwjYS/oWTmfIoFSkTTrXkCmTnfQ5dyqMkkZn8XDfjKoZWGHQJD0rXtLKz8SZyy
         E/fLb6yXYAkQRlwpNc95JgzEpv6FWBoxQ4l8PSVbPSnm7Bw7pCBRG9OVG0n8GKjFxW42
         VIfOGErn5PI7jllSXDqYHfwAKWpiye4Umn/Zt9ll1v6gPFbmK5UuPXj55G8GWygG0bbp
         I/jg==
X-Forwarded-Encrypted: i=1; AJvYcCUraVEbdNyA0cSwSFQJ9cK9FlFA/KW37KU1YWkxTRoBxIRB2AOeqxCFWaFBnF4X6R3maJKaO21Zp9N5Rug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvO7cgqqYnJ+bxVXAJyPxgM1FYNi3U6Ax2PpP8Sh6m6bgd6rNX
	PHa8HsPExaR8SDDGc5N/Za4zRfMmlXH3mHFffyYNudZe0phi/gv5F8OTCXszRPz0Ji5ChgJHr7w
	V3kgnwmrWtSZYOqQoSjmiI7c8rdBTeKUxkOUAqX8p
X-Gm-Gg: ASbGncvSb2iDeQpydcBdRdS4T/S+Mi/DuGyaQtYUrM1OTGtZ+7HM+Wjzx3AK+w++i1z
	xbhGf4rXhm5jY65U2g90HOoggpMUhPcTsMDnKp37sg3XrwLVfVg/F7zWqGUAZkYWJAGM4gYuW+T
	1FXXtSE0qkmoT4GMVznwiBLBSaHgvyZc8xvQI7U6fBpvgHItwBkzWk0WoddwZIhrKDN6ogwDM3r
	xK6+/dv9gEf1zorPckQOGv12eVJT70hNHcc2M8KPW2dbGN2mXDEU+p3lzoLZNyGaQtEVTT8sw==
X-Google-Smtp-Source: AGHT+IEllvyydsEe1jGCrMndYyia3WbtoHq7G7cIuBLtbAVxIqOwU7Amw//Va86anz3sh38CtXwP5BRGrqX+2dMybpY=
X-Received: by 2002:a17:902:e5cb:b0:24b:1741:1a4c with SMTP id
 d9443c01a7336-26800b2b62cmr10535325ad.0.1758211115340; Thu, 18 Sep 2025
 08:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <20250918140451.1289454-3-elver@google.com>
In-Reply-To: <20250918140451.1289454-3-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 18 Sep 2025 08:58:24 -0700
X-Gm-Features: AS18NWCmIr3tBq_ItIgZLmVErJr2S-etkG0Czo79LasUH7zn78brxTQjhP3i8s4
Message-ID: <CAP-5=fUfbMAKrLC_z04o9r0kGZ02tpHfv8cOecQAQaYPx44awA@mail.gmail.com>
Subject: Re: [PATCH v3 02/35] compiler-capability-analysis: Add infrastructure
 for Clang's capability analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
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
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 7:05=E2=80=AFAM Marco Elver <elver@google.com> wrot=
e:
>
> Capability analysis is a C language extension, which enables statically
> checking that user-definable "capabilities" are acquired and released whe=
re
> required. An obvious application is lock-safety checking for the kernel's
> various synchronization primitives (each of which represents a "capabilit=
y"),
> and checking that locking rules are not violated.
>
> Clang originally called the feature "Thread Safety Analysis" [1], with
> some terminology still using the thread-safety-analysis-only names. This
> was later changed and the feature became more flexible, gaining the
> ability to define custom "capabilities". Its foundations can be found in
> "capability systems", used to specify the permissibility of operations
> to depend on some capability being held (or not held).
>
> [1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
> [2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf
>
> Because the feature is not just able to express capabilities related to
> synchronization primitives, the naming chosen for the kernel departs
> from Clang's initial "Thread Safety" nomenclature and refers to the
> feature as "Capability Analysis" to avoid confusion. The implementation
> still makes references to the older terminology in some places, such as
> `-Wthread-safety` being the warning enabled option that also still
> appears in diagnostic messages.
>
> See more details in the kernel-doc documentation added in this and the
> subsequent changes.
>
> Clang version 22+ is required.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v3:
> * Require Clang 22 or later (reentrant capabilities, basic alias analysis=
).
> * Rename __assert_cap/__asserts_cap -> __assume_cap/__assumes_cap (sugges=
ted by Peter).
> * Add __acquire_ret and __acquire_shared_ret helper macros - can be used
>   to define function-like macros that return objects which contains a
>   held capabilities. Works now because of capability alias analysis.
> * Add capability_unsafe_alias() helper, where the analysis rightfully
>   points out we're doing strange things with aliases but we don't care.
> * Support multi-argument attributes.
>
> v2:
> * New -Wthread-safety feature rename to -Wthread-safety-pointer (was
>   -Wthread-safety-addressof).
> * Introduce __capability_unsafe() function attribute.
> * Rename __var_guarded_by to simply __guarded_by. The initial idea was
>   to be explicit if the variable or pointed-to data is guarded by, but
>   having a shorter attribute name is likely better long-term.
> * Rename __ref_guarded_by to __pt_guarded_by (pointed-to guarded by).
> ---
>  Makefile                                     |   1 +
>  include/linux/compiler-capability-analysis.h | 449 ++++++++++++++++++-
>  lib/Kconfig.debug                            |  31 ++
>  scripts/Makefile.capability-analysis         |   7 +
>  scripts/Makefile.lib                         |  10 +
>  5 files changed, 491 insertions(+), 7 deletions(-)
>  create mode 100644 scripts/Makefile.capability-analysis
>
> diff --git a/Makefile b/Makefile
> index cf37b9407821..2c91730e513b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1096,6 +1096,7 @@ include-$(CONFIG_RANDSTRUCT)      +=3D scripts/Make=
file.randstruct
>  include-$(CONFIG_KSTACK_ERASE) +=3D scripts/Makefile.kstack_erase
>  include-$(CONFIG_AUTOFDO_CLANG)        +=3D scripts/Makefile.autofdo
>  include-$(CONFIG_PROPELLER_CLANG)      +=3D scripts/Makefile.propeller
> +include-$(CONFIG_WARN_CAPABILITY_ANALYSIS) +=3D scripts/Makefile.capabil=
ity-analysis
>  include-$(CONFIG_GCC_PLUGINS)  +=3D scripts/Makefile.gcc-plugins
>
>  include $(addprefix $(srctree)/, $(include-y))
> diff --git a/include/linux/compiler-capability-analysis.h b/include/linux=
/compiler-capability-analysis.h
> index 7546ddb83f86..6f3f185478bc 100644
> --- a/include/linux/compiler-capability-analysis.h
> +++ b/include/linux/compiler-capability-analysis.h
> @@ -6,27 +6,462 @@
>  #ifndef _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
>  #define _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
>
> +#if defined(WARN_CAPABILITY_ANALYSIS)
> +
> +/*
> + * The below attributes are used to define new capability types. Interna=
l only.
> + */
> +# define __cap_type(name)                      __attribute__((capability=
(#name)))
> +# define __reentrant_cap                       __attribute__((reentrant_=
capability))
> +# define __acquires_cap(...)                   __attribute__((acquire_ca=
pability(__VA_ARGS__)))
> +# define __acquires_shared_cap(...)            __attribute__((acquire_sh=
ared_capability(__VA_ARGS__)))
> +# define __try_acquires_cap(ret, var)          __attribute__((try_acquir=
e_capability(ret, var)))
> +# define __try_acquires_shared_cap(ret, var)   __attribute__((try_acquir=
e_shared_capability(ret, var)))
> +# define __releases_cap(...)                   __attribute__((release_ca=
pability(__VA_ARGS__)))
> +# define __releases_shared_cap(...)            __attribute__((release_sh=
ared_capability(__VA_ARGS__)))
> +# define __assumes_cap(...)                    __attribute__((assert_cap=
ability(__VA_ARGS__)))
> +# define __assumes_shared_cap(...)             __attribute__((assert_sha=
red_capability(__VA_ARGS__)))
> +# define __returns_cap(var)                    __attribute__((lock_retur=
ned(var)))
> +
> +/*
> + * The below are used to annotate code being checked. Internal only.
> + */
> +# define __excludes_cap(...)           __attribute__((locks_excluded(__V=
A_ARGS__)))
> +# define __requires_cap(...)           __attribute__((requires_capabilit=
y(__VA_ARGS__)))
> +# define __requires_shared_cap(...)    __attribute__((requires_shared_ca=
pability(__VA_ARGS__)))
> +
> +/**
> + * __guarded_by - struct member and globals attribute, declares variable
> + *                protected by capability
> + *
> + * Declares that the struct member or global variable must be guarded by=
 the
> + * given capabilities. Read operations on the data require shared access=
,
> + * while write operations require exclusive access.
> + *
> + * .. code-block:: c
> + *
> + *     struct some_state {
> + *             spinlock_t lock;
> + *             long counter __guarded_by(&lock);
> + *     };
> + */
> +# define __guarded_by(...)             __attribute__((guarded_by(__VA_AR=
GS__)))
> +
> +/**
> + * __pt_guarded_by - struct member and globals attribute, declares point=
ed-to
> + *                   data is protected by capability
> + *
> + * Declares that the data pointed to by the struct member pointer or glo=
bal
> + * pointer must be guarded by the given capabilities. Read operations on=
 the
> + * data require shared access, while write operations require exclusive =
access.
> + *
> + * .. code-block:: c
> + *
> + *     struct some_state {
> + *             spinlock_t lock;
> + *             long *counter __pt_guarded_by(&lock);
> + *     };
> + */
> +# define __pt_guarded_by(...)          __attribute__((pt_guarded_by(__VA=
_ARGS__)))
> +
> +/**
> + * struct_with_capability() - declare or define a capability struct
> + * @name: struct name
> + *
> + * Helper to declare or define a struct type with capability of the same=
 name.
> + *
> + * .. code-block:: c
> + *
> + *     struct_with_capability(my_handle) {
> + *             int foo;
> + *             long bar;
> + *     };
> + *
> + *     struct some_state {
> + *             ...
> + *     };
> + *     // ... declared elsewhere ...
> + *     struct_with_capability(some_state);
> + *
> + * Note: The implementation defines several helper functions that can ac=
quire,
> + * release, and assert the capability.
> + */
> +# define struct_with_capability(name, ...)                              =
                               \
> +       struct __cap_type(name) __VA_ARGS__ name;                        =
                               \
> +       static __always_inline void __acquire_cap(const struct name *var)=
                               \
> +               __attribute__((overloadable)) __no_capability_analysis __=
acquires_cap(var) { }          \
> +       static __always_inline void __acquire_shared_cap(const struct nam=
e *var)                        \
> +               __attribute__((overloadable)) __no_capability_analysis __=
acquires_shared_cap(var) { }   \
> +       static __always_inline bool __try_acquire_cap(const struct name *=
var, bool ret)                 \
> +               __attribute__((overloadable)) __no_capability_analysis __=
try_acquires_cap(1, var)       \
> +       { return ret; }                                                  =
                               \
> +       static __always_inline bool __try_acquire_shared_cap(const struct=
 name *var, bool ret)          \
> +               __attribute__((overloadable)) __no_capability_analysis __=
try_acquires_shared_cap(1, var) \
> +       { return ret; }                                                  =
                               \
> +       static __always_inline void __release_cap(const struct name *var)=
                               \
> +               __attribute__((overloadable)) __no_capability_analysis __=
releases_cap(var) { }          \
> +       static __always_inline void __release_shared_cap(const struct nam=
e *var)                        \
> +               __attribute__((overloadable)) __no_capability_analysis __=
releases_shared_cap(var) { }   \
> +       static __always_inline void __assume_cap(const struct name *var) =
                               \
> +               __attribute__((overloadable)) __assumes_cap(var) { }     =
                               \
> +       static __always_inline void __assume_shared_cap(const struct name=
 *var)                         \
> +               __attribute__((overloadable)) __assumes_shared_cap(var) {=
 }                             \
> +       struct name
> +
> +/**
> + * disable_capability_analysis() - disables capability analysis
> + *
> + * Disables capability analysis. Must be paired with a later
> + * enable_capability_analysis().
> + */
> +# define disable_capability_analysis()                         \
> +       __diag_push();                                          \
> +       __diag_ignore_all("-Wunknown-warning-option", "")       \
> +       __diag_ignore_all("-Wthread-safety", "")                \
> +       __diag_ignore_all("-Wthread-safety-pointer", "")
> +
> +/**
> + * enable_capability_analysis() - re-enables capability analysis
> + *
> + * Re-enables capability analysis. Must be paired with a prior
> + * disable_capability_analysis().
> + */
> +# define enable_capability_analysis() __diag_pop()
> +
> +/**
> + * __no_capability_analysis - function attribute, disables capability an=
alysis
> + *
> + * Function attribute denoting that capability analysis is disabled for =
the
> + * whole function. Prefer use of `capability_unsafe()` where possible.
> + */
> +# define __no_capability_analysis      __attribute__((no_thread_safety_a=
nalysis))
> +
> +#else /* !WARN_CAPABILITY_ANALYSIS */
> +
> +# define __cap_type(name)
> +# define __reentrant_cap
> +# define __acquires_cap(...)
> +# define __acquires_shared_cap(...)
> +# define __try_acquires_cap(ret, var)
> +# define __try_acquires_shared_cap(ret, var)
> +# define __releases_cap(...)
> +# define __releases_shared_cap(...)
> +# define __assumes_cap(...)
> +# define __assumes_shared_cap(...)
> +# define __returns_cap(var)
> +# define __guarded_by(...)
> +# define __pt_guarded_by(...)
> +# define __excludes_cap(...)
> +# define __requires_cap(...)
> +# define __requires_shared_cap(...)
> +# define __acquire_cap(var)                    do { } while (0)
> +# define __acquire_shared_cap(var)             do { } while (0)
> +# define __try_acquire_cap(var, ret)           (ret)
> +# define __try_acquire_shared_cap(var, ret)    (ret)
> +# define __release_cap(var)                    do { } while (0)
> +# define __release_shared_cap(var)             do { } while (0)
> +# define __assume_cap(var)                     do { (void)(var); } while=
 (0)
> +# define __assume_shared_cap(var)              do { (void)(var); } while=
 (0)
> +# define struct_with_capability(name, ...)     struct __VA_ARGS__ name
> +# define disable_capability_analysis()
> +# define enable_capability_analysis()
> +# define __no_capability_analysis
> +
> +#endif /* WARN_CAPABILITY_ANALYSIS */
> +
> +/**
> + * capability_unsafe() - disable capability checking for contained code
> + *
> + * Disables capability checking for contained statements or expression.
> + *
> + * .. code-block:: c
> + *
> + *     struct some_data {
> + *             spinlock_t lock;
> + *             int counter __guarded_by(&lock);
> + *     };
> + *
> + *     int foo(struct some_data *d)
> + *     {
> + *             // ...
> + *             // other code that is still checked ...
> + *             // ...
> + *             return capability_unsafe(d->counter);
> + *     }
> + */
> +#define capability_unsafe(...)         \
> +({                                     \
> +       disable_capability_analysis();  \
> +       __VA_ARGS__;                    \
> +       enable_capability_analysis()    \
> +})
> +
> +/**
> + * __capability_unsafe() - function attribute, disable capability checki=
ng
> + * @comment: comment explaining why opt-out is safe
> + *
> + * Function attribute denoting that capability analysis is disabled for =
the
> + * whole function. Forces adding an inline comment as argument.
> + */
> +#define __capability_unsafe(comment) __no_capability_analysis
> +
> +/**
> + * capability_unsafe_alias() - helper to insert a capability "alias barr=
ier"
> + * @p: pointer aliasing a capability or object containing capabilities
> + *
> + * No-op function that acts as a "capability alias barrier", where the a=
nalysis
> + * rightfully detects that we're switching aliases, but the switch is co=
nsidered
> + * safe but beyond the analysis reasoning abilities.
> + *
> + * This should be inserted before the first use of such an alias.
> + *
> + * Implementation Note: The compiler ignores aliases that may be reassig=
ned but
> + * their value cannot be determined (e.g. when passing a non-const point=
er to an
> + * alias as a function argument).
> + */
> +#define capability_unsafe_alias(p) _capability_unsafe_alias((void **)&(p=
))
> +static inline void _capability_unsafe_alias(void **p) { }
> +
> +/**
> + * token_capability() - declare an abstract global capability instance
> + * @name: token capability name
> + *
> + * Helper that declares an abstract global capability instance @name tha=
t can be
> + * used as a token capability, but not backed by a real data structure (=
linker
> + * error if accidentally referenced). The type name is `__capability_@na=
me`.
> + */
> +#define token_capability(name, ...)                                    \
> +       struct_with_capability(__capability_##name, ##__VA_ARGS__) {};  \
> +       extern const struct __capability_##name *name
> +
> +/**
> + * token_capability_instance() - declare another instance of a global ca=
pability
> + * @cap: token capability previously declared with token_capability()
> + * @name: name of additional global capability instance
> + *
> + * Helper that declares an additional instance @name of the same token
> + * capability class @name. This is helpful where multiple related token
> + * capabilities are declared, as it also allows using the same underlyin=
g type
> + * (`__capability_@cap`) as function arguments.
> + */
> +#define token_capability_instance(cap, name)           \
> +       extern const struct __capability_##cap *name
> +
> +/*
> + * Common keywords for static capability analysis. Both Clang's capabili=
ty
> + * analysis and Sparse's context tracking are currently supported.
> + */
>  #ifdef __CHECKER__
>
>  /* Sparse context/lock checking support. */
>  # define __must_hold(x)                __attribute__((context(x,1,1)))
> +# define __must_not_hold(x)
>  # define __acquires(x)         __attribute__((context(x,0,1)))
>  # define __cond_acquires(x)    __attribute__((context(x,0,-1)))
>  # define __releases(x)         __attribute__((context(x,1,0)))
>  # define __acquire(x)          __context__(x,1)
>  # define __release(x)          __context__(x,-1)
>  # define __cond_lock(x, c)     ((c) ? ({ __acquire(x); 1; }) : 0)
> +/* For Sparse, there's no distinction between exclusive and shared locks=
. */
> +# define __must_hold_shared    __must_hold
> +# define __acquires_shared     __acquires
> +# define __cond_acquires_shared __cond_acquires
> +# define __releases_shared     __releases
> +# define __acquire_shared      __acquire
> +# define __release_shared      __release
> +# define __cond_lock_shared    __cond_acquire
>
>  #else /* !__CHECKER__ */
>
> -# define __must_hold(x)
> -# define __acquires(x)
> -# define __cond_acquires(x)
> -# define __releases(x)
> -# define __acquire(x)          (void)0
> -# define __release(x)          (void)0
> -# define __cond_lock(x, c)     (c)
> +/**
> + * __must_hold() - function attribute, caller must hold exclusive capabi=
lity
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the caller must hold the given capa=
bility
> + * instance @x exclusively.
> + */
> +# define __must_hold(x)                __requires_cap(x)
> +
> +/**
> + * __must_not_hold() - function attribute, caller must not hold capabili=
ty
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the caller must not hold the given
> + * capability instance @x.
> + */
> +# define __must_not_hold(x)    __excludes_cap(x)
> +
> +/**
> + * __acquires() - function attribute, function acquires capability exclu=
sively
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the function acquires the given
> + * capability instance @x exclusively, but does not release it.
> + */
> +# define __acquires(x)         __acquires_cap(x)
> +
> +/**
> + * __cond_acquires() - function attribute, function conditionally
> + *                     acquires a capability exclusively
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the function conditionally acquires=
 the
> + * given capability instance @x exclusively, but does not release it.
> + */
> +# define __cond_acquires(x)    __try_acquires_cap(1, x)
> +
> +/**
> + * __releases() - function attribute, function releases a capability exc=
lusively
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the function releases the given cap=
ability
> + * instance @x exclusively. The capability must be held on entry.
> + */
> +# define __releases(x)         __releases_cap(x)
> +
> +/**
> + * __acquire() - function to acquire capability exclusively
> + * @x: capability instance pointer
> + *
> + * No-op function that acquires the given capability instance @x exclusi=
vely.
> + */
> +# define __acquire(x)          __acquire_cap(x)
> +
> +/**
> + * __release() - function to release capability exclusively
> + * @x: capability instance pointer
> + *
> + * No-op function that releases the given capability instance @x.
> + */
> +# define __release(x)          __release_cap(x)
> +
> +/**
> + * __cond_lock() - function that conditionally acquires a capability
> + *                 exclusively
> + * @x: capability instance pinter
> + * @c: boolean expression
> + *
> + * Return: result of @c
> + *
> + * No-op function that conditionally acquires capability instance @x
> + * exclusively, if the boolean expression @c is true. The result of @c i=
s the
> + * return value, to be able to create a capability-enabled interface; fo=
r
> + * example:
> + *
> + * .. code-block:: c
> + *
> + *     #define spin_trylock(l) __cond_lock(&lock, _spin_trylock(&lock))
> + */
> +# define __cond_lock(x, c)     __try_acquire_cap(x, c)
> +
> +/**
> + * __must_hold_shared() - function attribute, caller must hold shared ca=
pability
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the caller must hold the given capa=
bility
> + * instance @x with shared access.
> + */
> +# define __must_hold_shared(x) __requires_shared_cap(x)
> +
> +/**
> + * __acquires_shared() - function attribute, function acquires capabilit=
y shared
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the function acquires the given
> + * capability instance @x with shared access, but does not release it.
> + */
> +# define __acquires_shared(x)  __acquires_shared_cap(x)
> +
> +/**
> + * __cond_acquires_shared() - function attribute, function conditionally
> + *                            acquires a capability shared
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the function conditionally acquires=
 the
> + * given capability instance @x with shared access, but does not release=
 it.
> + */
> +# define __cond_acquires_shared(x) __try_acquires_shared_cap(1, x)
> +
> +/**
> + * __releases_shared() - function attribute, function releases a
> + *                       capability shared
> + * @x: capability instance pointer
> + *
> + * Function attribute declaring that the function releases the given cap=
ability
> + * instance @x with shared access. The capability must be held on entry.
> + */
> +# define __releases_shared(x)  __releases_shared_cap(x)
> +
> +/**
> + * __acquire_shared() - function to acquire capability shared
> + * @x: capability instance pointer
> + *
> + * No-op function that acquires the given capability instance @x with sh=
ared
> + * access.
> + */
> +# define __acquire_shared(x)   __acquire_shared_cap(x)
> +
> +/**
> + * __release_shared() - function to release capability shared
> + * @x: capability instance pointer
> + *
> + * No-op function that releases the given capability instance @x with sh=
ared
> + * access.
> + */
> +# define __release_shared(x)   __release_shared_cap(x)
> +
> +/**
> + * __cond_lock_shared() - function that conditionally acquires a capabil=
ity
> + *                        shared
> + * @x: capability instance pinter
> + * @c: boolean expression
> + *
> + * Return: result of @c
> + *
> + * No-op function that conditionally acquires capability instance @x wit=
h shared
> + * access, if the boolean expression @c is true. The result of @c is the=
 return
> + * value, to be able to create a capability-enabled interface.
> + */
> +# define __cond_lock_shared(x, c) __try_acquire_shared_cap(x, c)
>
>  #endif /* __CHECKER__ */
>
> +/**
> + * __acquire_ret() - helper to acquire capability of return value
> + * @call: call expression
> + * @ret_expr: acquire expression that uses __ret
> + */
> +#define __acquire_ret(call, ret_expr)          \
> +       ({                                      \
> +               __auto_type __ret =3D call;       \
> +               __acquire(ret_expr);            \
> +               __ret;                          \
> +       })
> +
> +/**
> + * __acquire_shared_ret() - helper to acquire capability shared of retur=
n value
> + * @call: call expression
> + * @ret_expr: acquire shared expression that uses __ret
> + */
> +#define __acquire_shared_ret(call, ret_expr)   \
> +       ({                                      \
> +               __auto_type __ret =3D call;       \
> +               __acquire_shared(ret_expr);     \
> +               __ret;                          \
> +       })
> +
> +/*
> + * Attributes to mark functions returning acquired capabilities. This is=
 purely
> + * cosmetic to help readability, and should be used with the above macro=
s as
> + * follows:
> + *
> + *   struct foo { spinlock_t lock; ... };
> + *   ...
> + *   #define myfunc(...) __acquire_ret(_myfunc(__VA_ARGS__), &__ret->loc=
k)
> + *   struct foo *_myfunc(int bar) __acquires_ret;
> + *   ...
> + */
> +#define __acquires_ret         __no_capability_analysis
> +#define __acquires_shared_ret  __no_capability_analysis
> +
>  #endif /* _LINUX_COMPILER_CAPABILITY_ANALYSIS_H */
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index dc0e0c6ed075..57e09615f88d 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -613,6 +613,37 @@ config DEBUG_FORCE_WEAK_PER_CPU
>           To ensure that generic code follows the above rules, this
>           option forces all percpu variables to be defined as weak.
>
> +config WARN_CAPABILITY_ANALYSIS
> +       bool "Compiler capability-analysis warnings"
> +       depends on CC_IS_CLANG && CLANG_VERSION >=3D 220000
> +       # Branch profiling re-defines "if", which messes with the compile=
r's
> +       # ability to analyze __cond_acquires(..), resulting in false posi=
tives.
> +       depends on !TRACE_BRANCH_PROFILING

Err, wow! What and huh, and why? Crikes. I'm amazed you found such an
option exists. I must be very naive to have never heard of it and now
I wonder if it is needed and load bearing?

Ian


> +       default y
> +       help
> +         Capability analysis is a C language extension, which enables
> +         statically checking that user-definable "capabilities" are acqu=
ired
> +         and released where required.
> +
> +         Clang's name of the feature ("Thread Safety Analysis") refers t=
o
> +         the original name of the feature; it was later expanded to be a
> +         generic "Capability Analysis" framework.
> +
> +         Requires Clang 22 or later.
> +
> +         Produces warnings by default. Select CONFIG_WERROR if you wish =
to
> +         turn these warnings into errors.
> +
> +config WARN_CAPABILITY_ANALYSIS_ALL
> +       bool "Enable capability analysis for all source files"
> +       depends on WARN_CAPABILITY_ANALYSIS
> +       depends on EXPERT && !COMPILE_TEST
> +       help
> +         Enable tree-wide capability analysis. This is likely to produce=
 a
> +         large number of false positives - enable at your own risk.
> +
> +         If unsure, say N.
> +
>  endmenu # "Compiler options"
>
>  menu "Generic Kernel Debugging Instruments"
> diff --git a/scripts/Makefile.capability-analysis b/scripts/Makefile.capa=
bility-analysis
> new file mode 100644
> index 000000000000..e137751a4c9a
> --- /dev/null
> +++ b/scripts/Makefile.capability-analysis
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +capability-analysis-cflags :=3D -DWARN_CAPABILITY_ANALYSIS       \
> +       -fexperimental-late-parse-attributes -Wthread-safety    \
> +       -Wthread-safety-pointer -Wthread-safety-beta
> +
> +export CFLAGS_CAPABILITY_ANALYSIS :=3D $(capability-analysis-cflags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..e0ac273bf9eb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -105,6 +105,16 @@ _c_flags +=3D $(if $(patsubst n%,, \
>         -D__KCSAN_INSTRUMENT_BARRIERS__)
>  endif
>
> +#
> +# Enable capability analysis flags only where explicitly opted in.
> +# (depends on variables CAPABILITY_ANALYSIS_obj.o, CAPABILITY_ANALYSIS)
> +#
> +ifeq ($(CONFIG_WARN_CAPABILITY_ANALYSIS),y)
> +_c_flags +=3D $(if $(patsubst n%,, \
> +               $(CAPABILITY_ANALYSIS_$(target-stem).o)$(CAPABILITY_ANALY=
SIS)$(if $(is-kernel-object),$(CONFIG_WARN_CAPABILITY_ANALYSIS_ALL))), \
> +               $(CFLAGS_CAPABILITY_ANALYSIS))
> +endif
> +
>  #
>  # Enable AutoFDO build flags except some files or directories we don't w=
ant to
>  # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE=
).
> --
> 2.51.0.384.g4c02a37b29-goog
>

