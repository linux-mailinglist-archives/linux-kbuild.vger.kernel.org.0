Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DBD6633FE
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbjAIWch (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbjAIWcg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:32:36 -0500
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CEF01021
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:32:32 -0800 (PST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 309MNfL3025747;
        Mon, 9 Jan 2023 16:23:41 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 309MNcFl025746;
        Mon, 9 Jan 2023 16:23:38 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 9 Jan 2023 16:23:37 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <20230109222337.GM25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org> <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!  Happy new year all.

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

It is required by POSIX (for the c99 command, anyway).  It *also* is
required to be supported when producing object files (so when no linking
is done).

It is a GCC flag, and documented just fine:
https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s

(Yes, that says it is for linking; but the option is allowed without
error of any kind always).

(ASFLAGS sounds like it is for assembler commands, but it really is
for compiler commands that just happen to get .S input files).

> The patch seems fine to me, but what was this ever supposed to be?
> FWICT it predates git history (looking at
> arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)

Yeah, good question.  This compiler flag does the moral equivalent of
strip -s (aka --strip-all).  Maybe this was needed at some point, or
the symbol or debug info was just annoying (during bringup or similar)?

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
