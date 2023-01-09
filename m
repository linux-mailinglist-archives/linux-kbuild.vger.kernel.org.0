Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226DD6633C0
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbjAIWQF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbjAIWQE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:16:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89911117A
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:16:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67A78B80D50
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 22:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AFFC433D2;
        Mon,  9 Jan 2023 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673302560;
        bh=hUg9H/CHIei7l5JZ9xjrqZ8pkKMVqLGAm5u3tCpMf+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PsbN6754qD6E7+uzix04VaLVCaQWUjeCCJInc4CqvqynjEQ6dH+EpH4NNqo7ivzes
         iDo0UJ6/Iv0OH34UcBSsGHOiSlLMmGtm5qk/WnpX5f9bkl/n7F34luw2nNbwXk+ZOg
         CfnJRHGjmZRuZ3wXS6ood96OoJEVlMDlYFvkBm4OONiOmQnceCu12ugIe7CtpPMO7X
         2v7Mcqzk+Q9rWPB8etSBAMNQ5QrDFhsFuf19K3gYq7rQzomdsXguQFf4iEsWLVRriO
         7cSC61tqQDtKQTGcYxkr5zNv+CbN4bT/kGALexIZ/u5woSlX1tJZcnVo8S56UZucnC
         HowNHgbFw6daA==
Date:   Mon, 9 Jan 2023 15:15:57 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 07/14] powerpc/vdso: Improve linker flags
Message-ID: <Y7ySHXwgL5ZbkOtX@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-7-658cbc8fc592@kernel.org>
 <CAKwvOdk6wzoPWoAoShtaeCDZXEZ2b7OAE05pHZy-ry=Eu8UnAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdk6wzoPWoAoShtaeCDZXEZ2b7OAE05pHZy-ry=Eu8UnAg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 02:08:41PM -0800, Nick Desaulniers wrote:
> On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > are several warnings in the PowerPC vDSO:
> >
> >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> >
> >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> >
> > The first group of warnings point out that linker flags were being added
> > to all invocations of $(CC), even though they will only be used during
> > the final vDSO link. Move those flags to ldflags-y.
> >
> > The second group of warnings are compiler or assembler flags that will
> > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > they are not used during linking.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Cc: mpe@ellerman.id.au
> > Cc: npiggin@gmail.com
> > Cc: christophe.leroy@csgroup.eu
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > index 45c0cc5d34b6..769b62832b38 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
> >  UBSAN_SANITIZE := n
> >  KASAN_SANITIZE := n
> >
> > -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> > -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > -
> > -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > +ccflags-y := -fno-common -fno-builtin
> > +ldflags-y := -Wl,--hash-style=both -nostdlib -shared
> > +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > +# Filter flags that clang will warn are unused for linking
> > +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> > +
> > +CC32FLAGS := -m32
> > +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> >  AS32FLAGS := -D__VDSO32__
> >
> > -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
> >  AS64FLAGS := -D__VDSO64__
> >
> >  targets += vdso32.lds
> > @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
> >
> >  # actual build commands
> >  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> > -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> >  quiet_cmd_vdso32as = VDSO32A $@
> >        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
> >  quiet_cmd_vdso32cc = VDSO32C $@
> >        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
> >
> >  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> > -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> 
> Let's move `-z noexecstack` up into ldflags-y? (you may add my RB with
> that modification)

Ack, done locally, will be included in v2.

> >  quiet_cmd_vdso64as = VDSO64A $@
> >        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
> >
> >
> > --
> > 2.39.0
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
