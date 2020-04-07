Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11CE91A1111
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgDGQRt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 12:17:49 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44477 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgDGQRt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 12:17:49 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 037GHUZs032382;
        Wed, 8 Apr 2020 01:17:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 037GHUZs032382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586276252;
        bh=DV4fQlgdI60yXyAogQu5G2vroWmj19GJw8loLCiMBRg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tIcqkHoLC5M96nj3x2YzVV9UUsr/y742KxfC3UNs1GBac2JewzoFBmOxYTBtiKndB
         0fKUAY50qcGORe5YCImxGdRuRa8tR3wIWQzDQpEkyAVLOdJM+cbFHpwolrd75zt7P4
         X9oArUiTTwEfKgzYa46h4TpYxzB1vc9PpcQYx3h9q+5Fb5lzIIg0BTucTxMZdoBSZP
         766dWaGeXVX2PdFEXprPqVmnz97T0SVMGkg74/vwy61+EtuaY/JnHTxmXPlM6KkMy3
         7C7/wdy8TuAseKrHrhZabi8aschGhRkjicjWUmVpsMfB8PuJveBkVzMqNTeibJOmPA
         rjx5BY4ZgtMPg==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id y17so1444131uap.13;
        Tue, 07 Apr 2020 09:17:31 -0700 (PDT)
X-Gm-Message-State: AGi0Puap5sTB/c8cgnYuW05LFJiu/G08Em97wd2/OOp+4tGZvb+Gcq+P
        29Ka5deyMu5KENxpSKCUeTO496g8bViG7FV+hbY=
X-Google-Smtp-Source: APiQypL4774Th5H69SOlepN/aoOiTYdYrF9dl4AWXBc+K+44ia0npli6ilqGytimcT0x8H+qc/pPnnfHO64GS5LOK6M=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr2335006uad.25.1586276250105;
 Tue, 07 Apr 2020 09:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <20200406112220.GB126804@google.com>
