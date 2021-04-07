Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06C235735E
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 19:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbhDGRm5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 13:42:57 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53658 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDGRm4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 13:42:56 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 137HgOKS008379;
        Thu, 8 Apr 2021 02:42:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 137HgOKS008379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617817345;
        bh=DzWQsDVBYHpbvhiuWoMB5bfnaNGE9Ugo1N0UQsBaRPo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KYRrEwaU8s07UtAueYzO1+7IrIlYtBoI5hMbPStm/otncdCZqURYdxuTJ2gmk7/cC
         487X/0jyqOWKrVb2nEgONh/A8alMRsNtyP88vgwhDOwrRC7O/MPnV/FKtM4yCLfvh8
         D8jnp4kQ9YH2o9DsVU3ZMNdiLucOwNrDG/4b6VARvNG38+zQNCNWO5xxTI6u19mIzL
         zB3DL8Ok+DTZKazmfzFgpHrE2SrNd7YPpwf3AJXjVZ5PrSXflqrXfokem7PUGNNqmY
         /kABgimZwgdrGIl1raFkVfCtFnXt8Y9hZRLlzQr2m4ECZvDAseI+x0HfFNYoDQt4Dn
         Vqqn8z53OZoOw==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so3415334pjb.0;
        Wed, 07 Apr 2021 10:42:25 -0700 (PDT)
X-Gm-Message-State: AOAM532sT1ueFhKrxnqQKOhKr3Go1byUEzmU6TYb/giqnVdhQ4leQ4p4
        65FmziWnne6o3jif2lh/ghE+nKHu/g/KwSRyW2Q=
X-Google-Smtp-Source: ABdhPJwfxUJxniByhSNvyA3+HXlCddYtP2rO9b70gCFPO8z3blyCe6H/gxllyT0UaOGpbY7gqb5i2EIqwypWiPxIiFQ=
X-Received: by 2002:a17:902:be10:b029:e9:78a0:dd33 with SMTP id
 r16-20020a170902be10b02900e978a0dd33mr1769184pls.1.1617817344332; Wed, 07 Apr
 2021 10:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
In-Reply-To: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 8 Apr 2021 02:41:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6Na159fVxKhnx24bEQgF+1JL0UkPieyY0KcW5d=zrMQ@mail.gmail.com>
Message-ID: <CAK7LNAR6Na159fVxKhnx24bEQgF+1JL0UkPieyY0KcW5d=zrMQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: add support for zstd compressed modules
To:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 8, 2021 at 1:09 AM Piotr Gorski <lucjan.lucjanov@gmail.com> wrote:
>
> kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.
>
> V2 -> V3
>
> * Fix a typo
>
> V1 -> V2
>
> * Rebuild against linux-kbuild tree
>
> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>


Applied to linux-kbuild. Thanks!


I slightly changed to fix the log alignment.



diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index f9fa2a3808b2..ff9b09e4cfca 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -96,7 +96,7 @@ quiet_cmd_gzip = GZIP    $@
       cmd_gzip = $(KGZIP) -n -f $<
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
-quiet_cmd_zstd = ZSTD      $@
+quiet_cmd_zstd = ZSTD    $@
       cmd_zstd = $(ZSTD) -T0 --rm -f -q $<

 $(dst)/%.ko.gz: $(dst)/%.ko FORCE






> ---
>  init/Kconfig             | 8 +++++++-
>  scripts/Makefile.modinst | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 510f6fcd9b7f..b5744d32c4df 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2242,7 +2242,7 @@ choice
>
>           Please note that the tool used to load modules needs to support the
>           corresponding algorithm. module-init-tools MAY support gzip, and kmod
> -         MAY support gzip and xz.
> +         MAY support gzip, xz and zstd.
>
>           Your build system needs to provide the appropriate compression tool
>           to compress the modules.
> @@ -2267,6 +2267,12 @@ config MODULE_COMPRESS_XZ
>           Compress modules with XZ. The installed modules are suffixed
>           with .ko.xz.
>
> +config MODULE_COMPRESS_ZSTD
> +       bool "ZSTD"
> +       help
> +         Compress modules with ZSTD. The installed modules are suffixed
> +         with .ko.zst.
> +
>  endchoice
>
>  config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 191408f7a91a..f9fa2a3808b2 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -21,6 +21,7 @@ endif
>  suffix-y                               :=
>  suffix-$(CONFIG_MODULE_COMPRESS_GZIP)  := .gz
>  suffix-$(CONFIG_MODULE_COMPRESS_XZ)    := .xz
> +suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)  := .zst
>
>  modules := $(patsubst $(extmod_prefix)%, $(dst)/%$(suffix-y), $(modules))
>
> @@ -95,6 +96,8 @@ quiet_cmd_gzip = GZIP    $@
>        cmd_gzip = $(KGZIP) -n -f $<
>  quiet_cmd_xz = XZ      $@
>        cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
> +quiet_cmd_zstd = ZSTD      $@
> +      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
>
>  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>         $(call cmd,gzip)
> @@ -102,6 +105,9 @@ $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>  $(dst)/%.ko.xz: $(dst)/%.ko FORCE
>         $(call cmd,xz)
>
> +$(dst)/%.ko.zst: $(dst)/%.ko FORCE
> +       $(call cmd,zstd)
> +
>  PHONY += FORCE
>  FORCE:
>
> --
> 2.31.0.97.g1424303384
>


-- 
Best Regards
Masahiro Yamada
