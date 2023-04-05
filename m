Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF34D6D8915
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Apr 2023 22:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjDEUvc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Apr 2023 16:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDEUvb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Apr 2023 16:51:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B987185;
        Wed,  5 Apr 2023 13:51:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BC1062B84;
        Wed,  5 Apr 2023 20:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C90C433EF;
        Wed,  5 Apr 2023 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680727889;
        bh=GIhWuSTvi5dNlCJnEe2QuPHkW1zE/y3p5xizO193qDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lcuimBJR8T//I6SFduCNiWwmM9eKXgog875khOYd5/Svp36Sp9c6y3Kmc9HRohKGP
         hJiYuFJjchgqjadCtly19N88RnFZk42S4xNwSlybAe1cOi8nDo6JbXV1NNPlKgEYz9
         Q6pgj6HUZc0PJR9XWbYPdQxDKk9N/X3+IqEfvqQo0H35polk9YbUz0D3bpnga+tEDO
         Z+LUC3w2cq6uK/PzH0Jb/3xUhUrKez8i/ujmvBcAlKvKXPb52doMCtsY81GzmFrR13
         wl9fvmVI4tnq3RUpBtbm9ckjBItAuMqdOxprcE1PjQ379hjCchOfHrF89vXvGW29SE
         OQCYph6Hitxug==
Date:   Wed, 5 Apr 2023 13:51:26 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Bill Wendling <morbo@google.com>
Cc:     ndesaulniers@google.com, masahiroy@kernel.org, corbet@lwn.net,
        arnd@arndb.de, keescook@chromium.org, trix@redhat.com,
        nicolas@fjasle.eu, llvm@lists.linux.dev, patches@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/llvm: Add a note about prebuilt kernel.org
 toolchains
Message-ID: <20230405205126.GA3280774@dev-arch.thelio-3990X>
References: <20230405-korg-llvm-tc-docs-v1-1-420849b2e025@kernel.org>
 <CAGG=3QX65iJEtvMiSD2Ju18f0KfHsi2zPXAQDSh0ScqbCLv=Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGG=3QX65iJEtvMiSD2Ju18f0KfHsi2zPXAQDSh0ScqbCLv=Cg@mail.gmail.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 05, 2023 at 01:47:44PM -0700, Bill Wendling wrote:
> On Wed, Apr 5, 2023 at 1:44 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I recently started uploading prebuilt stable versions of LLVM to
> > kernel.org, which should make building the kernel with LLVM more
> > accessible to maintainers and developers. Link them in the LLVM
> > documentation to make this more visible.
> >
> > Link: https://lore.kernel.org/20230319235619.GA18547@dev-arch.thelio-3990X/
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  Documentation/kbuild/llvm.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index bfb51685073c..3e1f67b05ca6 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -171,6 +171,10 @@ Getting Help
> >  Getting LLVM
> >  -------------
> >
> > +We provide prebuilt stable versions of LLVM on `kernel.org <https://kernel.org/pub/tools/llvm/>`_.
> > +Below are links that may be useful for building LLVM from source or procurring
> 
> s/procurring/procuring/

Leave it to me to forget to use ':set spell' :( sometimes I think that
people would have a hard time guessing I am a native English speaker :^)

> Otherwise:
> 
> Reviewed-by: Bill Wendling <morbo@google.com>

Thanks for the quick review! I will send a v2 once others have had a
chance to chime in (unless the person applying this does not mind fixing
it up at that time).

> -bw
> 
> > +it through a distribution's package manager.
> > +
> >  - https://releases.llvm.org/download.html
> >  - https://github.com/llvm/llvm-project
> >  - https://llvm.org/docs/GettingStarted.html
> >
> > ---
> > base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
> > change-id: 20230405-korg-llvm-tc-docs-84304e881bc5
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> >
> >
