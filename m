Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A36A07C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfH1QpQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:45:16 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30370 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfH1QpQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:45:16 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x7SGjBde015936;
        Thu, 29 Aug 2019 01:45:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x7SGjBde015936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567010712;
        bh=BNuxKHSLybVA12f+ywCNukk32ucTqOKdIKBZ/5+ichk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QPb03lPdO0QCthf2wUwmX6jYBnrxx4FJhio6VjpnItRPD4U2b+pWb9+DVWhFuIY0o
         65LUSFJArDYHuvLvGlz5QQKDwIJyjVqFD807T1j6uIrPpthMRqoBV9S0JcBin/X2mS
         sclonJv730gXQdZ+tWtEs0RgH0m88TkT6SX46AgaeyAHXKmIVwUOlnLQupvjxc6qtr
         cOsnI5+lHy618NzDoghuHEohLpTNNi9NuxO2+WzoxFsytiG6zQDAHxoLobrFqvrrB5
         brU4NdoTdz8k2FF5K+ZhzSI6NcOPlwOueS3Ax9JpJbTG0JbE/2EfsJ+ARxYcY0qEur
         sQJSPA+wt9DDQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id q16so437083vsm.2;
        Wed, 28 Aug 2019 09:45:11 -0700 (PDT)
X-Gm-Message-State: APjAAAXBxeqYLuXrIYy+7Y2uhuCFkodu2SmS/vubuBarK5mpdqYZgtfc
        3fdIPuqBdNAMDDBJg1XfzTs8rDAf7fFe5QGNw88=
X-Google-Smtp-Source: APXvYqz8f1WeeabHuCBoPty5s4JUQfpYOWRdzGih76IDQDViYi/G6mM1rML+Jt5hJ0xIyOfT5mG7CauGE9TTs+vRZ/U=
X-Received: by 2002:a67:fd97:: with SMTP id k23mr2902393vsq.179.1567010710588;
 Wed, 28 Aug 2019 09:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190819085843.3554-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190819085843.3554-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 01:44:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQq_P9eFOOhR_vA+YzgVdoOigCdiqufJBssoOO-Q5X8ig@mail.gmail.com>
Message-ID: <CAK7LNAQq_P9eFOOhR_vA+YzgVdoOigCdiqufJBssoOO-Q5X8ig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move modkern_{c,a}flags to Makefile.lib from Makefile.build
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 19, 2019 at 5:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Makefile.lib is included by Makefile.modfinal as well as Makefile.build.
>
> Move modkern_cflags to Makefile.lib in order to simplify cmd_cc_o_c
> in Makefile.modfinal. Move modkern_cflags as well for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.

>
>  scripts/Makefile.build    | 13 -------------
>  scripts/Makefile.lib      | 12 ++++++++++++
>  scripts/Makefile.modfinal |  6 +++---
>  3 files changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 10adf3b558de..b46e608f9931 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -92,15 +92,6 @@ endif
>  # Compile C sources (.c)
>  # ---------------------------------------------------------------------------
>
> -# Default is built-in, unless we know otherwise
> -part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
> -
> -modkern_cflags =                                          \
> -       $(if $(part-of-module),                           \
> -               $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> -               $(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
> -quiet_modtag = $(if $(part-of-module),[M],   )
> -
>  quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
>        cmd_cc_s_c = $(CC) $(filter-out $(DEBUG_CFLAGS), $(c_flags)) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
>
> @@ -304,10 +295,6 @@ $(obj)/%.h.s: $(src)/%.h FORCE
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>
> -modkern_aflags = $(if $(part-of-module),                               \
> -                       $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),       \
> -                       $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> -
>  # .S file exports must have their C prototypes defined in asm/asm-prototypes.h
>  # or a file that it includes, in order to get versioned symbols. We build a
>  # dummy C file that includes asm-prototypes and the EXPORT_SYMBOL lines from
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 264611972c4a..888e5c830646 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -159,6 +159,18 @@ _cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
>  endif
>  endif
>
> +part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
> +quiet_modtag = $(if $(part-of-module),[M],   )
> +
> +modkern_cflags =                                          \
> +       $(if $(part-of-module),                           \
> +               $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> +               $(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
> +
> +modkern_aflags = $(if $(part-of-module),                               \
> +                       $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),       \
> +                       $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> +
>  c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>                  -include $(srctree)/include/linux/compiler_types.h       \
>                  $(_c_flags) $(modkern_cflags)                           \
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 2e49d536a9b3..059dbcf5ae77 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -17,12 +17,12 @@ modules := $(sort $(shell cat $(MODORDER)))
>  __modfinal: $(modules)
>         @:
>
> -# modname is set to make c_flags define KBUILD_MODNAME
> +# modname and part-of-module are set to make c_flags define proper module flags
>  modname = $(notdir $(@:.mod.o=))
> +part-of-module = y
>
>  quiet_cmd_cc_o_c = CC [M]  $@
> -      cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
> -                  -c -o $@ $<
> +      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
>
>  %.mod.o: %.mod.c FORCE
>         $(call if_changed_dep,cc_o_c)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
