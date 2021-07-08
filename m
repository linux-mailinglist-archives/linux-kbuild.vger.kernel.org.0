Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FF73C198E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 21:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhGHTFb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 15:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbhGHTFb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 15:05:31 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2356C06175F
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jul 2021 12:02:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 8so6564245lfp.9
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jul 2021 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iCjglDRVYYfDMnEWeZjnuRPIHpWzdHVzJbk3D4IPcVA=;
        b=SWRi6RCpKFn1brXJUTFOICgSd+8S+zpaDoVWVu17HzUaaNaOhIAzNsXkbkDvGWwtN0
         G7Ieq4ztDHwuPiJ8ssKtde4YIs+u2ezDe2PHi+EpInhZDgXSVoHN/znuHPlSndf0P2by
         RH31XOcagMhFIV+X6LHK4j3f5kEHMl5c6UAp6KmW2ES+DKY8fRsrI/b8Stk/8yFBCWcS
         ZaMjxrcxskgZ7o35ej2XXBMrGk0CbcOETzLZPvZ3YU5ckCnVOUTxxam8iNukqMRsl68N
         phwCS3eb9iHVL6N2u905XQ2+/PvK3k8yr/rJqkCbDJ3qlYJhyk9JHM6joWLNhAAwoM6n
         uf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iCjglDRVYYfDMnEWeZjnuRPIHpWzdHVzJbk3D4IPcVA=;
        b=rNqT741+c//cNqP7HYBomHCtJELvuPUT8QKNdf/RG6KhZo0/MzgBMQ8+9XTztubdx1
         jo9PKg01bS+iJ+oYApahKkg+VSIXteSFtIrsLJOLufDCMIg2FjpugMak9E6Po2pweGeS
         UVGCxoV9KytYBIHOg3l3AUFeMCkGkQ/zQjOrVH9e26TCxPZJYem6OBqCcokp+8WiuEPj
         4dVhgBdB63UmxLj8Hqh5RPTrp6TfjGs50+1waGz9yJn/BUUpDjBfkG8ozaLDJV1164kf
         tVa0xdggYERE7xz0tiu1rHwriNr+6zxQKttzT0Tca9LUpX+SQ2hk/IvGwFNjQIRuKaHk
         Jypw==
X-Gm-Message-State: AOAM533JzWUS1gsx2it2pqbJCnVLew7npecIq7oMqQntwfS1+n7Xa6a+
        bvUdlAkvPWNZFQC5m76cXIezpNSCT9ROp+tcNErs/A==
X-Google-Smtp-Source: ABdhPJyxbNSW17npdAMGIwokCciI1J6kaWl1ZamNZWgSDQNp1S5vgqAfQ2D6dK2pzfZFjzOtDWrx+SIergf/rBwJYMw=
X-Received: by 2002:a05:6512:3884:: with SMTP id n4mr24859969lft.547.1625770966574;
 Thu, 08 Jul 2021 12:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <20210707224310.1403944-3-ndesaulniers@google.com> <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
In-Reply-To: <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 8 Jul 2021 12:02:35 -0700
Message-ID: <CAKwvOdmufESjYQVZmaPdTXgZO5Ogz+OppVSUGAn6BZaC+YZhbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Fangrui Song <maskray@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
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

On Thu, Jul 8, 2021 at 3:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Jul 8, 2021 at 7:43 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > We get constant feedback that the command line invocation of make is too
> > long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> > target triple, or is an absolute path outside of $PATH, but it's mostly
> > redundant for a given ARCH.
> >
> > If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> > KBUILD_CFLAGS, and KBUILD_AFLAGS based on $ARCH.
> >
> > Previously, we'd cross compile via:
> > $ ARCH=arm64 CROSS_COMPILE=aarch64-linxu-gnu make LLVM=1 LLVM_IAS=1
> > Now:
> > $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Changes RFC -> v1:
> > * Rebase onto linux-kbuild/for-next
> > * Keep full target triples since missing the gnueabi suffix messes up
> >   32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
> >   drop references to arm64.
> > * Flush out TODOS.
> > * Add note about -EL/-EB, -m32/-m64.
> > * Add note to Documentation/.
> >
> >  Documentation/kbuild/llvm.rst |  5 +++++
> >  scripts/Makefile.clang        | 38 +++++++++++++++++++++++++++++++++--
> >  2 files changed, 41 insertions(+), 2 deletions(-)
>
>
>
>
>
>
>
>
> When I was considering a similar idea, my plan was
> to implement this in Kconfig instead of in Makefile
> because that will pass the compiler information
> in one direction (only from Kconfig to Kbuild), but
> that is not so important. We can change it later
> if needed.
>
> I did not complete it because I was investigating
> some issues (especially [3] below), but maybe
> that is something we don't care about.
>
> Can you address [2] below at least?

