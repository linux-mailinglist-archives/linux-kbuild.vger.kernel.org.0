Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB3219615D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2020 23:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0Wmu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Mar 2020 18:42:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33304 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgC0Wmu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Mar 2020 18:42:50 -0400
Received: by mail-ot1-f65.google.com with SMTP id 22so11551131otf.0;
        Fri, 27 Mar 2020 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b2K5AFjmsX/bgW6eWjt5DFeA+GmCKVXYTCWAUaaLArQ=;
        b=Qo7acoP8YAIjNoDvUoQ98+LNisRozgc2w5dAsTloR/sbgxpaMNxZfutPkkI+7mWXVn
         NGaJNbBzdZKMKe6+I3OGfT+AvV5prpOiC9WoPvdXg0LcCaIUknmP5mE5Zhy+F5kDllPI
         O/jLBdLrlpWuAyhGLg4iLEBwEf4z8o8lSfpCyX6hS8uITEAdPEkBmbmWSLTBGH+zsupq
         PREPJ56GQnM+hlVR9dwAaFAaKq4zDJRDVfnuAFV/9q9kk0XfG6WF6b4MCmt6m89tcczO
         0e10sMqNQGJJGPlrdRpED+mogiUUnfAfeeiktEbhRiI8XnLWOxdLj3iB6CmSxzsnJK54
         vBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b2K5AFjmsX/bgW6eWjt5DFeA+GmCKVXYTCWAUaaLArQ=;
        b=JyXVPXf1z3V4PnKhZoi5KpQDBJTXqaNEIHVOcHkI3xi1lOM7hLpEV7bzz591L4o3S1
         k6UxSwKpZ1veXGKmEmBcrTWdvPIKgafkwKY1qDJxIZ5UjTXONMDb7RRayUUiGrud+N3w
         7nOk8/UYXNZiaO07McF/XVbeQoBxj+JmVoDdXzGjGjAIut7Vw3gnSmLJFENt623rzXFu
         lSlF6OjB+rbBdfFNhaPU/p5po20J+7hKlp6wcNlMkRogi51Ur0gs1PX9ddfpyMaf58AB
         jD8qUrJl97EJxxqx77FwRK3XgMKTsL3BovJEa4dbAj/sxFMcxNPxce3fuoVquRta1cyH
         knXA==
X-Gm-Message-State: ANhLgQ3ZeJGA9ZRUFigmRfDcrsQ4enPbX0KUPpMl0i6mtEpkvNVGuGRk
        iKKgOcKNK4EQxA8wvqetbbU=
