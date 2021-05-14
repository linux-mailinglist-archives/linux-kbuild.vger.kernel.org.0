Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2190380251
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 May 2021 05:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhENDNO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 May 2021 23:13:14 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:29425 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhENDNN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 May 2021 23:13:13 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 14E3BSus008374;
        Fri, 14 May 2021 12:11:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 14E3BSus008374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620961888;
        bh=pbbpGUR6yrf1GL48OQICvHJRZXOz0W4ICJk5HTCek/0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D8RoOex7HXdNnqzlUi6SGs+AS81/YKPmxUEWjsheZ8sqRps0YxLVqvcClM3T5vC6S
         Qgf/7CEvSP9CQ5Tbj1iUYkaPgD6Sj2waGimagtqiyTCAnddIlD+8qnLm+S/2RCxmlI
         v1i6BAe6EEXVf2LAHXFf4y3YdIfVme6JotJA5VtYnXrLe7C12r+GpKfKjvP7TdaqS8
         egQkG7Kzkpv+aalnUFbaG7jh7nFk/Az/JIWjG+MVPam2gAt4soQbqYoqQBfF4ueZ89
         9hM7EJyunXDQZY4q2wReM0HtJz+5BPU3MD8hWeP4tMMkmaGrum4xZr8zl0yBiDIqSZ
         oJH1vHSTGxyzA==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id pf4-20020a17090b1d84b029015ccffe0f2eso948107pjb.0;
        Thu, 13 May 2021 20:11:28 -0700 (PDT)
X-Gm-Message-State: AOAM531plmzureqs/jNcYRBnWuuaUuLg0zeQ0KMTefcahKYeRYbhXm/z
        UhGnv8u0CULFGMF7e/gt1t+JU2QT6nGByRp3WhI=
X-Google-Smtp-Source: ABdhPJxhAZAfrz1qW8hiBEhhGIJjcZw6SR9M/Z4p4EKvBxTiWaVJoBYtJidqCl9RopQQTFhtzLXYTJJPTw3KxDjZ3lI=
X-Received: by 2002:a17:902:bcc7:b029:ed:6f73:ffc4 with SMTP id
 o7-20020a170902bcc7b02900ed6f73ffc4mr42803945pls.1.1620961887766; Thu, 13 May
 2021 20:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210511044812.267965-1-aik@ozlabs.ru> <20210511112019.GK10366@gate.crashing.org>
 <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20210511231635.GR10366@gate.crashing.org> <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
 <20210512102640.GT10366@gate.crashing.org>
In-Reply-To: <20210512102640.GT10366@gate.crashing.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 14 May 2021 12:10:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkDDVigJbPKsPEcqQNz0z0Hc0r8h22MGB=8vMxMiMuDg@mail.gmail.com>
Message-ID: <CAK7LNAQkDDVigJbPKsPEcqQNz0z0Hc0r8h22MGB=8vMxMiMuDg@mail.gmail.com>
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for preprocessor
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 12, 2021 at 7:29 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Wed, May 12, 2021 at 01:48:53PM +1000, Alexey Kardashevskiy wrote:
> > >Oh!  I completely missed those few lines.  Sorry for that :-(
> >
> > Well, I probably should have made it a separate patch anyway, I'll
> > repost separately.
>
> Thanks.
>
> > >To compensate a bit:
> > >
> > >>It still puzzles me why we need -C
> > >>(preserve comments in the preprocessor output) flag here.
> > >
> > >It is so that a human can look at the output and read it.  Comments are
> > >very significant to human readers :-)
> >
> > I seriously doubt anyone ever read those :)
>
> I am pretty sure whoever wrote it did!


Keeping comments in the pre-processed linker scripts
is troublesome.

That is why -C was removed from scripts/Makefile.build


commit 5cb0512c02ecd7e6214e912e4c150f4219ac78e0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Nov 2 14:10:37 2017 -0700

    Kbuild: don't pass "-C" to preprocessor when processing linker scripts




You can entirely remove

 CPPFLAGS_vdso32.lds += -P -C -Upowerpc





-- 
Best Regards
Masahiro Yamada
