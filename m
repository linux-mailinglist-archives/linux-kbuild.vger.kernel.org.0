Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270193C1A19
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 21:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhGHTuv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 15:50:51 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:29396 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHTuv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 15:50:51 -0400
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 168JlfDL014463;
        Fri, 9 Jul 2021 04:47:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 168JlfDL014463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625773662;
        bh=arlNPwHm9EiAFE7BPhsaCFToT1tPGHdwTZ8vMx/i5S8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bYBiYtPWTg5hgtfZinXR9XJpzwVPZkdPAkWTKY/A+Huw+g6Z8+c+3lsVBQhYo9RMG
         JMHrNwkYLsH90bEQQfwUVT9U8rq7ePuqZVuleXClhjDINzRq5Oha3x2NIyiuqn4/Hh
         /o0bMWc1H59gOMqXihtsnrNmMniTBjA8fuiZ/GGl1xqehb6Rrv5HVfvzgF/evSuZu0
         R6ZgDLwSjP/pUZkEQJAT/F/VOl0Qp45FvgrGeU0euYwqGgSMgJtf95eJbeJ2ZteNS6
         cSNSDLjz4LmUmKmA8H7CqfZz+l16E7Sb2etDrjKiHdW1Z/yONarMH2VqvYrVu8RfpJ
         gCEGOfW03x1eQ==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id f11so3741265plg.0;
        Thu, 08 Jul 2021 12:47:41 -0700 (PDT)
X-Gm-Message-State: AOAM533LuMp136Es33/bzBSyxHmd2uImVMZErIkVtsE4j83Ot6zQfVYX
        vzVQurjmlZT9LphS4xXY14XXwCJaq663/AlhMa4=
X-Google-Smtp-Source: ABdhPJwzt5J5i7YpexFehsGOlhT3XS+mWBXvmNGD1qoeWiVnuRaFYQHjZa5oSLb6rCt7reIkb84+PoK4ns9I3tdLRWY=
X-Received: by 2002:a17:902:8ec7:b029:11b:acb4:ac43 with SMTP id
 x7-20020a1709028ec7b029011bacb4ac43mr26966532plo.1.1625773660818; Thu, 08 Jul
 2021 12:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <20210707224310.1403944-3-ndesaulniers@google.com> <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
 <CAKwvOdmufESjYQVZmaPdTXgZO5Ogz+OppVSUGAn6BZaC+YZhbw@mail.gmail.com>
In-Reply-To: <CAKwvOdmufESjYQVZmaPdTXgZO5Ogz+OppVSUGAn6BZaC+YZhbw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 9 Jul 2021 04:47:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARP4aXgQ0d0JJWjbvyYD7uB3LUB0qQ2YvtMhKcVW588Pg@mail.gmail.com>
Message-ID: <CAK7LNARP4aXgQ0d0JJWjbvyYD7uB3LUB0qQ2YvtMhKcVW588Pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Fangrui Song <maskray@google.com>, Miguel Ojeda <ojeda@kernel.org>,
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

