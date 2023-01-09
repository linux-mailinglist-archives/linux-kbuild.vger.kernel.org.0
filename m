Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1244663477
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237476AbjAIW4O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235170AbjAIW4N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:56:13 -0500
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0031EE15
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:56:10 -0800 (PST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 309MleMo026818;
        Mon, 9 Jan 2023 16:47:40 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 309MlbXg026817;
        Mon, 9 Jan 2023 16:47:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 9 Jan 2023 16:47:37 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        kernel test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <20230109224737.GN25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org> <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951@gate.crashing.org> <Y7yXQdAG3OpxNDS0@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7yXQdAG3OpxNDS0@dev-arch.thelio-3990X>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 03:37:53PM -0700, Nathan Chancellor wrote:
> On Mon, Jan 09, 2023 at 04:23:37PM -0600, Segher Boessenkool wrote:
> > Hi!  Happy new year all.
> > 
> > On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> > > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > > > is unused.
> > > >
> > > >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > > >
> > > > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > > > and it is ignored for the powerpc target so just drop the flag
> > > > altogether, as it is not needed.
> > > 
> > > Do you have any more info where you found this?  I don't see -s
> > > documented as an assembler flag.
> > > https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> > > https://sourceware.org/binutils/docs/as/Invoking.html
> > 
> > It is required by POSIX (for the c99 command, anyway).  It *also* is
> > required to be supported when producing object files (so when no linking
> > is done).
> > 
> > It is a GCC flag, and documented just fine:
> > https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s
> > 
> > (Yes, that says it is for linking; but the option is allowed without
> > error of any kind always).
> > 
> > (ASFLAGS sounds like it is for assembler commands, but it really is
> > for compiler commands that just happen to get .S input files).
> > 
> > > The patch seems fine to me, but what was this ever supposed to be?
> > > FWICT it predates git history (looking at
> > > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
> > 
> > Yeah, good question.  This compiler flag does the moral equivalent of
> > strip -s (aka --strip-all).  Maybe this was needed at some point, or
> > the symbol or debug info was just annoying (during bringup or similar)?
> > 
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> 
> Thank you for the review and extra explanation! I had kind of expanded
> on this in the s390 version of this patch [1], I will go ahead and do
> the same thing for the powerpc version too.
> 
> [1]: https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org/

The underwhelming GCC source code for this is
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/gcc.cc;h=d629ca5e424ad3120be13e82b9f38b7bf8f1cdf2;hb=HEAD#l1148
which says that the -s flag is passed through unmodified to the linker
when invoking the linker.  See #l603 for the %{s} specs syntax.

This is not a flag to the assembler at all.  It is a flag to the
compiler, which passes it on to the linker :-)

> > (ASFLAGS sounds like it is for assembler commands, but it really is
> > for compiler commands that just happen to get .S input files).


Segher
