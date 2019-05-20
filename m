Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D26229DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 04:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfETCOf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 May 2019 22:14:35 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20958 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfETCOe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 May 2019 22:14:34 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4K2EPZf010599;
        Mon, 20 May 2019 11:14:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4K2EPZf010599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558318466;
        bh=VZT+dBEuTUp2nvsq0QEUtjKPQOjNBhC01YI0fClrYlk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DyU8Fm6xABp6oXu+Q6UXe5wuciIdp7MayAmm9B87C794CycMFkF9q+TUHpVH8PqHu
         6pBOsE/pKyYiEgm9Q07SHIjkujg6YksS4PLjvg836RPFkNQHgpz8CDR8ZQ24YQ4zPQ
         VHAgidzdnOKzeZSpLVcYRbYCkDAniNaSdxbE62v+nOSYUAbwMY7YsrFFoAT8YUL1zZ
         pZbG+ZnzlW1us3cgSPNokqf2DGokdGSvCeHuo+b56vy7QOr3iwwjwRms4vU//XrXpC
         ubH0SYMfA278Q1IOME4KCR+iVVljVmzPuA8Jf1HaDYLIaZ777mBR0Q8/A66GR4a+zG
         1HcQGRcuSP3zQ==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id m1so7973537vsr.6;
        Sun, 19 May 2019 19:14:26 -0700 (PDT)
X-Gm-Message-State: APjAAAWB+NaLLNYFeF35evqKqd3O3tCtVjzFYZXr+0/g4/vdNhuS+10M
        uUDlwMyNE6M06L1BdJdpLwJ420ZozGtLth6Rdvs=
X-Google-Smtp-Source: APXvYqwkqsmntlg/Va89Mxc0iu7T5p37ceRTEIAyBXMJbw5KLG1VQoHw0HcvFyL4sBSZv9FYEfrG6TiIqLiVLPo96qA=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr15737470vsl.179.1558318465161;
 Sun, 19 May 2019 19:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com> <20190520095147.2021c218@canb.auug.org.au>
In-Reply-To: <20190520095147.2021c218@canb.auug.org.au>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 20 May 2019 11:13:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQc1XjTCo0FdYMxCrGP-iqNj1s464WepCVcxUun3=OvMg@mail.gmail.com>
Message-ID: <CAK7LNAQc1XjTCo0FdYMxCrGP-iqNj1s464WepCVcxUun3=OvMg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Stephen,

On Mon, May 20, 2019 at 8:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> On Sat, 18 May 2019 01:07:15 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > It checks not only real modules, but also built-in modules (i.e.
> > controlled by tristate CONFIG option, but currently compiled with =y).
> > Non-unique names for built-in modules also cause problems because
> > /sys/modules/ would fall over.
> >
> > I tested allmodconfig on the latest kernel, and it detected the
> > following:
>
> A powerpc ppc64_defconfig produces:
>
> warning: same basename if the following are built as modules:
>   arch/powerpc/platforms/powermac/nvram.ko
>   drivers/char/nvram.ko
>
> Which is a false positive since
> arch/powerpc/platforms/powermac/Makefile has
>
> # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
> # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
> # CONFIG_NVRAM=y
> obj-$(CONFIG_NVRAM:m=y)         += nvram.o
>
> Which means that this nvram.o will never be built as a module.

Indeed.

I thought it was a good idea to check built-in modules,
but I do not have a good way to avoid false positives.

I think we should not check modules.builtin.
Anyway, allmodconfig has a good test coverage.

The following is the planned fix.
(I folded your sed code.)




diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 2f659530e1ec..39e8cb36ba19 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -6,10 +6,10 @@ set -e
 # Check uniqueness of module names
 check_same_name_modules()
 {
-       for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
+       for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
        do
-               echo "warning: same basename if the following are
built as modules:" >&2
-               sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
+               echo "warning: same module names found:" >&2
+               sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
        done
 }






> --
> Cheers,
> Stephen Rothwell



--
Best Regards
Masahiro Yamada
