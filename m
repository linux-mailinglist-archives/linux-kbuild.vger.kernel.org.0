Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C01A30D573
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 09:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhBCIlB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 03:41:01 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27799 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbhBCIk4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 03:40:56 -0500
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1138dQiu015637;
        Wed, 3 Feb 2021 17:39:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1138dQiu015637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612341566;
        bh=YRwehqSfi0jhVS4bwjVtB0egmrWeZIpOGjgdJ1KIwoc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XNpkib/morgOFfuffj1v+nXP2yTuwlM229z+2Ohp7wPKjrAuiItMWLGUKBwTAmrrl
         SBejziHWOR0b2Hsa3xL7BHuTT3FAhN2oaqPtKtRvv24KTBdNqvy80KTf36dfSV9mId
         I7hSSgxZ0MY51btbYDQaSt/xawGGCZeWJKjttNJHmlA8QPUOyQJW0OAsynV7er8g9q
         gio/B3ju+JyZnGcdKurctYrhacuy2ff1t/l+bfmG+KQ+4US+X6iYtxtZUOVt9HsXog
         7lBo2c30RJisNUij/WimITgBzvs0oRUOZHY4VYDrodgC+qNiRsH4cDO9DD4zZcI4lS
         QfR2eIhF0vwwQ==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id d13so14051417plg.0;
        Wed, 03 Feb 2021 00:39:26 -0800 (PST)
X-Gm-Message-State: AOAM530uvFUnOan/LX/BnNQnybCUmZZnWRpsYB6ZM5wTn4TgPUX1e2CW
        ei5oHSAbb85PG5KQ+y/9rARcQCRzFRmIR/T6xEU=
X-Google-Smtp-Source: ABdhPJysZhCYG7dqZ4FJNV06fOHSwoXD+kWgTT0OAkQuOmvJ0DjMPbm8HZWTJ7AzDqXkgkUz6ObDFrLo/id3mIu7vYA=
X-Received: by 2002:a17:90a:184:: with SMTP id 4mr2174355pjc.87.1612341565525;
 Wed, 03 Feb 2021 00:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20210203075239.5505-1-masahiroy@kernel.org> <CA+icZUW-uObu=7xpqUqKTASmBfEgLKMrKgmR_uhmHBN-EwpBVA@mail.gmail.com>
In-Reply-To: <CA+icZUW-uObu=7xpqUqKTASmBfEgLKMrKgmR_uhmHBN-EwpBVA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 3 Feb 2021 17:38:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_x+JWkUwBrJs2LD3rqabqP+tWewrfnMX6F_MdH9L2ZQ@mail.gmail.com>
Message-ID: <CAK7LNAQ_x+JWkUwBrJs2LD3rqabqP+tWewrfnMX6F_MdH9L2ZQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        Ian Rogers <irogers@google.com>,
        Mark Wielaard <mark@klomp.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 3, 2021 at 5:32 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Feb 3, 2021 at 8:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Sedat Dilek noticed duplicated debug flags passed when building C
> > files with CONFIG_DEBUG_INFO.
> >
> > I do not know much about his build environment, but yes, Kbuild
> > recurses to the top Makefile with some build targets. For example,
> > 'make CC=clang bindeb-pkg' reproduces the issue.
> >
> > With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments
> > for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
> > CONFIG_CC_IS_GCC=y.
> >
> > Fix it to reset DEBUG_CFLAGS also when using Clang.
> >
> > Fixes: 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments for old GCC versions")
> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> That fixes the issue for me:
>
> Without patch:
>
> ... -Wno-unused-const-variable -g -gdwarf-5 -gz=zlib -g -gdwarf-5
> -gz=zlib -pg -mfentry ...
>
> With this patch:
> ... -Wno-unused-const-variable -g -gdwarf-5 -gz=zlib -pg -mfentry ...
>
> The relevant Kconfigs:
>
> $ grep DEBUG_INFO .config | grep ^CONFIG
> CONFIG_DEBUG_INFO=y
> CONFIG_DEBUG_INFO_COMPRESSED=y
> CONFIG_DEBUG_INFO_DWARF5=y
>
> Latest make-line:
>
> $ /usr/bin/perf_5.10 stat make V=1 -j4 LLVM=1 LLVM_IAS=1
> PAHOLE=/opt/pahole/bin/pahole LOCALVERSION=-4-amd64-clang12-
> cfi-pgo KBUILD_VERBOSE=1 KBUILD_BUILD_HOST=iniza
> KBUILD_BUILD_USER=sedat.dilek@gmail.com
> KBUILD_BUILD_TIMESTAMP=2021-02-03 bindeb-pkg


Ah, OK.
You use bindeb-pkg for building the kernel.

That's why this happens only for you,
but Nick did not observe this issue.






> KDEB_PKGVERSION=5.11.0~rc6-4~bull
> seye+dileks1
>
> Feel free to add my...
>
>    Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> Thanks again Masahiro.
>
> - Sedat -
>
> > ---
> >
> >  Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 3d3f67b98ca2..769a38ee81b9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -811,10 +811,12 @@ KBUILD_CFLAGS     += -ftrivial-auto-var-init=zero
> >  KBUILD_CFLAGS  += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> >  endif
> >
> > +DEBUG_CFLAGS   :=
> > +
> >  # Workaround for GCC versions < 5.0
> >  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
> >  ifdef CONFIG_CC_IS_GCC
> > -DEBUG_CFLAGS   := $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> > +DEBUG_CFLAGS   += $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> >  endif
> >
> >  ifdef CONFIG_DEBUG_INFO
> > --
> > 2.27.0
> >



-- 
Best Regards
Masahiro Yamada
