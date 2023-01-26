Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C029A67C2A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Jan 2023 03:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjAZCH3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Jan 2023 21:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjAZCH2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jan 2023 21:07:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC733D09E
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jan 2023 18:07:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 735A461719
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jan 2023 02:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA24C433D2;
        Thu, 26 Jan 2023 02:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674698846;
        bh=iDE4VETN4jaTIfHsOYmXJe6CouDOc+jNMaZZeQ0kuik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y/afT4MbpJ33okTS4d577X4WXr8yyUKZG7CbK6x96mmxW29k4Bct/SByOmGvV3Z7R
         eLbmTPS2neoJVeM4uGy1Gp0IQeDDtrb68xbMS1K3MclF/eVrCDwhNa+6ty/+Pjt0Wx
         2VOrfEbXLnudEqDrEC00/KvShOMgG8D0f+loDVdKudn/7cdp/u7Ek8ZzBaQ26znNBH
         WbQFYGDEBzHj/exLdMBJ3zTYF8qPPrE8xo992Pg+LwrkfM6PCjvxdO86Pl/Fv8rW0e
         26eIOlRYXdoT123MTXtS1dqaNVVY+xkmyCvkr8KegJcxSEwXn73l1ZN5XrbQ2zVczS
         bkRPHz7lZGN9g==
Date:   Wed, 25 Jan 2023 19:07:24 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, ndesaulniers@google.com,
        nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
Message-ID: <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
 <871qnjqmmq.fsf@mpe.ellerman.id.au>
 <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 26, 2023 at 10:29:54AM +0900, Masahiro Yamada wrote:
> On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Nathan Chancellor <nathan@kernel.org> writes:
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > > used:
> >
> > Should that say "unused" ?
> 
> 
> 
> Nathan, shall I fix it up locally?
> (it will change the commit hash, though.)

Yes please, if you would not mind. Sorry about that and thank you for
spotting it Michael!

Since you have to rebase to fix it, you can include Michael's acks?

Cheers,
Nathan

> > >   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >
> > > This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> > > unnecessary, as all supported versions of clang and gcc will pass '-a64'
> > > or '-a32' to GNU as based on the value of '-m'; the behavior of the
> > > latest stable release of the oldest supported major version of each
> > > compiler is shown below and each compiler's latest release exhibits the
> > > same behavior (GCC 12.2.0 and Clang 15.0.6).
> > >
> > >   $ powerpc64-linux-gcc --version | head -1
> > >   powerpc64-linux-gcc (GCC) 5.5.0
> > >
> > >   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> > >   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
> > >
> > >   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> > >   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
> > >
> > >   $ clang --version | head -1
> > >   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
> > >
> > >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> > >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> > >    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
> > >
> > >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> > >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> > >    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
> > >
> > > Remove this flag altogether to avoid future issues.
> > >
> > > Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Cc: mpe@ellerman.id.au
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> >
> > cheers
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