On Fri, Jul 9, 2021 at 4:02 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Thu, Jul 8, 2021 at 3:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Jul 8, 2021 at 7:43 AM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > > We get constant feedback that the command line invocation of make is too
> > > long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> > > target triple, or is an absolute path outside of $PATH, but it's mostly
> > > redundant for a given ARCH.
> > >
> > > If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> > > KBUILD_CFLAGS, and KBUILD_AFLAGS based on $ARCH.
> > >
> > > Previously, we'd cross compile via:
> > > $ ARCH=arm64 CROSS_COMPILE=aarch64-linxu-gnu make LLVM=1 LLVM_IAS=1
> > > Now:
> > > $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> > > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Changes RFC -> v1:
> > > * Rebase onto linux-kbuild/for-next
> > > * Keep full target triples since missing the gnueabi suffix messes up
> > >   32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
> > >   drop references to arm64.
> > > * Flush out TODOS.
> > > * Add note about -EL/-EB, -m32/-m64.
> > > * Add note to Documentation/.
> > >
> > >  Documentation/kbuild/llvm.rst |  5 +++++
> > >  scripts/Makefile.clang        | 38 +++++++++++++++++++++++++++++++++--
> > >  2 files changed, 41 insertions(+), 2 deletions(-)
> >
> >
> >
> >
> >
> >
> >
> >
> > When I was considering a similar idea, my plan was
> > to implement this in Kconfig instead of in Makefile
> > because that will pass the compiler information
> > in one direction (only from Kconfig to Kbuild), but
> > that is not so important. We can change it later
> > if needed.
> >
> > I did not complete it because I was investigating
> > some issues (especially [3] below), but maybe
> > that is something we don't care about.
> >
> > Can you address [2] below at least?
>
> Sure!
>
> > If we do not have any concern, I can merge it.
> > It is likely so because people are only discussing
> > "We want to omit omit CROSS_COMPILE".
> >
> >
> >
> >
> >
> >
> >
> > [1] explicit target triple for native builds
> >
> > The default target of my distro clang
> > is x86_64-pc-linux-gnu.
> >
> > $ clang --version
> > Ubuntu clang version 11.0.0-2
> > Target: x86_64-pc-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/bin
> >
> > So, previously, the kernel was built with
> > implied --target=x86_64-pc-linux-gnu.
> >
> >
> > With this patch, --target=x86_64-linux-gnu will be
> > explicitly specified.
>
> Correct. We've been doing this for x86 builds of Android kernels for a
> while without issue.
>
> I can add this note to the commit message:
> ```
> For native builds (not involving cross compilation) we now explicitly
> specify a target triple
> rather than rely on the implicit host triple.

Sounds good.


> ```
> The only downside I can think of now is that we've encountered E2BIG
> for excessively long command line arguments in the past (mostly for
> out of tree drivers in Android).  I'm having trouble imagining how the
> implicit host triple could differ in a way from these explicit ones
> that would break native compilation.  Then again, someone did just
> submit patches for building Linux on BSD.
>
> If we don't want to do that, perhaps we could check `cross_compiling`.
> Why did you make that variable lowercase in
> commit f02aa48dde8b ("kconfig: use /boot/config-* etc. as
> DEFCONFIG_LIST only for native build")?
> Because the "origin" is not the environment?

Yes, something like that.
I'd like to use upper cases for user interface.

I think using lower cases is OK for
internal variables, but the policy
may not be consistent.







> > The same applies to native-builds of other architectures.
> > For example, when a user builds the arm64 kernel on
> > an arm64 server, --target=aarch64-linux-gnu is
> > explicitly forced.
> >
> > I guess, this is a good direction because the produced
> > code will be more deterministic, irrespective of the
> > Clang's configuration.
> >
> >
> >
> > [2] 32/64-bit configuration is toggled in Kconfig time.
> >
> > Initially, you submitted only arm64. Maybe, it was intentional
> > since arm64 is the simplest case.
> >
> > In the kernel tree, arch/arm and arch/arm64 are very special
> > cases where 32-bit and 64-bit are separated by directory.
> >
> > Some of the other architectures are bi-arch, and
> > 32-bit/64-bit is specified by CONFIG_64BIT in Kconfig time.
> >
> > When Makefiles are being parsed, we actually do not know
> > whether the user is planning to configure the kernel
> > for 32-bit or 64-bit because CONFIG_64BIT is not
> > specified at this point.
> >
> > ARCH=x86 + CONFIG_64BIT=y
> > will build the x86_64 kernel, and
> > ARCH=x86 + CONFIG_64BIT=n
> > will build the i386 kernel.
> >
> >
> > Then, you may wonder
> >
> >   else ifeq ($(ARCH),x86)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
> >
> > ... works?
> >
> > Yes, it does fortunately.
> >
> > -m32/-m64 takes precedence over the
> > {x86_64,i386} part of the target triple.
> >
> > As far as I tested,
> >
> >       clang --target=x86_64-linux-gnu -m32
> >
> > produced i386 code.
> >
> > Interestingly,
> >
> >     clang --target=i386-linux-gnu  -m64
> >
> > produced x86_64 code.
>
> Correct. -m32/-m64 and -LE/-BE refine the target triple that the
> driver builds up.
>
> > We must rely on this behavior of Clang because
> > --target (which is contained in CLANG_FLAGS)
> > must be specified before the Kconfig time.
> > Then, a user can toggle CONFIG_64BIT any time
> > from menuconfig etc.
>
> Correct. So we can't quite move all clang flags into one Makefile
> under scripts/ if they rely on Kconfig being run first. This new
> makefile is a "pre-kconfig" set of flags.
>
> > With this in mind, using $(ARCH) as if-else
> > switches is pointless.
> > $(SRCARCH) is the only meaningful input.
> >
> >
> >   else ifeq ($(ARCH),i386)
> >   CLANG_FLAGS    += --target=i686-linux-gnu
> >   else ifeq ($(ARCH),x86)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
> >   else ifeq ($(ARCH),x86_64)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
> >
> > should be replaced with:
> >
> >   else ifeq ($(SRCARCH),x86_64)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
>
> Sure, it looks like this would simplify the i386 vs x86_64 handling,
> and the use of SRCARCH does seem more prevalent throughout the
> codebase. I will fix in v2.
>
> > Some architectures are not only bi-arch, but also bi-endian.
> >
> >
> > You hardcoded 64bit little endian for ppc:
> >
> >    else ifeq ($(ARCH),powerpc)
> >    CLANG_FLAGS    += --target=powerpc64le-linux-gnu
> >
> >
> > But, we must rely on the fact that
> >
> >    clang  --target=powerpc64le-linux-gnu -mbig-endian -m32
> >
> > produces big-endian 32-bit code.
> >
> > This makes the "64le" part meaningless.
> >
> >
> > This should be noted. Otherwise it is difficult
>
> It is noted; in the top part of the newly added make file.
> ```
>   1 # Individual arch/{arch}/Makfiles should use -EL/-EB to set
> intended endianness
>   2 # and -m32/-m64 to set word size based on Kconfigs instead of
> relying on the
>   3 # target triple.
> ```
> Is there somewhere/somehow else you'd like me to note that?

Ah, you already noted it in the new Makefile.
Sorry, I missed it.

Then, this is fine.




>
> > to understand why --target=x86_64-linux-gnu works fine
> > with building the i386 kernel.
> >
> >
> >
> > [3] User-space compilation
> >
> > This does not matter to the kernel itself, but
> > Kbuild compiles some userspace programs for
> > the target architecture.
> > See the samples/ directory for example.
> >
> > Another example is net/bpfilter/Makefile, which
> > embeds the user mode helper when
> > CONFIG_BPFILTER_UMH=y.
> >
> > For this purpose, Kconfig checks if $(CC) is
> > capable of linking the userspace.
> > (CONFIG_CC_CAN_LINK).
> >
> > When cross-building with Clang, I cannot see
> > CONFIG_CC_CAN_LINK set.
>
> Yes, that is a known issue.
> https://github.com/ClangBuiltLinux/linux/issues/1290
>
> >
> > If we care about CONFIG_CC_CAN_LINK, probably,
> > --sysroot or something should be set according to:
> >
> > https://clang.llvm.org/docs/CrossCompilation.html
> >
> > This is an existing issue, but I have no time
> > for looking into this.
> >
> > On debian systems, sysroot for cross-compilation
> > are located in /usr/aarch64-linux-gnu,
> > /usr/arm-linux-gnueabi, /usr/arm-linux-gnueabihf,
> > /usr/i686-linux-gnu/ etc. but I do not know if it
> > is the same across distros.
>
> Right. If I remember the glibc/binutils/gcc bootstrap dance, I thought
> gcc was configured with a known path to a particular version of glibc.
> So a cross toolchain knew where to look for its cross libc.
>
> Clang doesn't have such configure time step; it can cross compile
> easily with one binary, but cross linking a working executable is
> still a PITA due to not knowing which cross libc to link against.  I'm
> not sure whether we need to improve Clang's logic when cross compiling
> to look in "sane default" paths for a cross libc, or if we should just
> add some flag when cross compiling with clang in Kbuild (such as
> --sysroot) in order for CONFIG_CC_CAN_LINK to work as expected.
> Fangrui probably has a good opinion about this.
>
> Zig (the compiler, but also the language name) can do this quite
> nicely. I'm envious.
> https://twitter.com/andy_kelley/status/1241409388532948992?lang=en
> https://www.youtube.com/watch?v=pq1XqP4-qOo
>
> But this is also somewhat orthogonal to the goal of "infer
> CROSS_COMPILE (or really, --target=) from ARCH (or really, SRCARCH)" I
> think.  It's still interesting for us all to discuss on-list though.
>
> >
> >
> >
> >
> >
> > [4] What is the best target if we hard-code it?
> >
> > Currently, we require the correct CROSS_COMPILE
> > is provided by users.
> >
> > The target might impact the performance
> > or the ABI.
> > It was difficult for me to define
> > which one is better than another.
> >
> > For example for ARCH=arm, which is better
> > --target=arm-linux-gnueabi or
> > --target=arm-lnux-gnueabihf or
> > something we don't care about?
>
> Yes, this is a case I was interested in.  I've used either
> interchangeably without issue for years.  That's not to say we get the
> same binary image with either.
>
> I get the same .config for the defconfig target with either.
>
> If I zero out KBUILD_BUILD_TIMESTAMP and the build number, I still get
> different sha1sums.  Though that assumes clang, lld, and kbuild are
> all deterministic, which I also haven't spent time to verify.
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdmufESjYQVZmaPdTXgZO5Ogz%2BOppVSUGAn6BZaC%2BYZhbw%40mail.gmail.com.



--
Best Regards
Masahiro Yamada
