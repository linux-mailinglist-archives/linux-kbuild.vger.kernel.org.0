Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAC13BF857
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 12:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhGHKZc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 06:25:32 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28247 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhGHKZb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 06:25:31 -0400
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 168AMbfx020771;
        Thu, 8 Jul 2021 19:22:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 168AMbfx020771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625739758;
        bh=x3iwjkRslUVXVzynqv9DkfAuhFvPu/NJ3gSa6NASYJE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uUd/VI3gi4dSyj51T4o6o+nARO5jLxRxy1olcogqUDzQKJDzcvEDK5GxemrwZ8gOa
         I5o4JyO3t/g32eqxiOVGgkRAZt0toUIs6RjDRWO6ihTYHSo+ChGRRTSQ0Mg6XdR70Z
         3PvRyxKfwafUTufh6LsbdfE2tOHIW0CJKYYRoO7fpkXUJP/vWWpXmwIenWBexubuut
         86TpGPPbH6eYD1abTyndbevMP9BGUFVM0KqJdDdU3geOLk/I3M0rc0CF4CUzBpVbRS
         lVRtY2SZ94ojvcTe9axGz8j1UrG7uYLWEPafx2ldKkMARI2s1SdE0fINvsmSoUCryv
         dW32QaWHhEn+g==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id u14so5428955pga.11;
        Thu, 08 Jul 2021 03:22:37 -0700 (PDT)
X-Gm-Message-State: AOAM530Ip/6JVdWynY8YEz5AbX2I/W6KQV9MBj0h7aM76yivDXND5A8k
        SVYLFKHnodyOBY0oyHT1OYbuVb3hKLQgLUhW95A=
X-Google-Smtp-Source: ABdhPJwu/iejZEqe9GXSf6sCQ5uzSwt2Q2xmjpHiv3AjLx+bimvubcjAKL2DtAxnQm0H6+37pnxC9zVobNq6Lje6JXo=
X-Received: by 2002:a05:6a00:c3:b029:327:f2ea:d869 with SMTP id
 e3-20020a056a0000c3b0290327f2ead869mr1588588pfj.63.1625739756737; Thu, 08 Jul
 2021 03:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com> <20210707224310.1403944-3-ndesaulniers@google.com>
In-Reply-To: <20210707224310.1403944-3-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 8 Jul 2021 19:21:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
Message-ID: <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 8, 2021 at 7:43 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given ARCH.
>
> If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> KBUILD_CFLAGS, and KBUILD_AFLAGS based on $ARCH.
>
> Previously, we'd cross compile via:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linxu-gnu make LLVM=1 LLVM_IAS=1
> Now:
> $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes RFC -> v1:
> * Rebase onto linux-kbuild/for-next
> * Keep full target triples since missing the gnueabi suffix messes up
>   32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
>   drop references to arm64.
> * Flush out TODOS.
> * Add note about -EL/-EB, -m32/-m64.
> * Add note to Documentation/.
>
>  Documentation/kbuild/llvm.rst |  5 +++++
>  scripts/Makefile.clang        | 38 +++++++++++++++++++++++++++++++++--
>  2 files changed, 41 insertions(+), 2 deletions(-)








When I was considering a similar idea, my plan was
to implement this in Kconfig instead of in Makefile
because that will pass the compiler information
in one direction (only from Kconfig to Kbuild), but
that is not so important. We can change it later
if needed.

I did not complete it because I was investigating
some issues (especially [3] below), but maybe
that is something we don't care about.

Can you address [2] below at least?
If we do not have any concern, I can merge it.
It is likely so because people are only discussing
"We want to omit omit CROSS_COMPILE".







[1] explicit target triple for native builds

The default target of my distro clang
is x86_64-pc-linux-gnu.

$ clang --version
Ubuntu clang version 11.0.0-2
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

So, previously, the kernel was built with
implied --target=x86_64-pc-linux-gnu.


With this patch, --target=x86_64-linux-gnu will be
explicitly specified.

The same applies to native-builds of other architectures.
For example, when a user builds the arm64 kernel on
an arm64 server, --target=aarch64-linux-gnu is
explicitly forced.

I guess, this is a good direction because the produced
code will be more deterministic, irrespective of the
Clang's configuration.



[2] 32/64-bit configuration is toggled in Kconfig time.

Initially, you submitted only arm64. Maybe, it was intentional
since arm64 is the simplest case.

In the kernel tree, arch/arm and arch/arm64 are very special
cases where 32-bit and 64-bit are separated by directory.

Some of the other architectures are bi-arch, and
32-bit/64-bit is specified by CONFIG_64BIT in Kconfig time.

When Makefiles are being parsed, we actually do not know
whether the user is planning to configure the kernel
for 32-bit or 64-bit because CONFIG_64BIT is not
specified at this point.

ARCH=x86 + CONFIG_64BIT=y
will build the x86_64 kernel, and
ARCH=x86 + CONFIG_64BIT=n
will build the i386 kernel.


Then, you may wonder

  else ifeq ($(ARCH),x86)
  CLANG_FLAGS    += --target=x86_64-linux-gnu

... works?

Yes, it does fortunately.

-m32/-m64 takes precedence over the
{x86_64,i386} part of the target triple.

As far as I tested,

      clang --target=x86_64-linux-gnu -m32

produced i386 code.

