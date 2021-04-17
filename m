Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A806362E8A
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 10:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhDQIa5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 04:30:57 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49145 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhDQIa4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 04:30:56 -0400
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 13H8U8QL023139
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 17:30:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13H8U8QL023139
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618648209;
        bh=GHkErriX+qvxdZBKNCCz9B9KFZZAJbFINnD/bZBcSR4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mWNbu+i/LtoshE9EHDXTpzP+s8GA3dMhRbNHcIfRcamiSylcqxo6ZD5L6GU9ovTQ+
         ippsOJTbQL8mBPHl9gouZA2eCZ102EABfoH4GRFSFkXaay2nHI47/tDzhAAg4PF7Mf
         m5k7cwHDDj+T0F97LvJd1gbTT++Sq8DxfeJcnT6we3kVw61Zc/WfjcxP8Cc78NMH2V
         NygATzQW1asuwqQw974ynjk9CejDfx0tmfNIcm72EPNBivsrDmJZ3NvBCLquOc72u5
         tEzPumqIVvNwkpwuTq3HYbRSuGHF5vR9LOvMov3UwMW+AM2RaL/kU4frgslYh56S/P
         IwJjup0vtS58g==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id d8so15158874plh.11
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 01:30:08 -0700 (PDT)
X-Gm-Message-State: AOAM530whVdDglzfbBAQXc/U9LJmNv46oA/G6AxiMAX6D63yDvzUMcHB
        rwIIztCncNyg6IK6Kc94CldxQqBnuHiY/LUz+nM=
X-Google-Smtp-Source: ABdhPJxLOR/z4s3iCFzWuhcjzmrtDT/qn8A8Q9szcaK4Et5xsR7WSMrISQ/MuaYV4ujMW1pwXZnE91htCva/7sG/V9M=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr13185528plh.47.1618648208066; Sat, 17
 Apr 2021 01:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210411101422.7092-1-bage@linutronix.de> <20210411101422.7092-2-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-2-bage@linutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 17 Apr 2021 17:29:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFZqp+DDWf5OV03vTrr9SaOhosbTeyMJQ3MwZHL6qA5A@mail.gmail.com>
Message-ID: <CAK7LNAQFZqp+DDWf5OV03vTrr9SaOhosbTeyMJQ3MwZHL6qA5A@mail.gmail.com>
Subject: Re: [PATCH 1/6] builddeb: diff-ignore unexported top-level files
To:     bage@linutronix.de
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 7:14 PM <bage@linutronix.de> wrote:
>
> From: Bastian Germann <bage@linutronix.de>
>
> scripts/Makefile.package's TAR_CONTENT lists the files to include in orig
> tarballs while the deb-pkg make target only ignores .git. This results in
> the other top-level files ending up in the .diff.gz.
>
> Let dpkg-source ignore .git with the default diff-ignore and list the other
> top-level files in extend-diff-ignore. Use the debian/source/options to
> always have those available on building the package.
>
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  scripts/Makefile.package | 2 +-
>  scripts/package/mkdebian | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index f952fb64789d..280f3a2fa334 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -75,7 +75,7 @@ deb-pkg:
>         $(call cmd,src_tar,$(KDEB_SOURCENAME))
>         origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
>                 mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
> +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
>
>  PHONY += bindeb-pkg
>  bindeb-pkg:
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 60a2a63a5e90..3d2d4b033e44 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -134,6 +134,8 @@ fi
>
>  mkdir -p debian/source/
>  echo "1.0" > debian/source/format
> +echo diff-ignore > debian/source/options
> +echo 'extend-diff-ignore = ".clang-format|.cocciconfig|.config.old|.*ignore|.mailmap|.version|CREDITS|MAINTAINERS|README"' >> debian/source/options

Please add
.clang-format, .cocciconfig, .mailmap, CREDITS, MAINTAINERS, README
to TAR_CONTENTS.

These are real source files.




>
>  echo $debarch > debian/arch
>  extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
