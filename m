Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871323DC1C9
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jul 2021 02:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhGaAFO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 20:05:14 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20051 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhGaAFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 20:05:14 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 16V04o9w005744;
        Sat, 31 Jul 2021 09:04:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 16V04o9w005744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627689890;
        bh=XO3ecdCytMFhmXI+sVt8I48X3Jd15zuvVLJ4vZPyas0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H1yPY+YPfUQ01M2XRLJMglDrCqcug8rVuWy+APGD6H0IQj0yd/NdoX6hMGf9yIVRH
         +vComhJRTuS/uJLO5eCnglVb5WUa1T9h8GQcO/xjBC7np8IIjJ6BjI4K4ryfLwRsrp
         Bbdalj8QqHjlo9M9X46nKAu4vW8+HFdkduqHOkz0yQ8dJsscxksSd2ioNU6ABFzf9q
         GtrtUzzCXCVurF/ddab9yz5e1O9iO7KUvy7Do5xTpOyDVbxIttyZYuJg+7JCVQN+d+
         q/lDllkt6x8l7a//9phhliVL9VJjQp0xPRtVsUPRApFh0jYnlc1LuJV1c/S9I1P8Q2
         MXTbHBPzmKndg==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id mt6so17503757pjb.1;
        Fri, 30 Jul 2021 17:04:50 -0700 (PDT)
X-Gm-Message-State: AOAM531QSFMxqNoqoH2yGdkllYUnvdVLRdS0RNBhHNsZrtPy/ympGq4j
        ntvINjI831MJxJEGF4M7HTnysnJECmhBAwnS5fQ=
X-Google-Smtp-Source: ABdhPJzzzctnjQeCI7BUS4IXNjkkf0zh9IxcM0IO/qVAtGj+jU0IHnX3ud9zlDEyIE2o0XvWF8snAnlibiHuoyM5/o4=
X-Received: by 2002:a65:498a:: with SMTP id r10mr136897pgs.7.1627689889645;
 Fri, 30 Jul 2021 17:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210730215708.276437-1-ndesaulniers@google.com>
 <20210730215708.276437-4-ndesaulniers@google.com> <20210730231252.r6fi6c3i6obbcgfi@google.com>
In-Reply-To: <20210730231252.r6fi6c3i6obbcgfi@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 31 Jul 2021 09:04:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSpc8JBivPGFSvxMdgh6+emwav9YPmnygrdPkX-Q1a+A@mail.gmail.com>
Message-ID: <CAK7LNASSpc8JBivPGFSvxMdgh6+emwav9YPmnygrdPkX-Q1a+A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
To:     Fangrui Song <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
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

On Sat, Jul 31, 2021 at 8:12 AM Fangrui Song <maskray@google.com> wrote:
>
> On 2021-07-30, Nick Desaulniers wrote:
> >As noted by Masahiro, document how we can generally infer CROSS_COMPILE
> >(and the more specific details about --target and --prefix) based on
> >ARCH.
> >
> >Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> >Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >---
> > Documentation/kbuild/llvm.rst | 17 +++++++++++++++++
> > 1 file changed, 17 insertions(+)
> >
> >diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> >index b18401d2ba82..4292f0686316 100644
> >--- a/Documentation/kbuild/llvm.rst
> >+++ b/Documentation/kbuild/llvm.rst
> >@@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
> > Currently, the integrated assembler is disabled by default. You can pass
> > ``LLVM_IAS=1`` to enable it.
> >
> >+Omitting CROSS_COMPILE
> >+----------------------
> >+
> >+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> >+
> >+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> >+``--prefix=<path>`` to search for the GNU assembler.
>
> and the GNU linker.
>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
> >+If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
> >+from ``ARCH``.
> >+
> >+That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
> >+
> >+For example, to cross-compile the arm64 kernel::
> >+
> >+      ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> Is  ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> preferred over
>
>    make ARCH=arm64 LLVM=1 LLVM_IAS=1
>
> ?


I do not think so.

For consistency,

   make ARCH=arm64 LLVM=1 LLVM_IAS=1

or

   ARCH=arm64 LLVM=1 LLVM_IAS=1 make

might be preferred.



But, in the same doc, I see an example, which
mixes up the env variables and a make variable.

     ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang




-- 
Best Regards
Masahiro Yamada
