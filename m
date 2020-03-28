Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10447196395
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2020 05:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgC1Ezs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Mar 2020 00:55:48 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31899 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgC1Ezs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Mar 2020 00:55:48 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 02S4tYiq010510;
        Sat, 28 Mar 2020 13:55:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02S4tYiq010510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585371335;
        bh=Vr6JjIdjM3H8UNhqrhJl9jK2dxQSrEpknfNIO7vlN7s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BBEiC5fcVmE/H41VVOu4wxzfPb9v4xG3+dCAIe3jPf6Lzn3p5nUtjpkajvkmzQ8W+
         dQ/z7miXAsabFExy64aakJR2qEjpyT/A3at3G87olh9jC1SGxVRzOwoxFBjPVgeigh
         nElrhi+dehQ1N/z3LjbTJnvL5HYMKSbCVtp1pAu+dDn7w4X5sNBekpORpBjaaqMvZs
         C/QwzxTvwmCVPvzvw84rOOXY9ZnTjIZDSGihL8v0BvrZlFy20SVSHhlPmcJmlpNvfF
         uzr7XYdljVS3tR6xAS4OFyQT2mk4VbHLAzuqj3O5nEcZi2YDxtwZ8HZPEy6l4Jw5Kr
         4tZQerRwwttNA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id j128so7609226vsd.6;
        Fri, 27 Mar 2020 21:55:35 -0700 (PDT)
X-Gm-Message-State: AGi0PuYK1VHJE+aVhHgTZ1j9HLvQW+veO5DJTQVAfvN/Z8S7sbswFpXx
        On/k+gyuy85OppEgpLX1VPxBIEfOWHsADMPvGuo=
X-Google-Smtp-Source: APiQypIfGbk+RVpris4TdojW4xae0INw6Vt88nTerFV5ncplbw4a55rLBVF9zOO6ebfhJ0KTNIFtWH4VIUJPHsFJSj4=
X-Received: by 2002:a67:3201:: with SMTP id y1mr1879956vsy.54.1585371333995;
 Fri, 27 Mar 2020 21:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200327224246.GA12350@ubuntu-m2-xlarge-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Mar 2020 13:54:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
