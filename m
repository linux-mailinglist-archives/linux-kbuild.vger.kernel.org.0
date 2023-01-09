Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABDEA6633DC
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbjAIWWN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237192AbjAIWV7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:21:59 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8F4E09A
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:21:58 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id g16so11125327plq.12
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lYRWg/J0ttDlaWM6UjZHnwN9ihNosYMSn3gAowHT2M=;
        b=iZkHJUsyXNwcsEHrsbTJYu+zqyvldkM3q+Jfocy7lLDq1f7yOgQS1qKFoy5t4X5pG9
         Lf/ZF8NRkoj5rP8ngrUbICNDbgpVxXPWsloJhs+CgsIOpuTXQJYx9vidSOSymo+S/Ije
         ZRdYM3E+gr4cegsnPR9y6mWYIIos6agegktTw69vzRhPWvB31/70485UOuHiIZt7kvKI
         SBA2Oyi6BTPPCUvJIXk/eECcarBR62uD3hPBv+usIaj97tq7BVt+dtDkYzmI7cQtyels
         t9bd4Aphg7YAQPz0VZdAi/yap0q2tswAhG4V+3glGwKWobeSKDbnEQsQ3A5njX97VoCm
         NCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lYRWg/J0ttDlaWM6UjZHnwN9ihNosYMSn3gAowHT2M=;
        b=PjVNcqHGs/jVcZOu+9htCOCOT9MThLSrjXJVsrQwXktTqR4aOTDc5NGukCRuEEfa6T
         VfNhCCizDkmTthT18eBoBAVWyrt/UCjN/AeBv1xEzFID1OOud1ox2oeSfE4WPZHnep3i
         xBZAl07drsRPn1qtlq4vUL7srW3U1qtJ+8DESsALVu0O/ODNO6pWDkpvNxZSjSCf8InI
         /bNCnjaO70kwm5auAi/61cgf40lYBApSGi0J1bfHSQebaopzaWUi0yzkm6vhZiu6h245
         Qy5yzq3G5ROj+1JXomfHsZ2j41Hd+tz3y8efGVZ/7GRWFhn/IQY0J3uBlaA/PAogacag
         2Qeg==
X-Gm-Message-State: AFqh2kp8NmPoA+DhPXhyOa7dRDDT0dkiaTyf/Tu6eX51YocnE1DMAaqT
        vv/3DbK8WAm7bFG95l7hPMMhKVTlrVqiA/hDWlA1lg==
X-Google-Smtp-Source: AMrXdXucbZiJrH1ZgxnLhDID88TWaIKL8fHclfX+Cw9XnW12o2dLaMix9Djfz5cY+2Sta5hP/Ikhd0ti7JTVF7GsPaw=
X-Received: by 2002:a17:902:c94d:b0:191:24d1:3b31 with SMTP id
 i13-20020a170902c94d00b0019124d13b31mr2860808pla.94.1673302917777; Mon, 09
 Jan 2023 14:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
In-Reply-To: <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 14:21:46 -0800
Message-ID: <CAKwvOdn5Wmi+b7x9DniE0=aCqFfLFwusAi2Ny-bfMNfncp5dUg@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 9, 2023 at 2:15 PM Nathan Chancellor <nathan@kernel.org> wrote:
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
> Sure thing, sorry I did not include it initially. See the section from
> line 1284 to 1291 or search for "case 's':":
>
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-ppc.c;h=9450fa74de1b61542c9a18babf8c8f621ef904fb;hb=HEAD
>
> > The patch seems fine to me, but what was this ever supposed to be?
> > FWICT it predates git history (looking at
> > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
>
> Right, I could not figure it out either, it has been there since the
> vDSO was introduced back in 2005 (I was three days away from 10!) and
> there is no comment about it so *shrug*:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=054eb7153aeb84cc92da84210cf93b0e2a34811b
>
> If someone else's archeological skills are better and can provide more
> information, I am happy to include that.
>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks as always for the review! I'll include this and a note about
> where in binutils I found that information for v2.

Yeah, I think the comment from binutils sources would be good to add
to a v2 commit message. Thanks!


-- 
Thanks,
~Nick Desaulniers
