Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7E0372461
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 04:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhEDCPA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 22:15:00 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:41841 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhEDCO7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 22:14:59 -0400
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 1442Ddm3026036;
        Tue, 4 May 2021 11:13:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 1442Ddm3026036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620094420;
        bh=Flpk8WY3fI6JRVmVx74VCPIcuW76pW3yvcKLrKEQfcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RcPTKSEZuzsHuullksFe1HmFYdJqmuQDvmRuMVscMUnbTGD1IAHfFUx7dg5iV8m8S
         JVq+4OeY8GmRwgM90uoiXxUQ8GBU6DS/UE7YNkMpCRhQjemtdM4gmVoWnXnKkMsZ6P
         wNzX+lqAga+GQCDJEkaLa0RsqmlOeV3Hv1gGqW3xwLbgXdat/s+21f6w35/UYErAzg
         eYPRP+7AosJUwZ/dFtrG0VhYQzao1oonlLYcj98QF0Z/lCQfak8N8Dj6/pM0Hyk1Rm
         0dH6xOgeIDzXhHXf/pxV1d72yKjZLx4ffhCHSdxGwxklgz893YkuvQdstcmBJwRsxN
         0RDuMm6MsEa/Q==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id m37so5336661pgb.8;
        Mon, 03 May 2021 19:13:40 -0700 (PDT)
X-Gm-Message-State: AOAM533WjKcCD2h0juyeAku81YcMg25NZe5V3yJ2z4UrhUyJeQWXVbdt
        2uWke3Q4JS3wAL8bFYzCw27r1xiGI0n05PZjyBw=
X-Google-Smtp-Source: ABdhPJzeIVApSQix0BuMNREdE8BGMBMEs/IGqBZW9NLCxeXtWVZOIBXs6zvGuxchr2x095EnqC+MdArD+HY3m1+ob/s=
X-Received: by 2002:a63:e044:: with SMTP id n4mr21297348pgj.47.1620094419287;
 Mon, 03 May 2021 19:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
In-Reply-To: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 4 May 2021 11:13:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASv=ev=MbA+iXsjQvKGe69+AmL7Ri7WQc9caoZpfyzEgw@mail.gmail.com>
Message-ID: <CAK7LNASv=ev=MbA+iXsjQvKGe69+AmL7Ri7WQc9caoZpfyzEgw@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 3:17 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 01/05/2021 =C3=A0 17:15, Masahiro Yamada a =C3=A9crit :
> > The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> > GCC 5.1.
> >
> > When we discussed last time, we agreed to raise the minimum GCC version
> > to 5.1 globally. [1]
> >
> > I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.
>
> One point I missed when I saw your patch first time, but I realised durin=
g the discussion:
>
> Up to 4.9, GCC was numbered with 3 digits, we had 4.8.0, 4.8.1, ... 4.8.5=
, 4.9.0, 4.9.1, .... 4.9.4
>
> Then starting at 5, GCC switched to a 2 digits scheme, with 5.0, 5.1, 5.2=
, ... 5.5
>
> So, that is not GCC 5.1 or 5.2 that you should target, but only GCC 5.
> Then it is up to the user to use the latest available version of GCC 5, w=
hich is 5.5 at the time
> begin, just like the user would have selected 4.9.4 when 4.9 was the mini=
mum GCC version.
>
> Christophe



One line below in Documentation/process/changes.rst,
I see

     Clang/LLVM (optional)  10.0.1           clang --version



Clang 10.0.1 is a bug fix release of Clang 10


I do not think GCC 5.2 is strange when we
want to exclude the initial release of GCC 5.





--=20
Best Regards
Masahiro Yamada
