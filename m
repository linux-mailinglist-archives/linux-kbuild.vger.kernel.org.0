Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB1221532
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 10:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbfEQIRe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 04:17:34 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:40683 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfEQIRe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 04:17:34 -0400
Received: by mail-it1-f195.google.com with SMTP id g71so10629181ita.5;
        Fri, 17 May 2019 01:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eltQ9RZxJjFFTW0M+Rw53YKm6Il1GZsOUEw7O1NJc6A=;
        b=r6t9xclW40AbJdsDu9N56nnINz1Xwu7BXJAT5M/DuK8RoxRujPvSwQexafcqJ4LNVR
         LetWg2zbqY2RHXHnbugfpIQ/ApNXHu1s6r6DuaUzg2fiwQCgs/7PJOQe59DDxYiMswEv
         BLotbh0F9TyeCcFTUKOvXCE3KhhMHU45BPsPOeA8tEeBJ3vZjK+b7LIr8DQkD4LpM9i0
         jckvNvSz2QLW4Dn5GB40/EkMCNoiv9smq8bfIsRaE69ZY+TuyF4jdniWXsvybIpwMzNh
         TImUtjvo0I5ZUA3+hOl3id1v4ZiecR9iZf6igtgTvhBKTZSKlZABoD2AaBgA0q279lTT
         2Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eltQ9RZxJjFFTW0M+Rw53YKm6Il1GZsOUEw7O1NJc6A=;
        b=MNGZNQnSbcsPEE27Ew4bvm65MbVVuR9uMhDzoVI4YL3S+EJpL4xFWJIqQ8iZvOyD8E
         FSGc9hGaxXpsUs0Ux6WykcHzDU0U1IU3Foi0P00/DDOaWHtO88UbK3G/MlL5IR0UIlVL
         3KxlrMhMdtq5uGaed9h0Hqp8TqmfcHCDPdw8CkRbCGbN5e1y1PikJUOxyJQ6vRhR8GEQ
         h6IHYGq0S5Q+UaryPM8BgejgHNuecMrGUNcfhaf9ag3tcnTydCZmt812hH9+5pmP8KCz
         JnSqZwCBjhsTXYoucIwSVYAGEWM9PR7XGN8KdtSoRAYQVDitBrwEMQgyIvdOOf9o6kB+
         PnGg==
X-Gm-Message-State: APjAAAVqlfoRzngyAt1LJIoPtm6FB9DW2/xm2cPrHVteve2XKn6/jVIH
        9fiBjGKza3rgTFzpEhKSxqHJIoKRPAoyMSB4pXE=
X-Google-Smtp-Source: APXvYqxaa+9vroafRYXth4ySCoYO5YIUH+5FUP8lgcefCyKO30FB4DouHp5cYDHNkJj00DEJAQc50MD5zSxT7z1IXU0=
X-Received: by 2002:a05:660c:1282:: with SMTP id s2mr1810731ita.47.1558081052776;
 Fri, 17 May 2019 01:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190517042753.25857-1-yamada.masahiro@socionext.com>
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date:   Fri, 17 May 2019 11:16:56 +0300
Message-ID: <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 8:33 AM Masahiro Yamada
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
>
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
> ---
>
> Changes in v2:
>  - redirect messages to stderr
>  - use '--' after 'basename -a'
>  - use '-r' for xargs to cope with empty modules.order/modules.builtin
>
>  Makefile                 |  1 +
>  scripts/modules-check.sh | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100755 scripts/modules-check.sh
>
> diff --git a/Makefile b/Makefile
> index a61a95b6b38f..30792fec7a12 100644
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
> index 000000000000..c875f6eab01e
> --- /dev/null
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +# Check uniqueness of module names
> +check_same_name_modules()
> +{
> +       same_name_modules=$(cat modules.order modules.builtin | \
> +                               xargs -r basename -a -- | sort | uniq -d)
> +
> +       for m in $same_name_modules
> +       do
> +               echo "warning: same basename if the following are built as modules:" >&2
> +               grep -h -e "/$m" modules.order modules.builtin | \
> +                                               sed 's:^kernel/:  :' >&2
> +       done
> +}
> +
> +check_same_name_modules
> --
> 2.17.1
>

The 'xargs' '-r' flag is a GNU extension.
If POSIX compliance is important here, the use of 'cat', 'xargs' and
'basename' may be substituted with that of 'sed' to initialise
same_name_modules:
sed 's!.*/!!' modules.order modules.builtin | sort | uniq -d

'Sed' may also be used on its own in the 'for' loop instead of as part
of a pipeline along with 'grep' to generate the desired output:
sed '/\/'$m'/!d;s:^kernel/:  :' modules.order modules.builtin

Just a suggestion.
