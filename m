Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F711E99E1
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2020 20:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgEaSb4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 May 2020 14:31:56 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29407 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaSb4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 May 2020 14:31:56 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 04VIVgsd020467;
        Mon, 1 Jun 2020 03:31:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 04VIVgsd020467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590949903;
        bh=4apCpancfdbtJzkndUTVnQUyykbzGPT5KHtojqows0M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IgvaKPBh3yEcofvQ45bsQD/xyUBWo942awBwFmUBGu6ABYuMQIRxeBzihW/+B0Xft
         IDW4jrIqvj1YgCK7+fEeRKjsDB8nR3GjkEoQCYtETUyrYndwWEg4SeyOfOXc9RMbhK
         zVvUNPd8l7RiM7jcSTeZ/J3dXMpckb2+CYniHRNWG+kWy20/R84lXyTqkbiD+15iEo
         9EGEuyx/8a3inMuylmyb/f5nle9LXumrcOPO2eQcH1J7nJKrhFMR21N/Mjs4z/g889
         i+A4ow1S9fynKOmp/43MIgaL5osb4KKCpNJTJ0qtusPsxZmsummSNKbh/5VpKm6bPc
         oZAKfsy7QHuzQ==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id d8so2572405uam.12;
        Sun, 31 May 2020 11:31:43 -0700 (PDT)
X-Gm-Message-State: AOAM531TeN0GfzSVnNfLhZr9ohMvGM1LlJl8BDJvwihBFGFLF9SsOmeL
        H6gMydubCE3435gfiCwgzsLXf/U9TA5wvIAnALo=
X-Google-Smtp-Source: ABdhPJx2sV0Ko8biWYjWBupgz6CqxRWQ2fmPKivw+cLRgc2BvaLssKRWGZAKY6uFGnbmo7eDn+pWKMNFBSkNTuTY2RI=
X-Received: by 2002:ab0:264f:: with SMTP id q15mr11201526uao.109.1590949902065;
 Sun, 31 May 2020 11:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200524154235.380482-1-masahiroy@kernel.org> <20200524154235.380482-10-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-10-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 1 Jun 2020 03:31:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYdPsu9feYR4N+rvNhn2J73jf5VwcV7U5Pi=jFzePddw@mail.gmail.com>
Message-ID: <CAK7LNARYdPsu9feYR4N+rvNhn2J73jf5VwcV7U5Pi=jFzePddw@mail.gmail.com>
Subject: Re: [PATCH v2 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 25, 2020 at 12:43 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> $(firstword ...) in scripts/Makefile.modpost was added by commit
> 3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
> to build multiple external module directories.
>
> It was a solution to resolve symbol dependencies when an external
> module depends on another external module.
>
> Commit 0d96fb20b7ed ("kbuild: Add new Kbuild variable
> KBUILD_EXTRA_SYMBOLS") introduced another solution by passing symbol
> info via KBUILD_EXTRA_SYMBOLS, then broke the multi-word M= support.
>
>   include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>                $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>
> ... does not work if KBUILD_EXTMOD contains multiple words.
>
> This feature has been broken for more than a decade. Remove the
> bitrotten code, and stop parsing if M or KBUILD_EXTMOD contains
> multiple words.
>
> As Documentation/kbuild/modules.rst explains, if your module depends
> on another one, there are two solutions:
>   - add a common top-level Kbuild file
>   - use KBUILD_EXTRA_SYMBOLS
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This patch, applied to linux-kbuild.



> ---
>
> Changes in v2:
>   - Add more commit log
>
>  Makefile                 | 3 +++
>  scripts/Makefile.modpost | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 72eb55a36545..48a2dfaf3bf3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -218,6 +218,9 @@ ifeq ("$(origin M)", "command line")
>    KBUILD_EXTMOD := $(M)
>  endif
>
> +$(if $(word 2, $(KBUILD_EXTMOD)), \
> +       $(error building multiple external modules is not supported))
> +
>  export KBUILD_CHECKSRC KBUILD_EXTMOD
>
>  extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 957eed6a17a5..b79bf0e30d32 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -44,7 +44,7 @@ include include/config/auto.conf
>  include scripts/Kbuild.include
>
>  kernelsymfile := $(objtree)/Module.symvers
> -modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
> +modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
>
>  MODPOST = scripts/mod/modpost                                                          \
>         $(if $(CONFIG_MODVERSIONS),-m)                                                  \
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
