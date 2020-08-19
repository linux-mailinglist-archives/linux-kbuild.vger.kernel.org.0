Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9979424A78C
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 22:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgHSULd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 16:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgHSUL3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 16:11:29 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A951C061383
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 13:11:29 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a79so12223514pfa.8
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ysEscVWILmvmykMxg8+0n31+wodeRoaMfoU6oDZTo84=;
        b=W0qzDu0dz/vFLIgmwd1kjxLHoxU+UwI1bE9+a5gGd+09ufPzSS4iMaaJ+O1+MrnJgc
         2ms7ld15axXbGMV4cveW2c13TbR98YkSq+qPYMrtJvudgciopq2AQu+mo9MNykDpBsLy
         cTCA7w3gv+vTyr9GoMzmF7vXnZ+QNO1kQaS6x8Oqt/tJL6o+wcQRhDcZv3TZ8EIpOMF2
         MrqQACaFUfPnHEfC0vNTlCJUepNtOyEf4z99vf9/dUNx1HcJBNzpMZSSSx3IM/X/Pj+3
         abAtZWj7BSlh/omOuXiBBmjiQnN7kgR1tg93rDtfc+pfQLx61XrLLnxwifrHUzsNmM0T
         Vz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ysEscVWILmvmykMxg8+0n31+wodeRoaMfoU6oDZTo84=;
        b=pvYk5A8Tz3QEEi8dOaAb7v6S7LKACXsKqWv1KQhKOKorMbxrye4/nTO2tlLiELmlii
         rBhHrAjm/nM365xSAZ6/zI+m4r3LNe2nm6tiUWG5wJ5sUn6EgBPHMxFwQe5uNq8+B3Wt
         4YTPeXweKEzasEjAIWD1HC0QbHMMSqMWLmpC+5s7kM12BBT5GK5vqG7rwdepE7H4UPN5
         Z6BYnOC5We217Keqsvc4btdaRtEA557dGc8p6HzsxrBASG/eR1NKfbV+c1cGEgf98LpN
         vhz+cWaujXoO16eBji4R4biugGR9teF5BMnpt5T5GSkD0y6yla6p4lV3pmLuLO5WwO4D
         r6hg==
X-Gm-Message-State: AOAM532TkcFRYzZ4piuKFumbKfMgQqCf7U4hi25f9Bjr65Ba4OFOUnC7
        qBAEWUibuc+m+kKGnDgW4x83w0kctd4rzbNjw2TJdQ==
X-Google-Smtp-Source: ABdhPJwvRmg/DUpVHXrDhcZyVbveYkPJZZxlAB7YooCCxegjU6ojPHBaRIQeJNx70cCujRu1aiwKGCQG01MEe7c2woM=
X-Received: by 2002:a05:6a00:14d0:: with SMTP id w16mr20101130pfu.39.1597867888865;
 Wed, 19 Aug 2020 13:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200819191654.1130563-1-ndesaulniers@google.com>
 <20200819191654.1130563-5-ndesaulniers@google.com> <20200819192932.GA58968@rani.riverdale.lan>
In-Reply-To: <20200819192932.GA58968@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 19 Aug 2020 13:11:17 -0700
Message-ID: <CAKwvOdnkqt8vBHcFNk1TMDWcnrOKcZF2O=Y250r6ZBns5dGvBA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] x86/boot: use -fno-builtin-bcmp
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
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
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 19, 2020 at 12:29 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Wed, Aug 19, 2020 at 12:16:53PM -0700, Nick Desaulniers wrote:
> > We're reverting
> > commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")
> > in favor of -fno-builtin-bcmp. Remove the additional definition here,
> > too.
> >
> > arch/x86/purgatory/Makefile uses -ffreestanding, so there's no risk of
> > this libcall optimization occurring for arch/x86/boot/purgatory.ro.
> >
> > arch/x86/boot/Makefile resets KBUILD_CFLAGS, so make sure to reset this
> > flag that was set for the top level Makefile.
> >
> > Fixes: 4ce97317f41d ("x86/purgatory: Do not use __builtin_memcpy and __builtin_memset")
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/x86/boot/Makefile | 1 +
> >  arch/x86/boot/string.c | 8 --------
> >  2 files changed, 1 insertion(+), 8 deletions(-)
> >
> > diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> > index fe605205b4ce..ef7f15bfceab 100644
> > --- a/arch/x86/boot/Makefile
> > +++ b/arch/x86/boot/Makefile
> > @@ -70,6 +70,7 @@ KBUILD_CFLAGS       := $(REALMODE_CFLAGS) -D_SETUP
> >  KBUILD_AFLAGS        := $(KBUILD_CFLAGS) -D__ASSEMBLY__
> >  KBUILD_CFLAGS        += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> >  KBUILD_CFLAGS        += -fno-asynchronous-unwind-tables
> > +KBUILD_CFLAGS        += -fno-builtin-bcmp
> >  GCOV_PROFILE := n
> >  UBSAN_SANITIZE := n
> >
>
> This should be unnecessary: KBUILD_CFLAGS in arch/x86/boot/Makefile is
> set to REALMODE_CFLAGS (defined in arch/x86/Makefile), which includes
> -ffreestanding.

I triple checked by grepping the disassemblies of
./arch/x86/purgatory/purgatory.ro, arch/x86/purgatory/*.o, and
arch/x86/boot/*.o for bcmp; should be fine to drop that hunk.  Will
wait a bit to see if there's other feedback, and whether folks are on
board with the plan to merge the series proposed in the cover letter
or not.

--
Thanks,
~Nick Desaulniers
