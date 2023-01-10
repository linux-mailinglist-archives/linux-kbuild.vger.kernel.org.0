Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8BD6643F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 16:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjAJPDs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Jan 2023 10:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbjAJPDN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jan 2023 10:03:13 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFB85E66D
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 07:02:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 562F7CE13CD
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 15:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CFAC433EF;
        Tue, 10 Jan 2023 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673362969;
        bh=sKgWysTb+sBvYEAqYlhx7Bnltvv0i7EhCIfzFtUqpQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CoepT9JQfZEoRk+MtW+ITnAysDwdWSmN7GF9I2qzH1rU3SEI/ahWHway48lRTQxEJ
         8zDm645kDIwo5u0UgwxnIZfYmmiwLC2wbSGGmIiEr/BLtxeqFaqDkKX3DWpEYmti/7
         mI8yQ7hLP/rDPYqKVTs82G88op92N7U6t2fMwqO6HZHrp0R0l0L+lXjmry9SkWFFkJ
         urlSO5eCEWDWmWWolyG1BKDa0tWenOzPFUgN4JrBuHdCjbR7e4eCctSqjH955+P9h4
         ZaW2VxD+J1wkLtqv4FoLY3gwlbgMJ5NCkNKTmVyjswYub9hN9n7C/0jwF0HaL1NuBz
         koAtRsViexyBw==
Date:   Tue, 10 Jan 2023 08:02:47 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        kernel test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <Y71+FxR58VjDim5v@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
 <20230109222337.GM25951@gate.crashing.org>
 <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com>
 <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
 <20230110114523.GP25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110114523.GP25951@gate.crashing.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 10, 2023 at 05:45:23AM -0600, Segher Boessenkool wrote:
> On Mon, Jan 09, 2023 at 05:51:23PM -0700, Nathan Chancellor wrote:
> > So for this patch, I have
> > 
> >   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> >   warns:
> > 
> >     clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > 
> >   The compiler's '-s' flag is a linking option (it is passed along to the
> >   linker directly), which means it does nothing when the linker is not
> >   invoked by the compiler. The kernel builds all .o files with either '-c'
> >   or '-S', which do not run the linker, so '-s' can be safely dropped from
> >   ASFLAGS.
> > 
> > as a new commit message. Is that sufficient for everyone? If so, I'll
> > adjust the s390 commit to match, as it is the same exact problem.
> 
> Almost?  -S doesn't write .o files, it writes a .s file.  To go from an
> assembler file (.s, or .S if you want to run the C preprocessor on non-C
> code for some strange reason, the assembler macro facilities are vastly
> superior) to an object file is just -c as well.

Heh, right, that is what I get for not paying attention and rushing at
the end of my day :) thanks for being pendantic, I will get that ironed
out for v2, which I should have out later today or tomorrow, time
permitting.

Cheers,
Nathan
