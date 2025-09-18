Return-Path: <linux-kbuild+bounces-8901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED27B8606E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 18:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63761CC0A04
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9481D314D3E;
	Thu, 18 Sep 2025 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ABNtotNi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233F31B819
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212529; cv=none; b=knl+sXWDqcTP+QmPttENeo+Xs0+ywVL9IvRZWPoZ3XdTLYQRUNmu1H+81Qb9ld7EsLmGw4Rf8xyOljNqrKOk+OKUpDgmX0aRPq2uApVah/iVvnBuAQso+XYj5Bx4J0LD70HUzRdl9zi93tiVe5ETwJDtbV2kCzU461W9u49V+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212529; c=relaxed/simple;
	bh=SAhQ4cQqqu3EVycuqcoZ3ffvgqhMm6L5akWnd1NUBCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpnNRAGJnQk0S8nxw+q4ZnwTjn/qK3rE83krzTs4a5VpY6gK+rXMFZhMPJYJPq3SxmBEnsJCIPiH/SA6KucvPmkZz7+n7UjayeRr7ncJF/U2qlOvIfPJsHH8ebLs0whogej6hRn0Rw8j4bqsiSGWCjI2DFkdYz+1Rt8vNbsdR4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ABNtotNi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-265f460ae7bso194635ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758212526; x=1758817326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MVxy+isNSGzxZ1RNWDgxpSBJ+uufmPyWYytHyGJgFE=;
        b=ABNtotNiX/ox4O60Iu1yz/vmqw9LhzvuaKi2tJYkALONhy6KjJUrnZNiHq1jMFhMKR
         L5xNmfjYye7jRZUq5FXAUcp7jqrEkdpC6gKKzWdJop4zDq16AcgkknuHH+OlNSldUvLc
         Nlc7yO/8avjXRSFxXux8FPh8agr+txOIoCXMnVU232F6hFFhXzfyzajrG6icJ1PxjAfv
         4Lrs/2XjbKtvQaPKePDij9DBmDl9QwWHrn3E4bm7xm7xuEswj4fivFcjpyUmQZgLgtEp
         /juVI74RI7gtyROiV7NkAe52w3XO/e5+yUbOqh7Aio4jz5gzSWo/+1Ymsnn9YT3nTZb3
         oOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212526; x=1758817326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MVxy+isNSGzxZ1RNWDgxpSBJ+uufmPyWYytHyGJgFE=;
        b=ubZZgbN/kBdtIsM2Su0wvXYReLJf23ZcO3QJgNEP5vsGnMG+tPrQM0SRWqU43ikvOB
         ykKnyzA1b+fzoasHzCiTpx+UPgPOChX1kgR5yq1woWPISgoB3grZy1xDYcfdisYn4U/n
         I5pI7/Lm0EpymIdYwmr/bsizwz6+9aZAEC33cYn/z7BbvivsLTtm6r17w/nyJXTjDwyO
         Ko/S5Zd/nLbefz3uUIoPHKOSvW0Lxux6sHVXoj4MG9xOF6ip6pAWWuWzwGuZgG8y6pTV
         tWQvDfwk3vcu1mIpJh4ShNTdRoiYhZenAyq9z6FldUcFW0cBu1Sd0WqhSQ+LDmzeC8Yz
         +frg==
X-Forwarded-Encrypted: i=1; AJvYcCWfH/ktkL+OkYqEICdx4ypyUAIrl8F/pS/1G/kED8/uBvJKQ1NW8FNJ7Wl1Q+CpqYZgPFg1iQT2fPj5Rug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jcP7gNovhLBvdPoinL9MfrO8j9FHiKSND9Vv1Z3xPjHyMU3I
	pHpvRkCnB6Kk+SjXbCuAT+5E/xr3FRfDMGc+FvAc6HG2koJBPp7YjCxu0dSU+cFw/mWFZpYM5vj
	ZI3P+vgS8p6/TSVS7dOGGwW+kNBwqicIGXoc9VKCG
X-Gm-Gg: ASbGncsH24B/VV5Y8KF3CHbw205tgCESZ8v0E3wBTua37bo1hFKPPpn1+CcFceA0fnt
	/jIy76Fres32yyLGNcoaSXhbgl3413m7wNWb90rTgw47ohvr+hZWPpAQ+BU9y+HHplf36WsicSW
	jWLhTWfb7UX6YPBfURz0xpXaRzOCWGBKRy9kcN7xkQjg68vnGh0snISCch0CDh3DNFPMbuQFDgY
	Kp8wO38uMmy696ggFvuDvlumSN1NxfxcZQBrlsxeX94y0drm1bcUuiCdugrcVM=
