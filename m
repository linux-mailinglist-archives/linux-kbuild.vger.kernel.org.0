Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6641663406
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237854AbjAIWiN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237805AbjAIWiA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:38:00 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53863F58C
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:37:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BD14FCE1276
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 22:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430D9C433D2;
        Mon,  9 Jan 2023 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673303875;
        bh=EIafaMbRLxZFbxacgDeKd6rkGJmiPZyvWttZF6Ltt7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jn9KUX0un9wox4UnYGcxi5TVftZua9ACI5dbU5bUh75/edM3LlOZh/fMiGVZgUqbh
         kcNLcAM+KLdmnUf6ZQzcv0zAl+knv+4oOc91C4FCrjiGn8I0j3Z8AhV6W66mdzityV
         NeOSFTsxdPKbePkPZbcZtyexZq4DEJkakXDnbdcQg+07noZccNQ15gSkkLhgPACxrw
         R8s43JvKbA1iuHYH06i9aBM7N73Bjkc1Tgj42uvuyNOmMk4H3AL4LqS0VfSe2cMbAG
         Lljs8jQ8K+/+cCaJPIomh4sQaShxiuNROmE7B6SFJdrB+IA6ylfEwGb/3VK9/WUSMf
         3kVN7MlVR4L6g==
Date:   Mon, 9 Jan 2023 15:37:53 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        kernel test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <Y7yXQdAG3OpxNDS0@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
 <20230109222337.GM25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109222337.GM25951@gate.crashing.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 04:23:37PM -0600, Segher Boessenkool wrote:
> Hi!  Happy new year all.
> 
> On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > > is unused.
> > >
> > >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > >
> > > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > > and it is ignored for the powerpc target so just drop the flag
> > > altogether, as it is not needed.
> > 
> > Do you have any more info where you found this?  I don't see -s
> > documented as an assembler flag.
> > https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> > https://sourceware.org/binutils/docs/as/Invoking.html
> 
> It is required by POSIX (for the c99 command, anyway).  It *also* is
> required to be supported when producing object files (so when no linking
> is done).
> 
> It is a GCC flag, and documented just fine:
> https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s
> 
> (Yes, that says it is for linking; but the option is allowed without
> error of any kind always).
> 
> (ASFLAGS sounds like it is for assembler commands, but it really is
> for compiler commands that just happen to get .S input files).
> 
> > The patch seems fine to me, but what was this ever supposed to be?
> > FWICT it predates git history (looking at
> > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
> 
> Yeah, good question.  This compiler flag does the moral equivalent of
> strip -s (aka --strip-all).  Maybe this was needed at some point, or
> the symbol or debug info was just annoying (during bringup or similar)?
> 
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Thank you for the review and extra explanation! I had kind of expanded
on this in the s390 version of this patch [1], I will go ahead and do
the same thing for the powerpc version too.

[1]: https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org/

Cheers,
Nathan
