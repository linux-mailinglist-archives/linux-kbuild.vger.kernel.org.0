Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0978C1A125A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 19:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgDGRBT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 13:01:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44474 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgDGRBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 13:01:19 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so1453246plr.11
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2020 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKA4RM51A82x/5SpJbkyD9gWBCDUmnDILyC/0E/dflg=;
        b=ma3VTOaM3ccztMgbWUch6c9Nop0cKlddfRdpAgSYy7156lYP1wdkteuId5JaVDSzgv
         pstITV0JnBjl18ZnTE6upqD3TrTmYjV1BhYYPm/isptuMEyFwY+neCeERdoMYIA7FceE
         xNVwlvSMjCG83B8EHkpPJnmePjhK+X4KiRdfPjVc0byiuKoVyK5E3bk9YI6Dlvga6ir7
         cVDQCpvkxG0SJFNfsJ0E5vidb8x267+9UBHEhnGyzZW9eCxi1GQ3ezR3fHYst8oiLvLz
         IFstetzqRlAla/WuwKTX5ClMVQozR86gOzJMPoKJLbYQRPkqoo62sEBKwhW77lGPmRfM
         5SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKA4RM51A82x/5SpJbkyD9gWBCDUmnDILyC/0E/dflg=;
        b=I3x7lkOwWrP3uylf8BRadOthKze4+5YPxdUcvX4wnY+LiBHPrmWIDYDL5smVAEvKDh
         qzxypNKY0J7LcsSMV2aMkdUU3kYWJevBQbH4jGPJ9CjIKuhHU+3/AJ73qV7ffmslKSCd
         8NWvazGUJviVIOJAG5/Ke2Ka7T/8qr71pISaF6AwgkG3022N5r345E7/cLfMi1er6Prf
         ymOQ7z1Gmu6KbH1Qx3he1FcY+ycoBhgNcwQYT51SdVk2YhZUQiPCjew9gPgDF/OJuRr4
         atfqfXhtG9+qwwjt6du+KdOq7z48IL97uF2hW+UFrx0fSrYrhqRgaZFyzsarvDR3DcI4
         GYmw==
X-Gm-Message-State: AGi0PuZ7zoyDgUg/NI7p0/b682Brl0SNJAXon6Lmk5j9tPXLzqrl+IHn
        LR/8LNn3su2vf39/5hJyeMkTIwCDUoUQ6RUhe01iRg==
X-Google-Smtp-Source: APiQypLwGulDH+WJsMgYCIEQ0C1UrzVbHqpMJvqU9FEJJ+53A81wLeMpTOTAACHxZBxyCdDBD0SwVckZrPDO4CnpsWc=
X-Received: by 2002:a17:90a:8085:: with SMTP id c5mr276765pjn.186.1586278877201;
 Tue, 07 Apr 2020 10:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <20200406112220.GB126804@google.com>
 <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
