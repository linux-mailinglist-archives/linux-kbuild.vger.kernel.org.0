Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD2561128
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 16:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfGFOqQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 10:46:16 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:37234 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfGFOqQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:46:16 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x66Ejqiu028151;
        Sat, 6 Jul 2019 23:45:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x66Ejqiu028151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562424353;
        bh=m+KMPujBNkWshaRj44UmELQEZTKnrk+VC+L/Y3HqoRg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=apdTQHIVboLfyIX7rk1fG8LB4HOSjr7x+MnrH9XlfHIDzdw199vqSY6/4HdkXCB3A
         Ib5SI0jLmvl9y4X8q1Wgh+OLCKl6oXyOIRyFDtCgwv+0CP5Czx1l+6RB03ToqZUEUm
         u4MYtzziNwY1UeQWGJ6+oxC8sJvtFmL7954RL28AXb9IoxRGCAmFbjvn+qgTWuP//r
         WTJ04Dz64sQABlbbwzF8VMEjwVRUowEoD5tcCCuxXLTe0P/jp2uwd44Eda8Uhtp74x
         bWHvIqXZ7T/Lu7pRE3vVPCJuqLCpPaxIHohM01IV+6V69bvGcHxQsQyPRs7Sm/zbrc
         KFsSkqw2GExFA==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id 190so5512150vsf.9;
        Sat, 06 Jul 2019 07:45:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWQ+IhSxkhgVib2oX7fwKU4bVNHpdm470WtOr/Tlp7N6P+IzAxp
        nb6x7x2KseDAuXJX99E+oSlN9mDCabaikLAkE6o=
X-Google-Smtp-Source: APXvYqzmLzDXaJfRfw+GqXrk4Wa7gUZ4GvT0Ss2POjrHHzxXbr5LY1Ef+woCyb7HPKJAzXG4nxczcmw4hHO1vrYodtQ=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr5221656vsq.179.1562424351592;
 Sat, 06 Jul 2019 07:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190623161328.22461-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190623161328.22461-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 6 Jul 2019 23:45:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCHQ3Tv91txwnLAVwFuZaOJeA+tJe2TpJ0NA8Q6ThnDw@mail.gmail.com>
Message-ID: <CAK7LNARCHQ3Tv91txwnLAVwFuZaOJeA+tJe2TpJ0NA8Q6ThnDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: fix missed rebuild of modules.builtin
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 24, 2019 at 1:13 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Unlike modules.order, modules.builtin is not rebuilt every time.
> Once modules.builtin is created, it will not be updated until
> auto.conf or tristate.conf is changed.
>
> So, it misses to notice a change in Makefile, for example, renaming
> of modules.
>
> Kbuild must always descend into directories for modules.builtin too.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Both applied to linux-kbuild.

>
>  Makefile | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9514dac2660a..19c33bc69bb1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1289,12 +1289,16 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
>
> -modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
> -       $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> +modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
>
> -%/modules.builtin: include/config/auto.conf include/config/tristate.conf
> -       $(Q)$(MAKE) $(modbuiltin)=$*
> +modules.builtin: $(modbuiltin-dirs)
> +       $(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
>
> +PHONY += $(modbuiltin-dirs)
> +# tristate.conf is not included from this Makefile. Add it as a prerequisite
> +# here to make it self-healing in case somebody accidentally removes it.
> +$(modbuiltin-dirs): include/config/tristate.conf
> +       $(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@)
>
>  # Target to prepare building external modules
>  PHONY += modules_prepare
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
