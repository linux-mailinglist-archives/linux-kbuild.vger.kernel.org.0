Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD34350644
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 20:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbhCaSZc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 14:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbhCaSZS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 14:25:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BBDC061574
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 11:25:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d13so9505093lfg.7
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EUROjIty2NzS2SHfb9lyXkeZUcLtaaw5q8IvGawS+KQ=;
        b=Cv3eemlBA0UIiUYZSJZApVgErFnAzwy297tWHCLspxrUc3409vyFWfsoQj4AHYTzGr
         porRwt8ySCCl8J1BYMaYOGMqFaJh5hPIUj4I0OoYK1X+OF6+yRKg3nzrRp91WqrS/a+N
         +S7KtcXpYH/r9oNFk7i45s2TTNGBV2Gdbu78eLOSTluIWCQWTK+x+pN6Dbo0Lx+p0slQ
         JPSc58RTLxOxDK2Gcl9B2cOVtH1TelIDIvaHvNREvKNN2S3fgfMz3EXlwHY9FrvEAU0D
         En38XqZpFhOzvchOPgSqsUVPV8p0+UKi9ninS2hXuhfZ7fEG0aDUeemJ8pGqGZ614meN
         sDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EUROjIty2NzS2SHfb9lyXkeZUcLtaaw5q8IvGawS+KQ=;
        b=HJQCW2pQtfWRhEPov+cskGwH2TxYawn2DKnfX1lHCswMqurFnqWRd4D91oP34wtlNC
         FC8zcf3cHcidjWenAH45sWXHgQxC6AnwsGKHo2+UaalMHhW2s5cTXtWJ0PD0GxMy2McN
         LSNU/GCqxG2hMBQ7HuJ3un7ntwpPc2r4EKkYYIxhlEveqHDL3T5AyE5x2hgUPGuSPiHg
         V0OdVO3MgQi8o8DqkmDALtiDDPnCsD4x5mwjlIEB6xpK6UWEb2V9powIhQcRGLKxg60z
         4v0ikQnEDg2yP0tZ7smRAc13VA+L+nvJaZ8miy0FnMfMRYwrN8DsojvggRax6xwb60l9
         hhAQ==
X-Gm-Message-State: AOAM533PPlOIGwH7+pN9TQLo/Lw7YHqtCNFx/QuR3bAsLBeBoj6G2W2d
        UwqPeyDRs2jObZ0HTdSic68Yk6P44KY/oktewVSfDZ4+GQeOcVj5
X-Google-Smtp-Source: ABdhPJykjNivctx6j/+LzGnw6RtTp1CizNpD4QFE0jeLrM6ZlxoxoWZ8X0fW/Um2vItIxDoaUJGJP8FFyzChWaLsRQU=
X-Received: by 2002:a19:5055:: with SMTP id z21mr2933000lfj.297.1617215115896;
 Wed, 31 Mar 2021 11:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210313194836.372585-1-masahiroy@kernel.org> <20210313194836.372585-11-masahiroy@kernel.org>
 <20210331171238.GA141362@roeck-us.net>
In-Reply-To: <20210331171238.GA141362@roeck-us.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 31 Mar 2021 11:25:04 -0700
Message-ID: <CAKwvOdmNUMJTjyc7hAhNRzmWmRQa5TCayTSpwiiVnO4HH-YTOQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] kconfig: do not use allnoconfig_y option
To:     Guenter Roeck <linux@roeck-us.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021 at 10:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sun, Mar 14, 2021 at 04:48:34AM +0900, Masahiro Yamada wrote:
> > allnoconfig_y is a bad hack that sets a symbol to 'y' by allnoconfig.
> >
> > allnoconfig does not mean a minimum set of CONFIG options because a
> > bunch of prompts are hidden by 'if EMBEDDED' or 'if EXPERT', but I do
> > not like to do a workaround this way.
> >
> > Use the pre-existing feature, KCONFIG_ALLCONFIG, to provide a one
> > liner config fragment. CONFIG_EMBEDDED=y is still forced under
> > allnoconfig.
> >
> > No change in the .config file produced by 'make tinyconfig'.
> >
> > The output of 'make allnoconfig' will be changed; we will get
> > CONFIG_EMBEDDED=n because allnoconfig literally sets all symbols to n.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> With this patch in place, mips:allnoconfig fails to build with
> the following error.
>
> Error log:
> WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference from the function reserve_exception_space() to the function .meminit.text:memblock_reserve()
> The function reserve_exception_space() references
> the function __meminit memblock_reserve().
> This is often because reserve_exception_space lacks a __meminit
> annotation or the annotation of memblock_reserve is wrong.
> ERROR: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> make[2]: *** [scripts/Makefile.modpost:62: vmlinux.symvers] Error 1
> make[2]: *** Deleting file 'vmlinux.symvers'
> make[1]: *** [Makefile:1292: vmlinux] Error 2
> make: *** [Makefile:222: __sub-make] Error 2

Thanks for the report. I suspect this is related to allnoconfig
disabling CONFIG_ARCH_KEEP_MEMBLOCK, which changes the definition of
__init_memblock in include/linux/memblock.h.

So allnoconfig would unselect CONFIG_ARCH_KEEP_MEMBLOCK, making
__init_memblock equivalent to __meminit triggering the above warning.

arch/mips/Kconfig
14:     select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL

so DEBUG_KERNEL is probably also disabled by allnoconfig.

commit a8c0f1c634507 ("MIPS: Select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
to enable sysfs memblock debug")

probably should drop the `if DEBUG_KERNEL` part.

>
> Guenter
>
> > ---
> >
> >  init/Kconfig                    | 1 -
> >  kernel/configs/tiny-base.config | 1 +
> >  scripts/kconfig/Makefile        | 3 ++-
> >  3 files changed, 3 insertions(+), 2 deletions(-)
> >  create mode 100644 kernel/configs/tiny-base.config
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 46b87ad73f6a..beb8314fdf96 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1769,7 +1769,6 @@ config DEBUG_RSEQ
> >
> >  config EMBEDDED
> >       bool "Embedded system"
> > -     option allnoconfig_y
> >       select EXPERT
> >       help
> >         This option should be enabled if compiling the kernel for
> > diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
> > new file mode 100644
> > index 000000000000..2f0e6bf6db2c
> > --- /dev/null
> > +++ b/kernel/configs/tiny-base.config
> > @@ -0,0 +1 @@
> > +CONFIG_EMBEDDED=y
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index 7df3c0e4c52e..46f2465177f0 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -102,7 +102,8 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
> >
> >  PHONY += tinyconfig
> >  tinyconfig:
> > -     $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> > +     $(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
> > +     $(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
> >
> >  # CHECK: -o cache_dir=<path> working?
> >  PHONY += testconfig
> > --
> > 2.27.0
> >



-- 
Thanks,
~Nick Desaulniers
