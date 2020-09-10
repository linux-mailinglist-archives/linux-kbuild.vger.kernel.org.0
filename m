Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FAB264A36
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 18:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgIJQsB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 12:48:01 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59044 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgIJQmk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 12:42:40 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08AGg6hG030582;
        Fri, 11 Sep 2020 01:42:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08AGg6hG030582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599756127;
        bh=+6n9Ppki6VT5Ezj3CVThftdXoJBLCgvbs+E684WSLWQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Db8+aEeRsHxQzx3ItxeUj48irYaveRBOu/6JsWRdSfEEhZG9EUQf+bfQkMrgOsYZn
         fhPv4hEmmPbm6IXE8FnFumAIUjFf7QfTk/E7JB8algWB3uJqWN1Pduh56bRbm9Y5S8
         5b+FkuJo61aSJozVPBUlXbs7If45fPxLGxdUx+URnZlXOE6btEAwrnODZzzmI4K87c
         Bo41kO4sju+7FxyIAP2D0AArLne8ArrHEEf8nib+AEP14OoTQKlnG2hE48YdlB0hGC
         hcEVzXZBAmPLKxUu96Yz0vVk9Qc23MWg3No9XiRnMnd8MCo2BjdcGMfQXWTX1P9qev
         viWmRySeLk7Xw==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id n3so1511542pjq.1;
        Thu, 10 Sep 2020 09:42:07 -0700 (PDT)
X-Gm-Message-State: AOAM5310pUOokFVmUiYz+ydD+tHEW19GpuD6myNgYHI5fSPujQTqvtks
        qYAtN4Kpevq+mR9mpavoHjwq0HYofepw/ZUajcQ=
X-Google-Smtp-Source: ABdhPJy8ZEvHkdbLCECmFhoubpkNyxJl1yM1jZlATF3A248P90vzBQMLMmP5xhwwifp+IH/oIxsi2WXLKi+7cwno7+A=
X-Received: by 2002:a17:902:ac8b:b029:d0:89f4:6220 with SMTP id
 h11-20020a170902ac8bb02900d089f46220mr6535483plr.8.1599756126225; Thu, 10 Sep
 2020 09:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200910135120.3527468-1-masahiroy@kernel.org>
 <20200910135120.3527468-2-masahiroy@kernel.org> <20200910163311.GB3119896@ubuntu-n2-xlarge-x86>
In-Reply-To: <20200910163311.GB3119896@ubuntu-n2-xlarge-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 11 Sep 2020 01:41:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbjsKpbSKRNEzFTXsD1+nj-gkKon3c1u9J=x8wL4H-DA@mail.gmail.com>
Message-ID: <CAK7LNAQbjsKpbSKRNEzFTXsD1+nj-gkKon3c1u9J=x8wL4H-DA@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: remove cc-option test of -fno-merge-all-constants
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 11, 2020 at 1:33 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Sep 10, 2020 at 10:51:18PM +0900, Masahiro Yamada wrote:
> > The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> >
> > Here is the godbolt:
> > https://godbolt.org/z/8T4177
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> For what it's worth, the commit that introduced this block is going to
> be reverted:
>
> https://lore.kernel.org/mm-commits/20200903201518.JKrRS%25akpm@linux-foundation.org/


My bad - you are right.
This hunk has already gone by Nick's patch.

Thanks.



> Regardless, it was introduced in LLVM 2.7.0 in commit
> f9d41df0930986c52e198292cf875eb5d1761ece.
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> > ---
> >
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 059b36f2ea53..1b6abecc5cab 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -927,7 +927,7 @@ KBUILD_CFLAGS     += -fno-strict-overflow
> >  # clang sets -fmerge-all-constants by default as optimization, but this
> >  # is non-conforming behavior for C and in fact breaks the kernel, so we
> >  # need to disable it here generally.
> > -KBUILD_CFLAGS        += $(call cc-option,-fno-merge-all-constants)
> > +KBUILD_CFLAGS        += -fno-merge-all-constants
> >
> >  # for gcc -fno-merge-all-constants disables everything, but it is fine
> >  # to have actual conforming behavior enabled.
> > --
> > 2.25.1
> >
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200910163311.GB3119896%40ubuntu-n2-xlarge-x86.



-- 
Best Regards
Masahiro Yamada
