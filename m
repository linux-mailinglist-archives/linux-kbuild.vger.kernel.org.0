Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BAC3EDE77
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhHPULx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhHPULv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:11:51 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6249BC0613C1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:11:19 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id n7so29205150ljq.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78/zU1JmXsLtOegDV7vdLvXhJXsUYGL1XAvIUm761Yo=;
        b=FDEZeluLRk7Bl4c5VqHicTN3BqcLo6Yh8vV12hPQhddXPlAys761JuA6DKnR7zAl0h
         gHDDz6FiwQpMOBXfHzE0VZGhCjMQ7P4lmw2vXkT817a+rW0PY3MMLwRB0fWl/45CeOfs
         TbRcn5llqM6dSw3aKuIP1/oAUASt3c9SUyNiJHbKU4Z2P2951lD+oZElRpLJwJrt7+Vd
         2GrXR/9ActPhDLPCkxXAUa1BUZlBLG18D2oOXFJgSggi7Lkb27pBrOd46z8TTqeiSFY2
         Rftxwr5u3dtVz/hYax6KNcikFUDuimKAA/7EykaNMqktyChnSW0g18AW7jDYAF1FHAqi
         jmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78/zU1JmXsLtOegDV7vdLvXhJXsUYGL1XAvIUm761Yo=;
        b=Z+xGWOlYqiza6XFFzoFZjJWQKIbzCqRD8fkYRECmOI8D4JAQQMYwbleXq6ZRF2Qobi
         oBytexf+JsyemwKQCplKn1gdC6Qta/ns1I62lhxp9yA1z4mWcnLBJ4Dqf8DP31aQIQpk
         aoJRC2dxYfIkxK+SolwIM5fsKicHrlCL/PcUCtMGuxLvTZSbk/g4mXi4Hs02fXoOA1yc
         cx/V8gm5lSTFvIAEXt5kq5piM5VIOuMr2BLbJCowk/N0hnnMJ2UND5QLJfABqyJnncv6
         sp8+8XAqR7ghlXA7APhl4tS3FCBiU9T59DQh+BisxHt3a65jlSWDckU0aRr6gzxvotMc
         B8qw==
X-Gm-Message-State: AOAM533Q/iXNuMKIsPXZ6h/tHI68w4jxYeH180SbhSX4jyuDb3q0U6kF
        ia3W7+tVmyeSKz01A7ON1Cunp7M/qnnK5fMkziB29A==
X-Google-Smtp-Source: ABdhPJzjQP33p8E5dJwrYaH7Np11d4PTlejXiOoFyZKCa81FyZOzHhlNcpB1PQM1I56iqIToLoQPKwx3bqg4JShQqiQ=
X-Received: by 2002:a2e:a784:: with SMTP id c4mr274732ljf.479.1629144677387;
 Mon, 16 Aug 2021 13:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com>
 <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com> <CAKwvOdnc-GAHOQtjrjFzc6GzCLR35rQ6uVAenLLKBkEqws9Tbw@mail.gmail.com>
In-Reply-To: <CAKwvOdnc-GAHOQtjrjFzc6GzCLR35rQ6uVAenLLKBkEqws9Tbw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 13:11:06 -0700
Message-ID: <CAKwvOdmMekTUz81ZX8qcwNpcEdfC=ab0Tnutun5UPS8GjLnq2Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
To:     Masahiro Yamada <masahiroy@kernel.org>
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
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 1:06 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Aug 13, 2021 at 6:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Aug 11, 2021 at 5:42 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 027fdf2a14fe..3e3fb4affba1 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -798,7 +801,7 @@ include/config/auto.conf:
> > >  endif # may-sync-config
> > >  endif # need-config
> > >
> > > -KBUILD_CFLAGS  += $(call cc-option,-fno-delete-null-pointer-checks,)
> > > +KBUILD_CFLAGS  += -fno-delete-null-pointer-checks
> > >  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
> > >  KBUILD_CFLAGS  += $(call cc-disable-warning, format-truncation)
> > >  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
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
> So it looks like `-fallow-store-data-races` was also supported. Reading through
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97309
> https://gcc.gnu.org/wiki/Atomic/GCCMM/ExecutiveSummary
> it seems that the default is not to allow "store data races." So I
> should not be adding `--allow-store-data-races` or
> `-fallow-store-data-races`; so this just should be the existing test,
> with a comment that it can be removed once gcc-10+ is the minimum.
> Will update that in v2.

Ah, perhaps I should combine the following line:
KBUILD_CFLAGS  += $(call
cc-option,-fallow-store-data-races,--param=allow-store-data-races=0)

Though I don't understand the csky failure. cc-option appends to a
running list of flags; if an unsupported flag gets added to CFLAGS, it
can cause cc-option to failure subsequent checks in spooky ways.  I
usually debug those by adding print statements to cc-option to see
what the full command it's testing; then invoke the compiler manually
with those to see what went wrong.  (bookmarked and referenced often:
https://stackoverflow.com/questions/16467718/how-to-print-out-a-variable-in-makefile)

Though my distro doesn't package csky-linux-gnu-gcc...
-- 
Thanks,
~Nick Desaulniers
