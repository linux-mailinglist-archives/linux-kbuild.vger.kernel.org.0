Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E2D30D5AB
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 09:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhBCI4l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 03:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbhBCI4j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 03:56:39 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE0FC061573;
        Wed,  3 Feb 2021 00:55:59 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id y15so3255693ilj.11;
        Wed, 03 Feb 2021 00:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=2GJNlaoEj4V/RBQkwXlJ305JIQw2Zv+StT/R0lheiks=;
        b=sksLsHSa5JL9BFRobXknLFqP1FaF4KBxIpS7T7pAkDpSMgRCWqFXOdFLN12DyfUG0T
         1pShvd5aDy0tWlRUrT0wtLKlY1aThsuyf/OTXi8pqnwQ1FifIQBtY4+iC4BpJPUM/0fy
         FrtmZk6dkk8iLkl8fCsrlD6A3HzTHGYODJ277gmLskDMoKFcLKIbnhEiflekrriyEI58
         3+jiNwlQmVcyk8LBmPwbuexHe2gRFnns76/7frisMVz/WSVIrOD/yhTgsD2Tnb8/XDPt
         96mHvm6ctW4BQcwJzO7gFoJ0gLB8JEtRIhcsReOWNA+MQPUf4YUdaV3gQh0bYZcIFd71
         wFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=2GJNlaoEj4V/RBQkwXlJ305JIQw2Zv+StT/R0lheiks=;
        b=W70W+GlC0E2dibf/ZB/jC2SEZy/Z7YRT733JXivgbvq701hdEnPytjjS1K5k5/pSg6
         ImrjdxI08cYhcE95VLy4IYMUb3rgzzYT4/kovDK9lOHveEEnQJHRmEZ+HLBDiswQI/1P
         N0ixdC4GgHNr7vZS4dpkYz3Y1g2mOFF+y7jsGBG3DhJiY8EXCWC0Arrtjl/c72LoYWj4
         s4jCFo1z2Cj9ribqWX/YjpFfqRKCuxX7g//tg5ec38zasiSUg0qfWHBkY9D8O6Gt8yff
         4isZLjdJCAwXGQ4+tGKUNArdPMfKW/qvSbvNhP+c3tbjXHEXZQvbmivBlzLzkTfik8c9
         HjWw==
X-Gm-Message-State: AOAM5301Xavr8bZvkkAoF2YfSzLuLG25zft+hKJhLt41QiXuRkZriaDy
        hHeAchAUhdo31puJRwvUlY1+H409AQ7gIWAmVF8=
X-Google-Smtp-Source: ABdhPJxKlkfj0/CL3ZNIz5HkEI3c55Y2Gs5PzUit5kYZuWVwsHdJKcDJUG4x3K8MrAsoWJ+usSZRSSswsndrcLMTdg8=
X-Received: by 2002:a92:c5c8:: with SMTP id s8mr1816643ilt.186.1612342558677;
 Wed, 03 Feb 2021 00:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20210203075239.5505-1-masahiroy@kernel.org> <CA+icZUW-uObu=7xpqUqKTASmBfEgLKMrKgmR_uhmHBN-EwpBVA@mail.gmail.com>
 <CAK7LNAQ_x+JWkUwBrJs2LD3rqabqP+tWewrfnMX6F_MdH9L2ZQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ_x+JWkUwBrJs2LD3rqabqP+tWewrfnMX6F_MdH9L2ZQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 3 Feb 2021 09:55:47 +0100
Message-ID: <CA+icZUXCgOjx6WH=ZKLpowqimeQDu4MfWLCTaAYcJpCQx=ekYA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, Feb 3, 2021 at 9:39 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Feb 3, 2021 at 5:32 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Wed, Feb 3, 2021 at 8:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Sedat Dilek noticed duplicated debug flags passed when building C
> > > files with CONFIG_DEBUG_INFO.
> > >
> > > I do not know much about his build environment, but yes, Kbuild
> > > recurses to the top Makefile with some build targets. For example,
> > > 'make CC=clang bindeb-pkg' reproduces the issue.
> > >
> > > With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments
> > > for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
> > > CONFIG_CC_IS_GCC=y.
> > >
> > > Fix it to reset DEBUG_CFLAGS also when using Clang.
> > >
> > > Fixes: 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments for old GCC versions")
> > > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > That fixes the issue for me:
> >
> > Without patch:
> >
> > ... -Wno-unused-const-variable -g -gdwarf-5 -gz=zlib -g -gdwarf-5
> > -gz=zlib -pg -mfentry ...
> >
> > With this patch:
> > ... -Wno-unused-const-variable -g -gdwarf-5 -gz=zlib -pg -mfentry ...
> >
> > The relevant Kconfigs:
> >
> > $ grep DEBUG_INFO .config | grep ^CONFIG
> > CONFIG_DEBUG_INFO=y
> > CONFIG_DEBUG_INFO_COMPRESSED=y
> > CONFIG_DEBUG_INFO_DWARF5=y
> >
> > Latest make-line:
> >
> > $ /usr/bin/perf_5.10 stat make V=1 -j4 LLVM=1 LLVM_IAS=1
> > PAHOLE=/opt/pahole/bin/pahole LOCALVERSION=-4-amd64-clang12-
> > cfi-pgo KBUILD_VERBOSE=1 KBUILD_BUILD_HOST=iniza
> > KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > KBUILD_BUILD_TIMESTAMP=2021-02-03 bindeb-pkg
>
>
> Ah, OK.
> You use bindeb-pkg for building the kernel.
>
> That's why this happens only for you,
> but Nick did not observe this issue.
>

I guess so.

- sed@ -

>
> > KDEB_PKGVERSION=5.11.0~rc6-4~bull
> > seye+dileks1
> >
> > Feel free to add my...
> >
> >    Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> >
> > Thanks again Masahiro.
> >
> > - Sedat -
> >
> > > ---
> > >
> > >  Makefile | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 3d3f67b98ca2..769a38ee81b9 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -811,10 +811,12 @@ KBUILD_CFLAGS     += -ftrivial-auto-var-init=zero
> > >  KBUILD_CFLAGS  += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> > >  endif
> > >
> > > +DEBUG_CFLAGS   :=
> > > +
> > >  # Workaround for GCC versions < 5.0
> > >  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
> > >  ifdef CONFIG_CC_IS_GCC
> > > -DEBUG_CFLAGS   := $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> > > +DEBUG_CFLAGS   += $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> > >  endif
> > >
> > >  ifdef CONFIG_DEBUG_INFO
> > > --
> > > 2.27.0
> > >
>
>
>
> --
> Best Regards
> Masahiro Yamada