X-Google-Smtp-Source: AGHT+IHxGXO+MQMP4X/HxoMphmnj6jFmVCb1ai8uCipAkHFyHD7uKu4n7L234w2XjgKLmDc8UqgxzQ06juIY0O+RCyk=
X-Received: by 2002:a17:902:d2d1:b0:265:e66:6c10 with SMTP id
 d9443c01a7336-26800eb14c1mr10816965ad.4.1758212525092; Thu, 18 Sep 2025
 09:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 18 Sep 2025 09:21:53 -0700
X-Gm-Features: AS18NWCdr0R3pX49u8RURP-UvB2JdrfJJnKQCP7CUfy991L56-Il3vjCOTsSBN4
Message-ID: <CAP-5=fXBe0_aAep4PPwvfyHPJevMeLffHwA80jec2WVb2ugeYg@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
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
> "capability systems" [2], used to specify the permissibility of
> operations to depend on some capability being held (or not held).
>
> Because the feature is not just able to express capabilities related to
> synchronization primitives, the naming chosen for the kernel departs
> from Clang's initial "Thread Safety" nomenclature and refers to the
> feature as "Capability Analysis" to avoid confusion. The implementation
> still makes references to the older terminology in some places, such as
> `-Wthread-safety` being the warning enabled option that also still
> appears in diagnostic messages.
>
> Enabling capability analysis can be seen as enabling a dialect of Linux
> C with a Capability System.
>
> Additional details can be found in the added kernel-doc documentation.
> An LWN article covered v2 of the series: https://lwn.net/Articles/1012990=
/
>
>  [1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
>  [2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf
>
> =3D=3D=3D Development Approach =3D=3D=3D
>
> Prior art exists in the form of Sparse's context tracking. Locking
> annotations on functions exist, so the concept of analyzing locking rules
> is not foreign to the kernel's codebase.
>
> However, Clang's analysis is more complete vs. Sparse's, with the
> typical trade-offs in static analysis: improved completeness is
> sacrificed for more possible false positives or additional annotations
> required by the programmer. Numerous options exist to disable or opt out
> certain code from analysis.
>
> This series initially aimed to retain compatibility with Sparse, which
> can provide tree-wide analysis of a subset of the capability analysis
> introduced, but it was later decided to drop Sparse compatibility. For
> the most part, the new (and old) keywords used for annotations remain
> the same, and many of the pre-existing annotations remain valid.
>
> One big question is how to enable this feature, given we end up with a
> new dialect of C -- 2 approaches have been considered:
>
>   A. Tree-wide all-or-nothing approach. This approach requires tree-wide
>      changes, adding annotations or selective opt-outs. Making additional
>      primitives capability-enabled increases churn, esp. where maintainer=
s
>      are unaware of the feature's existence and how to use it.
>
> Because we can't change the programming language (even if from one C
> dialect to another) of the kernel overnight, a different approach might
> cause less friction.
>
>   B. A selective, incremental, and much less intrusive approach.
>      Maintainers of subsystems opt in their modules or directories into
>      "capability analysis" (via Makefile):
>
>        CAPABILITY_ANALYSIS_foo.o :=3D y   # foo.o only
>        CAPABILITY_ANALYSIS :=3D y         # all TUs
>
>      Most (eventually all) synchronization primitives and more
>      capabilities (including ones that could track "irq disabled",
>      "preemption" disabled, etc.) could be supported.
>
> The approach taken by this series is B. This ensures that only
> subsystems where maintainers are willing to deal with any warnings are
> opted-in. Introducing the feature can be done incrementally, without
> large tree-wide changes and adding numerous opt-outs and annotations to
> the majority of code.
>
>   Note: Bart Van Assche concurrently worked on enabling -Wthread-safety:
>   https://lore.kernel.org/all/20250206175114.1974171-1-bvanassche@acm.org=
/
>   Bart's work has shown what it might take to go with approach A
>   (tree-wide, restricted to 'mutex' usage). This has shown that the
>   analysis finds real issues when applied to enough subsystems!  We hope
>   this serves as motivation to eventually enable the analysis in as many
>   subsystems as possible, particularly subsystems that are not as easily
>   tested by CI systems and test robots.
>
> =3D=3D=3D Initial Uses =3D=3D=3D
>
> With this initial series, the following synchronization primitives are
> supported: `raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`,
> `seqlock_t`, `bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`,
> `local_lock_t`, `ww_mutex`.
>
> To demonstrate use of the feature on real kernel code, the series also
> enables capability analysis for the following subsystems:
>
>         * kernel/kcov
>         * kernel/kcsan
>         * kernel/sched/
>         * lib/rhashtable
>         * lib/stackdepot
>         * mm/kfence
>         * security/tomoyo
>         * crypto/
>
> The initial benefits are static detection of violations of locking
> rules. As more capabilities are added, we would see more static checking
> beyond what regular C can provide, all while remaining easy (read quick)
> to use via the Clang compiler.
>
>   Note: The kernel already provides dynamic analysis tools Lockdep and
>   KCSAN for lock-safety checking and data-race detection respectively.
>   Unlike those, Clang's capability analysis is a compile-time static
>   analysis with no runtime impact. The static analysis complements
>   existing dynamic analysis tools, as it may catch some issues before
>   even getting into a running kernel, but is *not* a replacement for
>   whole-kernel testing with the dynamic analysis tools enabled!
>
> =3D=3D=3D Appendix =3D=3D=3D
>
> A Clang version that supports `-Wthread-safety-pointer` and the new
> alias-analysis of capability pointers is required (from this version
> onwards):
>
>         https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e6=
10c351a3227f36c92a4 [3]
>
> This series is also available at this Git tree:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/=
log/?h=3Dcap-analysis/dev
>
> =3D=3D=3D Changelog =3D=3D=3D
>
> v3:
>
>   - Bump min. Clang version to 22+ (unreleased), which now supports:
>
>         * re-entrancy via __attribute__((reentrant_capability));
>         * basic form of capability alias analysis [3] - which is the
>           biggest improvement since v2.
>
>     This was the result of conclusions from this discussion:
>     https://lore.kernel.org/all/CANpmjNPquO=3DW1JAh1FNQb8pMQjgeZAKCPQUAd7=
qUg=3D5pjJ6x=3DQ@mail.gmail.com/
>
>   - Rename __asserts_cap/__assert_cap to __assumes_cap/__assume_cap.
>
>   - Switch to DECLARE_LOCK_GUARD_1_ATTRS().
>
>   - Add __acquire_ret and __acquire_shared_ret helper macros - can be
>     used to define function-like macros that return objects which
>     contains a held capabilities. Works now because of capability alias
>     analysis.
>
>   - Add capability_unsafe_alias() helper, where the analysis rightfully
>     points out we're doing strange things with aliases but we don't
>     care.
>
>   - Support multi-argument attributes.
>
>   - Enable for kernel/sched/{core,fair}.c, kernel/kcsan.
>   - Drop drivers/tty changes (revisit later).
>
> v2: https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com=
/
>
>   - Remove Sparse context tracking support - after the introduction of
>     Clang support, so that backports can skip removal of Sparse support.
>
>   - Remove __cond_lock() function-like helper.
>
>   - ww_mutex support.
>
>   - -Wthread-safety-addressof was reworked and committed in upstream
>     Clang as -Wthread-safety-pointer.
>
>   - Make __cond_acquires() and __cond_acquires_shared() take abstract
>     value, since compiler only cares about zero and non-zero.
>
>   - Rename __var_guarded_by to simply __guarded_by. Initially the idea
>     was to be explicit about if the variable itself or the pointed-to
>     data is guarded, but in the long-term, making this shorter might be
>     better.
>
>   - Likewise rename __ref_guarded_by to __pt_guarded_by.
>
>   - Introduce common header warning suppressions - this is a better
>     solution than guarding header inclusions with disable_ +
>     enable_capability_analysis(). Header suppressions are disabled when
>     selecting CONFIG_WARN_CAPABILITY_ANALYSIS_ALL=3Dy. This bumps the
>     minimum Clang version required to 20+.
>
>   - Make the data_race() macro imply disabled capability analysis.
>     Writing capability_unsafe(data_race(..)) is unnecessarily verbose
>     and data_race() on its own already indicates something subtly unsafe
>     is happening.  This change was made after analysis of a finding in
>     security/tomoyo.
>
>   - Enable analysis in the following subsystems as additional examples
>     of larger subsystem. Where it was obvious, the __guarded_by
>     attribute was added to lock-guarded variables to improve coverage.
>
>         * drivers/tty
>         * security/tomoyo
>         * crypto/
>
> RFC v1: https://lore.kernel.org/lkml/20250206181711.1902989-1-elver@googl=
e.com

Thanks for this and lgtm. Fwiw, there is already thread safety
analysis in tools/perf:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/mutex.h?h=3Dperf-tools-next#n43
and we should migrate that code to use this code.

Something that I've wondered about capabilities is to use them for
detecting missing reference count "puts", which feel similar to missed
unlocks. In my experience the sanitizers are weak in this area as in
C++ you can trivially use RAII, however, frustratingly clang's
capability analysis is disabled in C++'s constructors and destructors
(not an issue here :-) and based on my rusty memory). To solve this
for perf (and fix many many bugs) we did a form of runtime RAII:
https://perfwiki.github.io/main/reference-count-checking/
There is likely something better than can be done with the nearly RAII
that is/are cleanups. Trying to make that sane for a data-structure
like an rbtree is hard and maybe rust is just the only solution there.
Anyway, it is great to see thread safety analysis pushed forward.

