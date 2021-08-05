Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A973E1B41
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 20:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241203AbhHES2W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 14:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241231AbhHES2U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 14:28:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C13C06179B
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Aug 2021 11:28:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id c16so12933767lfc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Aug 2021 11:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9f5+UcRxykKWQrhwnvqPA86sI58gT75eqY66GROKyNA=;
        b=uQ1LNJMzxkDObcH33vpmUAk1N2Oa1TnGr9KB8KJnrq4Xe/+Iy+UrARUTzIQ+8UBbbg
         jRqswcQYLPYFi7sRv/VLjuikh2aDuqjqkVGYRk1iOp9PlNaclkfw4KFJhBskj0oYSpcn
         GYC4SGsSjxyMvpzU9SL0TRJR0gEXWKdxUgJ0aI0Np15wtEAsRYc67SVoGsJKf9fkUeZq
         1sB4CULzzxuTJoRQtrsf0tGM/+Ie+o27/RWpDGv0yTZvwMA0BxKNTZTlNMZ4aV79noik
         PZsjScI95YtJnNmRYTTz69PCOynt8A2mflS2qGBlhB43YeGg43BsnenftziutIfzqxuH
         eaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9f5+UcRxykKWQrhwnvqPA86sI58gT75eqY66GROKyNA=;
        b=JkBzoQrwX26hmecliu9MbPWJ67fM4hfuWy2RdEfcAMFc+0eGn0lnW+bDcCTdaAnN+h
         r/lQpVqzfA+ilD8l7sy9vu1SDHGhXYkdihU3PBAHVMce3zotfRY6rmVBHEKdKWr+PE5F
         VcChtCw6qg+NnTPPq3g6SAd+yozwMsdJZZ27sIddIbBLBQiDBhtmKSwKrG8TREUWuGYp
         FtKKiL38T8ecDNgfLCJX9yg1zusHho1Y2JeGm0klFrgnCPRqcmHBQ+lCF52oK7OaEAdj
         /RmwshBYAZgnfM7rZFOKkqk55R9l3SNcVqztJYG7VDZ5Lbt0aTFfDZIf0uLpMiGumS4V
         r3ow==
X-Gm-Message-State: AOAM532qmOOGb3LWIszlXi0oWjCCzbdwVDNN4xUeGmCle+a2NJAuZgjV
        sDmbZGYpn/ZYB2ahz1CtKnTUflA+M7wq0i+SDhUbvvYgCj/8RlGR
X-Google-Smtp-Source: ABdhPJwPUKJ+mKOt5M72tKPqVOZ41c3qyJLEjsbx545iw2vHagDvmoOdnzkDZJBg2UjuLlGiwUkzoEwRuK29R1qgjtI=
X-Received: by 2002:a05:6512:39ca:: with SMTP id k10mr4737821lfu.547.1628188083378;
 Thu, 05 Aug 2021 11:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
 <20210802183910.1802120-4-ndesaulniers@google.com> <CAK7LNASkBNDzXWxweotPZGJH-z3J59rPQwGDV32rfH9hH+sVHQ@mail.gmail.com>
In-Reply-To: <CAK7LNASkBNDzXWxweotPZGJH-z3J59rPQwGDV32rfH9hH+sVHQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 5 Aug 2021 11:27:52 -0700
Message-ID: <CAKwvOd=iyhky9jhw+UpYM7W5-7tqo02sxpZUASEk6XciS0wSwg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
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

On Thu, Aug 5, 2021 at 6:58 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 3, 2021 at 3:39 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index b18401d2ba82..f8a360958f4c 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
> >  Currently, the integrated assembler is disabled by default. You can pass
> >  ``LLVM_IAS=1`` to enable it.
> >
> > +Omitting CROSS_COMPILE
> > +----------------------
> > +
> > +As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> > +
> > +Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> > +``--prefix=<path>`` to search for the GNU assembler and linker.
>
>
> Is there any place where we rely on --prefix
> to search for the linker?
>
> In general, the compiler stops after generating an object
> since it is passed with the -c option.
> The linking stage is separated.
>
> In the old days, VDSO was an exceptional case
> where $(CC) was used as the linker driver, but
> commit fe00e50b2db8c60e4ec90befad1f5bab8ca2c800 fixed it.

See my previous reply to Fangrui.
https://lore.kernel.org/lkml/CAKwvOdnK=SUm1_--tcLRO3LVeXd_2Srfv2tsZCUW0uXXa1W_pg@mail.gmail.com/

To be more specific, I believe this is still a problem for ppc vdso.
https://github.com/ClangBuiltLinux/linux/issues/774

I had sent patches for that, but binutils 2.26 would crash (IIUC,
newer GNU binutils are ok).  See this thread:
https://lore.kernel.org/lkml/b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu/

So "we'd prefer the linker was used as the driver, but there's at
least one place I know of in the tree where that's not currently the
case."
-- 
Thanks,
~Nick Desaulniers
