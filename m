Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2EC2C03FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 12:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgKWLSt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 06:18:49 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58006 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgKWLSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 06:18:49 -0500
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0ANBINr2002771;
        Mon, 23 Nov 2020 20:18:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0ANBINr2002771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606130304;
        bh=v3Ya0vKYFsorXl+gwNrxF+if1F/H9gfmTii8TZdd3G8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MqmHAABn9LUjTh3vmFyCZcKjJDxA0IfRH8O3KtLla/Xq3dFKC4VXu8Rd0ucEY0A7f
         jb9f9G8WjqFHhr7QG5eSz61X7pVo0PCYBLSTHLrG6r3HUnhpWqBgy3/6E9sL5zzpJe
         oVVd3p0uq0Zrj/JGm9eHjjVYXQkS+ChlJKq0mIrBkt5dg1PyR1Vz6WsQHxFnQ4lJBB
         9jsjhVvRj9kAyjc3oDcnsrm1GEUYgWW6SBtOD0/LYJ5QJuNvmYf2aZqZvEMpUOUlAU
         IzmXhh5ZsvfX3ynZhp0UYhZADKl+ZFxC8jjXveTj2DpQ8Sxwz+o5MQK4KtJudmICCk
         iHqSsJnKhfk6A==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id v5so10565375pff.10;
        Mon, 23 Nov 2020 03:18:24 -0800 (PST)
X-Gm-Message-State: AOAM533is5YYVmJYclVyNlC5ew984+8C2KHlXHBwhWcLHrsX/sREPixK
        hzTAjZBElfaJP3efJEDhxKPGGEZctcJG0miGQ/w=
X-Google-Smtp-Source: ABdhPJzyLgVesz87TOyHoXJkTkOGyjWiQNh9wJXgUOO9mizaW9CpIxHxSW6DmwuIBmCdxdg1L1eOsYqEjj5hTadzWkk=
X-Received: by 2002:a17:90a:c209:: with SMTP id e9mr25229153pjt.87.1606130303346;
 Mon, 23 Nov 2020 03:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20201026220331.3896226-1-arnd@kernel.org> <20201027014219.GA4058050@ubuntu-m3-large-x86>
In-Reply-To: <20201027014219.GA4058050@ubuntu-m3-large-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 20:17:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSn8D_0Gq3072SrD5ijzaqjLGxN=ttLZp5ay-G+adFUQ@mail.gmail.com>
Message-ID: <CAK7LNARSn8D_0Gq3072SrD5ijzaqjLGxN=ttLZp5ay-G+adFUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile.extrawarn: move -Wcast-align to W=3
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 27, 2020 at 10:42 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Oct 26, 2020 at 11:03:13PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This warning behaves differently depending on the architecture
> > and compiler. Using x86 gcc, we get no output at all because
> > gcc knows the architecture can handle unaligned accesses.
> >
> > Using x86 clang, or gcc on an architecture that needs to
> > manually deal with unaligned accesses, the build log is
> > completely flooded with these warnings, as they are commonly
> > invoked by inline functions of networking headers, e.g.
> >
> > include/linux/skbuff.h:1426:26: warning: cast increases required alignment of target type [-Wcast-align]
> >
> > The compiler is correct to point this out, as we are dealing
> > with undefined behavior that does cause problems in practice,
> > but there is also no good way to rewrite the code in commonly
> > included headers to a safer method.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Always sad to see a warning move further down the list but noisy headers
> are rough to deal with. This seems okay.
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> > ---
> >  scripts/Makefile.extrawarn | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 95e4cdb94fe9..6baee1200615 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -60,7 +60,6 @@ endif
> >  #
> >  ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> >
> > -KBUILD_CFLAGS += -Wcast-align
> >  KBUILD_CFLAGS += -Wdisabled-optimization
> >  KBUILD_CFLAGS += -Wnested-externs
> >  KBUILD_CFLAGS += -Wshadow
> > @@ -80,6 +79,7 @@ endif
> >  ifneq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> >
> >  KBUILD_CFLAGS += -Wbad-function-cast
> > +KBUILD_CFLAGS += -Wcast-align
> >  KBUILD_CFLAGS += -Wcast-qual
> >  KBUILD_CFLAGS += -Wconversion
> >  KBUILD_CFLAGS += -Wpacked
> > --
> > 2.27.0
> >


Applied to linux-kbuild. Thanks.

But, I think people already tend to ignore W=2 warnings.


-- 
Best Regards
Masahiro Yamada
