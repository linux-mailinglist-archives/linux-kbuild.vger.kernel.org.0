Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7782E195F31
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2020 20:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0TvY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Mar 2020 15:51:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39151 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgC0TvY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Mar 2020 15:51:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id b22so5072378pgb.6
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2020 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIwsqk5ETWei+wO/g9OP6mg14rZv2Sy0ZTEE4p3E5LA=;
        b=RDtBwgbh21rFcjfZsOUJIiOtRexPVS8cP8uSvGeivBRXnY4VnLA3g1MHeH5/9T/XES
         FeRmCskWGKGh0fQ7yVM0FPOAMyEdIjFli4ug8oy7RcezblrxwhDoaoFfMEYCABPvZzpp
         5+qDnpEtCvTvdOhVSEJJz0Y/L+j+vc8udRewEi+eWT8t1Vwy9WktakW03tiglJ7hTDj1
         RZXGoQ4hVyGLhUH0J8/J/Zs1ZhEAzc6lIJJdxkNIa0Xb7weMmoTZn1CYovMWZcjqtarG
         4wL41bjZT9v6O8T+BbIiCtdVVLT9Cx2PuqAT2asQj50WV5zAcICSrjRvTy6EpYmTsNrK
         xN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIwsqk5ETWei+wO/g9OP6mg14rZv2Sy0ZTEE4p3E5LA=;
        b=Jz2IAjESS5lhG7kYxDV79UnwaGrHpLwZiuvo7aJNsciboxtVbcqmyH1Jltb1YSP5gf
         zMjQwprw+i+mj8A6p8SUG6DH6+7jPUe51j9dFm8CPgnkmAFGCMLTWZFqvAkAhw0vvPz6
         EI54XONLb2W6XgVebBHaJvFahA4qOZlif9WxuNZv5A+TWsQLUF351nQQiFZi/IRUEUZo
         GGoqVY5zOOkaD6xGBN1/GdsBy+h33jRSyb2+dMaPU9DUTqJF1igUtXBfKE9KWHO/LyV9
         fRL4c7kVr4Ru14N0r/6CXiatwbzRbOnqvthhTw0oG0rxi/82btb905QbK54RIzUJaZnI
         oBKw==
X-Gm-Message-State: ANhLgQ03PiIURq+ASnB6MOdCae6fkcBgjrEm2TSMxpIaMjCXT5nsY4H+
        JIH0PjpnN+o/mFCOxjoxyFRkK4whyIHxT63+9tQkgQ==
X-Google-Smtp-Source: ADFU+vuT93SbkDj0p9unFr5Rs5UuKMpKjBBxKNfZIk6oC+p91ttTtTWsKR0DxIGIOx09+KKHj4uqyhS8cAI/jve6trg=
X-Received: by 2002:aa7:87ca:: with SMTP id i10mr830739pfo.169.1585338682518;
 Fri, 27 Mar 2020 12:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
In-Reply-To: <20200317215515.226917-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 27 Mar 2020 12:51:08 -0700
Message-ID: <CAKwvOdkhxvtK0_WJ-K4XNwN=fu=PxntEetL_umXdepwR-Ocd1g@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro and Nathan,
I get daily reminders that `make CC=clang LD=ld.lld NM=llvm-nm ...`
sucks. I always prioritize code reviews for you, can you please carve
out time to review+test+provide feedback for me?

On Tue, Mar 17, 2020 at 2:55 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
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


-- 
Thanks,
~Nick Desaulniers
