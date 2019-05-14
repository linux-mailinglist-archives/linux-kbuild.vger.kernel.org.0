Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3941C0BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2019 04:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfENCyo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 May 2019 22:54:44 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29816 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfENCyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 22:54:44 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4E2sdp1004820;
        Tue, 14 May 2019 11:54:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4E2sdp1004820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557802481;
        bh=rFuRFoBY8BjOIKeayc3Ot7VuLciFt8LmjZQInVHSlJ4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M/nWmIQpgSw8lYeS5vHINkvbkJEEyJ2XG6ydAmYMqKRuStMB1s1ZvnGlfKW8E1S+r
         p1r6IOp6KSf7oQc9jql1QraVXc9oFBd5kVGQdBF34ER8EpqXK0vHxs6khjAFiuMU/3
         wtMuoqofVm99cCX+DbvvEswe/DzMtSTOQJ0x4LhxdAMt3YVbi38hAWL6PloUMTLMNu
         9HARA3NHM2QeeVhmmUJpAvuJ7+vKMCehbSKgmYrE7E1LgqUIi9V7zP4rSVCBySm43K
         jWGwbtBuWCyRRS/Z5aQMX2IllBKizP7vbKb+0d+wTG7CwUy/NQtff5+7WwpRtjf5Gd
         pSb2qHrx/FVng==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id q64so9372215vsd.1;
        Mon, 13 May 2019 19:54:40 -0700 (PDT)
X-Gm-Message-State: APjAAAXHOrJhTdjWJlL6etBiZ1DBYsoMWbkYhKOHL7+YFLkEBib4SaE5
        Ld2XWZYaUn49YuNLQlnCIRlzjpCFfs+DOwTm6dc=
X-Google-Smtp-Source: APXvYqyrQxnPRhJ3FLWMlSOsXjGbSi7zKQxYzdHJB0RMC8Qrb2DGcBWQtuxRQWnmcrKt62nbS2wFXsudrd2UZBTVwL4=
X-Received: by 2002:a67:f443:: with SMTP id r3mr15631970vsn.179.1557802479337;
 Mon, 13 May 2019 19:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190509073555.15545-1-yamada.masahiro@socionext.com> <20190513044721.GA3664@archlinux-i9>
In-Reply-To: <20190513044721.GA3664@archlinux-i9>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 14 May 2019 11:54:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUgvqLG8LQUcLfkQFVngiOdAeeYxbK0qg9dyUyxenu6A@mail.gmail.com>
Message-ID: <CAK7LNARUgvqLG8LQUcLfkQFVngiOdAeeYxbK0qg9dyUyxenu6A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 13, 2019 at 1:47 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, May 09, 2019 at 04:35:55PM +0900, Masahiro Yamada wrote:
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
> >
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
>
> As mentioned in the other thread, $(AS) should be checked as well since
> it's possible that neither $(CC) nor $(LD) will involve $(CROSS_COMPILE),
> like the combination of clang + ld.lld, whereas $(AS) will (currently)
> always involve $(CROSS_COMPILE).

Indeed.
This patch cannot check the presence of the intended gnu toolchains
if CC=clang LD=ld.lld

The reason for $(CC) / $(LD) checks in Kconfig
is because it evaluates some $(cc-option, ...) and $(ld-option, ...) calls.

Currently, Kconfig does not have as-option, but I will add it
sooner or later, so I am fine with adding
$(error-if,$(failure,command -v $(AS)),assembler '$(AS)' not found)




> > +
> >  # gcc version including patch level
> >  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> > --
> > 2.17.1
> >


--
Best Regards
Masahiro Yamada
