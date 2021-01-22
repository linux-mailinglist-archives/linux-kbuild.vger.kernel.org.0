Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBC23001DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 12:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbhAVLpx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 06:45:53 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58774 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbhAVLOJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 06:14:09 -0500
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10MBCw8w016148;
        Fri, 22 Jan 2021 20:12:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10MBCw8w016148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611313979;
        bh=D7WJn5ip9vwukc8tSFFnXyaZzQAdq+2k8RixwVA9pt0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XS1P75STxMVKC82+XK6/3X0T0dxd0zS0gVIotWS3jOlFYQa2QSSYMXW6diGLF4eXb
         lYQ1a0T1RWnLB3whNpOjnth1faJuZU+629v7uwogMdF507KNGqA99ZEAd98wMWrZ16
         sNHKF55DSEEGukmbpFrdd1j4eoinJA8nWCvjgv0NXzgkOIWkRo9tW8NSH8MeWjdlqI
         4CLtxZQtJpBs+aP2pORiBLoA7tszCOsjPLIDZqCnD3tMDSYQji7rd1PZRwRUW03vOP
         3X/EK56LHOUyco49Lm7z41M4adulVVIxHu55ezsrdByvUcieu2g+poFO7aXLJ1451e
         /GhHCszWUin8A==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id u11so2967628plg.13;
        Fri, 22 Jan 2021 03:12:59 -0800 (PST)
X-Gm-Message-State: AOAM530WhV3LmYp6fGCNiPbsv5dZLugHwc2mrrbAWRfBb05j3banJMYk
        OzVaHfK8Ag80i0FCxfIVtiTA/Kk1jGrci4NrcUM=
X-Google-Smtp-Source: ABdhPJwHMlGlT7igCUnp0nVPVEWWhj+b7/scA0XVxD8bky4PSp4nAJaeuaXQg2cn0oBR+KJeCVUrSnTJ5k0A58j0mSM=
X-Received: by 2002:a17:90a:3481:: with SMTP id p1mr4844084pjb.198.1611313978476;
 Fri, 22 Jan 2021 03:12:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611312122.git.viresh.kumar@linaro.org> <43d693de2034dd30bb7d4576ffb52207ca220079.1611312122.git.viresh.kumar@linaro.org>
In-Reply-To: <43d693de2034dd30bb7d4576ffb52207ca220079.1611312122.git.viresh.kumar@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 22 Jan 2021 20:12:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjAvCyuY7yFAS2NaV-3XZbUjBd4rmgpD9rWYdoR9TkLw@mail.gmail.com>
Message-ID: <CAK7LNASjAvCyuY7yFAS2NaV-3XZbUjBd4rmgpD9rWYdoR9TkLw@mail.gmail.com>
Subject: Re: [PATCH V6 4/6] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 7:51 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Add support for building DT overlays (%.dtbo). The overlay's source file
> will have the usual extension, i.e. .dts, though the blob will have
> .dtbo extension to distinguish it from normal blobs.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Acked-by: Masahiro Yamada <masahiroy@kernel.org>



>  .gitignore               | 1 +
>  Makefile                 | 5 ++++-
>  scripts/Makefile.dtbinst | 3 +++
>  scripts/Makefile.lib     | 5 +++++
>  4 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/.gitignore b/.gitignore
> index d01cda8e1177..bb65fa253e58 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -18,6 +18,7 @@
>  *.c.[012]*.*
>  *.dt.yaml
>  *.dtb
> +*.dtbo
>  *.dtb.S
>  *.dwo
>  *.elf
> diff --git a/Makefile b/Makefile
> index 9e73f82e0d86..18fd02f55d9b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1337,6 +1337,9 @@ ifneq ($(dtstree),)
>  %.dtb: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> +%.dtbo: include/config/kernel.release scripts_dtc
> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> +
>  PHONY += dtbs dtbs_install dtbs_check
>  dtbs: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
> @@ -1816,7 +1819,7 @@ clean: $(clean-dirs)
>         @find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
>                 \( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
>                 -o -name '*.ko.*' \
> -               -o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
> +               -o -name '*.dtb' -o -name '*.dtbo' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
>                 -o -name '*.dwo' -o -name '*.lst' \
>                 -o -name '*.su' -o -name '*.mod' \
>                 -o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
> diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
> index 50d580d77ae9..ba01f5ba2517 100644
> --- a/scripts/Makefile.dtbinst
> +++ b/scripts/Makefile.dtbinst
> @@ -29,6 +29,9 @@ quiet_cmd_dtb_install = INSTALL $@
>  $(dst)/%.dtb: $(obj)/%.dtb
>         $(call cmd,dtb_install)
>
> +$(dst)/%.dtbo: $(obj)/%.dtbo
> +       $(call cmd,dtb_install)
> +
>  PHONY += $(subdirs)
>  $(subdirs):
>         $(Q)$(MAKE) $(dtbinst)=$@ dst=$(patsubst $(obj)/%,$(dst)/%,$@)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 213677a5ed33..b00855b247e0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -86,7 +86,9 @@ extra-$(CONFIG_OF_ALL_DTBS)   += $(dtb-)
>
>  ifneq ($(CHECK_DTBS),)
>  extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> +extra-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
>  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> +extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
>  endif
>
>  # Add subdir path
> @@ -327,6 +329,9 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>
> +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> +       $(call if_changed_dep,dtc)
> +
>  DT_CHECKER ?= dt-validate
>  DT_BINDING_DIR := Documentation/devicetree/bindings
>  # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
> --
> 2.25.0.rc1.19.g042ed3e048af
>


-- 
Best Regards
Masahiro Yamada
