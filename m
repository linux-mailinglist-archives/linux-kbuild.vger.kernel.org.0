Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21AD248E95
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 21:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgHRTYZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 15:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbgHRTYY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 15:24:24 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01326C061389
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:24:24 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id j13so290591pjd.4
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qLv+dtMW9UswgZn2E6Ho1I7FfK+G/nf1EICniRBZEjs=;
        b=WDm3AyK/lnVRoBw5KPL9aR5Q5AawD46e8q5v/krU9Cdyt/RE2+Ir54as89sLRTqG+a
         +CmfhePykpVPheSWv4jaXOeiKEhI3g9YqqIsvrjV963DnacKRKdzfZUmcQIZ1dMjk155
         zZPe6v5E7GFpZJXR3Ui8uF18OmDuMECC/A6dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qLv+dtMW9UswgZn2E6Ho1I7FfK+G/nf1EICniRBZEjs=;
        b=Xiqua+mOFuPHJhqXKV2ZzO25HMZGpqt7EY4+GWfHZbSXx3OTTgHDOHGq6wtwwY1CA0
         duKnc5aJnlkPfLcgnY/pae4xk4ZgPai2jW/rqC898pPAaJ3RK7G7k3c0z9vulxExfDF6
         RdqkxirlMfeBeDI5jsaiwqFnEjDCdvQyGRPeVFusN7MWp6KE/TnwJDNsiG/Yqy84hwXz
         1qFLQiGkNXjunTKZ/i5vFy0khsDnjrHbkj6nv5VUrdnO50pPOZV981mSlzMX4VAIPRPd
         +56M3c+VxP9nK7kCRsY4WNSQqAoPdkM3lhMBlObi0D7ZC54Ccb8wDrqSwXYrv2frmfWe
         pFAA==
X-Gm-Message-State: AOAM533Xl8N5atH8PSMZ6ydg/vEOCosLR96EDO573CIC2jzWOKUr6Cjr
        1ejhCQzsuVVsOYDpuHmJ5IVSBnYK5yfa+A==
X-Google-Smtp-Source: ABdhPJwXvrYOUzly7vTIhacdMI+xL2IkBgeXZYoK+2/GaE9H2DE1OMHa69bgKd4CTr7F/8sSACqqkQ==
X-Received: by 2002:a17:902:a9cb:: with SMTP id b11mr16673385plr.1.1597778663515;
        Tue, 18 Aug 2020 12:24:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 63sm24821591pfu.196.2020.08.18.12.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 12:24:22 -0700 (PDT)
Date:   Tue, 18 Aug 2020 12:24:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?iso-8859-1?Q?D=E1vid_Bolvansk=FD?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Subject: Re: [PATCH 2/4] Revert "lib/string.c: implement a basic bcmp"
Message-ID: <202008181223.78EF9B95E@keescook>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <20200817220212.338670-3-ndesaulniers@google.com>
 <20200818054428.GA2540870@ubuntu-n2-xlarge-x86>
 <CAKwvOdm8iKUbfFP3a-2GjB1XQXp36Y9+B4kp2KX5iKbH-f0vDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdm8iKUbfFP3a-2GjB1XQXp36Y9+B4kp2KX5iKbH-f0vDA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 11:00:01AM -0700, Nick Desaulniers wrote:
> On Mon, Aug 17, 2020 at 10:44 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Mon, Aug 17, 2020 at 03:02:10PM -0700, Nick Desaulniers wrote:
> > > This reverts commit 5f074f3e192f10c9fade898b9b3b8812e3d83342.
> > >
> > > Use `-fno-builtin-bcmp` instead.
> > >
> > > The issue with using `-fno-builtin-*` flags was that they were not
> > > retained during an LTO link with LLVM.  This was fixed in clang-11 by
> > > https://reviews.llvm.org/D71193
> > > (0508c994f0b14144041f2cfd3ba9f9a80f03de08), which is also the minimum
> > > supported version of clang for LTO.
> > >
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  Makefile               |  1 +
> > >  include/linux/string.h |  3 ---
> > >  lib/string.c           | 20 --------------------
> > >  3 files changed, 1 insertion(+), 23 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 211a1b6f6478..722ff5864275 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -964,6 +964,7 @@ endif
> > >  # to provide implementations of these routines, then prevent the compiler from
> > >  # emitting calls to what will be undefined symbols.
> > >  KBUILD_CFLAGS        += -fno-builtin-stpcpy
> > > +KBUILD_CFLAGS        += -fno-builtin-bcmp
> >
> > I personally think that this hunk should be its own patch before this
> > one then have this patch just be the revert, that way there is no
> > regression across a bisect (if one were to ever occur) and so the revert
> > is a straight 'git revert', rather than have something else mixed in
> > that requires reading the actual changelog text.
> >
> > No objections if you disagree though.
> 
> That's a great idea.  I considered it before sending, but I think it
> would be interesting to divorce the KBUILD changes which can be picked
> up quickly from the latter changes.  Will send a V2.

Yeah, I had the same thoughts as Nathan. With that change:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> >
> > >  # include additional Makefiles when needed
> > >  include-y                    := scripts/Makefile.extrawarn
> > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > index b1f3894a0a3e..f3bdb74bc230 100644
> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> > > @@ -155,9 +155,6 @@ extern void * memscan(void *,int,__kernel_size_t);
> > >  #ifndef __HAVE_ARCH_MEMCMP
> > >  extern int memcmp(const void *,const void *,__kernel_size_t);
> > >  #endif
> > > -#ifndef __HAVE_ARCH_BCMP
> > > -extern int bcmp(const void *,const void *,__kernel_size_t);
> > > -#endif
> > >  #ifndef __HAVE_ARCH_MEMCHR
> > >  extern void * memchr(const void *,int,__kernel_size_t);
> > >  #endif
> > > diff --git a/lib/string.c b/lib/string.c
> > > index 6012c385fb31..69328b8353e1 100644
> > > --- a/lib/string.c
> > > +++ b/lib/string.c
> > > @@ -922,26 +922,6 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
> > >  EXPORT_SYMBOL(memcmp);
> > >  #endif
> > >
> > > -#ifndef __HAVE_ARCH_BCMP
> > > -/**
> > > - * bcmp - returns 0 if and only if the buffers have identical contents.
> > > - * @a: pointer to first buffer.
> > > - * @b: pointer to second buffer.
> > > - * @len: size of buffers.
> > > - *
> > > - * The sign or magnitude of a non-zero return value has no particular
> > > - * meaning, and architectures may implement their own more efficient bcmp(). So
> > > - * while this particular implementation is a simple (tail) call to memcmp, do
> > > - * not rely on anything but whether the return value is zero or non-zero.
> > > - */
> > > -#undef bcmp
> > > -int bcmp(const void *a, const void *b, size_t len)
> > > -{
> > > -     return memcmp(a, b, len);
> > > -}
> > > -EXPORT_SYMBOL(bcmp);
> > > -#endif
> > > -
> > >  #ifndef __HAVE_ARCH_MEMSCAN
> > >  /**
> > >   * memscan - Find a character in an area of memory.
> > > --
> > > 2.28.0.220.ged08abb693-goog
> > >
> >
> > Cheers,
> > Nathan
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Kees Cook