Thanks,
Ian

> Marco Elver (35):
>   compiler_types: Move lock checking attributes to
>     compiler-capability-analysis.h
>   compiler-capability-analysis: Add infrastructure for Clang's
>     capability analysis
>   compiler-capability-analysis: Add test stub
>   Documentation: Add documentation for Compiler-Based Capability
>     Analysis
>   checkpatch: Warn about capability_unsafe() without comment
>   cleanup: Basic compatibility with capability analysis
>   lockdep: Annotate lockdep assertions for capability analysis
>   locking/rwlock, spinlock: Support Clang's capability analysis
>   compiler-capability-analysis: Change __cond_acquires to take return
>     value
>   locking/mutex: Support Clang's capability analysis
>   locking/seqlock: Support Clang's capability analysis
>   bit_spinlock: Include missing <asm/processor.h>
>   bit_spinlock: Support Clang's capability analysis
>   rcu: Support Clang's capability analysis
>   srcu: Support Clang's capability analysis
>   kref: Add capability-analysis annotations
>   locking/rwsem: Support Clang's capability analysis
>   locking/local_lock: Include missing headers
>   locking/local_lock: Support Clang's capability analysis
>   locking/ww_mutex: Support Clang's capability analysis
>   debugfs: Make debugfs_cancellation a capability struct
>   compiler-capability-analysis: Remove Sparse support
>   compiler-capability-analysis: Remove __cond_lock() function-like
>     helper
>   compiler-capability-analysis: Introduce header suppressions
>   compiler: Let data_race() imply disabled capability analysis
>   MAINTAINERS: Add entry for Capability Analysis
>   kfence: Enable capability analysis
>   kcov: Enable capability analysis
>   kcsan: Enable capability analysis
>   stackdepot: Enable capability analysis
>   rhashtable: Enable capability analysis
>   printk: Move locking annotation to printk.c
>   security/tomoyo: Enable capability analysis
>   crypto: Enable capability analysis
>   sched: Enable capability analysis for core.c and fair.c
>
>  .../dev-tools/capability-analysis.rst         | 148 +++++
>  Documentation/dev-tools/index.rst             |   1 +
>  Documentation/dev-tools/sparse.rst            |  19 -
>  Documentation/mm/process_addrs.rst            |   6 +-
>  MAINTAINERS                                   |  11 +
>  Makefile                                      |   1 +
>  crypto/Makefile                               |   2 +
>  crypto/acompress.c                            |   6 +-
>  crypto/algapi.c                               |   2 +
>  crypto/api.c                                  |   1 +
>  crypto/crypto_engine.c                        |   2 +-
>  crypto/drbg.c                                 |   5 +
>  crypto/internal.h                             |   2 +-
>  crypto/proc.c                                 |   3 +
>  crypto/scompress.c                            |  24 +-
>  .../net/wireless/intel/iwlwifi/iwl-trans.c    |   4 +-
>  .../net/wireless/intel/iwlwifi/iwl-trans.h    |   6 +-
>  .../intel/iwlwifi/pcie/gen1_2/internal.h      |   5 +-
>  .../intel/iwlwifi/pcie/gen1_2/trans.c         |   4 +-
>  fs/dlm/lock.c                                 |   2 +-
>  include/crypto/internal/acompress.h           |   7 +-
>  include/crypto/internal/engine.h              |   2 +-
>  include/linux/bit_spinlock.h                  |  24 +-
>  include/linux/cleanup.h                       |  17 +
>  include/linux/compiler-capability-analysis.h  | 423 +++++++++++++
>  include/linux/compiler.h                      |   2 +
>  include/linux/compiler_types.h                |  18 +-
>  include/linux/console.h                       |   4 +-
>  include/linux/debugfs.h                       |  12 +-
>  include/linux/kref.h                          |   2 +
>  include/linux/list_bl.h                       |   2 +
>  include/linux/local_lock.h                    |  45 +-
>  include/linux/local_lock_internal.h           |  73 ++-
>  include/linux/lockdep.h                       |  12 +-
>  include/linux/mm.h                            |  33 +-
>  include/linux/mutex.h                         |  35 +-
>  include/linux/mutex_types.h                   |   4 +-
>  include/linux/rcupdate.h                      |  86 +--
>  include/linux/refcount.h                      |   6 +-
>  include/linux/rhashtable.h                    |  14 +-
>  include/linux/rwlock.h                        |  22 +-
>  include/linux/rwlock_api_smp.h                |  43 +-
>  include/linux/rwlock_rt.h                     |  44 +-
>  include/linux/rwlock_types.h                  |  10 +-
>  include/linux/rwsem.h                         |  66 +-
>  include/linux/sched.h                         |   6 +-
>  include/linux/sched/signal.h                  |  16 +-
>  include/linux/sched/task.h                    |   5 +-
>  include/linux/sched/wake_q.h                  |   3 +
>  include/linux/seqlock.h                       |  24 +
>  include/linux/seqlock_types.h                 |   5 +-
>  include/linux/spinlock.h                      |  89 ++-
>  include/linux/spinlock_api_smp.h              |  34 +-
>  include/linux/spinlock_api_up.h               | 112 +++-
>  include/linux/spinlock_rt.h                   |  37 +-
>  include/linux/spinlock_types.h                |  10 +-
>  include/linux/spinlock_types_raw.h            |   5 +-
>  include/linux/srcu.h                          |  60 +-
>  include/linux/srcutiny.h                      |   4 +
>  include/linux/srcutree.h                      |   6 +-
>  include/linux/ww_mutex.h                      |  22 +-
>  kernel/Makefile                               |   2 +
>  kernel/kcov.c                                 |  36 +-
>  kernel/kcsan/Makefile                         |   2 +
>  kernel/kcsan/report.c                         |  11 +-
>  kernel/printk/printk.c                        |   2 +
>  kernel/sched/Makefile                         |   3 +
>  kernel/sched/core.c                           |  89 ++-
>  kernel/sched/fair.c                           |   9 +-
>  kernel/sched/sched.h                          | 110 +++-
>  kernel/signal.c                               |   4 +-
>  kernel/time/posix-timers.c                    |  13 +-
>  lib/Kconfig.debug                             |  45 ++
>  lib/Makefile                                  |   6 +
>  lib/dec_and_lock.c                            |   8 +-
>  lib/rhashtable.c                              |   5 +-
>  lib/stackdepot.c                              |  20 +-
>  lib/test_capability-analysis.c                | 596 ++++++++++++++++++
>  mm/kfence/Makefile                            |   2 +
>  mm/kfence/core.c                              |  20 +-
>  mm/kfence/kfence.h                            |  14 +-
>  mm/kfence/report.c                            |   4 +-
>  mm/memory.c                                   |   4 +-
>  mm/pgtable-generic.c                          |  19 +-
>  net/ipv4/tcp_sigpool.c                        |   2 +-
>  scripts/Makefile.capability-analysis          |  11 +
>  scripts/Makefile.lib                          |  10 +
>  scripts/capability-analysis-suppression.txt   |  33 +
>  scripts/checkpatch.pl                         |   8 +
>  security/tomoyo/Makefile                      |   2 +
>  security/tomoyo/common.c                      |  52 +-
>  security/tomoyo/common.h                      |  77 +--
>  security/tomoyo/domain.c                      |   1 +
>  security/tomoyo/environ.c                     |   1 +
>  security/tomoyo/file.c                        |   5 +
>  security/tomoyo/gc.c                          |  28 +-
>  security/tomoyo/mount.c                       |   2 +
>  security/tomoyo/network.c                     |   3 +
>  tools/include/linux/compiler_types.h          |   2 -
>  99 files changed, 2370 insertions(+), 589 deletions(-)
>  create mode 100644 Documentation/dev-tools/capability-analysis.rst
>  create mode 100644 include/linux/compiler-capability-analysis.h
>  create mode 100644 lib/test_capability-analysis.c
>  create mode 100644 scripts/Makefile.capability-analysis
>  create mode 100644 scripts/capability-analysis-suppression.txt
>
> --
> 2.51.0.384.g4c02a37b29-goog
>

