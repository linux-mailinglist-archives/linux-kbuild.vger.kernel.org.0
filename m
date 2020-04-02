Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD4019C76A
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 18:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbgDBQyz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 12:54:55 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30687 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388689AbgDBQyz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 12:54:55 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 032GsoDX019343;
        Fri, 3 Apr 2020 01:54:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 032GsoDX019343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585846491;
        bh=7OcTobGkjHwoSGKSzSqbMXwOD8hf/Cu5Rv1KanxRG6M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r4dvWeRrqrEB5tuF7dbbTjfXwOBc4B5OqV2ZPUPeAl+mhwtYPJUL8PnVSL/fpaJb9
         B4gJcNEcacVpLBdF2hfJCURRyOTrd9bLE1MAdoDbWE2O6T/SikbSHFYe1ydjt63Ip2
         lF8+FRGvnGQtCwUs0nCm5jaNz3Z3rbu/EyEaCk9Eg48y1LlpvLx0rxnjgVOWIlFkRn
         FemuFRhRPB/S31C85Qmd/8nj4VZMjlvH2fyI5G3lRJFSeDeR72o7CHPB8xcW7zEk3T
         DRcVV3JsuDhL03rb0mtlBk2QI0SSycmuuISBREBl9Iae9m3wG84iad2s6FygSj7odO
         w74U/Cm2Sn1Bw==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id z125so2783391vsb.13;
        Thu, 02 Apr 2020 09:54:50 -0700 (PDT)
X-Gm-Message-State: AGi0Puaw146oiZ8o7P0evT4fEm2vW0nYa6YfHozBl0qd1Jy6z/fQ2S7T
        24cL3kPCrCETgQhIHwd/gbVxm7MQBSsAGTRhXH4=
X-Google-Smtp-Source: APiQypKcHSOwmmBEXqfymQAwzhMySUC6GWbEi2z++DB0OAET1CSzQkxHcDe0BRYuPWHguZMvAQQlIIcxxGF/yF/X9d4=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr3145292vsz.155.1585846489469;
 Thu, 02 Apr 2020 09:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86> <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
 <20200330190312.GA32257@ubuntu-m2-xlarge-x86> <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
 <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
 <CAK7LNAR0PPxibFVC5F07mytz4J2BbwQkpHcquH56j7=S_Mqj2g@mail.gmail.com>
 <CAKwvOdnYXXcfxWT6bOZXCX9-ac8tb=p2J53W+T-_gOfUu9vvSg@mail.gmail.com> <20200402163957.lqgr3tpc4z7ish5e@google.com>
In-Reply-To: <20200402163957.lqgr3tpc4z7ish5e@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Apr 2020 01:54:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQxN=y=E_wysYhvDZh9hVpe5Yo6R0kVjCP7ZpK7+C_Vxw@mail.gmail.com>
Message-ID: <CAK7LNAQxN=y=E_wysYhvDZh9hVpe5Yo6R0kVjCP7ZpK7+C_Vxw@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
To:     Fangrui Song <maskray@google.com>
Cc:     "'Nick Desaulniers' via Clang Built Linux" 
        <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 3, 2020 at 1:40 AM Fangrui Song <maskray@google.com> wrote:
>
>
> On 2020-04-01, 'Nick Desaulniers' via Clang Built Linux wrote:
> >On Tue, Mar 31, 2020 at 11:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>
> >> On Wed, Apr 1, 2020 at 3:39 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >> >
> >> > On Mon, Mar 30, 2020 at 11:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> > >
> >> > > Having both LLVM_DIR and LLVM_SUFFIX seems verbose.
> >> >
> >> > I agree, so maybe just LLVM=y, and we can support both non-standard
> >> > locations and debian suffixes via modifications to PATH.
> >>
> >>
> >>
> >> OK, so we will start with the boolean switch 'LLVM'.
> >>
> >> People can use PATH to cope with directory path and suffixes.
> >
> >Sounds good, we will modify our CI to use PATH modifications rather
> >than suffixes. We can even do that before such a patch to Makefile
> >exists.
>
> The proposed LLVM=1 + PATH scheme looks good to me.
>
>
> There seems to be one issue.
> OBJSIZE=llvm-objsize added in
> commit fcf1b6a35c16ac500fa908a4022238e5d666eabf "Documentation/llvm: add documentation on building w/ Clang/LLVM"
> is wrong.
>
> The tool is named llvm-size. OBJSIZE is only used once:
>
>    arch/s390/scripts/Makefile.chkbss
>    14:     if ! $(OBJSIZE) --common $< | $(AWK) 'END { if ($$3) exit 1 }'; then \


Good catch.

Could you send a patch, please?




-- 
Best Regards
Masahiro Yamada
