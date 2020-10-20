Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C7F293298
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Oct 2020 03:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389785AbgJTBHS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Oct 2020 21:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgJTBHS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Oct 2020 21:07:18 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AD7C0613CE;
        Mon, 19 Oct 2020 18:07:18 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id h21so432577iob.10;
        Mon, 19 Oct 2020 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D/Mefsj+3OKX02UJFagduiRTFW1Pif4p9TwZBeovz3o=;
        b=I8jXoFBf0BPu/4YlJ7My47K79QVZsYMn5BEFG2voVpotjqOgHJFmlNIBx1MWjU9gGu
         EwmXWprxmBkQdNRuFmmH7Mt23bp9aFvinZC/Qp+XjQ6MMxqpSzQR8ZgNo/c0/SVShr65
         G47EnZ6t6WNugH9jJ/gA7XgG/iV4GGon5A1o0BdlPPzbPBfSmDMwzEyG4a4BZtgPpssE
         eKrAUc1GEIUXqhYgXAzgY5Siw1tKrM0SsN8iP5LwIA1GCsYxrDob/gHenMRK7CwE43Uq
         iSrKLSpYFOWtQVIF66tCKNo5SgMB94nzGtRTIcf8RQx2nThbiiUbfyJsoLLPmyg0kvgA
         q0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D/Mefsj+3OKX02UJFagduiRTFW1Pif4p9TwZBeovz3o=;
        b=IlUOLVRFjKNDeB/FeK6vsdHJteFx9/pp0uxQJvPe4N40WgzI5dH5YTKIBOVCBIkQ92
         zrnkQIfMkAr7RMoxQoh8P9pI4jTSaBs8rneU/MPXtcjAB1gVCn5sLHOAoNB0vXM804yv
         0pmm9uUFjxohCB0vZwrOUf1CE4Vb20SbENsuBMcX5IP49CHWHuDpnM5DFYGn8gJYbUXc
         d/DWNzd8tIBMMEamU6UK6sEjm6Mw1Aqnk2G/is2Up30TxP7hDI2RugXH6QGe/6gEkNXS
         JaGQ1wIEz8B34CXuXTLam510x5dk7aLkpl5xoPDRTdX4w2ch4aFHw9SDwXJKsVLltq5K
         3Svg==
X-Gm-Message-State: AOAM531jQBs7MKCMSDAnLUKye3J09Pryx6uLWFrQ/P1V/5r9vwE6gS2z
        r+PtMqpwlkYA9PSTXlUgT+4=
X-Google-Smtp-Source: ABdhPJw+uIieZkmAewbaRo3e9ZTxt14jHLTFkOJ54t8nGu5lDYF8HsfIgGD2fHcT6RpDbNg4/1PfEA==
X-Received: by 2002:a02:7:: with SMTP id 7mr365606jaa.112.1603156037226;
        Mon, 19 Oct 2020 18:07:17 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45d1:2600::3])
        by smtp.gmail.com with ESMTPSA id v90sm290746ili.75.2020.10.19.18.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 18:07:15 -0700 (PDT)
Date:   Mon, 19 Oct 2020 18:07:14 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] arm64: vdso32: Allow ld.lld to properly link the VDSO
Message-ID: <20201020010714.GA1817488@ubuntu-m3-large-x86>
References: <20201013033947.2257501-1-natechancellor@gmail.com>
 <53b74ed0-f143-6870-1227-3d9663166068@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53b74ed0-f143-6870-1227-3d9663166068@arm.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 19, 2020 at 10:59:47AM +0100, Vincenzo Frascino wrote:
