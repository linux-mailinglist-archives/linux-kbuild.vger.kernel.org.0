Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D183DBBE3
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 17:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239546AbhG3PQV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 11:16:21 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34597 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239248AbhG3PQV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 11:16:21 -0400
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 16UFFxvG029442;
        Sat, 31 Jul 2021 00:16:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 16UFFxvG029442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627658160;
        bh=rwXESo6Zwmg+wSRT6LqVZ2Q5mAY+xa2YCUP4gKaEPA0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t+XmJm/IJ7HTRTTYuc07Zz8yHH8uBUb85TrY/OcfMiLhbekNAni5sjb4KEbM6iRAE
         86n06tGO1UJQFNtgLFQo5WdRiU+ZLSSBVvn1x6I1oMup+QA8FTvDa9OXMvCLNXsIFH
         g2GcX7qrMeE9ZgE3+y0oXEwQXohARUPIvWBv1HB4jRuQMlrMkJ86J8M9Souu3OegsN
         gpRsysAN/ofpWnhRcywOmNrh0uzgtyNFamthEV+lCXH3b/SvQo6MnfqansiTuwxZoa
         LA+AP+N6Y5/OpWW1EhtxNbjbOIcKWnn+Pcd38VoIsHr/dNGVvXqb1xCnb3EUm5ygSb
         8bjrLxNgw6W7A==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so14924608pjd.0;
        Fri, 30 Jul 2021 08:16:00 -0700 (PDT)
X-Gm-Message-State: AOAM530u5Q3KT+wGlPdTXeSzW6fX5XjXboaI2GpqGRKzfAA5UAC4eipF
        1kSOg+s9+LV/9z1FZkchSwyro+SnMO88r/kOhTU=
X-Google-Smtp-Source: ABdhPJwznfYYKIHMhFfOobcifveHJS6kvIDcdZfC3d9h4pw5yo52howVX3ihUf8nUjmN3pPjRmyHo9I5vji2VrqW6WU=
X-Received: by 2002:aa7:8593:0:b029:32b:c173:cd96 with SMTP id
 w19-20020aa785930000b029032bc173cd96mr3341045pfn.63.1627658159170; Fri, 30
 Jul 2021 08:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210729165039.23896-1-ndesaulniers@google.com>
 <20210729165039.23896-3-ndesaulniers@google.com> <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
 <CAKwvOdm0xs4ikb0K0_b8Az0T=Kxu_-6AHjWHOhjsKZb3hTrH2A@mail.gmail.com>
In-Reply-To: <CAKwvOdm0xs4ikb0K0_b8Az0T=Kxu_-6AHjWHOhjsKZb3hTrH2A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 31 Jul 2021 00:15:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbbHosb7uB53HPo3BpdFH_g5YAKkn1ouL=ymHb5nkEXw@mail.gmail.com>
Message-ID: <CAK7LNATbbHosb7uB53HPo3BpdFH_g5YAKkn1ouL=ymHb5nkEXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 CC=clang LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 9:19 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jul 29, 2021 at 2:00 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > While I understand that the LLVM=1 LLVM_IAS=1 case works perfectly fine
> > with this series, I am of the belief that making it work for CC=clang
> > LLVM_IAS=1 is a mistake because there is no way for that configuration
> > to work for cross compiling without CROSS_COMPILE.
>
> So with v3 of this change, rather than:
>
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang -j72
>
> If you wanted to omit CROSS_COMPILE, you'd need:
>
> $ ARCH=arm64 make CC=clang LLVM_IAS=1 LD=ld.lld OBJCOPY=llvm-objcopy
> STRIP=llvm-strip
>
> or
>
> $ ARCH=arm64 make CC=clang LLVM_IAS=1 LD=aarch64-linux-gnu-ld
> OBJCOPY=aarch64-linux-gnu-objcopy STRIP=aarch64-linux-gnu-strip

or

  $ ARCH=arm64 make LLVM=1 LLVM_IAS=1

still works.




> That's straight up worse IMO and defeats the purpose of "shortening
> the command line," which should be the goal.  Not "making CC=clang
> maximally flexible."  We don't want folks generally using CC=clang;
> preferably they'd use LLVM=1.  I need to rewrite our docs to make that
> more explicit and straightforward.  And if folks would prefer to use
> CC=clang for whatever reason, let them explicitly state CROSS_COMPILE
> then.
>
> So I agree with Nathan, and hope Masahiro will reconsider that perhaps
> the v2 variant that required LLVM=1 maybe makes more sense.


We can always infer the target triple from ARCH unless CROSS_COMPILE is given.

Doing this all the time makes nothing wrong.

"Whether CROSS_COMPILE is unneeded" is a different thing.



> Either way, I need to fix the comment in the new script, commit
> message, and docs, so v4 is necessary.
>
> I'm tempted to add a rewrite of our docs to say "just use LLVM=1"
> front and center, then get into finer grain details below, moving this
> second patch to be the third in a series.  Let's see what Masahiro's
> thoughts are though first. (I do appreciate them, even when I
> disagree).


I am not sure about that.

LLVM=1 is a very strong all-or-nothing flag,
but technically there is no reason to force it.

(At least, target-tools and host-tools look
independent to each other to me)


When you send v4, one more request:
Please drop LLVM_IAS=1 check as well.


-- 
Best Regards
Masahiro Yamada
