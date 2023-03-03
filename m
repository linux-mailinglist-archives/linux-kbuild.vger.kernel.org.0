Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAB76A9A57
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Mar 2023 16:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjCCPOI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Mar 2023 10:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjCCPOH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Mar 2023 10:14:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6173A8B
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Mar 2023 07:14:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34540B818CA
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Mar 2023 15:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00B9C433EF;
        Fri,  3 Mar 2023 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677856443;
        bh=SY8yapFxxlbxxr+YImm1QNyDrMxq689GISGUK9dvGzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XUBMaRMGAHRCenjd4RbPqV/bhxgnkH1olWU6j3dlWBghBnruGBN5UDe9zwKa/fyKb
         QHI0/euHioxKSC5BSqzq3ASq1njWsB+n17cjtNA+19sLHnRqfwteqnCCSte8OjneH9
         4RwJUm+5zpBUdUZRmVOA4308F9ALarlAACp/dqRo6eUbB19LqpD1tCQV68UsxOw0GO
         9QnmFWsrQ7csVOffJ8OAYY5A2zSAVjVjT7rAwY/iJ150pJ7wmGIyxhPiGnAU763VtE
         EaNqwxweAfIhs/Dv/1BWZTTmThYvrPact4rTfCX+ZCVxHZOAxAIK+XkE5evbh5RuIE
         WcKK8GEuU7MKw==
Date:   Fri, 3 Mar 2023 08:14:00 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
Message-ID: <20230303151400.GA2665@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
 <20230302131656.50626-2-mpe@ellerman.id.au>
 <20230302164324.GB3010526@dev-arch.thelio-3990X>
 <878rgelnhd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rgelnhd.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 03, 2023 at 10:53:02AM +1100, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi Michael,
> >
> > Thanks for the workaround and sorry this has come to bite us :/
> >
> > On Fri, Mar 03, 2023 at 12:16:56AM +1100, Michael Ellerman wrote:
> >> For the -mtune option clang doesn't accept power10/9/8, instead it
> >> accepts pwr10/9/8. That will be fixed in future versions of clang, but
> >> the kernel must support the clang versions in the wild.
> >> 
> >> So add support for the "pwr" spelling if clang is in use.
> >> 
> >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> >
> > I think that should actually be
> >
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> I guess yeah.
> 
> >> BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
> >> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks.
> 
> >> ---
> >>  arch/powerpc/platforms/Kconfig.cputype | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> Need to confirm the clang <= 16 statement is correct.
> >
> > Currently, this is indeed the case. It is possible that Nemanja's patch
> > will get applied to release/16.x before 16.0.0 final but it might not.
> >
> > We can always update it later. I think we do want to push to get that
> > patch applied because I forgot that it is only in 16.0.0 that '-mtune'
> > starts to do something on PowerPC:
> >
> > https://github.com/llvm/llvm-project/commit/1dc26b80b872a94c581549a21943756a8c3448a3
> >
> > Prior to that change, '-mtune' was accepted but did nothing. It is only
> > once it was hooked up to the backend that we got the spew of warnings. I
> > think that warrants us trying to get Nemanja's patch into 16.0.0, which
> > may allow us to drop this workaround altogether...
> 
> Aha OK, I missed that the warning was new in 16.
> 
> I'll sit on this for now then until we know if that change will make it
> into clang 16.

It was merged into release/16.x a few hours ago:

https://github.com/llvm/llvm-project/issues/61128

https://github.com/llvm/llvm-project/commit/9b2e09e9fb1aa3bbe3668d7cc585188a3014d1b9

So I think this particular workaround is no longer needed :)

Cheers,
Nathan
