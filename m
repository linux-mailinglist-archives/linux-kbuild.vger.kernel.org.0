Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466D23668DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 12:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbhDUKKD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Apr 2021 06:10:03 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48809 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbhDUKKD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Apr 2021 06:10:03 -0400
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 13LA9A7c025983
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Apr 2021 19:09:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13LA9A7c025983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618999751;
        bh=jhq+x3zjBvV6IAAGAyQZXvcnjJO//NC8m8/bq1kaUxI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lPIoiLzS1IF35q+hUUwlRey2ueTP5jaXUnrJrhAHuBQWPaS4VEwqvF3gjkPiLWkRe
         4uhFq5iWnkS9bQMKHF7tcR1bPzthJQqS/Xlg9HEHQyCc9YwMsCVnyjB682+1/USTFT
         SobIuVxyrmP1a+KKlDCthlTAHQJ357DitVzhB3jUhOAo8jIETZQcbz1rCxDA1KPufz
         qoU4Mc70/euZC3boqz0ecLTu3zF4vtpNKIvipQMKRvCtoR9hkvdi/BehPkwUxpsEPK
         0DCWuIjB7DBe5lRSQvZLkXVmF9dk3fyxxRvWoKPzW4/H4LaztRuu/JYFe+ileZlihR
         tH8SoAL437XPQ==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id y32so29311040pga.11
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Apr 2021 03:09:10 -0700 (PDT)
X-Gm-Message-State: AOAM530aYeo0ehjDy0Lw1eeLN6oEo30xHdREP0ScegoUnilPfoH4VEGc
        GyOezVqwByuOtBeS19x/m2Cm240D2aBDYbWS3/0=
X-Google-Smtp-Source: ABdhPJxMZ6D4N7IoEqjuGhVQs4Qv87hZqLvpPdYED1G/OXxMw/60fIsER4DTpQrlhVw+IwSK8FYvzz5pGVrFdmH04Js=
X-Received: by 2002:a63:e044:: with SMTP id n4mr21340657pgj.47.1618999750211;
 Wed, 21 Apr 2021 03:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org> <87tuo0az16.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tuo0az16.fsf@mpe.ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Apr 2021 19:08:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUZuDigADB8JP+wO=hvk+guM-DU=XYpaFxcYG6ErWo9Q@mail.gmail.com>
Message-ID: <CAK7LNATUZuDigADB8JP+wO=hvk+guM-DU=XYpaFxcYG6ErWo9Q@mail.gmail.com>
Subject: Re: powerpc{32,64} randconfigs
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 21, 2021 at 4:15 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Randy Dunlap <rdunlap@infradead.org> writes:
> > Hi,
> >
> > Is there a way to do this?
> >
> > $ make ARCH=powerpc randconfig # and force PPC32
>
> Sort of:
>
> $ KCONFIG_ALLCONFIG=arch/powerpc/configs/book3s_32.config make randconfig
>
> But that also forces BOOK3S.
>
> > and separately
> > $ make ARCH=powerpc randconfig # and force PPC64
>
> No.
>
> ...
> > OK, I have a patch that seems for work as far as setting
> > PPC32=y or PPC64=y... but it has a problem during linking
> > of vmlinux:
> >
> > crosstool/gcc-9.3.0-nolibc/powerpc-linux/bin/powerpc-linux-ld:./arch/powerpc/kernel/vmlinux.lds:6: syntax error
> >
> > and the (bad) generated vmlinux.lds file says (at line 6):
> >
> > OUTPUT_ARCH(1:common)
> >
> > while it should say:
> >
> > OUTPUT_ARCH(powerpc:common)
> >
> > Does anyone have any ideas about this problem?
>
> I guess your patch broke something? :D
> Not sure sorry.
>
> What about something like this?
>
> cheers
>
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 3212d076ac6a..712c5e8768ce 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -376,6 +376,16 @@ PHONY += ppc64_book3e_allmodconfig
>         $(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/85xx-64bit.config \
>                 -f $(srctree)/Makefile allmodconfig
>
> +PHONY += ppc32_randconfig
> +ppc32_randconfig:
> +       $(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/32-bit.config \
> +               -f $(srctree)/Makefile randconfig
> +
> +PHONY += ppc64_randconfig
> +ppc64_randconfig:
> +       $(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
> +               -f $(srctree)/Makefile randconfig
> +
>  define archhelp
>    @echo '* zImage          - Build default images selected by kernel config'
>    @echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
> diff --git a/arch/powerpc/configs/32-bit.config b/arch/powerpc/configs/32-bit.config
> new file mode 100644
> index 000000000000..bdf833009006
> --- /dev/null
> +++ b/arch/powerpc/configs/32-bit.config
> @@ -0,0 +1 @@
> +CONFIG_PPC64=n

Please do:

# CONFIG_PPC64 is not set





> diff --git a/arch/powerpc/configs/64-bit.config b/arch/powerpc/configs/64-bit.config
> new file mode 100644
> index 000000000000..0fe6406929e2
> --- /dev/null
> +++ b/arch/powerpc/configs/64-bit.config
> @@ -0,0 +1 @@
> +CONFIG_PPC64=y
>


-- 
Best Regards
Masahiro Yamada
