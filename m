Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A69A3E1626
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 15:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241276AbhHEN6y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 09:58:54 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57078 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239757AbhHEN6y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 09:58:54 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 175DwLoB003434;
        Thu, 5 Aug 2021 22:58:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 175DwLoB003434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628171902;
        bh=IkfSllG+SbN/b97YNpBIEYdvlpJTUqg6G4RBryizSqQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ua05HcSeJ4GvTVEoegvZ/4UovWLE4o04xLtcLEgmKUiat7MByY6JV9RYXC/BKRqZq
         bJ4GEPmNqOAS2we1MhN7g2DxlhTz/V4qJD2aRoup0IgEmSO0tEY7gz1pBFum+zt+fp
         BOr/AGtvqAMKEfR26wckN+FCI1/Po8YmaWbo5d0BoDhxEOQQMNcXfrKHpmzGShwmsw
         UajyYRmcA9TkCLDMwRip4TPZBuIr9STIhvQQHCSpw7ZHQN9LVNcFreo9oITw7vblks
         WupTlOpeIMuKYqZJIXAS9raVZft2wpAWW8iCRkt4Fb6XXw5ss8b4iDTGtm+oXNk+fC
         AkMsXX4WMYfRQ==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso9609585pjf.4;
        Thu, 05 Aug 2021 06:58:22 -0700 (PDT)
X-Gm-Message-State: AOAM530KqEPsaudEQ14PYggWt4dztn33bJnmHVy1Z4mrraPBsuBXX01/
        mJcaHXAaYvBiCDJbyOGMjYpl1oYfNrW+XBcheY0=
X-Google-Smtp-Source: ABdhPJw6/Efi1cfCY9CvameEnPfnwBuMScrNWAcgvk9GREiR8ZuGP8HHSkCOuhcsjtwB3fnqTQ6M0WbScGU9mQfZ4Q8=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr15434358pjt.198.1628171901401;
 Thu, 05 Aug 2021 06:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com> <20210802183910.1802120-4-ndesaulniers@google.com>
In-Reply-To: <20210802183910.1802120-4-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 22:57:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkBNDzXWxweotPZGJH-z3J59rPQwGDV32rfH9hH+sVHQ@mail.gmail.com>
Message-ID: <CAK7LNASkBNDzXWxweotPZGJH-z3J59rPQwGDV32rfH9hH+sVHQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
To:     Nick Desaulniers <ndesaulniers@google.com>
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

On Tue, Aug 3, 2021 at 3:39 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> As noted by Masahiro, document how we can generally infer CROSS_COMPILE
> (and the more specific details about --target and --prefix) based on
> ARCH.
>
> Change use of env vars to command line parameters.
>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes v5 -> v6:
> * Pick up Fangrui's RB tag.
> * Change use of env vars to command line parameters for consistency.
>
>  Documentation/kbuild/llvm.rst | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b18401d2ba82..f8a360958f4c 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -38,7 +38,7 @@ Cross Compiling
>  A single Clang compiler binary will typically contain all supported backends,
>  which can help simplify cross compiling. ::
>
> -       ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> +       make ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu-
>
>  ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
>  ``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
> @@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
>  Currently, the integrated assembler is disabled by default. You can pass
>  ``LLVM_IAS=1`` to enable it.
>
> +Omitting CROSS_COMPILE
> +----------------------
> +
> +As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> +
> +Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> +``--prefix=<path>`` to search for the GNU assembler and linker.


Is there any place where we rely on --prefix
to search for the linker?

In general, the compiler stops after generating an object
since it is passed with the -c option.
The linking stage is separated.

In the old days, VDSO was an exceptional case
where $(CC) was used as the linker driver, but
commit fe00e50b2db8c60e4ec90befad1f5bab8ca2c800 fixed it.







> +
> +If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
> +from ``ARCH``.
> +
> +That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
> +
> +For example, to cross-compile the arm64 kernel::
> +
> +       make ARCH=arm64 LLVM=1 LLVM_IAS=1
> +
>  Supported Architectures
>  -----------------------
>
> --
> 2.32.0.554.ge1b32706d8-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210802183910.1802120-4-ndesaulniers%40google.com.



-- 
Best Regards
Masahiro Yamada
