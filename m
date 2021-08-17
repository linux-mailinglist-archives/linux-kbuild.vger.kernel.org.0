Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1893EE3DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 03:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbhHQBkU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 21:40:20 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21538 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbhHQBkS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 21:40:18 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17H1dXKn018934;
        Tue, 17 Aug 2021 10:39:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17H1dXKn018934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629164374;
        bh=5NWkg+bxS9gK9TpUYBiD3sVAhmuzKvoT9bOeRCZQU14=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KNHDtYbNVE63+TfAvnvpEYW8qXz+PxOtI9+w9u+wxh6Xl8IHtrC0uSzMFPc80vAcF
         MykIhs567l5d3FTN1KCOvZlRvZC92lqzxOneyAAJ/WPUcHbJmabP/zHMgBvoVGgt9+
         DyMFAIQrpBEzKIKKk03G/pjmoRWDGe21/w0h3uN/6dVkLIqBkv4bcpkNsLCS68V9zZ
         9JD0XRJbG2NP01/hgST18Zk4NJH5QwB+WFhNqKMb7RH4lTqEVkNWVB6HRDXAEBodPU
         b0FUWzO8HCOhV4FvEBk724ZOfmvfa/Z9aTjgF4TzYAnN571vTpqkJJzx02oNO6MaDQ
         jBkS7OKW88rQA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso2163254pjb.2;
        Mon, 16 Aug 2021 18:39:34 -0700 (PDT)
X-Gm-Message-State: AOAM532FRXiy0nB4LRVEUYGnaPCZhUsuSCrmQCs4bk3zXCWZyGACasDG
        NvxmD+Jfsp2T/y9s1Aajkd1q3ASoUQKpSyXutKQ=
X-Google-Smtp-Source: ABdhPJyacDBegZmpDY5iGkwK+pdYDy6J6f4wwqijnMcW0+PTDukcQAoPChsO7J7wlqQNEgHhd3t08nMf/AtJe/d86tc=
X-Received: by 2002:a17:902:bc41:b029:12d:3f9b:401e with SMTP id
 t1-20020a170902bc41b029012d3f9b401emr745719plz.47.1629164373202; Mon, 16 Aug
 2021 18:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com>
 <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com>
 <CAKwvOdmpTt1PBnvo3RFkYnd5O2JTW7DTA9sGQJgvsDOFkVt8Ag@mail.gmail.com> <CAK7LNAQP93qMRP8uSZKzLR0G7tM9-vNyzAEsUceRtj2nA0kd7A@mail.gmail.com>
In-Reply-To: <CAK7LNAQP93qMRP8uSZKzLR0G7tM9-vNyzAEsUceRtj2nA0kd7A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Aug 2021 10:38:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDcOvjP-gj79rhOJzd456qBP7Fyo3yv94Mp5cHJhOFMw@mail.gmail.com>
Message-ID: <CAK7LNAQDcOvjP-gj79rhOJzd456qBP7Fyo3yv94Mp5cHJhOFMw@mail.gmail.com>
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

On Tue, Aug 17, 2021 at 9:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 17, 2021 at 3:36 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Aug 13, 2021 at 6:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Wed, Aug 11, 2021 at 5:42 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > --param=allow-store-data-races=0 was renamed to --allow-store-data-races
> > > > in the GCC 10 release.
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 027fdf2a14fe..3e3fb4affba1 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -844,17 +847,17 @@ KBUILD_RUSTFLAGS += -Copt-level=z
> > > >  endif
> > > >
> > > >  # Tell gcc to never replace conditional load with a non-conditional one
> > > > -KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
> > > > +ifdef CONFIG_CC_IS_GCC
> > >
> > >
> > > Can you insert a comment here?
> > >
> > > # GCC 10 renamed --param=allow-store-data-races=0 to --allow-store-data-races
> > >
> > >
> > > It will remind us of dropping this conditional
> > > in the (long long distant) future.
> > >
> > >
> > >
> > >
> > > > +KBUILD_CFLAGS  += $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
> > > >  KBUILD_CFLAGS  += $(call cc-option,-fno-allow-store-data-races)
> > > > +endif
> >
> > This report is confusing:
> > https://lore.kernel.org/linux-mm/202108160729.Lx0IJzq3-lkp@intel.com/
> > (csky gcc-11)
> >
> > >> csky-linux-gcc: error: unrecognized command-line option '--param=allow-store-data-races=0'; did you mean '--allow-store-data-races'?
> >
> > I wonder if cc-option detection for these is broken?
>
> I do not say it is broken...
>
>
> cc-option is defined like this:
>
> cc-option = $(call __cc-option, $(CC),\
>         $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
>
>
> It is checking
> $(KBUILD_CPPFLAGS) + $(KBUILD_CFLAGS)
> + --allow-store-data-races
>
>
> A few lines above, I see
>
> csky-linux-gcc: error: unrecognized argument in option '-mcpu=ck860'
>
>
> It makes all the cc-option tests fail after this line:
> KBUILD_CFLAGS += -mcpu=$(CPUTYPE) -Wa,-mcpu=$(MCPU_STR)
>
>
> Then,
>
> $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
>
> falls back to --param=allow-store-data-races=0
>
>
>
>
> >  Perhaps I should
> > not touch these other than to wrap them in the CONFIG_CC_IS_GCC guard?
>
> I do not think so.
>
> If an unrecognized argument appears,
> all the cc-option tests that follow are unreliable.
>
>
>
> If you are not comfortable with  it,
> you can split it.
>
> KBUILD_CFLAGS  += $(call cc-option,--allow-store-data-races)
> KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)


I read the patch in the wrong way.
This is the same as the current code.

So, your v2 is fine with me.
I will pick it up soon.





-- 
Best Regards
Masahiro Yamada
