Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EBB255B5A
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgH1NmA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 09:42:00 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47536 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729547AbgH1NkN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 09:40:13 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07SDd3xi014164;
        Fri, 28 Aug 2020 22:39:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07SDd3xi014164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598621943;
        bh=YdLnD8kilQi6Qu8wKPy3myXSTQRUVPOWLWxsi5X2Fak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t9eyrQX+d1ulLL0/TMY60sXye5M1I5wDkQq4Df+A0o1cVrBXmJg6t11tbOQl2mUrh
         bySrf/sl+Z3WUBCsgDnvSd/nicXj7DNFkjISU/YuXvYESsbbtJvYUMhLtaP5JsLD1H
         Xm2uLN3kbNXLXS2nrVVwHCLH6ubI9bsktK7gGi9Dlf0DRGgEoQnhfcdN4p8XL6rU0n
         fcJlmhTV2TDeewsIKMj2tlsRl279nrD3um9T415MU564pvecCQQZon+BV6w0h04ns5
         /wUomgE7AxMb+J2GXLw98WdbelePJs7m5kYMgaFrIuBH72AQUIG1Igs0PuMik+5Lqq
         rpfazqrkpYEZw==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id ls14so516930pjb.3;
        Fri, 28 Aug 2020 06:39:03 -0700 (PDT)
X-Gm-Message-State: AOAM530GGv1Ex5/MFVZKRHBGjJkK6db6eT0EOFcInEMJs/SSKAW4Jvpf
        jpmmG5Z7Gw7lxyZ/m7ZVKkvDlJElPXtqdSUI06w=
X-Google-Smtp-Source: ABdhPJzV51qhMJH/ItksiorasK1D6Z26aPHW40w0GVHpyueJGVudjSIjLrMTzzNHC/usgQ90ukPvmXif6Ac3NwjOCdE=
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr1274061pjb.153.1598621942482;
 Fri, 28 Aug 2020 06:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200825231438.15682-1-natechancellor@gmail.com> <CAKwvOdnCGoRHxgoV+qZNZQx04jwcttckCoxTpFKp9C=jRHw5+w@mail.gmail.com>
In-Reply-To: <CAKwvOdnCGoRHxgoV+qZNZQx04jwcttckCoxTpFKp9C=jRHw5+w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Aug 2020 22:38:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=Nr+kRoObN_FaGoHEBig404Ax3VU3=Qjt_o_yPR45OA@mail.gmail.com>
Message-ID: <CAK7LNAR=Nr+kRoObN_FaGoHEBig404Ax3VU3=Qjt_o_yPR45OA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Improve formatting of commands,
 variables, and arguments
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 10:36 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Aug 25, 2020 at 4:14 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > While reviewing a separate patch, I noticed that the formatting of the
> > commands, variables, and arguments was not in a monospaced font like the
> > rest of the Kbuild documentation (see kbuild/kconfig.rst for an
> > example). This is due to a lack of "::" before indented command blocks
> > and single backticks instead of double backticks for inline formatting.
> >
> > Add those so that the document looks nicer in an HTML format, while not
> > ruining the look in plain text.
> >
> > As a result of this, we can remove the escaped backslashes in the last
> > code block and move them to single backslashes.
> >
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Ah, yeah, I saw that. Thanks for the fix!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > ---
> >  Documentation/kbuild/llvm.rst | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index 2aac50b97921..334df758dce3 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -23,8 +23,8 @@ supports C and the GNU C extensions required by the kernel, and is pronounced
> >  Clang
> >  -----
> >
> > -The compiler used can be swapped out via `CC=` command line argument to `make`.
> > -`CC=` should be set when selecting a config and during a build.
> > +The compiler used can be swapped out via ``CC=`` command line argument to ``make``.
> > +``CC=`` should be set when selecting a config and during a build. ::
> >
> >         make CC=clang defconfig
> >
> > @@ -34,33 +34,33 @@ Cross Compiling
> >  ---------------
> >
> >  A single Clang compiler binary will typically contain all supported backends,
> > -which can help simplify cross compiling.
> > +which can help simplify cross compiling. ::
> >
> >         ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> >
> > -`CROSS_COMPILE` is not used to prefix the Clang compiler binary, instead
> > -`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
> > -example:
> > +``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
> > +``CROSS_COMPILE`` is used to set a command line flag: ``--target <triple>``. For
> > +example: ::
> >
> >         clang --target aarch64-linux-gnu foo.c
> >
> >  LLVM Utilities
> >  --------------
> >
> > -LLVM has substitutes for GNU binutils utilities. Kbuild supports `LLVM=1`
> > -to enable them.
> > +LLVM has substitutes for GNU binutils utilities. Kbuild supports ``LLVM=1``
> > +to enable them. ::
> >
> >         make LLVM=1
> >
> > -They can be enabled individually. The full list of the parameters:
> > +They can be enabled individually. The full list of the parameters: ::
> >
> > -       make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> > -         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
> > -         READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> > +       make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> > +         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \
> > +         READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
> >           HOSTLD=ld.lld
> >
> >  Currently, the integrated assembler is disabled by default. You can pass
> > -`LLVM_IAS=1` to enable it.
> > +``LLVM_IAS=1`` to enable it.
> >
> >  Getting Help
> >  ------------
> >
> > base-commit: abb3438d69fb6dd5baa4ae23eafbf5b87945eff1
> > --


Applied to linux-kbuild/fixes.
Thanks.

-- 
Best Regards
Masahiro Yamada
