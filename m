Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344403EBF58
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Aug 2021 03:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbhHNBe2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 21:34:28 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51853 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236128AbhHNBe2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 21:34:28 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17E1XdoU010548;
        Sat, 14 Aug 2021 10:33:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17E1XdoU010548
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628904819;
        bh=D1NrHp21TglzpTWQR4gc+oo0WJWxlE8wjDRqrZvWVYo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xvhp4Aqkg0CDw83gKShnpudctyTFlUe506pMgGmC/uv08tyNZyl4eFoFf2rB8lJCE
         QUiS7k8oUJBF6P7xvHh9U9cbXThISnYIPlliSQ3FP8gKVEuzhYc1UhOZKxihjRuQSG
         Tw2GMyWhFxjE1QJJCycMevCKmWhjqu6OoCaiPyLZRSswuPkQ3AbUsY/Z7bDAYmdriT
         1kq+uZUgmq5B2SVzpBrr5jjBpRj3TdhUtUmPOcXC+6ufFngPttjIHmVKu450EbAPtz
         6jcLVnny+hPL0TQGO85ZK+/cTvLHm0TIhi9NMHjPfSYGgdaiHBvBeec7M2h7t9eIl2
         wZ/mOoW608J/g==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so7914751pjb.2;
        Fri, 13 Aug 2021 18:33:39 -0700 (PDT)
X-Gm-Message-State: AOAM532BNxRzPhN5ya1DrvF0CpdRt8fHhPng5Fy0E8a95EbaRgf7PHaP
        8gs/rJm2m4bvTRQPptgKWZs2Uhex5WHPrYW0yM4=
X-Google-Smtp-Source: ABdhPJxyv/sGZDUDm//Sie0uoRNB0E4JgdU3tnelH7d2I2SgsocLvtNeElQmpPq++IbMQQWPcxPtDgPQNUzFfJ0F504=
X-Received: by 2002:a17:90a:9314:: with SMTP id p20mr5339607pjo.87.1628904818637;
 Fri, 13 Aug 2021 18:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com> <YRMFTm3EJWRqwZkM@Ryzen-9-3900X.localdomain>
In-Reply-To: <YRMFTm3EJWRqwZkM@Ryzen-9-3900X.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 14 Aug 2021 10:33:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWmV2W4MG8UUMQ=BqsK72coqwXsWRZ7TQMKRrtQqP=qA@mail.gmail.com>
Message-ID: <CAK7LNASWmV2W4MG8UUMQ=BqsK72coqwXsWRZ7TQMKRrtQqP=qA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 11, 2021 at 8:01 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Aug 10, 2021 at 01:42:37PM -0700, Nick Desaulniers wrote:
> > cc-option, cc-option-yn, and cc-disable-warning all invoke the compiler
> > during build time, and can slow down the build when these checks become
> > stale for our supported compilers, whose minimally supported versions
> > increases over time. See Documentation/process/changes.rst for the
> > current supported minimal versions (GCC 4.9+, clang 10.0.1+). Compiler
> > version support for these flags may be verified on godbolt.org.
> >
> > The following flags are GCC only and supported since at least GCC 4.9.
> > Remove cc-option and cc-disable-warning tests.
> > * -fno-tree-loop-im
> > * -Wno-maybe-uninitialized
> > * -fno-reorder-blocks
> > * -fno-ipa-cp-clone
> > * -fno-partial-inlining
> > * -femit-struct-debug-baseonly
> > * -fno-inline-functions-called-once
> > * -fconserve-stack
> >
> > The following flags are supported by all supported versions of GCC and
> > Clang. Remove their cc-option, cc-option-yn, and cc-disable-warning tests.
> > * -fno-delete-null-pointer-checks
> > * -fno-var-tracking
> > * -mfentry
> > * -Wno-array-bounds
> >
> > The following configs are made dependent on GCC, since they use GCC
> > specific flags.
> > * READABLE_ASM
> > * DEBUG_SECTION_MISMATCH
> >
> > --param=allow-store-data-races=0 was renamed to --allow-store-data-races
> > in the GCC 10 release.
> >
> > Also, base RETPOLINE_CFLAGS and RETPOLINE_VDSO_CFLAGS on CONFIC_CC_IS_*
> > then remove cc-option tests for Clang.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1436
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Fewer pointless calls to the compiler is always a good thing :)
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Small comments inline.
>
> > ---
> > Note: It may be preferred to move the test for
> > -fno-inline-functions-called-once for DEBUG_SECTION_MISMATCH into
> > Kconfig. That one does seem relatively more reasonable to implement in
> > Clang.
> >
> >  Makefile          | 55 ++++++++++++++++++++++++++---------------------
> >  lib/Kconfig.debug |  2 ++
> >  2 files changed, 33 insertions(+), 24 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 027fdf2a14fe..3e3fb4affba1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -730,9 +730,10 @@ endif # KBUILD_EXTMOD
> >  # Defaults to vmlinux, but the arch makefile usually adds further targets
> >  all: vmlinux
> >
> > -CFLAGS_GCOV  := -fprofile-arcs -ftest-coverage \
> > -     $(call cc-option,-fno-tree-loop-im) \
> > -     $(call cc-disable-warning,maybe-uninitialized,)
> > +CFLAGS_GCOV  := -fprofile-arcs -ftest-coverage
> > +ifdef CONFIG_CC_IS_GCC
> > +CFLAGS_GCOV  += -fno-tree-loop-im
> > +endif
>
> Eliminating -Wno-maybe-uninitialized might warrant a comment in the
> commit message as I was initially confused then I realized that it is
> unconditionally added later.


Indeed.

Commit 78a5255ffb6a1af189a83e493d916ba1c54d8c75
could have removed -Wno-maybe-initialized
from CFLAGS_GCOV as well, but somehow it has been
left over here...


Comments in the commit log, or perhaps
splitting this as 1/2 will be less confusing.





-- 
Best Regards
Masahiro Yamada
