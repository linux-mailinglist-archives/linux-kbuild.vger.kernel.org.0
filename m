Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532BD6633BD
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjAIWPP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbjAIWPN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:15:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E20E17E37
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:15:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F8C7B80D50
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 22:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D780C433EF;
        Mon,  9 Jan 2023 22:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673302510;
        bh=rMxiXT24cJy5vKA+lJutQflz87Lb9x3a2qshOdeXs3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f9fLWX/OrdnGyjHkdHQf24yXZhNNlbkPPm9P3VJKcQbCAutav9WpHni7Ym1Ea+7hS
         U6z6rm+rRDjHfgXAHQosi/HgS9qSL9BXYih1rRWT5IgC06fogYoXloEvmwQ8KLLNaW
         oTpVmmkUoOO1t0g4g6cG/JBrP+eRvX+hEBwZltiDeJ+EFEgIhEkmLnYZKpZY8pcXcm
         aP3qjkX2S4u9TMzK4qy0bTdt9ZEKaBS9UYrI6TSRjiuySrwIrPOF+W9KN1gw6iwRco
         WFWUBr9ZWroS9+gn9jsqBBCuKXZ0nZje7w2OJIqjSupErlltoCWwXF2mtxZYt5A6Pq
         bsAvWpLg2bidQ==
Date:   Mon, 9 Jan 2023 15:15:07 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > is unused.
> >
> >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> >
> > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > and it is ignored for the powerpc target so just drop the flag
> > altogether, as it is not needed.
> 
> Do you have any more info where you found this?  I don't see -s
> documented as an assembler flag.
> https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> https://sourceware.org/binutils/docs/as/Invoking.html

Sure thing, sorry I did not include it initially. See the section from
line 1284 to 1291 or search for "case 's':":

https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-ppc.c;h=9450fa74de1b61542c9a18babf8c8f621ef904fb;hb=HEAD

> The patch seems fine to me, but what was this ever supposed to be?
> FWICT it predates git history (looking at
> arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)

Right, I could not figure it out either, it has been there since the
vDSO was introduced back in 2005 (I was three days away from 10!) and
there is no comment about it so *shrug*:

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=054eb7153aeb84cc92da84210cf93b0e2a34811b

If someone else's archeological skills are better and can provide more
information, I am happy to include that.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks as always for the review! I'll include this and a note about
where in binutils I found that information for v2.

> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Cc: mpe@ellerman.id.au
> > Cc: npiggin@gmail.com
> > Cc: christophe.leroy@csgroup.eu
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/vdso/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > index 6a977b0d8ffc..45c0cc5d34b6 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> >  ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> >
> >  CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > -AS32FLAGS := -D__VDSO32__ -s
> > +AS32FLAGS := -D__VDSO32__
> >
> >  CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > -AS64FLAGS := -D__VDSO64__ -s
> > +AS64FLAGS := -D__VDSO64__
> >
> >  targets += vdso32.lds
> >  CPPFLAGS_vdso32.lds += -P -C -Upowerpc
> >
> > --
> > 2.39.0
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
