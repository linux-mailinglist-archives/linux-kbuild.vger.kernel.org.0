Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925B73DBBC2
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 17:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239030AbhG3PLZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 11:11:25 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54823 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238909AbhG3PLY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 11:11:24 -0400
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 16UFAtLP007419;
        Sat, 31 Jul 2021 00:10:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 16UFAtLP007419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627657856;
        bh=v5MHFz9EK8kI2OcDF+0Y/+e/itS2l+ggYopCMqJkDFY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vzdxAYX3sa2bpVf56BCgiVmZfFrD8HDXc4sCLxvYG3LmS/rPSdbDzZH5SPXSo4LxR
         /XQi6+16Ud3RCtP1s13CrSMYLiBFd+AzzEyAkqEorNB0xqkdkV9I8D4mZa9zQXYPgW
         p0sG3oWHYNzClOyVJvFYy4sUBxbl/DKTHuaPXpQsg776GId/7yeWyHGvf6ZO1/9eJ6
         f8XTLlmG5BchS+AUMSo8HfZd0RrAqJZ6ksPB9xl6EAZEMpvaBdx22FOJFb1MjXUXbQ
         ucGpF6KZ/6wBMrmpOFzs7yCr2Y6MsT2daWMtl4CR93R/+IrJXGG6O6ArmetimMdJKf
         zlBjYMju8Pnww==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id c16so11415531plh.7;
        Fri, 30 Jul 2021 08:10:56 -0700 (PDT)
X-Gm-Message-State: AOAM530gbk1p8IYuIZUC22sLnEfs9obuztwBC5i8PG+H1mlxrMoLfcSF
        dgaGCYMvp8B7/7lOZd7RoTOsn8IYRTbPtuofgdM=
X-Google-Smtp-Source: ABdhPJy+M7XuQ/jjawczND9jNy2h40WK+ckYQK9VbO9dPob2y+06r5HBv0LImSV2ypdk8zPX1KCPs/f+anNFsYQQ/Lk=
X-Received: by 2002:a05:6a00:26d0:b029:32d:7d40:5859 with SMTP id
 p16-20020a056a0026d0b029032d7d405859mr3049890pfw.76.1627657855216; Fri, 30
 Jul 2021 08:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210729165039.23896-1-ndesaulniers@google.com>
 <20210729165039.23896-3-ndesaulniers@google.com> <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
In-Reply-To: <44117d0c-51b7-1f68-f752-ba53de503b14@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 31 Jul 2021 00:10:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvGK6pKXpE9=P-BXK5GHmLLVJRnxq84VOVz_1bm72FBg@mail.gmail.com>
Message-ID: <CAK7LNAQvGK6pKXpE9=P-BXK5GHmLLVJRnxq84VOVz_1bm72FBg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 CC=clang LLVM_IAS=1
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
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

