Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 987E61AEF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfEMCfh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:35:37 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40790 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfEMCfh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:35:37 -0400
Received: by mail-qt1-f196.google.com with SMTP id k24so8087952qtq.7;
        Sun, 12 May 2019 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0ZH7EmWDmGyDb6BIpvnIVA/+/gXTuajAezfGcXNja8=;
        b=nMLC7fk2jUjWZuyUE7OV83X/g0pp5ylpZCrfGxwaVZPKqNy+DABj/g+Q0scYnoZW9E
         cNOh7elbR10+O/PY433UkLuQZs2mMZZfzmFd46hChrkpSzXi4aMZAEV3/8op6HM1nYO3
         NvSDCPDh2iXvw5OEnckkgGieX5c0yd5MQ0dBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0ZH7EmWDmGyDb6BIpvnIVA/+/gXTuajAezfGcXNja8=;
        b=nAqYkDvT9ome7exWe3EMWSx9M1OsaJCihLESVbpDai0XHv5yrq/HwakynJzq4S5VIf
         ZhExnmvRfFFBK/LuwggMy1pFdk01aXryBMslRBciVq1M9GH/ouxZ4MYGE65S2jd5WcjG
         twW8zvSQEJkHPi/J5OLbMoPX3pD5xf2/YiPxX7z1ycICEo4hWf+BSW3FrGOpBIJNyaPr
         ecmp1s2WHXxIMvPOrv6ptIDDfhrSvCkiB6cQIFxFIPawx2k5D2f88o2b/3HwNzl//LhG
         PsBzmSnskc08xXQYQepZ3UT/yBkku83Gj2aLOEU5oD8cwpg4ag4GDFryvTTHp2ajPPEw
         /gkg==
X-Gm-Message-State: APjAAAWA2u9xtBMoP+57yRuXdzTgGHm6yLDF+HtvwOaOkvL9rZ/sx9oW
        BbqwregKTuCDzTbY4YZPgPlRb4nBeE4624A7El0hEYDB
X-Google-Smtp-Source: APXvYqzTxT/Qw+JqYrZgxGgHyMFtSKRkbGK4Slq68uOnqJ4S2xG9MFaV9bcZvZiF9swkNvgi7wrnvFUwfL/ZD7nnCXc=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr21846072qta.136.1557714936178;
 Sun, 12 May 2019 19:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190509073555.15545-1-yamada.masahiro@socionext.com> <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com>
In-Reply-To: <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 13 May 2019 02:35:23 +0000
Message-ID: <CACPK8XdVZHtCtHzv9vmt8C877SBbZNqRPxT9iUe0+8-o7X9W7g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 13 May 2019 at 02:28, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, May 9, 2019 at 4:36 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > If the compiler specified by $(CC) is not present, the Kconfig stage
> > sprinkles 'not found' messages, then succeeds.
> >
> >   $ make CROSS_COMPILE=foo defconfig
> >   /bin/sh: 1: foogcc: not found
> >   /bin/sh: 1: foogcc: not found
> >   *** Default configuration is based on 'x86_64_defconfig'
> >   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> >   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> >   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> >   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> >   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> >   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> >   ./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
> >   ./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
> >   init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
> >   #
> >   # configuration written to .config
> >   #
> >
> > Terminate parsing files immediately if $(CC) or $(LD) is not found.
> > "make *config" will fail more nicely.
> >
> >   $ make CROSS_COMPILE=foo defconfig
> >   *** Default configuration is based on 'x86_64_defconfig'
> >   scripts/Kconfig.include:34: compiler 'foogcc' not found
> >   make[1]: *** [scripts/kconfig/Makefile;82: defconfig] Error 1
> >   make: *** [Makefile;557: defconfig] Error 2
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
> Applied to linux-kbuild.

Thanks Masahiro! I had this in my inbox to test but you're too efficient.

Testing your patch on linus' tree as of today (d7a02fa0a8f9) gives me
this output:

$ CROSS_COMPILE=foo  make
make: foogcc: Command not found
scripts/kconfig/conf  --syncconfig Kconfig
scripts/Kconfig.include:34: compiler 'foogcc' not found
make[2]: *** [scripts/kconfig/Makefile:69: syncconfig] Error 1
make[1]: *** [Makefile:557: syncconfig] Error 2
make: *** [include/config/auto.conf.cmd] Deleting file
'include/config/tristate.conf'
make: Failed to remake makefile 'include/config/auto.conf'.
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  UPD     include/config/kernel.release
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/export.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  UPD     include/generated/uapi/linux/version.h
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/sortextable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/extract-cert
You are building kernel with non-retpoline compiler.
Please update your compiler.
make: *** [arch/x86/Makefile:308: checkbin] Error 1

Which is a little confusing.

The second time is shorter, but the retpoline message is not ideal:

$ CROSS_COMPILE=foo  make
make: foogcc: Command not found
scripts/kconfig/conf  --syncconfig Kconfig
scripts/Kconfig.include:34: compiler 'foogcc' not found
make[2]: *** [scripts/kconfig/Makefile:69: syncconfig] Error 1
make[1]: *** [Makefile:557: syncconfig] Error 2
make: Failed to remake makefile 'include/config/auto.conf'.
You are building kernel with non-retpoline compiler.
Please update your compiler.

Cheers,

Joel

>
>
> >  Makefile                | 2 +-
> >  scripts/Kconfig.include | 8 ++++++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 28965187c528..bd7ae11947cb 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -537,7 +537,7 @@ endif
> >  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> >  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> >  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
> > -CC_VERSION_TEXT = $(shell $(CC) --version | head -n 1)
> > +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
> >
> >  ifeq ($(config-targets),1)
> >  # ===========================================================================
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 87ff1dcc6bd5..0b267fb27f07 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -18,6 +18,10 @@ if-success = $(shell,{ $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
> >  # Return y if <command> exits with 0, n otherwise
> >  success = $(if-success,$(1),y,n)
> >
> > +# $(failure,<command>)
> > +# Return n if <command> exits with 0, y otherwise
> > +failure = $(if-success,$(1),n,y)
> > +
> >  # $(cc-option,<flag>)
> >  # Return y if the compiler supports <flag>, n otherwise
> >  cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> > @@ -26,5 +30,9 @@ cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> >  # Return y if the linker supports <flag>, n otherwise
> >  ld-option = $(success,$(LD) -v $(1))
> >
> > +# check if $(CC) and $(LD) exist
> > +$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> > +$(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> > +
> >  # gcc version including patch level
> >  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> > --
> > 2.17.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
