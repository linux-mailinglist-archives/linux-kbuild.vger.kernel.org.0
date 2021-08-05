Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED943E1B4F
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 20:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhHES3a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 14:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbhHES3a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 14:29:30 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A6FC061765
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Aug 2021 11:29:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m18so8355637ljo.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Aug 2021 11:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2x6auZy1yOpqK/qUxjj6oGl/GoNZ7BrX2iVqBBt8Ww=;
        b=s3FKo7e0gW48IvH0lOX4Kcel4L00ZcKu2nFI66uWvjtQ8/rVQhYZPEbf79d0F8Uouv
         uk0W/wKOVOAsC0A1EJXlP0p0jCihTaty+C79VIp+YN5MwaOTs/9xzexUBEOh590f+HIF
         iwFt3MK6wBZjYWk+VbbwKxjhOEYpiNNYXy4u+PXsbJiOBuVInPk2hy49igFYzkF8WVFa
         Gm9EdHXBflVgYvKhPAgq5ajsf6CE/zuiuxLLOFt+OPa1fpWMD/S29zBNMp3UK/0bFT42
         GEMXOFiBckGd6B64Zpg0ot0G6WU+72hyx3WSKw3YcoZJWqQiaSCIG8Bg9rQbBBNidWKp
         e1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2x6auZy1yOpqK/qUxjj6oGl/GoNZ7BrX2iVqBBt8Ww=;
        b=T+oeoVOLsRiB2HrJvhkiFgoAUnGmu9M7FAMiFthpDjx5BPK59bEtEEojIHi44r6878
         vNJH16HUsEUuW+vGMBBl/dskUVi3CM1qH68cxm2goIiGrvwQnvLlnmYnb7SA1HypmVT+
         EJnhZql8AjjW6wWg7H/aeFrZqAJPr11sAcu2HnysiA4LdEt0t0a/+2PzKJYTKscM+6Ij
         2Qpb360Cx6ZZ4eer86D632jsXKCWyYU9FxhFty2N67eF3nf9DCxhIwIGih2kw3e3AWQM
         jPjrFWryM58/CBVm3Rq21b3RRlAttkZcyJRJbOHYDOEIidDheM2r4+xfpYcp9Vg9F4D/
         ncCg==
X-Gm-Message-State: AOAM531+/nG74Vs0oFrAWEofvrGVu7EumjZazzNLIu1m3FLvJ4I6DVom
        QYSDjolye6P7hdrMUIYiG804lpCG7d/5Crj5Dt+72Q==
X-Google-Smtp-Source: ABdhPJyAXLRiePOk8RmfIiiw1Li4GncljE5ldEIU/fCDMdz+GCo7ZOdHwkVrVBCBCpZSQezVnv9hbeU9goJsJiriwWs=
X-Received: by 2002:a2e:9ec1:: with SMTP id h1mr4044167ljk.0.1628188154005;
 Thu, 05 Aug 2021 11:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
 <20210802183910.1802120-4-ndesaulniers@google.com> <CAK7LNASkBNDzXWxweotPZGJH-z3J59rPQwGDV32rfH9hH+sVHQ@mail.gmail.com>
 <CAKwvOd=iyhky9jhw+UpYM7W5-7tqo02sxpZUASEk6XciS0wSwg@mail.gmail.com>
In-Reply-To: <CAKwvOd=iyhky9jhw+UpYM7W5-7tqo02sxpZUASEk6XciS0wSwg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 5 Aug 2021 11:29:03 -0700
Message-ID: <CAKwvOd=5drNCoU-PLFb-kJTzk1tXOvwCK89hAMPXrBZv+Ey=Bw@mail.gmail.com>
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

On Thu, Aug 5, 2021 at 11:27 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 5, 2021 at 6:58 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Aug 3, 2021 at 3:39 AM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > > index b18401d2ba82..f8a360958f4c 100644
> > > --- a/Documentation/kbuild/llvm.rst
> > > +++ b/Documentation/kbuild/llvm.rst
> > > @@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
> > >  Currently, the integrated assembler is disabled by default. You can pass
> > >  ``LLVM_IAS=1`` to enable it.
> > >
> > > +Omitting CROSS_COMPILE
> > > +----------------------
> > > +
> > > +As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> > > +
> > > +Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> > > +``--prefix=<path>`` to search for the GNU assembler and linker.
> >
> >
> > Is there any place where we rely on --prefix
> > to search for the linker?
> >
> > In general, the compiler stops after generating an object
> > since it is passed with the -c option.
> > The linking stage is separated.
> >
> > In the old days, VDSO was an exceptional case
> > where $(CC) was used as the linker driver, but
> > commit fe00e50b2db8c60e4ec90befad1f5bab8ca2c800 fixed it.
>
> See my previous reply to Fangrui.
> https://lore.kernel.org/lkml/CAKwvOdnK=SUm1_--tcLRO3LVeXd_2Srfv2tsZCUW0uXXa1W_pg@mail.gmail.com/
>
> To be more specific, I believe this is still a problem for ppc vdso.
> https://github.com/ClangBuiltLinux/linux/issues/774
>
> I had sent patches for that, but binutils 2.26 would crash (IIUC,
> newer GNU binutils are ok).  See this thread:
> https://lore.kernel.org/lkml/b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu/
>
> So "we'd prefer the linker was used as the driver, but there's at
> least one place I know of in the tree where that's not currently the
> case."

Also, I think the CC_CAN_LINK functionality also fits the bill.
https://github.com/ClangBuiltLinux/linux/issues/1290
-- 
Thanks,
~Nick Desaulniers
