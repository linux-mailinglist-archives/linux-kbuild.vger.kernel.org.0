Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C0546FB2
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Jun 2019 12:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfFOK4r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Jun 2019 06:56:47 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17668 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfFOK4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Jun 2019 06:56:46 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x5FAuZgF025740;
        Sat, 15 Jun 2019 19:56:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5FAuZgF025740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560596196;
        bh=ALZKjiw1db82ayQOVyaN/WsAOdhwxBOjFeoTxjhDDtk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ByHI2S9JcVxHe5YqlkYdLGfDFAip/4jf0Sw80BIlbgHif4D8XpeeRpC5ETzDf6yc7
         2o24Xx7rtT8hfkbwWvz43cPzoSTsQ1oUBNNnwi6bN4cW1U7H5RpyQuz23ou5J2TQdK
         aq5BXT+bYujyU/he/yHUaQeEh8hnnf5l0oTxRxVfdaWtUQq7sWz5QG9EtLlb0ivw0z
         mprwtSYdzEpNb9cHntRAyCuYEkO5w4Tazk3EnRoDQTjw0+tCdqcL4q+ru+6Rz0rIIJ
         5lYvDiPqDK10F+z1R0Bm4wgfL7rFCqt24ZkXpx/B3cBpnzX5BRwDHSPG1vTo4xOGh3
         Rtxnk2cwFtDIQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id n2so3361819vso.6;
        Sat, 15 Jun 2019 03:56:35 -0700 (PDT)
X-Gm-Message-State: APjAAAUvFzxnlwTLhT3JYDh6Lgc8gsa9z3kN4LIM5HxZWMp1rzAoesjl
        GLYJNBtM41xKN/3sU4xlb/hDxLAnnGpZaHjrCr0=
X-Google-Smtp-Source: APXvYqzOezD0lM4US0HI7NC4PON5mpqLsHSxh80mL9prAiOxdJDJdhoaL4lsbdfXW/4h9YbfWghpnRvDD1FJPBXFlmA=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr15919118vsl.155.1560596194791;
 Sat, 15 Jun 2019 03:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190604181453.30422-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190604181453.30422-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 15 Jun 2019 19:55:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARpRQo1o65EGm2kzDfhGy-C0u=AJ0K1q+HR4uwJ_aNT1A@mail.gmail.com>
Message-ID: <CAK7LNARpRQo1o65EGm2kzDfhGy-C0u=AJ0K1q+HR4uwJ_aNT1A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: run olddefconfig instead of oldconfig after
 merging fragments
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 5, 2019 at 3:15 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> 'make olddefconfig' is non-interactive, so we can drop 'yes'.
> The behavior is equivalent.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/kconfig.



>
>  scripts/kconfig/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ab30fe724c43..7656e1137b6b 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -94,7 +94,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
>  %.config: $(obj)/conf
>         $(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> -       +$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
> +       $(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>
>  PHONY += kvmconfig
>  kvmconfig: kvm_guest.config
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
