Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303D4327162
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 08:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhB1HI3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Feb 2021 02:08:29 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:35781 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhB1HI3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Feb 2021 02:08:29 -0500
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-09.nifty.com with ESMTP id 11S74aGf017927
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Feb 2021 16:04:36 +0900
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 11S70lE9021634;
        Sun, 28 Feb 2021 16:00:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 11S70lE9021634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614495647;
        bh=tv5SDnKyPgoNP6YiEnF6vKsgSgqKofgv5GPg1jxlWHo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AqYiemIQdGS7+6qTzFRIOsa0vrTOnXKmqd8bP2egk3+fLmNTxpD6rDl60wZ566qNx
         whxufXp3wD3ru3jgdraO2wf7HUhzuaTtt1eP1b+jz+qdAtnHC16FylwiDMT091YgkP
         08x4SZPthTdZp3D/l1vHMWPFqNVU1ev7EV56RrcZCXg46xKegocZqc3aHpkDJ83u3r
         BWo9veP1HTNPgpPc+/uPHjdyLJI5vfabEOInD3PZ6SdlwvvAms1M2TjJr8f3idb3ja
         oGG1AMcUToNexOOkMoNMalzyv/ByktPBJ70CF8uldRNItyG5/LtFEW4OTs+bOxV87R
         bHx+jmvV1xupg==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id t9so8489068pjl.5;
        Sat, 27 Feb 2021 23:00:47 -0800 (PST)
X-Gm-Message-State: AOAM533SbQyiqVuIbka3PalnV1zCWAP39Ql/xyadtoxaMazZA0TWD5s2
        VWwrYsdQMT055e0NYKH+kluA8HZkHvNJdoM7RBU=
X-Google-Smtp-Source: ABdhPJxbsLViJKD15RYvEtsukfPTiWhOx3l3YaSLDqvhv2WZlKrOxfrIHl0DSd7zO+LNS0ZBsnf5ZE8BZiNfCJWVNew=
X-Received: by 2002:a17:90a:3b0e:: with SMTP id d14mr1565162pjc.198.1614495646276;
 Sat, 27 Feb 2021 23:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20210228061028.239459-1-masahiroy@kernel.org> <20210228061028.239459-4-masahiroy@kernel.org>
In-Reply-To: <20210228061028.239459-4-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Feb 2021 16:00:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ+3WNf=9047abBH-jD8XcgJe0V0rGhuo9Ta218UPswqQ@mail.gmail.com>
Message-ID: <CAK7LNAQ+3WNf=9047abBH-jD8XcgJe0V0rGhuo9Ta218UPswqQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: include Makefile.compiler only when compiler
 is required
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Israel Tsadok <itsadok@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 28, 2021 at 3:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit f2f02ebd8f38 ("kbuild: improve cc-option to clean up all
> temporary files"), running 'make kernelversion' in a read-only source
> tree emits a bunch of warnings:
>
>   mkdir: cannot create directory '.tmp_12345': Permission denied
>
> Non-build targets such as kernelversion, clean, help, etc. do not
> need to evaluate $(call cc-option,) and friends. Do not include
> Makefile.compiler so $(call cc-option,) becomes no-op.
>
> This not only fix the warnings, but also runs non-build targets much
> faster.
>
> Basically, all installation targets should also be non-build targets.
> Unfortunately, vdso_install requires the compiler because it builds
> vdso before installtion. This is a problem that must be fixed by a
> separate patch.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> I am not adding Reported-by for now because a reporter sent me
> an email privately.
>
> If he allows me to add Reported-by, I will add it to record
> the credit.
>
> (Perhaps, another person might have reported a similar issue
> somewhere, but my memory is obsure. I cannot recall it.)
>

Now, I got acknowledge to add this:

Reported-by: Israel Tsadok <itsadok@gmail.com>







>  Makefile | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index eec7a94f5c33..20724711dc71 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -263,6 +263,10 @@ no-dot-config-targets := $(clean-targets) \
>                          $(version_h) headers headers_% archheaders archscripts \
>                          %asm-generic kernelversion %src-pkg dt_binding_check \
>                          outputmakefile
> +# Installation targets should not require compiler. Unfortunately, vdso_install
> +# is an exception where build artifacts may be updated. This must be fixed.
> +no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
> +                       headers_install modules_install kernelrelease image_name
>  no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
>                           image_name
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> @@ -270,6 +274,7 @@ single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
>  config-build   :=
>  mixed-build    :=
>  need-config    := 1
> +need-compiler  := 1
>  may-sync-config        := 1
>  single-build   :=
>
> @@ -279,6 +284,12 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
>         endif
>  endif
>
> +ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
> +       ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
> +               need-compiler :=
> +       endif
> +endif
> +
>  ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
>         ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
>                 may-sync-config :=
> @@ -584,7 +595,9 @@ endif
>
>  # Include this also for config targets because some architectures need
>  # cc-cross-prefix to determine CROSS_COMPILE.
> +ifdef need-compiler
>  include $(srctree)/scripts/Makefile.compiler
> +endif
>
>  ifdef config-build
>  # ===========================================================================
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