X-Google-Smtp-Source: ADFU+vtukz2LmvX3IoICm3cgCBDA2Xzp45uxqrTH1HynXo6uBaYtb1l2E25GScwMV1h428xcvS4BkA==
X-Received: by 2002:a05:6830:158e:: with SMTP id i14mr801986otr.103.1585348968691;
        Fri, 27 Mar 2020 15:42:48 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id z12sm2253435otk.24.2020.03.27.15.42.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 15:42:48 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:42:46 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     masahiroy@kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Patil <sspatil@google.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Message-ID: <20200327224246.GA12350@ubuntu-m2-xlarge-x86>
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86>
 <20200317215515.226917-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317215515.226917-1-ndesaulniers@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Sorry for the delay in review :(

On Tue, Mar 17, 2020 at 02:55:15PM -0700, Nick Desaulniers wrote:
> Prior to this patch, building the Linux kernel with Clang
> looked like:
> 
> $ make CC=clang
> 
> or when cross compiling:
> 
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
> 
> which got very verbose and unwieldy when using all of LLVM's substitutes
> for GNU binutils:
> 
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang AS=clang \
>   LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
>   OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \
>   READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
>   HOSTLD=ld.lld
> 
> This change adds a new Makefile under scripts/ which will be included in
> the top level Makefile AFTER CC and friends are set, in order to make
> the use of LLVM utilities when building a Linux kernel more ergonomic.
> 
> With this patch, the above now looks like:
> 
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=y
> 
> Then you can "opt out" of certain LLVM utilities explicitly:
> 
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=y AS=as
> 
> will instead invoke arm-linux-gnueabihf-as in place of clang for AS.
> 
> Or when not cross compiling:
> 
> $ make LLVM=y AS=as
> 
> This would make it more verbose to opt into just one tool from LLVM, but
> this patch doesn't actually break the old style; just leave off LLVM=y.
> Also, LLVM=y CC=clang would wind up prefixing clang with $CROSS_COMPILE.
> In that case, it's recommended to just drop LLVM=y and use the old
> style. So LLVM=y can be thought of as default to LLVM with explicit opt
> ins for GNU, vs the current case of default to GNU and opt in for LLVM.
> 
> A key part of the design of this patch is to be minimally invasive to
> the top level Makefile and not break existing workflows. We could get
> more aggressive, but I'd prefer to save larger refactorings for another
> day.
> 
> Finally, some linux distributions package specific versions of LLVM
> utilities with naming conventions that use the version as a suffix, ie.
> clang-11.  In that case, you can use LLVM=<number> and that number will
> be used as a suffix. Example:
> 
> $ make LLVM=11
> 
> will invoke clang-11, ld.lld-11, llvm-objcopy-11, etc.
> 
> About the script:
> The pattern used in the script is in the form:
> 
> ifeq "$(origin $(CC))" "file"
> $(CC) := $(clang)
> else
> override $(CC) := $(CROSS_COMPILE)$(CC)
> endif
> 
> "Metaprogramming" (eval) is used to template the above to make it more
> concise for specifying all of the substitutions.
> 
> The "origin" of a variable tracks whether a variable was explicitly set
> via "command line", "environment", was defined earlier via Makefile
> "file", was provided by "default", or was "undefined".
> 
> Variable assignment in GNU Make has some special and complicated rules.
> 
> If the variable was set earlier explicitly in the Makefile, we can
> simply reassign a new value to it. If a variable was unspecified, then
> earlier assignments were executed and change the origin to file.
> Otherwise, the variable was explicitly specified.
> 
> If a variable's "origin" was "command line" or "environment",
> non-"override" assignments are not executed. The "override" directive
> forces the assignment regardless of "origin".
> 
> Some tips I found useful for debugging for future travelers:
> 
> $(info $$origin of $$CC is $(origin CC))
> 
> at the start of the new script for all of the variables can help you
> understand "default" vs "undefined" variable origins.
> 
> $(info $$CC is [${CC}])
> 
> in the top level Makefile after including the new script, for all of the
> variables can help you check that they're being set as expected.
> 
> Link: https://www.gnu.org/software/make/manual/html_node/Eval-Function.html
> Link: https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
> Link: https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
> Link: https://www.gnu.org/software/make/manual/html_node/Override-Directive.html
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * Rather than LLVM=1, use LLVM=y to enable all.
> * LLVM=<anything other than y> becomes a suffix, LLVM_SUFFIX.
> * strip has to be used on the LLVM_SUFFIX to avoid an extra whitespace.
> 
> 
>  Makefile              |  4 ++++
>  scripts/Makefile.llvm | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 scripts/Makefile.llvm
> 
> diff --git a/Makefile b/Makefile
> index 402f276da062..72ec9dfea15e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -475,6 +475,10 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>  CLANG_FLAGS :=
>  
> +ifneq ($(LLVM),)
> +include scripts/Makefile.llvm
> +endif
> +
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/scripts/Makefile.llvm b/scripts/Makefile.llvm
> new file mode 100644
> index 000000000000..0bab45a100a3
> --- /dev/null
> +++ b/scripts/Makefile.llvm
> @@ -0,0 +1,30 @@
> +LLVM_SUFFIX=
> +
> +ifneq ($(LLVM),y)
> +LLVM_SUFFIX += -$(LLVM)
> +endif
> +
> +define META_set =
> +ifeq "$(origin $(1))" "file"
> +$(1) := $(2)$(strip $(LLVM_SUFFIX))
> +else
> +override $(1) := $(CROSS_COMPILE)$($(1))
> +endif
> +endef
> +
> +$(eval $(call META_set,CC,clang))
> +$(eval $(call META_set,AS,clang))
> +$(eval $(call META_set,LD,ld.lld))
> +$(eval $(call META_set,AR,llvm-ar))
> +$(eval $(call META_set,NM,llvm-nm))
> +$(eval $(call META_set,STRIP,llvm-strip))
> +$(eval $(call META_set,OBJCOPY,llvm-objcopy))
> +$(eval $(call META_set,OBJDUMP,llvm-objdump))
> +$(eval $(call META_set,OBJSIZE,llvm-objsize))
> +$(eval $(call META_set,READELF,llvm-readelf))
> +$(eval $(call META_set,HOSTCC,clang))
> +$(eval $(call META_set,HOSTCXX,clang++))
> +$(eval $(call META_set,HOSTAR,llvm-ar))
> +$(eval $(call META_set,HOSTLD,ld.lld))
> +
> +## TODO: HOSTAR, HOSTLD in tools/objtool/Makefile
> -- 
> 2.25.1.481.gfbce0eb801-goog
> 

The use of override appears to break exporting the value to Kconfig,
which causes Kconfig to endlessly loop at the --syncconfig step:

$ make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LD=ld LLVM=y defconfig prepare
...
Makefile: LD is riscv64-linux-gnu-ld
*** Default configuration is based on 'defconfig'
Kconfig: LD is ld
#
# No change to .config
#
Makefile: LD is riscv64-linux-gnu-ld
Makefile: LD is riscv64-linux-gnu-ld
scripts/kconfig/conf  --syncconfig Kconfig
Kconfig: LD is ld
Makefile: LD is riscv64-linux-gnu-ld
auto.conf.cmd: LD is riscv64-linux-gnu-ld
Makefile: LD is riscv64-linux-gnu-ld
scripts/kconfig/conf  --syncconfig Kconfig
Kconfig: LD is ld
Makefile: LD is riscv64-linux-gnu-ld
auto.conf.cmd: LD is riscv64-linux-gnu-ld
Makefile: LD is riscv64-linux-gnu-ld
scripts/kconfig/conf  --syncconfig Kconfig
Kconfig: LD is ld
...

This endless loops happens because auto.conf.cmd is constantly being
regenerated because Kconfig is not picking up the override value, as you
can see from the debugging output above and auto.conf.cmd below:

$ rg -A 2 "LD\)" include/config/auto.conf.cmd | cat
ifneq "$(LD)" "ld"
include/config/auto.conf: FORCE
endif

$(LD) evaluates to riscv64-linux-gnu-ld, which is not equal to ld, so
include/config/auto.conf is regenerated, but env_write_dep in
scripts/kconfig/preprocess.c just picks up the environment value, rather
than the value that was overridden. This appears to be related to
recursive make calls from what I can tell.

$ cat Makefile
override FOO := foo
export FOO

all:
	$(info Makefile: $$(FOO) is $(FOO))
	$(MAKE) -f Makefile.sub all

$ cat Makefile.sub
all:
	$(info Makefile.sub: $$(FOO) is $(FOO))

$ make -s
Makefile: $(FOO) is foo
Makefile.sub: $(FOO) is foo

$ make -s FOO=bar
Makefile: $(FOO) is foo
Makefile.sub: $(FOO) is bar

No idea if this is a bug in make or not, this seems subtle. Not really
sure where to go from here, hopefully this is useful to you or Masahiro.

You will only notice this with variables that impact Kconfig, which
is why you never noticed with AS=as. See include/config/auto.conf.cmd
for the full list (CC, LD, NM, OBJCOPY, HOSTCC, and HOSTCXX are the ones
I see).

Debug patch if you want to play around with this.

Cheers,
Nathan

================================

diff --git a/Makefile b/Makefile
index acd8022ddb52..81cbb940e035 100644
--- a/Makefile
+++ b/Makefile
@@ -479,6 +479,8 @@ ifneq ($(LLVM),)
 include scripts/Makefile.llvm
 endif
 
+$(info Makefile: LD is $(LD))
+
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 8074f14d9d0d..43a852e0ee93 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -57,3 +57,5 @@ gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
 cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
+
+$(info,Kconfig: LD is $(LD))
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 0243086fb168..fd828efc85fc 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -93,6 +93,7 @@ void env_write_dep(FILE *f, const char *autoconfig_name)
 
 	list_for_each_entry_safe(e, tmp, &env_list, node) {
 		fprintf(f, "ifneq \"$(%s)\" \"%s\"\n", e->name, e->value);
+		fprintf(f, "$(info auto.conf.cmd: %s is $(%s))\n", e->name, e->name);
 		fprintf(f, "%s: FORCE\n", autoconfig_name);
 		fprintf(f, "endif\n");
 		env_del(e);
