Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8843EE0C0
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhHQAR6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:17:58 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:36933 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbhHQAR6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:17:58 -0400
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17H0Gwmh028866;
        Tue, 17 Aug 2021 09:16:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17H0Gwmh028866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629159419;
        bh=XbVBncXQBymx/ieyPJ6HdMsSmxJ3fpUPvSQvKQ5bVDo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SR5bX611BWYbnFYeXtj/HbHiNhDrWtr2M96SyaS3aqdtaah7rB//1C28fqTs276VT
         BVSj6Zi3DWgvB5HBMEy+rT6PJBPx2rGqHgY/gvXyf1oKLmBjEUZJSSXhG9E3P7fACR
         uOJsTT2ldN/kKT717R4yLUDIpBkkiQJjPWamkr4jIspNLOcb5yGFK0EeTIamuJxY7J
         KYFxzIsygLSWOOCXtLGFxVC16r97VUIcQmX7BCiWfXGtDtawaSoqmQcSSuXzaRStyn
         e+L4wXzpGOmIi3V+J0YNegA1xpBLaQxUQXfqmjzbFIDmMmMG4kg9AcAApCBaqvGz3e
         6MajQLiqghLew==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id a20so22717082plm.0;
        Mon, 16 Aug 2021 17:16:58 -0700 (PDT)
X-Gm-Message-State: AOAM531i0s613dsd/qcYXYXaCI2L8TR0pFnoex4tpKxlUtn2lLp/Y/sM
        h/WgL2yYANwaVDDOr9DYMtbBD7OL1NdHOcaXBQ4=
X-Google-Smtp-Source: ABdhPJwh8T5kk8Fx0mW7+dY9QdqC7lL9mpf28QTuVLb7DJKs79tNh+ARFne0A9HP1tTn9g6V2/qKKslwPwznwKJ+yH0=
X-Received: by 2002:a65:6459:: with SMTP id s25mr673098pgv.7.1629159418096;
 Mon, 16 Aug 2021 17:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com>
 <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com> <CAKwvOdmpTt1PBnvo3RFkYnd5O2JTW7DTA9sGQJgvsDOFkVt8Ag@mail.gmail.com>
In-Reply-To: <CAKwvOdmpTt1PBnvo3RFkYnd5O2JTW7DTA9sGQJgvsDOFkVt8Ag@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Aug 2021 09:16:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQP93qMRP8uSZKzLR0G7tM9-vNyzAEsUceRtj2nA0kd7A@mail.gmail.com>
Message-ID: <CAK7LNAQP93qMRP8uSZKzLR0G7tM9-vNyzAEsUceRtj2nA0kd7A@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
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
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 3:36 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Aug 13, 2021 at 6:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Aug 11, 2021 at 5:42 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > --param=allow-store-data-races=0 was renamed to --allow-store-data-races
> > > in the GCC 10 release.
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 027fdf2a14fe..3e3fb4affba1 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -844,17 +847,17 @@ KBUILD_RUSTFLAGS += -Copt-level=z
> > >  endif
> > >
> > >  # Tell gcc to never replace conditional load with a non-conditional one
> > > -KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
> > > +ifdef CONFIG_CC_IS_GCC
> >
> >
> > Can you insert a comment here?
> >
> > # GCC 10 renamed --param=allow-store-data-races=0 to --allow-store-data-races
> >
> >
> > It will remind us of dropping this conditional
> > in the (long long distant) future.
> >
> >
> >
> >
> > > +KBUILD_CFLAGS  += $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
> > >  KBUILD_CFLAGS  += $(call cc-option,-fno-allow-store-data-races)
> > > +endif
>
> This report is confusing:
> https://lore.kernel.org/linux-mm/202108160729.Lx0IJzq3-lkp@intel.com/
> (csky gcc-11)
>
> >> csky-linux-gcc: error: unrecognized command-line option '--param=allow-store-data-races=0'; did you mean '--allow-store-data-races'?
>
> I wonder if cc-option detection for these is broken?

I do not say it is broken...


cc-option is defined like this:

cc-option = $(call __cc-option, $(CC),\
        $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))


It is checking
$(KBUILD_CPPFLAGS) + $(KBUILD_CFLAGS)
+ --allow-store-data-races


A few lines above, I see

csky-linux-gcc: error: unrecognized argument in option '-mcpu=ck860'


It makes all the cc-option tests fail after this line:
KBUILD_CFLAGS += -mcpu=$(CPUTYPE) -Wa,-mcpu=$(MCPU_STR)


Then,

$(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)

falls back to --param=allow-store-data-races=0




>  Perhaps I should
> not touch these other than to wrap them in the CONFIG_CC_IS_GCC guard?

I do not think so.

If an unrecognized argument appears,
all the cc-option tests that follow are unreliable.



If you are not comfortable with  it,
you can split it.

KBUILD_CFLAGS  += $(call cc-option,--allow-store-data-races)
KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)



Or, another way of implementation is

KBUILD_CFLAGS += $(call cc-ifversion, -lt, 1000,
--allow-store-data-races, --param=allow-store-data-races=0)





>
> (Either way, I need to send a v2 in response to Naresh's report as
> well. https://lore.kernel.org/lkml/CA+G9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w@mail.gmail.com/
> It seems that -mfentry wasn't implemented for s390-linux-gnu-gcc until
> gcc-9; so rather than remove top level support, perhaps a comment
> about gcc-9+ s390 having support will make grepping for it easier in
> the future).
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