In-Reply-To: <20200406112220.GB126804@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 8 Apr 2020 01:16:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
Message-ID: <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Matthias Maennich <maennich@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 6, 2020 at 8:22 PM 'Matthias Maennich' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
> >As Documentation/kbuild/llvm.rst implies, building the kernel with a
> >full set of LLVM tools gets very verbose and unwieldy.
> >
> >Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> >GCC and Binutils. You can pass LLVM=1 from the command line or as an
> >environment variable. Then, Kbuild will use LLVM toolchains in your
> >PATH environment.
> >
> >Please note LLVM=1 does not turn on the LLVM integrated assembler.
> >You need to explicitly pass AS=clang to use it. When the upstream
> >kernel is ready for the integrated assembler, I think we can make
> >it default.
> >
> >We discussed what we need, and we agreed to go with a simple boolean
> >switch (https://lkml.org/lkml/2020/3/28/494).
> >
> >Some items in the discussion:
> >
> >- LLVM_DIR
> >
> >  When multiple versions of LLVM are installed, I just thought supporting
> >  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> >
> >  CC      = $(LLVM_DIR)clang
> >  LD      = $(LLVM_DIR)ld.lld
> >    ...
> >
> >  However, we can handle this by modifying PATH. So, we decided to not do
> >  this.
> >
> >- LLVM_SUFFIX
> >
> >  Some distributions (e.g. Debian) package specific versions of LLVM with
> >  naming conventions that use the version as a suffix.
> >
> >  CC      = clang$(LLVM_SUFFIX)
> >  LD      = ld.lld(LLVM_SUFFIX)
> >    ...
> >
> >  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
> >  but the suffixed versions in /usr/bin/ are symlinks to binaries in
> >  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> >
> >- HOSTCC, HOSTCXX, etc.
> >
> >  We can switch the host compilers in the same way:
> >
> >  ifneq ($(LLVM),)
> >  HOSTCC       = clang
> >  HOSTCXX      = clang++
> >  else
> >  HOSTCC       = gcc
> >  HOSTCXX      = g++
> >  endif
> >
> >  This may the right thing to do, but I could not make up my mind.
> >  Because we do not frequently switch the host compiler, a counter
> >  solution I had in my mind was to leave it to the default of the
> >  system.
> >
> >  HOSTCC       = cc
> >  HOSTCXX      = c++
>
> What about HOSTLD ? I saw recently, that setting HOSTLD=ld.lld is not
> yielding the expected result (some tools, like e.g. fixdep still require
> an `ld` to be in PATH to be built). I did not find the time to look into
> that yet, but I would like to consistently switch to the llvm toolchain
> (including linker and possibly more) also for hostprogs.


HOSTLD=ld.lld worked for me, but HOSTCC=clang did not.



HOSTCC=clang without CC=clang fails to build objtool.

The build system of objtool is meh.  :(


  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
error: unknown warning option '-Wstrict-aliasing=3'; did you mean
'-Wstring-plus-int'? [-Werror,-Wunknown-warning-option]
  HOSTCC   /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep.o
  HOSTLD   /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep-in.o
  LINK     /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep
  CC       /home/masahiro/workspace/linux-kbuild/tools/objtool/exec-cmd.o
  CC       /home/masahiro/workspace/linux-kbuild/tools/objtool/help.o
  CC       /home/masahiro/workspace/linux-kbuild/tools/objtool/pager.o






> Cheers,
> Matthias
>
> >
> >  Many distributions support update-alternatives to switch the default
> >  to GCC, Clang, or whatever, but reviewers were opposed to this
> >  approach. So, this commit does not touch the host tools.
> >
> >Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >---
> >
> > Documentation/kbuild/kbuild.rst |  5 +++++
> > Documentation/kbuild/llvm.rst   |  5 +++++
> > Makefile                        | 20 ++++++++++++++++----
> > 3 files changed, 26 insertions(+), 4 deletions(-)
> >
> >diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> >index 510f38d7e78a..2d1fc03d346e 100644
> >--- a/Documentation/kbuild/kbuild.rst
> >+++ b/Documentation/kbuild/kbuild.rst
> >@@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
> > These two variables allow to override the user@host string displayed during
> > boot and in /proc/version. The default value is the output of the commands
> > whoami and host, respectively.
> >+
> >+LLVM
> >+----
> >+If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
> >+of GCC and GNU binutils to build the kernel.
> >diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> >index d6c79eb4e23e..4602369f6a4f 100644
> >--- a/Documentation/kbuild/llvm.rst
> >+++ b/Documentation/kbuild/llvm.rst
> >@@ -55,6 +55,11 @@ additional parameters to `make`.
> >         READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> >         HOSTLD=ld.lld
> >
> >+You can use a single switch `LLVM=1` to use LLVM utilities by default (except
> >+for building host programs).
> >+
> >+      make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> >+
> > Getting Help
> > ------------
> >
> >diff --git a/Makefile b/Makefile
> >index c91342953d9e..6db89ecdd942 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> > KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> >
> > # Make variables (CC, etc...)
> >-LD            = $(CROSS_COMPILE)ld
> >-CC            = $(CROSS_COMPILE)gcc
> > CPP           = $(CC) -E
> >+ifneq ($(LLVM),)
> >+CC            = clang
> >+LD            = ld.lld
> >+AR            = llvm-ar
> >+NM            = llvm-nm
> >+OBJCOPY               = llvm-objcopy
> >+OBJDUMP               = llvm-objdump
> >+READELF               = llvm-readelf
> >+OBJSIZE               = llvm-size
> >+STRIP         = llvm-strip
> >+else
> >+CC            = $(CROSS_COMPILE)gcc
> >+LD            = $(CROSS_COMPILE)ld
> > AR            = $(CROSS_COMPILE)ar
> > NM            = $(CROSS_COMPILE)nm
> >-STRIP         = $(CROSS_COMPILE)strip
> > OBJCOPY               = $(CROSS_COMPILE)objcopy
> > OBJDUMP               = $(CROSS_COMPILE)objdump
> >-OBJSIZE               = $(CROSS_COMPILE)size
> > READELF               = $(CROSS_COMPILE)readelf
> >+OBJSIZE               = $(CROSS_COMPILE)size
> >+STRIP         = $(CROSS_COMPILE)strip
> >+endif
> > PAHOLE                = pahole
> > LEX           = flex
> > YACC          = bison
> >--
> >2.17.1
> >
> >--
> >You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> >To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> >To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200403051709.22407-1-masahiroy%40kernel.org.
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200406112220.GB126804%40google.com.



-- 
Best Regards
Masahiro Yamada