Message-ID: <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 28, 2020 at 7:42 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Sorry for the delay in review :(
>
> On Tue, Mar 17, 2020 at 02:55:15PM -0700, Nick Desaulniers wrote:
> > Prior to this patch, building the Linux kernel with Clang
> > looked like:
> >
> > $ make CC=clang
> >
> > or when cross compiling:
> >
> > $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
> >
> > which got very verbose and unwieldy when using all of LLVM's substitutes
> > for GNU binutils:
> >
> > $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang AS=clang \
> >   LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> >   OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \
> >   READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
> >   HOSTLD=ld.lld
> >
> > This change adds a new Makefile under scripts/ which will be included in
> > the top level Makefile AFTER CC and friends are set, in order to make
> > the use of LLVM utilities when building a Linux kernel more ergonomic.
> >
> > With this patch, the above now looks like:
> >
> > $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=y
> >
> > Then you can "opt out" of certain LLVM utilities explicitly:
> >
> > $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=y AS=as
> >
> > will instead invoke arm-linux-gnueabihf-as in place of clang for AS.
> >
> > Or when not cross compiling:
> >
> > $ make LLVM=y AS=as
> >
> > This would make it more verbose to opt into just one tool from LLVM, but
> > this patch doesn't actually break the old style; just leave off LLVM=y.
> > Also, LLVM=y CC=clang would wind up prefixing clang with $CROSS_COMPILE.
> > In that case, it's recommended to just drop LLVM=y and use the old
> > style. So LLVM=y can be thought of as default to LLVM with explicit opt
> > ins for GNU, vs the current case of default to GNU and opt in for LLVM.
> >
> > A key part of the design of this patch is to be minimally invasive to
> > the top level Makefile and not break existing workflows. We could get
> > more aggressive, but I'd prefer to save larger refactorings for another
> > day.
> >
> > Finally, some linux distributions package specific versions of LLVM
> > utilities with naming conventions that use the version as a suffix, ie.
> > clang-11.  In that case, you can use LLVM=<number> and that number will
> > be used as a suffix. Example:
> >
> > $ make LLVM=11
> >
> > will invoke clang-11, ld.lld-11, llvm-objcopy-11, etc.
> >
> > About the script:
> > The pattern used in the script is in the form:
> >
> > ifeq "$(origin $(CC))" "file"
> > $(CC) := $(clang)
> > else
> > override $(CC) := $(CROSS_COMPILE)$(CC)
> > endif
> >
> > "Metaprogramming" (eval) is used to template the above to make it more
> > concise for specifying all of the substitutions.
> >
> > The "origin" of a variable tracks whether a variable was explicitly set
> > via "command line", "environment", was defined earlier via Makefile
> > "file", was provided by "default", or was "undefined".
> >
> > Variable assignment in GNU Make has some special and complicated rules.
> >
> > If the variable was set earlier explicitly in the Makefile, we can
> > simply reassign a new value to it. If a variable was unspecified, then
> > earlier assignments were executed and change the origin to file.
> > Otherwise, the variable was explicitly specified.
> >
> > If a variable's "origin" was "command line" or "environment",
> > non-"override" assignments are not executed. The "override" directive
> > forces the assignment regardless of "origin".
> >
> > Some tips I found useful for debugging for future travelers:
> >
> > $(info $$origin of $$CC is $(origin CC))
> >
> > at the start of the new script for all of the variables can help you
> > understand "default" vs "undefined" variable origins.
> >
> > $(info $$CC is [${CC}])
> >
> > in the top level Makefile after including the new script, for all of the
> > variables can help you check that they're being set as expected.
> >
> > Link: https://www.gnu.org/software/make/manual/html_node/Eval-Function.html
> > Link: https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
> > Link: https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
> > Link: https://www.gnu.org/software/make/manual/html_node/Override-Directive.html
> > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Changes V1 -> V2:
> > * Rather than LLVM=1, use LLVM=y to enable all.
> > * LLVM=<anything other than y> becomes a suffix, LLVM_SUFFIX.
> > * strip has to be used on the LLVM_SUFFIX to avoid an extra whitespace.
> >
> >
> >  Makefile              |  4 ++++
> >  scripts/Makefile.llvm | 30 ++++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 scripts/Makefile.llvm
> >
> > diff --git a/Makefile b/Makefile
> > index 402f276da062..72ec9dfea15e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -475,6 +475,10 @@ KBUILD_LDFLAGS :=
> >  GCC_PLUGINS_CFLAGS :=
> >  CLANG_FLAGS :=
> >
> > +ifneq ($(LLVM),)
> > +include scripts/Makefile.llvm
> > +endif
> > +
> >  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
> >  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > diff --git a/scripts/Makefile.llvm b/scripts/Makefile.llvm
> > new file mode 100644
> > index 000000000000..0bab45a100a3
> > --- /dev/null
> > +++ b/scripts/Makefile.llvm
> > @@ -0,0 +1,30 @@
> > +LLVM_SUFFIX=
> > +
> > +ifneq ($(LLVM),y)
> > +LLVM_SUFFIX += -$(LLVM)
> > +endif
> > +
> > +define META_set =
> > +ifeq "$(origin $(1))" "file"
> > +$(1) := $(2)$(strip $(LLVM_SUFFIX))
> > +else
> > +override $(1) := $(CROSS_COMPILE)$($(1))
> > +endif
> > +endef
> > +
> > +$(eval $(call META_set,CC,clang))
> > +$(eval $(call META_set,AS,clang))
> > +$(eval $(call META_set,LD,ld.lld))
> > +$(eval $(call META_set,AR,llvm-ar))
> > +$(eval $(call META_set,NM,llvm-nm))
> > +$(eval $(call META_set,STRIP,llvm-strip))
> > +$(eval $(call META_set,OBJCOPY,llvm-objcopy))
> > +$(eval $(call META_set,OBJDUMP,llvm-objdump))
> > +$(eval $(call META_set,OBJSIZE,llvm-objsize))
> > +$(eval $(call META_set,READELF,llvm-readelf))
> > +$(eval $(call META_set,HOSTCC,clang))
> > +$(eval $(call META_set,HOSTCXX,clang++))
> > +$(eval $(call META_set,HOSTAR,llvm-ar))
> > +$(eval $(call META_set,HOSTLD,ld.lld))
> > +
> > +## TODO: HOSTAR, HOSTLD in tools/objtool/Makefile
> > --
> > 2.25.1.481.gfbce0eb801-goog
> >
>
> The use of override appears to break exporting the value to Kconfig,
> which causes Kconfig to endlessly loop at the --syncconfig step:
>
> $ make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LD=ld LLVM=y defconfig prepare
> ...
> Makefile: LD is riscv64-linux-gnu-ld
> *** Default configuration is based on 'defconfig'
> Kconfig: LD is ld
> #
> # No change to .config
> #
> Makefile: LD is riscv64-linux-gnu-ld
> Makefile: LD is riscv64-linux-gnu-ld
> scripts/kconfig/conf  --syncconfig Kconfig
> Kconfig: LD is ld
> Makefile: LD is riscv64-linux-gnu-ld
> auto.conf.cmd: LD is riscv64-linux-gnu-ld
> Makefile: LD is riscv64-linux-gnu-ld
> scripts/kconfig/conf  --syncconfig Kconfig
> Kconfig: LD is ld
> Makefile: LD is riscv64-linux-gnu-ld
> auto.conf.cmd: LD is riscv64-linux-gnu-ld
> Makefile: LD is riscv64-linux-gnu-ld
> scripts/kconfig/conf  --syncconfig Kconfig
> Kconfig: LD is ld
> ...





Kconfig is invoked from scripts/kconfig/Makefile
instead of the top Makefile.


Just add one more debug code

   $(info scripts/kconfig/Makefile: LD is $(LD))

into scripts/kconfig/Makefile.


It is "ld", not "riscv64-linux-gnu-ld".



The variable passed from the command line
is strong, and overrides the variable in sub-make as well.




> This endless loops happens because auto.conf.cmd is constantly being
> regenerated because Kconfig is not picking up the override value, as you
> can see from the debugging output above and auto.conf.cmd below:
>
> $ rg -A 2 "LD\)" include/config/auto.conf.cmd | cat
> ifneq "$(LD)" "ld"
> include/config/auto.conf: FORCE
> endif
>
> $(LD) evaluates to riscv64-linux-gnu-ld, which is not equal to ld, so
> include/config/auto.conf is regenerated, but env_write_dep in
> scripts/kconfig/preprocess.c just picks up the environment value, rather
> than the value that was overridden. This appears to be related to
> recursive make calls from what I can tell.
>
> $ cat Makefile
> override FOO := foo
> export FOO
>
> all:
>         $(info Makefile: $$(FOO) is $(FOO))
>         $(MAKE) -f Makefile.sub all
>
> $ cat Makefile.sub
> all:
>         $(info Makefile.sub: $$(FOO) is $(FOO))
>
> $ make -s
> Makefile: $(FOO) is foo
> Makefile.sub: $(FOO) is foo
>
> $ make -s FOO=bar
> Makefile: $(FOO) is foo
> Makefile.sub: $(FOO) is bar
>
> No idea if this is a bug in make or not, this seems subtle. Not really
> sure where to go from here, hopefully this is useful to you or Masahiro.


This is not a bug.

The variable passed from the command line
(which is inherited to sub-make as well)
is stronger than the environment variable.

"make -s FOO=BAR" is not equivalent to "FOO=BAR make -s".




-- 
Best Regards
Masahiro Yamada