Sure!

> If we do not have any concern, I can merge it.
> It is likely so because people are only discussing
> "We want to omit omit CROSS_COMPILE".
>
>
>
>
>
>
>
> [1] explicit target triple for native builds
>
> The default target of my distro clang
> is x86_64-pc-linux-gnu.
>
> $ clang --version
> Ubuntu clang version 11.0.0-2
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
>
> So, previously, the kernel was built with
> implied --target=x86_64-pc-linux-gnu.
>
>
> With this patch, --target=x86_64-linux-gnu will be
> explicitly specified.

Correct. We've been doing this for x86 builds of Android kernels for a
while without issue.

I can add this note to the commit message:
```
For native builds (not involving cross compilation) we now explicitly
specify a target triple
rather than rely on the implicit host triple.
```
The only downside I can think of now is that we've encountered E2BIG
for excessively long command line arguments in the past (mostly for
out of tree drivers in Android).  I'm having trouble imagining how the
implicit host triple could differ in a way from these explicit ones
that would break native compilation.  Then again, someone did just
submit patches for building Linux on BSD.

If we don't want to do that, perhaps we could check `cross_compiling`.
Why did you make that variable lowercase in
commit f02aa48dde8b ("kconfig: use /boot/config-* etc. as
DEFCONFIG_LIST only for native build")?
Because the "origin" is not the environment?

> The same applies to native-builds of other architectures.
> For example, when a user builds the arm64 kernel on
> an arm64 server, --target=aarch64-linux-gnu is
> explicitly forced.
>
> I guess, this is a good direction because the produced
> code will be more deterministic, irrespective of the
> Clang's configuration.
>
>
>
> [2] 32/64-bit configuration is toggled in Kconfig time.
>
> Initially, you submitted only arm64. Maybe, it was intentional
> since arm64 is the simplest case.
>
> In the kernel tree, arch/arm and arch/arm64 are very special
> cases where 32-bit and 64-bit are separated by directory.
>
> Some of the other architectures are bi-arch, and
> 32-bit/64-bit is specified by CONFIG_64BIT in Kconfig time.
>
> When Makefiles are being parsed, we actually do not know
> whether the user is planning to configure the kernel
> for 32-bit or 64-bit because CONFIG_64BIT is not
> specified at this point.
>
> ARCH=x86 + CONFIG_64BIT=y
> will build the x86_64 kernel, and
> ARCH=x86 + CONFIG_64BIT=n
> will build the i386 kernel.
>
>
> Then, you may wonder
>
>   else ifeq ($(ARCH),x86)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu
>
> ... works?
>
> Yes, it does fortunately.
>
> -m32/-m64 takes precedence over the
> {x86_64,i386} part of the target triple.
>
> As far as I tested,
>
>       clang --target=x86_64-linux-gnu -m32
>
> produced i386 code.
>
> Interestingly,
>
>     clang --target=i386-linux-gnu  -m64
>
> produced x86_64 code.

Correct. -m32/-m64 and -LE/-BE refine the target triple that the
driver builds up.

> We must rely on this behavior of Clang because
> --target (which is contained in CLANG_FLAGS)
> must be specified before the Kconfig time.
> Then, a user can toggle CONFIG_64BIT any time
> from menuconfig etc.

Correct. So we can't quite move all clang flags into one Makefile
under scripts/ if they rely on Kconfig being run first. This new
makefile is a "pre-kconfig" set of flags.

> With this in mind, using $(ARCH) as if-else
> switches is pointless.
> $(SRCARCH) is the only meaningful input.
>
>
>   else ifeq ($(ARCH),i386)
>   CLANG_FLAGS    += --target=i686-linux-gnu
>   else ifeq ($(ARCH),x86)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu
>   else ifeq ($(ARCH),x86_64)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu
>
> should be replaced with:
>
>   else ifeq ($(SRCARCH),x86_64)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu

Sure, it looks like this would simplify the i386 vs x86_64 handling,
and the use of SRCARCH does seem more prevalent throughout the
codebase. I will fix in v2.

> Some architectures are not only bi-arch, but also bi-endian.
>
>
> You hardcoded 64bit little endian for ppc:
>
>    else ifeq ($(ARCH),powerpc)
>    CLANG_FLAGS    += --target=powerpc64le-linux-gnu
>
>
> But, we must rely on the fact that
>
>    clang  --target=powerpc64le-linux-gnu -mbig-endian -m32
>
> produces big-endian 32-bit code.
>
> This makes the "64le" part meaningless.
>
>
> This should be noted. Otherwise it is difficult

It is noted; in the top part of the newly added make file.
```
  1 # Individual arch/{arch}/Makfiles should use -EL/-EB to set
intended endianness
  2 # and -m32/-m64 to set word size based on Kconfigs instead of
relying on the
  3 # target triple.
```
Is there somewhere/somehow else you'd like me to note that?

> to understand why --target=x86_64-linux-gnu works fine
> with building the i386 kernel.
>
>
>
> [3] User-space compilation
>
> This does not matter to the kernel itself, but
> Kbuild compiles some userspace programs for
> the target architecture.
> See the samples/ directory for example.
>
> Another example is net/bpfilter/Makefile, which
> embeds the user mode helper when
> CONFIG_BPFILTER_UMH=y.
>
> For this purpose, Kconfig checks if $(CC) is
> capable of linking the userspace.
> (CONFIG_CC_CAN_LINK).
>
> When cross-building with Clang, I cannot see
> CONFIG_CC_CAN_LINK set.

Yes, that is a known issue.
https://github.com/ClangBuiltLinux/linux/issues/1290

>
> If we care about CONFIG_CC_CAN_LINK, probably,
> --sysroot or something should be set according to:
>
> https://clang.llvm.org/docs/CrossCompilation.html
>
> This is an existing issue, but I have no time
> for looking into this.
>
> On debian systems, sysroot for cross-compilation
> are located in /usr/aarch64-linux-gnu,
> /usr/arm-linux-gnueabi, /usr/arm-linux-gnueabihf,
> /usr/i686-linux-gnu/ etc. but I do not know if it
> is the same across distros.

Right. If I remember the glibc/binutils/gcc bootstrap dance, I thought
gcc was configured with a known path to a particular version of glibc.
So a cross toolchain knew where to look for its cross libc.

Clang doesn't have such configure time step; it can cross compile
easily with one binary, but cross linking a working executable is
still a PITA due to not knowing which cross libc to link against.  I'm
not sure whether we need to improve Clang's logic when cross compiling
to look in "sane default" paths for a cross libc, or if we should just
add some flag when cross compiling with clang in Kbuild (such as
--sysroot) in order for CONFIG_CC_CAN_LINK to work as expected.
Fangrui probably has a good opinion about this.

Zig (the compiler, but also the language name) can do this quite
nicely. I'm envious.
https://twitter.com/andy_kelley/status/1241409388532948992?lang=en
https://www.youtube.com/watch?v=pq1XqP4-qOo

But this is also somewhat orthogonal to the goal of "infer
CROSS_COMPILE (or really, --target=) from ARCH (or really, SRCARCH)" I
think.  It's still interesting for us all to discuss on-list though.

>
>
>
>
>
> [4] What is the best target if we hard-code it?
>
> Currently, we require the correct CROSS_COMPILE
> is provided by users.
>
> The target might impact the performance
> or the ABI.
> It was difficult for me to define
> which one is better than another.
>
> For example for ARCH=arm, which is better
> --target=arm-linux-gnueabi or
> --target=arm-lnux-gnueabihf or
> something we don't care about?

Yes, this is a case I was interested in.  I've used either
interchangeably without issue for years.  That's not to say we get the
same binary image with either.

I get the same .config for the defconfig target with either.

If I zero out KBUILD_BUILD_TIMESTAMP and the build number, I still get
different sha1sums.  Though that assumes clang, lld, and kbuild are
all deterministic, which I also haven't spent time to verify.
-- 
Thanks,
~Nick Desaulniers