> 
> Hi Nathan,
> 
> On 10/13/20 4:39 AM, Nathan Chancellor wrote:
> > As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
> > using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
> > Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
> > 8384/1: VDSO: force use of BFD linker").
> > 
> > Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
> > link VDSO") changed that Makefile to use $(LD) directly instead of
> > through $(CC), which matches how the rest of the kernel operates. Since
> > then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
> > which has shown no problems so far.
> > 
> > Allow ld.lld to link this vDSO as we do the regular arm vDSO. To do
> > this, we need to do a few things:
> > 
> > * Add a LD_COMPAT variable, which defaults to $(CROSS_COMPILE_COMPAT)ld
> >   with gcc and $(LD) if LLVM is 1, which will be ld.lld, or
> >   $(CROSS_COMPILE_COMPAT)ld if not, which matches the logic of the main
> >   Makefile. It is overrideable for further customization and avoiding
> >   breakage.
> > 
> > * Eliminate cc32-ldoption, which matches commit 055efab3120b ("kbuild:
> >   drop support for cc-ldoption").
> > 
> > With those, we can use $(LD_COMPAT) in cmd_ldvdso and change the flags
> > from compiler linker flags to linker flags directly. We eliminate
> > -mfloat-abi=soft because it is not handled by the linker.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1033
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Just a small nit on my side (see below) and as you already stated it requires
> rebasing if we want to merge it in mainline. Otherwise:
> 
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Thank you for the review! I do not have any personal preference on how
fast this goes in. If we want it fast tracked, it can probably wait
until after -rc1 anyways so I am going to keep it rebased on -next since
presumably the kbuild tree will be merged into mainline by that point.
If anyone else feels differently, let me know.

> > ---
> > 
> > NOTE: This patch is currently based on the kbuild tree due to the
> > --build-id -> --build-id=sha1 change that Bill did. If the arm64
> > maintainers would prefer to take this patch, I can rebase it (althought
> > presumably this won't hit mainline until at least 5.11 so it can
> > probably just stay as is for now).
> > 
> >  arch/arm64/kernel/vdso32/Makefile | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> > index 7f96a1a9f68c..1cf00c58805d 100644
> > --- a/arch/arm64/kernel/vdso32/Makefile
> > +++ b/arch/arm64/kernel/vdso32/Makefile
> > @@ -22,16 +22,21 @@ endif
> >  
> >  CC_COMPAT ?= $(CC)
> >  CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
> > +
> > +ifeq ($(LLVM),1)
> 
> Nit: Here can we check 'ifneq ($(LLVM),)' for consistency with what the main
> Makefile does?

Sure, I will fix that up.

> > +LD_COMPAT ?= $(LD)
> > +else
> > +LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
> > +endif
> >  else
> >  CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
> > +LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
> >  endif
> >  
> >  cc32-option = $(call try-run,\
> >          $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> >  cc32-disable-warning = $(call try-run,\
> >  	$(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> > -cc32-ldoption = $(call try-run,\
> > -        $(CC_COMPAT) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
> >  cc32-as-instr = $(call try-run,\
> >  	printf "%b\n" "$(1)" | $(CC_COMPAT) $(VDSO_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
> >  
> > @@ -122,14 +127,10 @@ dmbinstr := $(call cc32-as-instr,dmb ishld,-DCONFIG_AS_DMB_ISHLD=1)
> >  VDSO_CFLAGS += $(dmbinstr)
> >  VDSO_AFLAGS += $(dmbinstr)
> >  
> > -VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
> >  # From arm vDSO Makefile
> > -VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
> > -VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
> > -VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
> > -VDSO_LDFLAGS += -Wl,--hash-style=sysv
> > -VDSO_LDFLAGS += -Wl,--build-id=sha1
> > -VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
> > +VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
> > +VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
> > +VDSO_LDFLAGS += -nostdlib -shared --hash-style=sysv --build-id=sha1
> >  
> >  
> >  # Borrow vdsomunge.c from the arm vDSO
> > @@ -189,8 +190,8 @@ quiet_cmd_vdsold_and_vdso_check = LD32    $@
> >        cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)
> >  
> >  quiet_cmd_vdsold = LD32    $@
> > -      cmd_vdsold = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_LDFLAGS) \
> > -                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
> > +      cmd_vdsold = $(LD_COMPAT) $(VDSO_LDFLAGS) \
> > +                   -T $(filter %.lds,$^) $(filter %.o,$^) -o $@
> >  quiet_cmd_vdsocc = CC32    $@
> >        cmd_vdsocc = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_CFLAGS) -c -o $@ $<
> >  quiet_cmd_vdsocc_gettimeofday = CC32    $@
> > 
> > base-commit: 172aad81a882443eefe1bd860c4eddc81b14dd5b
> > 
> 
> -- 
> Regards,
> Vincenzo
