Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09081DEE74
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 19:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbgEVRmo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 13:42:44 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49019 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgEVRmn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 13:42:43 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 04MHgODw032294;
        Sat, 23 May 2020 02:42:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 04MHgODw032294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590169345;
        bh=fF465e4cnaQp88xwLbk+1MqPt//D6hFy+PhkCFDvhhc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yXuHRAlVOXd4c42/9sRMSJzWOqAYDtqyQqKvKtB7oC7DpiMTFqy+G6iczr5pe7OXk
         v0xBcCSIqJPdgZ/tILMgaD8dxy2dIJBr0I/QMuicO6UWRR6S2xZQID3Ma49/brqjrw
         zAMb3+zNqbXQ+eA8YWFEyO744xm0CUoo6rh+9C0Ro3pNbb9iihO1aKsDcKpU1tLfZZ
         SRbmauvbdv98OXpwX4dCqqHkjlam+sEb6b5x4CeFHqnSzOsFFvsVFYG9MtMLWQLZq1
         b9mJ6sDLJB9x0sqYgvmKnV6EXSzvi6yXs30W4OFL7Q0/lmzlBhGJjIyySuncAHyymi
         amwLbf0Da4z0g==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id b28so4453435vsa.5;
        Fri, 22 May 2020 10:42:24 -0700 (PDT)
X-Gm-Message-State: AOAM5336AaOOBoygGgkuh5iwhtTi2klnAMfcook+YoC9Rs5bEata512b
        UKBmtemcvlXoQdG6bDyH4utLiHzrIXr0uxp8f8M=
X-Google-Smtp-Source: ABdhPJzCUtZN33PfMU+raPJWrHgIs7KZBwOtCQU4wT6PeRoEs0d1Ss1q8cuN+Ux4nT5e0grUgnwX/9NsJ4NPXpQcbow=
X-Received: by 2002:a67:e096:: with SMTP id f22mr12084772vsl.54.1590169338595;
 Fri, 22 May 2020 10:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
In-Reply-To: <20200521202716.193316-1-samitolvanen@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 23 May 2020 02:41:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
Message-ID: <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> Instead of linking all compilation units again each time vmlinux_link is
> called, reuse vmlinux.o from modpost_link.
>
> With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> in the time spent in vmlinux_link).
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/link-vmlinux.sh | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d09ab4afbda4..c6cc4305950c 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -77,11 +77,8 @@ vmlinux_link()
>
>         if [ "${SRCARCH}" != "um" ]; then
>                 objects="--whole-archive                        \
> -                       ${KBUILD_VMLINUX_OBJS}                  \
> +                       vmlinux.o                               \
>                         --no-whole-archive                      \
> -                       --start-group                           \
> -                       ${KBUILD_VMLINUX_LIBS}                  \
> -                       --end-group                             \
>                         ${@}"
>
>                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>
> base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
> --
> 2.27.0.rc0.183.gde8f92d652-goog
>


I like this patch irrespective of CLANG_LTO, but
unfortunately, my build test failed.


ARCH=powerpc failed to build as follows:



  MODPOST vmlinux.o
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
R_PPC64_REL14 against `.text'+4b1c
vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
R_PPC64_REL14 against `.text'+1cf78
vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
R_PPC64_REL14 against `.text'+1dac4
vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
R_PPC64_REL14 against `.text'+1e254
make: *** [Makefile:1125: vmlinux] Error 1



I used powerpc-linux-gcc
available at
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/


Build command:

make -j24 ARCH=powerpc  CROSS_COMPILE=powerpc-linux-  defconfig all


Could you check it please?



I will apply it to my test branch.
Perhaps, 0-day bot may find more failure cases.


--
Best Regards
Masahiro Yamada
