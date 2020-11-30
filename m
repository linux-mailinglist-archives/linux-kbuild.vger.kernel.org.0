Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAB72C8F5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Nov 2020 21:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgK3UqI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 15:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbgK3UqH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 15:46:07 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9049C0613D3
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Nov 2020 12:45:27 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id r20so335305pjp.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Nov 2020 12:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHk+vscpe9u8SLq69FjicFeg9t4MWKyCiDt4jUtaF7o=;
        b=cpaTdK87VnoZo3+5Ml8WwaCfUpvHSdiM4hpMObvwg6dH5dhNpD8fdzY3d9qit5fHEE
         w+d2qn8sIHA7fMwtmGkheGDLfX8/TuIghQQFQ5cbcPj/E7AFxbbjiwcWX1D4qVZ1mSUo
         ye+hcQVcv6752V31wWD7Izfcqsx+1aTqdK57ejHZCXr727bO7x3LoRTzZgS4oCaVXkOE
         +KkVH7Niocm/O55zIBRy/KirzfJS/jrunu/TSrSGltX7eU3h/a3ph16g3HfrXiNj/a6Y
         Ua/5/89W2Q3z7IHqbUyFo+dvBpLB/rrw1C4Y2boBdFiXwPHXVkKiudfwFlckeQOARBuQ
         B+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHk+vscpe9u8SLq69FjicFeg9t4MWKyCiDt4jUtaF7o=;
        b=nEAEyqMegJlBr/g6hZoGzVe/PR7AuD+6AhXN9GZVieS41AL3+YcjcTqlxWLzrT/TMk
         0nI/gkyCpnCpvEMKQgURlCC0OqHgXRVef6C0WqsmT3A4fWHXZgPEm+hexiA7Ri/wf1si
         3lIIU8LskRRr1r0uCPeROV04tn+UkZ8G1fKGzaRh4gTswbfzan6qn1bxh4PtH419z+AA
         vF4+KQggdaoed7zn2Ut7SQSRyiYiJ0UHatTopvIR8eyBij18S3+xiBZ+Vwcksjh+4zcV
         hqv/DrtK4ULfTXtUUvgfBExolJtCMFYswHJKjkZHHd2plT0u2WVP3ZpmPpFaQwRCwCeH
         R4Tw==
X-Gm-Message-State: AOAM533Oep3Sxse3jod/4QtoMZMYOF9RPBGIHZH2nvCchCBxkQnTdLLZ
        mFjDr9rZE23m7bV8X4BsLLkoFf76YsxugPtKoykWAg==
X-Google-Smtp-Source: ABdhPJxIv2yClRi2YVQVFxgmk635w7WzpvI8lIGR4e+gQL7sKYswhNk507GvJNSx1ypo5rjPx8ha4NMhcUeJCh03J+c=
X-Received: by 2002:a17:902:221:b029:d8:f938:b112 with SMTP id
 30-20020a1709020221b02900d8f938b112mr20683673plc.10.1606769126862; Mon, 30
 Nov 2020 12:45:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-4-ndesaulniers@google.com>
 <CAK7LNAT5MQqUddv+QbFu5ToLBK3eUPArHSBR=5AOS3ONtMqKaw@mail.gmail.com>
In-Reply-To: <CAK7LNAT5MQqUddv+QbFu5ToLBK3eUPArHSBR=5AOS3ONtMqKaw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 30 Nov 2020 12:45:15 -0800
Message-ID: <CAKwvOdmPeOEA4dfODCKLE4A_M-SF5RBVFEf-NuiTkUTXAbh-5w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 30, 2020 at 10:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Nov 4, 2020 at 9:53 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice. Adds an
> > explicit CONFIG_DEBUG_INFO_DWARF2, which is the default. Does so in a
> > way that's forward compatible with existing configs, and makes adding
> > future versions more straightforward.
> >
> > Suggested-by: Fangrui Song <maskray@google.com>
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  Makefile          | 14 ++++++++------
> >  lib/Kconfig.debug | 19 +++++++++++++++----
> >  2 files changed, 23 insertions(+), 10 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 75b1a3dcbf30..e23786a4c1c7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -826,12 +826,14 @@ else
> >  DEBUG_CFLAGS   += -g
> >  endif
> >
> > -ifndef LLVM_IAS
> > -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > -endif
> > -
> > -ifdef CONFIG_DEBUG_INFO_DWARF4
> > -DEBUG_CFLAGS   += -gdwarf-4
> > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
> > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> > +DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> > +ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
> > +# Binutils 2.35+ required for -gdwarf-4+ support.
> > +dwarf-aflag    := $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
> > +DEBUG_CFLAGS   += $(dwarf-aflag)
>
> This changes the behavior.
>
> For the Dwarf-2 case,
>
> Previously, -gdwarf-2 was passed to $(CC),
> so the debug info was generated by gcc.
>
> Now, -Wa,-gdwarf-2 is passed to $(CC).
> -gdwarf-2 is handled by GNU as.
> So, the source info points to /tmp/<hash>.s
> instead of the original .c file.
>
>
>
> Handling the Dwarf capability is very complicated.
>
> Are you still working for v3?

Yes, I plan to revisit the series based on all of the feedback thus
far.  Lately I'm focused on enabling LLVM_IAS=1 for Android; but I
would like to see this land so that the Linux kernel may provide
coverage and feedback to the toolchain developers for DWARF v5 (as
well as reduced binary image sizes).  Maybe later this week I'll have
time to revisit.
-- 
Thanks,
~Nick Desaulniers
