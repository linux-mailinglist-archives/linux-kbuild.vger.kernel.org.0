Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F36A663F8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 12:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbjAJLyJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Jan 2023 06:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238025AbjAJLyF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jan 2023 06:54:05 -0500
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C78775689D
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 03:53:58 -0800 (PST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30ABjQic021510;
        Tue, 10 Jan 2023 05:45:26 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 30ABjNkV021509;
        Tue, 10 Jan 2023 05:45:23 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 10 Jan 2023 05:45:23 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        kernel test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <20230110114523.GP25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org> <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951@gate.crashing.org> <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com> <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 05:51:23PM -0700, Nathan Chancellor wrote:
> So for this patch, I have
> 
>   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
>   warns:
> 
>     clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> 
>   The compiler's '-s' flag is a linking option (it is passed along to the
>   linker directly), which means it does nothing when the linker is not
>   invoked by the compiler. The kernel builds all .o files with either '-c'
>   or '-S', which do not run the linker, so '-s' can be safely dropped from
>   ASFLAGS.
> 
> as a new commit message. Is that sufficient for everyone? If so, I'll
> adjust the s390 commit to match, as it is the same exact problem.

Almost?  -S doesn't write .o files, it writes a .s file.  To go from an
assembler file (.s, or .S if you want to run the C preprocessor on non-C
code for some strange reason, the assembler macro facilities are vastly
superior) to an object file is just -c as well.

> Alternatively, if '-s' should actually remain around, we could move it
> to ldflags-y, which is added in patch 7. However, I assume that nobody
> has noticed that it has not been doing its job for a while, so it should
> be safe to remove.

+1


Segher