On Fri, Jul 30, 2021 at 6:00 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> I realized that the title of this commit is not really right. We are not
> inferring CROSS_COMPILE, we are inferring '--target='.
>
> On 7/29/2021 9:50 AM, Nick Desaulniers wrote:
> > We get constant feedback that the command line invocation of make is too
> > long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> > target triple, or is an absolute path outside of $PATH, but it's mostly
> > redundant for a given SRCARCH. SRCARCH itself is derived from ARCH
>
> I feel like the beginning of this needs a little work.
>
> 1. "...invocation of make is too long when compiling with LLVM" would be
> a little more accurate.
>
> 2. "it's mostly redundant for a given SRCARCH" is not quite true in my
> eyes. For example, you could have aarch64-linux-, aarch64-elf-, or
> aarch64-linux-gnu-, and to my knowledge, all of these can compile a
> working Linux kernel. Again, saying "with LLVM", even mentioning its
> multitargeted nature, might make it a little more accurate to the casual
> passerby.
>
> > (normalized for a few different targets).
> >
> > If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> > KBUILD_CFLAGS, and KBUILD_AFLAGS based on $SRCARCH.
> >
> > Previously, we'd cross compile via:
> > $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
> > Now:
> > $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
> >
> > For native builds (not involving cross compilation) we now explicitly
> > specify a target triple rather than rely on the implicit host triple.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> > Changes v2 -> v3:
> > * Drop check/requirement for LLVM=1, as per Masahiro.
> > * Change oneliner from LLVM=1 LLVM_IAS=1 to CC=clang LLVM_IAS=1.
> > * Don't carry forward Nathan's RB/TB tags. :( Sorry Nathan, but thank
> >    you for testing+reviewing v2.
> > * Update wording of docs slightly.
> >
> > Changes v1 -> v2:
> > * Fix typos in commit message as per Geert and Masahiro.
> > * Use SRCARCH instead of ARCH, simplifying x86 handling, as per
> >    Masahiro. Add his sugguested by tag.
> > * change commit oneline from 'drop' to 'infer.'
> > * Add detail about explicit host --target and relationship of ARCH to
> >    SRCARCH, as per Masahiro.
> >
> > Changes RFC -> v1:
> > * Rebase onto linux-kbuild/for-next
> > * Keep full target triples since missing the gnueabi suffix messes up
> >    32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
> >    drop references to arm64.
> > * Flush out TODOS.
> > * Add note about -EL/-EB, -m32/-m64.
> > * Add note to Documentation/.
> >
> >   Documentation/kbuild/llvm.rst |  6 ++++++
> >   scripts/Makefile.clang        | 32 ++++++++++++++++++++++++++++++--
> >   2 files changed, 36 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index b18401d2ba82..aef1587fc09b 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -46,6 +46,12 @@ example: ::
> >
> >       clang --target=aarch64-linux-gnu foo.c
> >
> > +When both ``CC=clang`` (set via ``LLVM=1``) and ``LLVM_IAS=1`` are used,
> > +``CROSS_COMPILE`` becomes unnecessary and can be inferred from ``ARCH``.
>
> I am not a fan of this sentence because it implies that something like
> 'make ARCH=arm64 CC=clang LLVM_IAS=1' will work fine, which is not true.
> We still need CROSS_COMPILE for binutils in this configuration.


Agree.  That sentence is misleading, and moreover, it is wrong.



>
> CROSS_COMPILE provides the value for '--target=' and the prefix for the
> GNU tools such as ld, objcopy, and readelf. I think this direction is a
> regression because we are just talking about the first use of
> CROSS_COMPILE rather than the second at the same time.
>
> With LLVM=1 LLVM_IAS=1, we KNOW that the user will be using all LLVM
> tools. Sure, they are free to override LD, OBJCOPY, READELF, etc with
> the GNU variants but they have to provide the prefix because LLVM=1
> overrides the $(CROSS_COMPILE)<tool> assignments so it is irrelevant to
> us. As Masahiro mentioned, the user is free to individually specify all
> the tools by their individual variables such as LD=ld.lld BUT at that
> point, the user should be aware of what they are doing and specify
> CROSS_COMPILE.
>
> While I understand that the LLVM=1 LLVM_IAS=1 case works perfectly fine
> with this series, I am of the belief that making it work for CC=clang
> LLVM_IAS=1 is a mistake because there is no way for that configuration
> to work for cross compiling without CROSS_COMPILE.



LLVM=1 is a too strong requirement.


LLVM=1 switches not only target tools
(CC=clang, LD=ld.lld, AR=llvm-ar...)
but also host tools
(HOSTCC=clang, HOSTCXX=g++...).

Obviously host-tools are don't-care here.



Specifying the target tools individually, as in

   make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
     OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf

... is a perfectly correct command that
makes CROSS_COMPILE unnecessary.

There is no reason to stop inferring --target for this case.


The problem is NOT removing the LLVM=1 check
but the wrong documentation.


Let's write a precise document.

For example, the following document exactly
explains what is happening in the code,
and is still clear.




diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b18401d2ba82..a0d862bd73ac 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -63,6 +63,26 @@ They can be enabled individually. The full list of
the parameters: ::
 Currently, the integrated assembler is disabled by default. You can pass
 ``LLVM_IAS=1`` to enable it.

+
+Omitting CROSS_COMPILE
+----------------------
+
+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
+
+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
+``--prefix=<path>`` to search for the back-end GNU assembler.
+
+If CROSS_COMPILE is not specified, the ``--target=<triple>`` is inferred from
+``ARCH``.
+
+It means, if you use only LLVM tools, `CROSS_COMPILE`` becomes unnecessary.
+
+For example, to cross-compile the arm64 kernel::
+
+       ARCH=arm64 make LLVM=1 LLVM_IAS=1
+
+
 Supported Architectures
 -----------------------





BTW, I noticed LLVM_IAS=1 check is also unneeded
for the same reason.
So, it should go away.


-- 
Best Regards
Masahiro Yamada
