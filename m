Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9024F21C0B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 18:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfEQQzP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 12:55:15 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:24288 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbfEQQzP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 12:55:15 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4HGsqSM021729;
        Sat, 18 May 2019 01:54:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4HGsqSM021729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558112093;
        bh=5EgqDA3uYtlz+L9+XdyrzLf9fP9Nb7aFHjFy8jmb9xk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=klfFRY+V0IcR/WURZ8TUavi5XlMp+z3AAFdWp4hexArEt+1hST4bqXlIR4a9qvopF
         2cChKs91z2RU14NwGmJe3w/ulbAXctG0MmRjYWVYGPwmrqbSXfHChUNOAuXcDeBBCt
         ZbPTTx2NRW7QCfIIl85MdiIlqPeogigmlSA1vNnK3uhr/ksbRxnXbIYOXO32bqF0iw
         8L93IFPZPYsQw6C+xtArZlqhUvymbJpHo47CABsMpF3CF3i2VdaIo4JD16kXo5sbAk
         0ZzJsFU2YUJ2EZTZ9Co61rcTQn7GCTiudH8miA9548lgCPGiuF7yDzDMn45XwRJ4j3
         NWP3Fuu6z5CsA==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id l20so5072600vsp.3;
        Fri, 17 May 2019 09:54:53 -0700 (PDT)
X-Gm-Message-State: APjAAAWPV34yWT++zpwniSuJ4ROafhiKNhCy5M5Wmb5gcEqpfw6zwkqH
        L5nXKVMJw/kRLKGValOLz/+3wwXNUvNbYhCDxkA=
X-Google-Smtp-Source: APXvYqzINtt+UP6QYttfJWgL84DbhH2Bi2LMAL/PldGGKhnRzaS4ndVK1dAtfX05W0f3e5v5KRkvEG5WAjb2idT60D4=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr9584081vsl.179.1558112092216;
 Fri, 17 May 2019 09:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 01:54:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDT7MaD1Kw8w0JgLYYXvLntb+tsNo+D9LJ2PmzNQNKdg@mail.gmail.com>
Message-ID: <CAK7LNARDT7MaD1Kw8w0JgLYYXvLntb+tsNo+D9LJ2PmzNQNKdg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
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

On Sat, May 18, 2019 at 1:10 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> In the recent build test of linux-next, Stephen saw a build error
> caused by a broken .tmp_versions/*.mod file:
>
>   https://lkml.org/lkml/2019/5/13/991
>
> drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> basename, and there is a race in generating .tmp_versions/asix.mod
>
> Kbuild has not checked this before, and it suddenly shows up with
> obscure error message when this kind of race occurs.
>
> Non-unique module names cause various sort of problems, but it is
> not trivial to catch them by eyes.
>
> Hence, this script.
>
> It checks not only real modules, but also built-in modules (i.e.
> controlled by tristate CONFIG option, but currently compiled with =y).
> Non-unique names for built-in modules also cause problems because
> /sys/modules/ would fall over.
>
> I tested allmodconfig on the latest kernel, and it detected the
> following:


FYI.

"make -j8 allmodconfig all"
takes long time to compile
(my machine is cheap...)


If you want to detect modules with non-unique name quickly,
"make -j8 allyesconfig modules" is much faster.






> warning: same basename if the following are built as modules:
>   drivers/regulator/88pm800.ko
>   drivers/mfd/88pm800.ko
> warning: same basename if the following are built as modules:
>   drivers/gpu/drm/bridge/adv7511/adv7511.ko
>   drivers/media/i2c/adv7511.ko
> warning: same basename if the following are built as modules:
>   drivers/net/phy/asix.ko
>   drivers/net/usb/asix.ko
> warning: same basename if the following are built as modules:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> warning: same basename if the following are built as modules:
>   drivers/net/phy/realtek.ko
>   drivers/net/dsa/realtek.ko
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>
> Changes in v3:
>  - Simplied sed code (Alexander Kapshuk)
>
> Changes in v2:
>  - redirect messages to stderr
>  - use '--' after 'basename -a'
>  - use '-r' for xargs to cope with empty modules.order/modules.builtin
>
>  Makefile                 |  1 +
>  scripts/modules-check.sh | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100755 scripts/modules-check.sh
>
> diff --git a/Makefile b/Makefile
> index a61a95b..30792fe 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1290,6 +1290,7 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
>         $(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
>         @$(kecho) '  Building modules, stage 2.';
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> +       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
>
>  modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
>         $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> new file mode 100755
> index 0000000..2f65953
> --- /dev/null
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +# Check uniqueness of module names
> +check_same_name_modules()
> +{
> +       for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
> +       do
> +               echo "warning: same basename if the following are built as modules:" >&2
> +               sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
> +       done
> +}
> +
> +check_same_name_modules
> --
> 2.7.4
>


--
Best Regards
Masahiro Yamada
