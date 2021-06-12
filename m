Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532613A4FD4
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 18:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhFLRBr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 13:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhFLRBr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 13:01:47 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACB6C061574;
        Sat, 12 Jun 2021 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ddh5oJmHNUDvPnkjDyvBawyeYIqU7P8eLWt5TLZPuMU=; b=GzSY1ygh72Wp3u4leV2JypR5PX
        QXCDPX2Q9aSjNMuK1rbZ/QmYeFjIol4pKEND0ZbOjKFeczgxXDdOZ3UHAhNrhhsHoKBdzqJx2NARb
        +D2FUbFIbYd673okD6bmi3oJGRrIsflLnvfnylO5SvMVHnaBOSuhmFwZvgy7buNE8RGYNqCy4xtci
        gt14sUxQ054KqX/qyfhKpZod/I6XKjWY5YdINf9HVp/sLbOUYKRXtY5m6izvW2qf7Ppxo2w1WfMrV
        tDZjuqfPts3Hnj+zjBSpWnBcBAwwnPhMpHdonNafkndOTnmIih6tWxzqC6FDSOhYKR/Yd8vGbRP4E
        uzCrd43A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ls6yo-006GWf-RV; Sat, 12 Jun 2021 16:59:37 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C480A30020C;
        Sat, 12 Jun 2021 18:59:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id AD4BD2C23AAFF; Sat, 12 Jun 2021 18:59:35 +0200 (CEST)
Date:   Sat, 12 Jun 2021 18:59:35 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Bill Wendling <morbo@google.com>
Cc:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>, x86@kernel.org
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407211704.367039-1-morbo@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 02:17:04PM -0700, Bill Wendling wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> profile, the kernel is instrumented with PGO counters, a representative
> workload is run, and the raw profile data is collected from
> /sys/kernel/debug/pgo/profraw.
> 
> The raw profile data must be processed by clang's "llvm-profdata" tool
> before it can be used during recompilation:
> 
>   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> 
> Multiple raw profiles may be merged during this step.
> 
> The data can now be used by the compiler:
> 
>   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> 
> This initial submission is restricted to x86, as that's the platform we
> know works. This restriction can be lifted once other platforms have
> been verified to work with PGO.

*sigh*, and not a single x86 person on Cc, how nice :-/

> Note that this method of profiling the kernel is clang-native, unlike
> the clang support in kernel/gcov.
> 
> [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization

Also, and I don't see this answered *anywhere*, why are you not using
perf for this? Your link even mentions Sampling Profilers (and I happen
to know there's been significant effort to make perf output work as
input for the PGO passes of the various compilers).

> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Bill Wendling <morbo@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> ---
>  Documentation/dev-tools/index.rst     |   1 +
>  Documentation/dev-tools/pgo.rst       | 127 +++++++++
>  MAINTAINERS                           |   9 +
>  Makefile                              |   3 +
>  arch/Kconfig                          |   1 +
>  arch/x86/Kconfig                      |   1 +
>  arch/x86/boot/Makefile                |   1 +
>  arch/x86/boot/compressed/Makefile     |   1 +
>  arch/x86/crypto/Makefile              |   4 +
>  arch/x86/entry/vdso/Makefile          |   1 +
>  arch/x86/kernel/vmlinux.lds.S         |   2 +
>  arch/x86/platform/efi/Makefile        |   1 +
>  arch/x86/purgatory/Makefile           |   1 +
>  arch/x86/realmode/rm/Makefile         |   1 +
>  arch/x86/um/vdso/Makefile             |   1 +
>  drivers/firmware/efi/libstub/Makefile |   1 +
>  include/asm-generic/vmlinux.lds.h     |  34 +++
>  kernel/Makefile                       |   1 +
>  kernel/pgo/Kconfig                    |  35 +++
>  kernel/pgo/Makefile                   |   5 +
>  kernel/pgo/fs.c                       | 389 ++++++++++++++++++++++++++
>  kernel/pgo/instrument.c               | 189 +++++++++++++
>  kernel/pgo/pgo.h                      | 203 ++++++++++++++
>  scripts/Makefile.lib                  |  10 +
>  24 files changed, 1022 insertions(+)
>  create mode 100644 Documentation/dev-tools/pgo.rst
>  create mode 100644 kernel/pgo/Kconfig
>  create mode 100644 kernel/pgo/Makefile
>  create mode 100644 kernel/pgo/fs.c
>  create mode 100644 kernel/pgo/instrument.c
>  create mode 100644 kernel/pgo/pgo.h

> --- a/Makefile
> +++ b/Makefile
> @@ -660,6 +660,9 @@ endif # KBUILD_EXTMOD
>  # Defaults to vmlinux, but the arch makefile usually adds further targets
>  all: vmlinux
>  
> +CFLAGS_PGO_CLANG := -fprofile-generate
> +export CFLAGS_PGO_CLANG
> +
>  CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage \
>  	$(call cc-option,-fno-tree-loop-im) \
>  	$(call cc-disable-warning,maybe-uninitialized,)

And which of the many flags in noinstr disables this?

Basically I would like to NAK this whole thing until someone can
adequately explain the interaction with noinstr and why we need those
many lines of kernel code and can't simply use perf for this.
