Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC60667EAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 20:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238170AbjALTHc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 14:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239964AbjALTGb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 14:06:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25075767A
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 10:48:11 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d30so24836187lfv.8
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 10:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2LHJhaYz4OJaY3qxSfplobYir10QkCvABhK4MHujXhE=;
        b=Mj1nuXNvwOYlRF1dKE2t1j63P0DmN8cSVBEglgoKkJyzxPTVd7GG+IR7u+/JZkBfZm
         IYH0ooDA4XvRSc+FAmL7evdeV6yHglIyqtgd+yafyjoy221eO1bEfN5zOp8fwzLzvxRx
         fLMeMGGNJ3JZJGTGbidVCsP/fRjDEvsZznC1CceBBHvixBXainarIrYQkFn3JlGoJrll
         o4+YnHlrAXtDCwrkPrx9ul6KrIzg2x91O9mOoLMGM2C3g9LwvfAUqwJB3pDeqa6wPiof
         p6aYc8q/MwrJAonjiUC/+vgcjhQgz27WLvCEf2NJQBcZpAHTcmiGDHLqDzHZRfwiiJak
         MVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LHJhaYz4OJaY3qxSfplobYir10QkCvABhK4MHujXhE=;
        b=TfcfXYytC9ov296AWZwsm+9gsdSaABhZiQoEImqXACD80a1bgrDRAY3JPh1N0Utzjd
         2+F4eCQ9c/PsefE4M9EM9IgFVHsjJKpzYgHRfA1F3Eze641IeWksjSw4DN8YmcMkRz87
         9n3jBBhirHl2/Iig86D88xkJ9o3XywiaUJfPieQCVA1O0jt5XcD7ycRu9jxzpPmWB89V
         ugE4+Hj313/dLB4aHCfvZOb3+wvDnCJ50ByZv2HRLBBPnAMHVfEvCwC+PLgOdc1kk/5z
         ITIYDM5C4aXnfXgqkeNVXdC3lfrzW/xNqPbQOrbCB+2u72iizXX2AjUGk5G4kxjSSdIL
         ROAg==
X-Gm-Message-State: AFqh2kptJPnjASiW78FXGoVZe9yCfd0Dr+95vTLkRDJoRMFIu/QnAu3g
        Mt71FUz6YbIUh+/yP1K6/W4K+OQtkISpZYA+Pnk=
X-Google-Smtp-Source: AMrXdXtBulizHQGHp+HKYjCPRVs+bctKl77S50/lf3BRAxO6DdRnFw6UXz+0+x4yagp7e3UnLq5IOn2ek3UncLBdjcc=
X-Received: by 2002:a05:6512:3e12:b0:4ca:6c11:d3e5 with SMTP id
 i18-20020a0565123e1200b004ca6c11d3e5mr3715964lfv.224.1673549289451; Thu, 12
 Jan 2023 10:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
 <CA+icZUUgq-dnSTRbdynPA8bEWg6SsCE9GYBMF6iViVmo9DfaFA@mail.gmail.com> <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
In-Reply-To: <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 12 Jan 2023 19:47:32 +0100
Message-ID: <CA+icZUUyyJX8XTDqgacT6aacD_5-g5S=YY+aOjCjyMBk=CWxsg@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 12, 2023 at 7:21 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sedat,
>
> On Thu, Jan 12, 2023 at 07:02:30PM +0100, Sedat Dilek wrote:
> > On Thu, Jan 12, 2023 at 4:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > > are several warnings in the PowerPC vDSO:
> > >
> > >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> > >
> > >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> > >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> > >
> > > The first group of warnings point out that linker flags were being added
> > > to all invocations of $(CC), even though they will only be used during
> > > the final vDSO link. Move those flags to ldflags-y.
> > >
> > > The second group of warnings are compiler or assembler flags that will
> > > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > > they are not used during linking.
> > >
> > > Additionally, '-z noexecstack' was added directly to the ld_and_check
> > > rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
> > > but now that there is a common ldflags variable, it can be moved there.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Cc: mpe@ellerman.id.au
> > > Cc: npiggin@gmail.com
> > > Cc: christophe.leroy@csgroup.eu
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > ---
> > >  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > > index 45c0cc5d34b6..4337b3aa9171 100644
> > > --- a/arch/powerpc/kernel/vdso/Makefile
> > > +++ b/arch/powerpc/kernel/vdso/Makefile
> > > @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
> > >  UBSAN_SANITIZE := n
> > >  KASAN_SANITIZE := n
> > >
> > > -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> > > -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > -
> > > -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > > +ccflags-y := -fno-common -fno-builtin
> > > +ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
> > > +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > +# Filter flags that clang will warn are unused for linking
> > > +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> > > +
> > > +CC32FLAGS := -m32
> > > +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> > >  AS32FLAGS := -D__VDSO32__
> > >
> > > -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> >
> > Set CC64FLAGS := -m64 ?
>
> I do not think it is necessary. ldflags-y is filtered from
> KBUILD_CFLAGS, which should already include '-m64' (search for
> 'HAS_BIARCH' in arch/powerpc/Makefile). We would have seen a problem
> with this already if a 32-bit target (powerpc-linux-gnu-) CROSS_COMPILE
> value since $(c_flags) uses the main kernel's CROSS_COMPILE value.
>

Happy new 2023 Nathan,

that vdso Makefiles are hard to read.

Looks like x86/vdso explicitly sets -m32 and filter-out -m64 for the
32-bit case.

Best regards,
-Sedat-

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/entry/vdso/Makefile

> > > +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > >  AS64FLAGS := -D__VDSO64__
> > >
> > >  targets += vdso32.lds
> > > @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
> > >
> > >  # actual build commands
> > >  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> > > -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> > >  quiet_cmd_vdso32as = VDSO32A $@
> > >        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
> > >  quiet_cmd_vdso32cc = VDSO32C $@
> > >        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
> > >
> > >  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> > > -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> >
> > If no CC64FLAGS := xxx is set, this can go?
>
> Good catch! CC64FLAGS can be removed. Masahiro, I am happy to send a v3
> when I am back online next week but if you are able to fix it up during
> application, please feel free to do so (once the PowerPC folks give
> their Acks of course).
>
> > >  quiet_cmd_vdso64as = VDSO64A $@
> > >        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
> > >
> > >
> > > --
> > > 2.39.0
> > >
>
> Thanks for the review, cheers!
> Nathan
