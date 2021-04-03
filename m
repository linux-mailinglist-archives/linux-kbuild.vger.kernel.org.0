Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8433532AE
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Apr 2021 07:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhDCFMF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Apr 2021 01:12:05 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:24225 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhDCFMF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Apr 2021 01:12:05 -0400
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 1335BiLj018210;
        Sat, 3 Apr 2021 14:11:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 1335BiLj018210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617426705;
        bh=6ZV4zN2J2YGsnMVtam1aocwXNCuTiUeEo/jlCKDEurM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y3yFoZEGTt/rz3s/8n2kBohyUyPst/3jIhYq6eVpw03WaBTnRVROG7TTnS8DzmCA9
         nXcCUAwtMUaUb73WoR7ix0Nj8kgC0qzjcQ+XIacpE8Gpdxzvb2uAUmZsIiYwXUjUvQ
         EvRlKAr/85ABJFt5bkcGtJT4/hUjRcQDIv2GcZ1emRUdpoGyuZxuaKmQRJL52G21GS
         VmPrc/VVUqLC5OgNgJ/CIQjLBj1d4j+CIQPQ6X+JQSbBx0Yg+iOW4+T1QaqoaCx7tw
         tnpDy6KXodTywH8mBX3SCTCY+c8psi4A/qf/fgd8xtD1/BEL3dsEBP3XILFshfDbSu
         rxZC/9ze4gikA==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id f29so2253288pgm.8;
        Fri, 02 Apr 2021 22:11:44 -0700 (PDT)
X-Gm-Message-State: AOAM530G+XwU+I4WZ1hgV0bGW7anhfo4WSTMmJflF7So4iFvLSFXc1pj
        /8soYUsPg5z4JGlTmWh4dIcSn1Q8tSa6LAvXUW0=
X-Google-Smtp-Source: ABdhPJycTmd93+HaOjmWXjjwlRXRxWWNhEzCN8H2tET+ZE2GCj4DrychZ1QHz9Rlc1PioRXcnyWnEkD4YN5TKIR/U3w=
X-Received: by 2002:aa7:956d:0:b029:1f1:5ba6:2a58 with SMTP id
 x13-20020aa7956d0000b02901f15ba62a58mr15061132pfq.63.1617426704037; Fri, 02
 Apr 2021 22:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <1617317072-26770-1-git-send-email-eberman@codeaurora.org>
In-Reply-To: <1617317072-26770-1-git-send-email-eberman@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 3 Apr 2021 14:11:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoXksBwxU_UH92n7mg0XtFKrSBzFRqmWXXnze1dx-B0g@mail.gmail.com>
Message-ID: <CAK7LNARoXksBwxU_UH92n7mg0XtFKrSBzFRqmWXXnze1dx-B0g@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Update config_data.gz only if KCONFIG_CONFIG
 materially changed
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 2, 2021 at 7:45 AM Elliot Berman <eberman@codeaurora.org> wrote:
>
> If you update the timestamp of KCONFIG_CONFIG without actually changing
> anything, config_data.gz is re-generated and causes vmlinux to re-link.
> When Link Time Optimization is enabled, unnecessary re-linking of
> vmlinux is highly desirable since it adds several minutes to build time.
>
> Avoid touching config_data.gz by using filechk to compare the existing
> config_data.gz and update only if it changed.
>
> The .config can be touched, for instance, by a build script which
> installs the default defconfig and then applies a defconfig fragment on
> top.
>
> For a simple example on my x86 machine, I modified x86 default defconfig to set
> CONFIG_IKCONFIG=y and run:
>   make -j50 defconfig tiny.config vmlinux
>   make -j50 defconfig tiny.config vmlinux
> With this patch, vmlinux is not re-built as a result of config_data.gz
> change.
>
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  kernel/Makefile      | 2 +-
>  scripts/Makefile.lib | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 320f1f3..bd4e558 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -140,7 +140,7 @@ $(obj)/configs.o: $(obj)/config_data.gz
>
>  targets += config_data.gz
>  $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
> -       $(call if_changed,gzip)
> +       $(call filechk,gzip)


I do not think this is the right approach
because gzip is executed every time, even
if the time stamp is not changed.







>
>  $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index a4fbaf8..81d3ec1 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -282,6 +282,8 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>  quiet_cmd_gzip = GZIP    $@
>        cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
>
> +filechk_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9
> +
>  # DTC
>  # ---------------------------------------------------------------------------
>  DTC ?= $(objtree)/scripts/dtc/dtc
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Best Regards
Masahiro Yamada