In-Reply-To: <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Apr 2020 10:01:04 -0700
Message-ID: <CAKwvOdmHxeZ+T1OsOhW25pPygHM4D21OgZqRk141xbjP437-1w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Tue, Apr 7, 2020 at 9:17 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Apr 6, 2020 at 8:22 PM 'Matthias Maennich' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
> > >As Documentation/kbuild/llvm.rst implies, building the kernel with a
> > >full set of LLVM tools gets very verbose and unwieldy.
> > >
> > >Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> > >GCC and Binutils. You can pass LLVM=1 from the command line or as an
> > >environment variable. Then, Kbuild will use LLVM toolchains in your
> > >PATH environment.
> > >
> > >Please note LLVM=1 does not turn on the LLVM integrated assembler.
> > >You need to explicitly pass AS=clang to use it. When the upstream
> > >kernel is ready for the integrated assembler, I think we can make
> > >it default.
> > >
> > >We discussed what we need, and we agreed to go with a simple boolean
> > >switch (https://lkml.org/lkml/2020/3/28/494).
> > >
> > >Some items in the discussion:
> > >
> > >- LLVM_DIR
> > >
> > >  When multiple versions of LLVM are installed, I just thought supporting
> > >  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> > >
> > >  CC      = $(LLVM_DIR)clang
> > >  LD      = $(LLVM_DIR)ld.lld
> > >    ...
> > >
> > >  However, we can handle this by modifying PATH. So, we decided to not do
> > >  this.
> > >
> > >- LLVM_SUFFIX
> > >
> > >  Some distributions (e.g. Debian) package specific versions of LLVM with
> > >  naming conventions that use the version as a suffix.
> > >
> > >  CC      = clang$(LLVM_SUFFIX)
> > >  LD      = ld.lld(LLVM_SUFFIX)
> > >    ...
> > >
> > >  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
> > >  but the suffixed versions in /usr/bin/ are symlinks to binaries in
> > >  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> > >
> > >- HOSTCC, HOSTCXX, etc.
> > >
> > >  We can switch the host compilers in the same way:
> > >
> > >  ifneq ($(LLVM),)
> > >  HOSTCC       = clang
> > >  HOSTCXX      = clang++
> > >  else
> > >  HOSTCC       = gcc
> > >  HOSTCXX      = g++
> > >  endif
> > >
> > >  This may the right thing to do, but I could not make up my mind.
> > >  Because we do not frequently switch the host compiler, a counter
> > >  solution I had in my mind was to leave it to the default of the
> > >  system.
> > >
> > >  HOSTCC       = cc
> > >  HOSTCXX      = c++
> >
> > What about HOSTLD ? I saw recently, that setting HOSTLD=ld.lld is not
> > yielding the expected result (some tools, like e.g. fixdep still require
> > an `ld` to be in PATH to be built). I did not find the time to look into
> > that yet, but I would like to consistently switch to the llvm toolchain
> > (including linker and possibly more) also for hostprogs.
>
>
> HOSTLD=ld.lld worked for me, but HOSTCC=clang did not.
>
>
>
> HOSTCC=clang without CC=clang fails to build objtool.
>
> The build system of objtool is meh.  :(

Let's tackle that in a follow up, with the goal of build hermiticity
in mind.  I think there's good feedback in this thread to inform the
design of a v2:
1. CLANG_AS=0 to disable integrated as.  Hopefully we won't need this
much longer, so we don't need to spend too much time on this, Masahiro
please just choose a name for this.  llvm-as naming conventions
doesn't follow the rest of binutils.
2. HOSTCC=clang HOSTLD=ld.lld set by LLVM=1 for helping with build hermiticity.

>
>
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   DESCEND  objtool
> error: unknown warning option '-Wstrict-aliasing=3'; did you mean
> '-Wstring-plus-int'? [-Werror,-Wunknown-warning-option]
>   HOSTCC   /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep.o
>   HOSTLD   /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep-in.o
>   LINK     /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep
>   CC       /home/masahiro/workspace/linux-kbuild/tools/objtool/exec-cmd.o
>   CC       /home/masahiro/workspace/linux-kbuild/tools/objtool/help.o
>   CC       /home/masahiro/workspace/linux-kbuild/tools/objtool/pager.o
>
>
>
>
>
>
> > Cheers,
> > Matthias
> >
> > >
> > >  Many distributions support update-alternatives to switch the default
> > >  to GCC, Clang, or whatever, but reviewers were opposed to this
> > >  approach. So, this commit does not touch the host tools.
> > >
> > >Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > >---
> > >
> > > Documentation/kbuild/kbuild.rst |  5 +++++
> > > Documentation/kbuild/llvm.rst   |  5 +++++
> > > Makefile                        | 20 ++++++++++++++++----
> > > 3 files changed, 26 insertions(+), 4 deletions(-)
> > >
> > >diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> > >index 510f38d7e78a..2d1fc03d346e 100644
> > >--- a/Documentation/kbuild/kbuild.rst
> > >+++ b/Documentation/kbuild/kbuild.rst
> > >@@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
> > > These two variables allow to override the user@host string displayed during
> > > boot and in /proc/version. The default value is the output of the commands
> > > whoami and host, respectively.
> > >+
> > >+LLVM
> > >+----
> > >+If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
> > >+of GCC and GNU binutils to build the kernel.
> > >diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > >index d6c79eb4e23e..4602369f6a4f 100644
> > >--- a/Documentation/kbuild/llvm.rst
> > >+++ b/Documentation/kbuild/llvm.rst
> > >@@ -55,6 +55,11 @@ additional parameters to `make`.
> > >         READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> > >         HOSTLD=ld.lld
> > >
> > >+You can use a single switch `LLVM=1` to use LLVM utilities by default (except
> > >+for building host programs).
> > >+
> > >+      make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> > >+
> > > Getting Help
> > > ------------
> > >
> > >diff --git a/Makefile b/Makefile
> > >index c91342953d9e..6db89ecdd942 100644
> > >--- a/Makefile
> > >+++ b/Makefile
> > >@@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> > > KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> > >
> > > # Make variables (CC, etc...)
> > >-LD            = $(CROSS_COMPILE)ld
> > >-CC            = $(CROSS_COMPILE)gcc
> > > CPP           = $(CC) -E
> > >+ifneq ($(LLVM),)
> > >+CC            = clang
> > >+LD            = ld.lld
> > >+AR            = llvm-ar
> > >+NM            = llvm-nm
> > >+OBJCOPY               = llvm-objcopy
> > >+OBJDUMP               = llvm-objdump
> > >+READELF               = llvm-readelf
> > >+OBJSIZE               = llvm-size
> > >+STRIP         = llvm-strip
> > >+else
> > >+CC            = $(CROSS_COMPILE)gcc
> > >+LD            = $(CROSS_COMPILE)ld
> > > AR            = $(CROSS_COMPILE)ar
> > > NM            = $(CROSS_COMPILE)nm
> > >-STRIP         = $(CROSS_COMPILE)strip
> > > OBJCOPY               = $(CROSS_COMPILE)objcopy
> > > OBJDUMP               = $(CROSS_COMPILE)objdump
> > >-OBJSIZE               = $(CROSS_COMPILE)size
> > > READELF               = $(CROSS_COMPILE)readelf
> > >+OBJSIZE               = $(CROSS_COMPILE)size
> > >+STRIP         = $(CROSS_COMPILE)strip
> > >+endif
> > > PAHOLE                = pahole
> > > LEX           = flex
> > > YACC          = bison
> > >--
> > >2.17.1
> > >
> > >--
> > >You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > >To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > >To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200403051709.22407-1-masahiroy%40kernel.org.
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200406112220.GB126804%40google.com.
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA%40mail.gmail.com.



-- 
Thanks,
~Nick Desaulniers
