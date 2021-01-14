Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCAC2F5D2D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 10:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbhANJWG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 04:22:06 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17189 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbhANJWE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 04:22:04 -0500
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10E9KqSV019480;
        Thu, 14 Jan 2021 18:20:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10E9KqSV019480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610616053;
        bh=GIb0FR4aAJ1kV0/4W9xH+1ZDMIfRJ13sU7o4iHJooWs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZwBVEYtVaQI3Ad1/Y/kI2tJl7/mbCio5Ka5MzlaPdjnmiA61H/XgvFsPkKj1OGsOi
         cIjU2CVxv936oipOnX4YLFlEyN/1fKLytRQzveLHseJ38HBEJvN0R74oM/KVLybo8d
         zjWDZLesZFm0bOOMV3EAY4FwNHLB+xCl1m8YXbI+kgjY/PPowo1DG3HfKLS3gWirUv
         jh0ybJjMt9kA0ROlRTDdpxS3WzR9f0aa+mtFlz57FM4Ah82MH5essNRUxJcc1HfYW3
         BR+tuCNkpsiARAYa8IFpFHTwcDw8I2OxAiyY4J520OimsdRiJE2NbZP13/K4qurdcb
         iIlmzmIFeOpQQ==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id p18so3348217pgm.11;
        Thu, 14 Jan 2021 01:20:53 -0800 (PST)
X-Gm-Message-State: AOAM533x0SA382nMT86WYi1L4GAQxN39LzwJs3q+uIWos12bO0ECNe6h
        ffxKnK7mAyvBX25YEwV1iTlFHuoWDHuNe6lQhZI=
X-Google-Smtp-Source: ABdhPJwepfFWui1ua8cr613ixTmhywiJ7Pk5vUuQbiDz5BC1VAyF5UuBK7/VMmxanUim1HTEdNYGRPUN8y+65c9E/Qk=
X-Received: by 2002:a62:820d:0:b029:1ad:d810:6805 with SMTP id
 w13-20020a62820d0000b02901add8106805mr6554390pfd.63.1610616052534; Thu, 14
 Jan 2021 01:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20210114042420.229524-1-masahiroy@kernel.org> <CAHFW8PRr6kjEE=7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g@mail.gmail.com>
In-Reply-To: <CAHFW8PRr6kjEE=7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 14 Jan 2021 18:20:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHA7FpYfdDaOuf+t+nMCtLH=Z7cdoK+3z3ScZ3Fn9Xww@mail.gmail.com>
Message-ID: <CAK7LNAQHA7FpYfdDaOuf+t+nMCtLH=Z7cdoK+3z3ScZ3Fn9Xww@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check the minimum compiler version in Kconfig
To:     Ilie Halip <ilie.halip@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 4:55 PM Ilie Halip <ilie.halip@gmail.com> wrote:
>
> Hi Masahiro,
>
> > +       #elif defined(__INTEL_COMPILER)
> > +       /* How to get the version of intel compiler? */
> > +       ICC     0               0               0
>
> According to Intel documentation[1], this should do the trick:
>
>     ICC     __INTEL_COMPILER  __INTEL_COMPILER_UPDATE
> __INTEL_COMPILER_BUILD_DATE
>
> I don't have the compiler installed, but I tested this on godbolt[2] and
> looks fine to me. What do you think?
>
> [1] https://software.intel.com/content/www/us/en/develop/documentation/cpp-compiler-developer-guide-and-reference/top/compiler-reference/macros/additional-predefined-macros.html
> [2] https://godbolt.org/z/E5PE6f
>
> I.H.

Thanks.

The following is the result from godbolt
(except the beta releases of 21.1.*)


version    __INTEL_COMPILER  __INTEL_COMPILER_UPDATE
13.0.1     1300               (unsupported)
16.0.3     1600               3
17.0.0     1700               0
18.0.0     1800               0
19.0.0     1900               0
19.0.1     1900               0



Presumably, the version string xx.yy.zz corresponds to
__INTEL_COMPILER=xxyy
__INTEL_COMPILER_UPDATE=zz

The output from 19.0.1 does not make sense, though.



BTW, when I tried ICC a few years ago,
I could not build the kernel with it.


-- 
Best Regards
Masahiro Yamada
