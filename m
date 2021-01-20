Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E10D2FCD12
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 10:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbhATJAZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 04:00:25 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26421 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbhATJAF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 04:00:05 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10K8wh3T011274;
        Wed, 20 Jan 2021 17:58:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10K8wh3T011274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611133124;
        bh=f3iAmXIDKOPJp4ih3NmOk2Q9n+jGsuMSrON5Z6Bck8U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BQhXc0dE2eTO1n7TOOiwvnQOnCXEO311P3x+bQH5mQtfJC1xO+pVzps+IvH+tBmH1
         NwGdOqPubfjHuMN2ZI20J2gXvJTcceh+otX32uxKzJrnL21fSkgRPmX9nyNeqjbCpw
         7rwDNrY/5ihYpfzqhAQDhxBzH8NQgEcs4/7x2r/F3utvIfw0VPLuv47Qi/+X1X3E2g
         XaRWPl45IIhRSdC59+P6pvmRzwTxa8qiZa26eB3T5OV+JoC8QMzwYmWd7qSA7npE5+
         +Dkakyo8Mp/XwuvJSgZ0JR0323z0cEVrJknTa9nBwpNFF4wrk/LPG929Wk+TtaDlqx
         PtCy0aWUi3K2A==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id e9so7995193plh.3;
        Wed, 20 Jan 2021 00:58:43 -0800 (PST)
X-Gm-Message-State: AOAM530cq6ZuROSLhtwi6vdmv9VYspMyPrXfgczqN1lHtxj2YJJusaD1
        rlg8uKbpe7FGufHiXD1drH2FV7nB1CcrGK/bQJQ=
X-Google-Smtp-Source: ABdhPJyAH8wRCGfCRq2QwL41Mk7/GebCnpAr1kspidLm2gMJAwDd7EFDdWQeVRojyza2gre0bVfvj0NCswBLh5tAUB0=
X-Received: by 2002:a17:902:ed93:b029:de:84d2:9ce1 with SMTP id
 e19-20020a170902ed93b02900de84d29ce1mr8949832plj.47.1611133122660; Wed, 20
 Jan 2021 00:58:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611124778.git.viresh.kumar@linaro.org> <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
In-Reply-To: <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 Jan 2021 17:58:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPSBrmSC_if+6sK0pwi1ksBZ7RXK1mndj1AGCX3gkj+g@mail.gmail.com>
Message-ID: <CAK7LNATPSBrmSC_if+6sK0pwi1ksBZ7RXK1mndj1AGCX3gkj+g@mail.gmail.com>
Subject: Re: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 4:07 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Add support for building DT overlays (%.dtbo). The overlay's source file
> will have the usual extension, i.e. .dts, though the blob will have
> .dtbo extension to distinguish it from normal blobs.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .gitignore               | 3 +--
>  Makefile                 | 4 ++--
>  scripts/Makefile.dtbinst | 3 +++
>  scripts/Makefile.lib     | 4 +++-
>  4 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index d01cda8e1177..0458c36f3cb2 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -17,8 +17,7 @@
>  *.bz2
>  *.c.[012]*.*
>  *.dt.yaml
> -*.dtb
> -*.dtb.S
> +*.dtb*


Personally, I prefer adding .dtbo explicitly


>  *.dwo
>  *.elf
>  *.gcno
> diff --git a/Makefile b/Makefile
> index 9e73f82e0d86..b84f5e0b46ab 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1334,7 +1334,7 @@ endif
>
>  ifneq ($(dtstree),)
>
> -%.dtb: include/config/kernel.release scripts_dtc
> +%.dtb %.dtbo: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@


No, this is wrong because it does not work
as grouped targets.

You need to separate them.



%.dtb: include/config/kernel.release scripts_dtc
         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@

%.dtbo: include/config/kernel.release scripts_dtc
         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@




See GNU make manual.


"Pattern rules may have more than one target; however, every target
must contain a % character.
Pattern rules are always treated as grouped targets"

https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html





>  PHONY += dtbs dtbs_install dtbs_check
> @@ -1816,7 +1816,7 @@ clean: $(clean-dirs)
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
> index 213677a5ed33..30bc0a8e0087 100644
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
> @@ -324,7 +326,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>
> -$(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> +$(obj)/%.dtb $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)


Same here.

You need to duplicate the rules everywhere, unfortunately.







>  DT_CHECKER ?= dt-validate
> --
> 2.25.0.rc1.19.g042ed3e048af
>


-- 
Best Regards
Masahiro Yamada
