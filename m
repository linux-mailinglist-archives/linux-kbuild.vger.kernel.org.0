Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF8828DD11
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Oct 2020 11:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgJNJWS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Oct 2020 05:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbgJNJVy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Oct 2020 05:21:54 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671B5C0610D0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2020 15:37:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n9so643940pgt.8
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2020 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t+96sOhB1uhq2YjHHSuH7V+uCK/i5ddWXeBGT6qagJA=;
        b=d6OEbf/+V3UpxQdj2KMVlgOQcefOZdwa3t2IYeg6hJ+lKu3UXruJnPByJcdjka4MBR
         4SAdUkNgqPXDj4W0srOyR8s0lLtX9jrVvv0PCkGks13TUOW/kXDX1+1bZds9tEkeOmvM
         2It/ZbepycqUMq/DB66R6g1+UPLJEEF4lV8N6vhEI7yQ/pCURkPMf676QOZ8OLCMGOX3
         ZMFYznBYfJd8pEsQVQHk+Qm/3WXO+FNY0mxUsBY3+ZAo2CPE+iFBagq/vFVv3jAHyFAn
         mouDl5Sa1TlXuHRXscWk1l0p38nOax3UPYKSdeQSsUJRmh4em6/PrjM1mx1+AuIsBZvb
         SWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t+96sOhB1uhq2YjHHSuH7V+uCK/i5ddWXeBGT6qagJA=;
        b=Ko0p+ofCoTG76Sz63x+SLAAjboLPVt/8hv4ojDE4XEarBf7OXi0icPINFx83m583N/
         4B9SseWkmJtP9ClNgp7r2xXYeI1podt5rPt40yotvZ2SIh1iOLqP1vMJ5AnjONX4oCsa
         qO64HN3XwGLPcDECbWUP3L6BGdU3REwule8bBLy0AAiszrM4i7QZoKP4DqH2X+qH1ple
         YL3hibquwfqboMdSrwnFUihM+iZWLMqWX0CRqAtRPjFl1raIJtLb44XbbabVSPdO5A8J
         C/9hYfk115cptWa8mQrNgcoDGeEOTdgHGA6epD3nswJ5JoQqYVkRyHNX89/hf5Yox7vl
         OcaQ==
X-Gm-Message-State: AOAM531QW5xfxYXp5z6PY3NpGXwvLdscxhbpTEXex9pEyI8bjI1xdr6n
        7pC/4OSMkMNo5U5FpJCnBAtxD0qQYQxZjRmSMagAig==
X-Google-Smtp-Source: ABdhPJyB0FBPN6kmOAg+J/VCEh6dU5+yk6DK5SN+eaoylYe+N7AYyL/Y2UtPVKzPBoIPLNRcoa/aaBtLeEfdN2T7dSQ=
X-Received: by 2002:a63:1f03:: with SMTP id f3mr1305731pgf.381.1602628652646;
 Tue, 13 Oct 2020 15:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201013033947.2257501-1-natechancellor@gmail.com>
In-Reply-To: <20201013033947.2257501-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 13 Oct 2020 15:37:21 -0700
Message-ID: <CAKwvOdm72u3J-3stdxtQhq5LKy=2u9HjV=z0n55pi16nq6VX2w@mail.gmail.com>
Subject: Re: [PATCH] arm64: vdso32: Allow ld.lld to properly link the VDSO
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 12, 2020 at 8:41 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
> using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
> Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
> 8384/1: VDSO: force use of BFD linker").
>
> Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
> link VDSO") changed that Makefile to use $(LD) directly instead of
> through $(CC), which matches how the rest of the kernel operates. Since
> then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
> which has shown no problems so far.
>
> Allow ld.lld to link this vDSO as we do the regular arm vDSO. To do
> this, we need to do a few things:
>
> * Add a LD_COMPAT variable, which defaults to $(CROSS_COMPILE_COMPAT)ld
>   with gcc and $(LD) if LLVM is 1, which will be ld.lld, or
>   $(CROSS_COMPILE_COMPAT)ld if not, which matches the logic of the main
>   Makefile. It is overrideable for further customization and avoiding
>   breakage.
>
> * Eliminate cc32-ldoption, which matches commit 055efab3120b ("kbuild:
>   drop support for cc-ldoption").
>
> With those, we can use $(LD_COMPAT) in cmd_ldvdso and change the flags
> from compiler linker flags to linker flags directly. We eliminate
> -mfloat-abi=soft because it is not handled by the linker.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1033
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch and summary of related changes! This is
immediately useful for Android.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> NOTE: This patch is currently based on the kbuild tree due to the
> --build-id -> --build-id=sha1 change that Bill did. If the arm64
> maintainers would prefer to take this patch, I can rebase it (althought
> presumably this won't hit mainline until at least 5.11 so it can
> probably just stay as is for now).
>
>  arch/arm64/kernel/vdso32/Makefile | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 7f96a1a9f68c..1cf00c58805d 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -22,16 +22,21 @@ endif
>
>  CC_COMPAT ?= $(CC)
>  CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
> +
> +ifeq ($(LLVM),1)
> +LD_COMPAT ?= $(LD)
> +else
> +LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
> +endif
>  else
>  CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
> +LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
>  endif
>
>  cc32-option = $(call try-run,\
>          $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
>  cc32-disable-warning = $(call try-run,\
>         $(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> -cc32-ldoption = $(call try-run,\
> -        $(CC_COMPAT) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
>  cc32-as-instr = $(call try-run,\
>         printf "%b\n" "$(1)" | $(CC_COMPAT) $(VDSO_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
>
> @@ -122,14 +127,10 @@ dmbinstr := $(call cc32-as-instr,dmb ishld,-DCONFIG_AS_DMB_ISHLD=1)
>  VDSO_CFLAGS += $(dmbinstr)
>  VDSO_AFLAGS += $(dmbinstr)
>
> -VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
>  # From arm vDSO Makefile
> -VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
> -VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
> -VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
> -VDSO_LDFLAGS += -Wl,--hash-style=sysv
> -VDSO_LDFLAGS += -Wl,--build-id=sha1
> -VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
> +VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
> +VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
> +VDSO_LDFLAGS += -nostdlib -shared --hash-style=sysv --build-id=sha1
>
>
>  # Borrow vdsomunge.c from the arm vDSO
> @@ -189,8 +190,8 @@ quiet_cmd_vdsold_and_vdso_check = LD32    $@
>        cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)
>
>  quiet_cmd_vdsold = LD32    $@
> -      cmd_vdsold = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_LDFLAGS) \
> -                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
> +      cmd_vdsold = $(LD_COMPAT) $(VDSO_LDFLAGS) \
> +                   -T $(filter %.lds,$^) $(filter %.o,$^) -o $@
>  quiet_cmd_vdsocc = CC32    $@
>        cmd_vdsocc = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_CFLAGS) -c -o $@ $<
>  quiet_cmd_vdsocc_gettimeofday = CC32    $@
>
> base-commit: 172aad81a882443eefe1bd860c4eddc81b14dd5b
> --
> 2.29.0.rc0
>


-- 
Thanks,
~Nick Desaulniers
