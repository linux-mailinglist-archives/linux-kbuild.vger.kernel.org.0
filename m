Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B15E6634E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 00:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbjAIXPC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 18:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237691AbjAIXOt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 18:14:49 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CED3D9E3
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 15:14:46 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so11442242pjj.4
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 15:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+WOyLnDWh5S7xcrPmBfttF3Z19ifhLYlKcXHEX4tIs=;
        b=Hg3hO8JL3A/4d7/eG7rMHOUq18URfw4TuAMqoteHfbY2En4Z8wMIUbn6Wls9eAMRie
         QnLXQI25t2A60rJTTrdmJNF33LIvG8uyFd4+CHsEraCMSflZi6avawbI1nB5FYLpds7W
         x1D911LtQfYNKd6wFxU7QQ3br1mlnfaVBMZVnlMFMHOAv9KSNhFdVRrJ6WCNnZv0xfdp
         TzD7vDuBd04CjyuxJY6xN2H1+R5tZKPgoHlWi2U7uN/HZKIVASC+lC1yqyiqpWxQVmZX
         Gblyo450A3Wu0Q4yWi4Xtf835QOZOvb9WzuS1kskSfQCTaba/69HNDFgKHNb63JeXx88
         59Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+WOyLnDWh5S7xcrPmBfttF3Z19ifhLYlKcXHEX4tIs=;
        b=FAag2MUAQPnF1T5iTDBx9GV4fIb+xSear92ZN+6NEPc5+KltNRYih50MKnCNDgJus+
         D6h9kgPbrA/M/FK49/mRNHCWtJKUYa9puR73G+3U3BkiQQcRLjl5D1slWrFpvaDDo+DI
         hIYmEmSF7Jb6F2j2r8+32B0vByTqNuVnP0iYJql4CamjzbW00XkggBH9ouA1PwDp9L9T
         h5r8rHtkcL9VBWVrTtry/dyWjln0fukcvqOVa+jotACX0ObSnhZ2aip/EIO/+c2FXJja
         BQIPaIqJQQwcibWCO+6Npn/UXTDSIL4MJDGCa4DMdWk+BwSS25/ePqmPoVDMZixN+iJ4
         5x8Q==
X-Gm-Message-State: AFqh2kq53euCh3xasFE23pnFu0mO+q+Yavo636bg6OjaZycxHn082NP6
        BoV+mX23Zp2dalKCmoc6+ZaL+nMqchi7wAid9SEbHQ==
X-Google-Smtp-Source: AMrXdXsB3ryalN8D7oA3yt3g9w8IcGiWFckF3wJZX8uc1YDF62989GrGh+WqKFfUXH6OhRUTzaYeOT+I2KPSfz2kMDM=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr2205324pjh.102.1673306085681; Mon, 09
 Jan 2023 15:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951@gate.crashing.org>
In-Reply-To: <20230109222337.GM25951@gate.crashing.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 15:14:33 -0800
Message-ID: <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To:     Segher Boessenkool <segher@kernel.crashing.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org,
        trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev,
        npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
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

On Mon, Jan 9, 2023 at 2:29 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Hi!  Happy new year all.

HNY Segher! :)

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
> It is required by POSIX (for the c99 command, anyway).  It *also* is
> required to be supported when producing object files (so when no linking
> is done).
>
> It is a GCC flag, and documented just fine:
> https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s
>
> (Yes, that says it is for linking; but the option is allowed without
> error of any kind always).
>
> (ASFLAGS sounds like it is for assembler commands, but it really is
> for compiler commands that just happen to get .S input files).
>
> > The patch seems fine to me, but what was this ever supposed to be?
> > FWICT it predates git history (looking at
> > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
>
> Yeah, good question.  This compiler flag does the moral equivalent of
> strip -s (aka --strip-all).  Maybe this was needed at some point, or
> the symbol or debug info was just annoying (during bringup or similar)?

Ah right! Ok then, I think we might keep the patch's diff, but update
the commit message to mention this is a linker flag that's unused
since the compiler is being invoked but not the linker (the compiler
is being used as the driver to assemble a single assembler source
without linking it; linking is then driven by the linker in a separate
make rule).

Then we might want to revisit that s390 patch, too?
https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org/

>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
>
>
> Segher



-- 
Thanks,
~Nick Desaulniers
