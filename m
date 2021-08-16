Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53B93EDE66
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhHPUG7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhHPUG7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:06:59 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0005FC061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:06:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x27so36812747lfu.5
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCHefUYIGF0rDVJ88x82+J6avfifkq1IRlnZNezfBi0=;
        b=MPmTA2z8ZBWyznTkjJSbBpYBiKSwRKqaPJeK9g3MrNUu8QU8lEs5G4eyP6K7/RVcib
         rSElteGsKie7jonGaiPHLEev7ZJR39UsHoWnioW4gtfpWCZ9nV+JIPZsxF60HByTqbb9
         j7JYeW3xlEobvuQxyzLtdXgUlKS7aYkJpjy7Nu2K+ot3LLgsdN3F7BANNoZtkkxvjKkt
         dGEXpeuZZdT2BdyMcaHDXZEKEksVb4fzCEFmwGHSgHQzj2453B2zyxa1bgFTn06Z3YVT
         vFkgP5QR9kW7iF7gnZDyd8JMU2V5mlF4Ggg6j6bMIsE6BTI2AySTsf/MQHl+/rRNXjuu
         x0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCHefUYIGF0rDVJ88x82+J6avfifkq1IRlnZNezfBi0=;
        b=NbT4JjcLmPc9rYahFCpLYG8NyzoxuZErGpi4AyXsHx/W2apmmpgwaSfDdRlvqb3LlF
         HNYrJAZyTzlAS8lKM/7thH3JCUVwxhxIPX7rpiaKLv9U1BJy+yzyocXgaZc8SY/hi9M/
         wbkQxMBhGY9liTYDCiJ5a4UCVeisi2L12joGY9G1cuA0C2W2FvA7X5bW7JHt5RpdFjq0
         FgZmWQVNZ6/O+RenaUtQyePmIHJpTcZfiBnCXlqJ2xdiIc/YkgojDS118kGr4jXdg/Qd
         qv2zU4k7PBqJNhXhQ0cahIcvRC7t3JpHFb7VDAs0JTczvTxmdn+RFJmjaH+Zr0Og6LI/
         frmA==
X-Gm-Message-State: AOAM532oSmRnYUgqgO7ohKhZhBVT5HXSWstyWipRLNiM4ca+Eo8teM1A
        Fwn/cH7G0Zt5ld2Lm12SIdEmaCmkkZW+odlNpTFs+Q==
X-Google-Smtp-Source: ABdhPJzgjBXZZxuAxDiFWmfUvUkPVNJRQydgWlOCjtRurPN+dmCZo022hvuTevpvOkS2jjpo/C6Z7hmM+uQdsNMPd34=
X-Received: by 2002:a19:f017:: with SMTP id p23mr55541lfc.547.1629144384999;
 Mon, 16 Aug 2021 13:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com> <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com>
In-Reply-To: <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 13:06:13 -0700
Message-ID: <CAKwvOdnc-GAHOQtjrjFzc6GzCLR35rQ6uVAenLLKBkEqws9Tbw@mail.gmail.com>
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

On Fri, Aug 13, 2021 at 6:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Aug 11, 2021 at 5:42 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > diff --git a/Makefile b/Makefile
> > index 027fdf2a14fe..3e3fb4affba1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -798,7 +801,7 @@ include/config/auto.conf:
> >  endif # may-sync-config
> >  endif # need-config
> >
> > -KBUILD_CFLAGS  += $(call cc-option,-fno-delete-null-pointer-checks,)
> > +KBUILD_CFLAGS  += -fno-delete-null-pointer-checks
> >  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
> >  KBUILD_CFLAGS  += $(call cc-disable-warning, format-truncation)
> >  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
> > @@ -844,17 +847,17 @@ KBUILD_RUSTFLAGS += -Copt-level=z
> >  endif
> >
> >  # Tell gcc to never replace conditional load with a non-conditional one
> > -KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
> > +ifdef CONFIG_CC_IS_GCC
>
>
> Can you insert a comment here?
>
> # GCC 10 renamed --param=allow-store-data-races=0 to --allow-store-data-races
>
>
> It will remind us of dropping this conditional
> in the (long long distant) future.
>
>
>
>
> > +KBUILD_CFLAGS  += $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
> >  KBUILD_CFLAGS  += $(call cc-option,-fno-allow-store-data-races)
> > +endif

So it looks like `-fallow-store-data-races` was also supported. Reading through
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97309
https://gcc.gnu.org/wiki/Atomic/GCCMM/ExecutiveSummary
it seems that the default is not to allow "store data races." So I
should not be adding `--allow-store-data-races` or
`-fallow-store-data-races`; so this just should be the existing test,
with a comment that it can be removed once gcc-10+ is the minimum.
Will update that in v2.
-- 
Thanks,
~Nick Desaulniers
