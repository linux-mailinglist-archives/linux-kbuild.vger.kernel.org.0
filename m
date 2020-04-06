Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74319EF23
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 03:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgDFBe3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Apr 2020 21:34:29 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:16616 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFBe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 21:34:29 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0361YHe5027913;
        Mon, 6 Apr 2020 10:34:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0361YHe5027913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586136858;
        bh=WggtXRihTH+Wz5QBc889jtnhJke76W/cxwCtqWHtd04=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bMm9k1daHMzkHhg5is8BX38kKAJ0WFkzJrfNeP7PlxYViVbSh9UoVN1GgB0CWjwMw
         rLDDLCR3SxHbP8ozgi+cCvc5mKLqPJYoz3LkgqTq6B6ZPVfL5nGBfDdIt2nIDarR19
         7xi67pDvFe6z4VTK//Rej0c5xSMzp1HfrIs5YDFerlBrYM5Gi7VUWz8Qz6dZMjdfsj
         0ZHLTqLKoNRbXj1hqWx0R6M5reDK7a2ozPZTfIjLhq+cDmebugCqKxyEo2k5zE4ibL
         z06lWpBcwMqkSEwIU2fUPXfGZVG6rKWzhxmoQw39Y52eUYkiPh2eZG008RhcFmDi32
         7+L/HGdp/whPQ==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id g10so4928788uae.5;
        Sun, 05 Apr 2020 18:34:17 -0700 (PDT)
X-Gm-Message-State: AGi0PublqpKT37TTyTmIzrpjD7iCAb4EfKkT15zSBqrtN1n79zbAFrPL
        mTbwJXsZmr1Psg21gwTQb2zW0p4I9g12N496c+M=
X-Google-Smtp-Source: APiQypIcMplsadH3z84yNAuKQGfFCQbbX6ctwDwhT2ytsTfzrhFdcvKfTpH9UVUIN3vG+xTJxurABv8/OBALFHZl+Jk=
X-Received: by 2002:ab0:2790:: with SMTP id t16mr13453216uap.40.1586136856501;
 Sun, 05 Apr 2020 18:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <CAKwvOdnaZ6qDVxaPY-GEH8pdUkzH6eqm16ok9_wzRSVRG-1kiQ@mail.gmail.com>
 <CAK7LNAQybfcYiosNU+ybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew@mail.gmail.com> <20200405235507.psjjhqa3cxw57xra@google.com>
In-Reply-To: <20200405235507.psjjhqa3cxw57xra@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 6 Apr 2020 10:33:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_SQg2nhJ8HKBTq3+dziGpaJZ87fOBRS-ZMdUpKGhX9Q@mail.gmail.com>
Message-ID: <CAK7LNAS_SQg2nhJ8HKBTq3+dziGpaJZ87fOBRS-ZMdUpKGhX9Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Fangrui Song <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 6, 2020 at 8:55 AM 'Fangrui Song' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On 2020-04-06, Masahiro Yamada wrote:
> >On Sat, Apr 4, 2020 at 3:24 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >>
> >> On Thu, Apr 2, 2020 at 10:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> >
> >> > As Documentation/kbuild/llvm.rst implies, building the kernel with a
> >> > full set of LLVM tools gets very verbose and unwieldy.
> >> >
> >> > Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> >> > GCC and Binutils. You can pass LLVM=1 from the command line or as an
> >> > environment variable. Then, Kbuild will use LLVM toolchains in your
> >> > PATH environment.
> >> >
> >> > Please note LLVM=1 does not turn on the LLVM integrated assembler.
> >> > You need to explicitly pass AS=clang to use it. When the upstream
> >> > kernel is ready for the integrated assembler, I think we can make
> >> > it default.
> >>
> >> Having this behavior change over time may be surprising.  I'd rather
> >> that if you want to not use the integrated assembler, you explicitly
> >> negate it, or just don't use the LLVM=1 syntax, ie. `make CC=clang
> >> LD=ld.lld ...`.
> >>
> >> We could modify how `-no-integrated-as` is chosen when LLVM=1.
> >>
> >> make LLVM=1 LLVMIA=0 ... # add `-no-integrated-as`
> >> # what the flag is doesn't really matter to me, something shorter might be nice.
> >> make LLVM=1 # use all LLVM tools
> >>
> >> Since we got rid of $(AS), it would be appropriate to remove/change it
> >> there, since no one really relies on AS=clang right now. (We do have 1
> >> of our 60+ CI targets using it, but we can also change that trivially.
> >> So I think we have a lot of freedom to change how `-no-integrated-as`
> >> is set.
> >>
> >> This could even be independent of this patch.
> >
> >
> >I also thought a boolean flag is preferred.
> >
> >AS=clang will not live long anyway, and
> >I hesitated to break the compatibility
> >for the short-term workaround.
> >
> >But, if this is not a big deal, I can
> >replace AS=clang with LLVMIA=1.
>
> My mere complaint is that it may be difficult to infer the intention (integrated
> assembler) from the abbreviation "IA" in "LLVMIA" :/
>
> Something with "AS" in the name may be easier for a user to understand,
> e.g. CLANG_AS or LLVM_AS.




I see 'llvm-as' in my PATH,
but it is a different kind of tool, right?
(converter from LLVM assembler *.ll to LLVM bit code *.bc)

So, I thought "LLVM_AS" might be confusing.



-- 
Best Regards
Masahiro Yamada
