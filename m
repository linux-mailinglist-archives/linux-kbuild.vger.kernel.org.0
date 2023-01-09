Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9467366340D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbjAIWiq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237876AbjAIWiW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:38:22 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C89AF58C
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:38:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E7DCDCE1276
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 22:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEC0C433EF;
        Mon,  9 Jan 2023 22:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673303898;
        bh=dclPwp96wKjDlc1FajSl86T4kQa8AF1q5XWy8XdCCeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RbDLLONbytCU+y1moF2ZQadPzH9WooGc+7xaOOqG9IQuI+VlzMeMJcTOblDlf0+Oj
         Lp6z9ZJe37Th4vg8XaigbM4gfEB+ahuP7lbxFV9obuFwPjsiVGtClWJt6pYvZf6FD2
         7/0U7UHLWVLqkzZ/elVxU4opDa0IcepkJRjyxscfJ624qBm0a9JOcQgAlwdzhFN1ki
         NQAM+Uyq/pgAh88HFwWFqwMcxDCOHzN7H4yu7zDDUT4wf/G6pCqXsbkTfhD7yT9HNt
         iEhrWtfUxJ6CHDlSuM3eOpdUlelWg+uCGOBbw4nrvRRD5MyJYRDUe76EYBfhZLGt+1
         ntKVucTgmgHAw==
Date:   Mon, 9 Jan 2023 15:38:15 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
Message-ID: <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
 <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 09, 2023 at 02:12:55PM -0800, Nick Desaulniers wrote:
> On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > warns:
> >
> >   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
> >
> > This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> > Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> > been done for other flags previously.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Hmm...so this was added by the top level Makefile doing a cc-option
> test.  How did the test pass if this was unsupported? That worries me
> that perhaps other cc-option tests are passing erroneously for certain
> ppc -m32/-m64 configs?

Sure, that is a reasonable concern. I should have expanded upon this a
little bit more in the commit message. Is this any better?

  When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
  warns:

    clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]

  This warning happens because vgettimeofday-32.c gets its base CFLAGS
  from the main kernel, which may contain flags that are only supported
  on a 64-bit target but not a 32-bit one, which is the case here.
  -fstack-clash-protection and its negation are only suppported by the
  64-bit powerpc target but that flag is included in an invocation for a
  32-bit powerpc target, so clang points out that while the flag is one
  that it recognizes, it is not actually used by this compiler job.

  To eliminate the warning, remove -fno-stack-clash-protection from
  vgettimeofday-32.c's CFLAGS when using clang, as has been done for
  other flags previously.

Cheers,
Nathan

> > ---
> > Cc: mpe@ellerman.id.au
> > Cc: npiggin@gmail.com
> > Cc: christophe.leroy@csgroup.eu
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/vdso/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > index 769b62832b38..4ee7d36ce752 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
> >    CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
> >    CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
> >    CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> > +  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
> > +  # an unused command line flag warning for this file.
> > +  ifdef CONFIG_CC_IS_CLANG
> > +  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
> > +  endif
> >    CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
> >    CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
> >    CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)
> >
> > --
> > 2.39.0
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
