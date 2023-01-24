Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A50679E5A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 17:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjAXQO6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 11:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjAXQO5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 11:14:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200F438039
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 08:14:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C588BB812A1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2023 16:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCA3C433D2;
        Tue, 24 Jan 2023 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674576894;
        bh=5DfgSAXJHi/R6zrfkO3Bu4T0XYdp//PH3WS6X+RZU4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKnI31K/lyFANr15L4/i6SrFwsUap21OIm6uGBh5pAcR7WQ+VJjVC2Mbf07y0wCFs
         jfCSjrZ3Bx6hvVfMu7VlArcmofveuikGYffxUA2PGPX/FlXjIpVaKLI+pzZGwW2Ydz
         s75oJHVTUwW3I6gjP5j8zoOANyptHi0oQI7Am0IrsaqXQUM3RxaW+8RnJbpz3HeKFX
         U899TvOzGWQFUA/27FDOCITZ3Jmx1dxrEv40ZjLfiIdTpzb0cnIQ5sODVjv90Lpeez
         paBLfqxM8V9YFB7KBDA0qLLZ4J7aSbHDpleauVFElF8E5Q6JNXKHNUnjEgun3utGkD
         3TOzop7uGGDHg==
Date:   Tue, 24 Jan 2023 09:14:52 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu,
        linux-kbuild@vger.kernel.org, trix@redhat.com,
        llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <Y9AD/Mejnv6jp7Np@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
 <20230123150716.GJ25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123150716.GJ25951@gate.crashing.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 23, 2023 at 09:07:16AM -0600, Segher Boessenkool wrote:
> Hi!
> 
> On Wed, Jan 11, 2023 at 08:05:04PM -0700, Nathan Chancellor wrote:
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > are several warnings in the PowerPC vDSO:
> > 
> >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> > 
> >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> 
> There is nothing wrong with the warnings, but as usual, -Werror is very
> counterproductive.
> 
> > The first group of warnings point out that linker flags were being added
> > to all invocations of $(CC), even though they will only be used during
> > the final vDSO link. Move those flags to ldflags-y.
> 
> Which is explicitly allowed, and won't do anything, so nothing harmful
> either.  It is not a bad idea to avoid this if that is trivial to do,
> of course.

I think this patch shows that it is trivial to do this, the primary core
of the diff is only a few lines.

> > The second group of warnings are compiler or assembler flags that will
> > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > they are not used during linking.
> 
> And here it is even more obviously fine.  If you need obfuscation like
> in your patch, it is better not to do this imo.

I do not think this patch really obfuscates anything? The filtering is
pretty clear to me.

If this is a real objection to the patch, I suppose we could just
localize '-Qunused-arguments' to this Makefile and be done with it but I
do not think this change is a bad solution to the problem either.

Cheers,
Nathan