Interestingly,

    clang --target=i386-linux-gnu  -m64

produced x86_64 code.


We must rely on this behavior of Clang because
--target (which is contained in CLANG_FLAGS)
must be specified before the Kconfig time.
Then, a user can toggle CONFIG_64BIT any time
from menuconfig etc.

With this in mind, using $(ARCH) as if-else
switches is pointless.
$(SRCARCH) is the only meaningful input.


  else ifeq ($(ARCH),i386)
  CLANG_FLAGS    += --target=i686-linux-gnu
  else ifeq ($(ARCH),x86)
  CLANG_FLAGS    += --target=x86_64-linux-gnu
  else ifeq ($(ARCH),x86_64)
  CLANG_FLAGS    += --target=x86_64-linux-gnu

should be replaced with:

  else ifeq ($(SRCARCH),x86_64)
  CLANG_FLAGS    += --target=x86_64-linux-gnu


Some architectures are not only bi-arch, but also bi-endian.


You hardcoded 64bit little endian for ppc:

   else ifeq ($(ARCH),powerpc)
   CLANG_FLAGS    += --target=powerpc64le-linux-gnu


But, we must rely on the fact that

   clang  --target=powerpc64le-linux-gnu -mbig-endian -m32

produces big-endian 32-bit code.

This makes the "64le" part meaningless.


This should be noted. Otherwise it is difficult
to understand why --target=x86_64-linux-gnu works fine
with building the i386 kernel.



[3] User-space compilation

This does not matter to the kernel itself, but
Kbuild compiles some userspace programs for
the target architecture.
See the samples/ directory for example.

Another example is net/bpfilter/Makefile, which
embeds the user mode helper when
CONFIG_BPFILTER_UMH=y.

For this purpose, Kconfig checks if $(CC) is
capable of linking the userspace.
(CONFIG_CC_CAN_LINK).

When cross-building with Clang, I cannot see
CONFIG_CC_CAN_LINK set.

If we care about CONFIG_CC_CAN_LINK, probably,
--sysroot or something should be set according to:

https://clang.llvm.org/docs/CrossCompilation.html

This is an existing issue, but I have no time
for looking into this.

On debian systems, sysroot for cross-compilation
are located in /usr/aarch64-linux-gnu,
/usr/arm-linux-gnueabi, /usr/arm-linux-gnueabihf,
/usr/i686-linux-gnu/ etc. but I do not know if it
is the same across distros.





[4] What is the best target if we hard-code it?

Currently, we require the correct CROSS_COMPILE
is provided by users.

The target might impact the performance
or the ABI.
It was difficult for me to define
which one is better than another.

For example for ARCH=arm, which is better
--target=arm-linux-gnueabi or
--target=arm-lnux-gnueabihf or
something we don't care about?







> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b18401d2ba82..80c63dd9a6d1 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -46,6 +46,11 @@ example: ::
>
>         clang --target=aarch64-linux-gnu foo.c
>
> +When both ``LLVM=1`` and ``LLVM_IAS=1`` are used, ``CROSS_COMPILE`` becomes
> +unnecessary and can be inferred from ``ARCH``. Example: ::
> +
> +       ARCH=arm64 make LLVM=1 LLVM_IAS=1
> +
>  LLVM Utilities
>  --------------
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 297932e973d4..a79088797a50 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -1,6 +1,40 @@
> -ifneq ($(CROSS_COMPILE),)
> +# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness
> +# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
> +# target triple.
> +ifeq ($(CROSS_COMPILE),)
> +ifneq ($(LLVM),)
> +ifeq ($(LLVM_IAS),1)
> +ifeq ($(ARCH),arm)
> +CLANG_FLAGS    += --target=arm-linux-gnueabi
> +else ifeq ($(ARCH),arm64)
> +CLANG_FLAGS    += --target=aarch64-linux-gnu
> +else ifeq ($(ARCH),hexagon)
> +CLANG_FLAGS    += --target=hexagon-linux-gnu
> +else ifeq ($(ARCH),i386)
> +CLANG_FLAGS    += --target=i686-linux-gnu
> +else ifeq ($(ARCH),m68k)
> +CLANG_FLAGS    += --target=m68k-linux-gnu
> +else ifeq ($(ARCH),mips)
> +CLANG_FLAGS    += --target=mipsel-linux-gnu
> +else ifeq ($(ARCH),powerpc)
> +CLANG_FLAGS    += --target=powerpc64le-linux-gnu
> +else ifeq ($(ARCH),riscv)
> +CLANG_FLAGS    += --target=riscv64-linux-gnu
> +else ifeq ($(ARCH),s390)
> +CLANG_FLAGS    += --target=s390x-linux-gnu
> +else ifeq ($(ARCH),x86)
> +CLANG_FLAGS    += --target=x86_64-linux-gnu
> +else ifeq ($(ARCH),x86_64)
> +CLANG_FLAGS    += --target=x86_64-linux-gnu
> +else
> +$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
> +endif # ARCH
> +endif # LLVM_IAS
> +endif # LLVM
> +else
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> +endif # CROSS_COMPILE
> +
>  ifeq ($(LLVM_IAS),1)
>  CLANG_FLAGS    += -integrated-as
>  else
> --
> 2.32.0.93.g670b81a890-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210707224310.1403944-3-ndesaulniers%40google.com.



--
Best Regards

Masahiro Yamada
