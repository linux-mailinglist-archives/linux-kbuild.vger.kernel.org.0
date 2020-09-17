Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9B526DAA3
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Sep 2020 13:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgIQLph (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 07:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgIQLgJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 07:36:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1AAC061756
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2020 04:35:45 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so1663475wrn.13
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2020 04:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EtH4/cbuQgykQYd+jjjiuY8limbLr894Hm1Wfr5TKQE=;
        b=MZtwfo2Wkr6xjMeQYiz0AzKCHXOeKN48g2ul8ghIqc3xiqk9zQf+HOBZ+UHRPpswvD
         9SBgHRwMaFLJDl27uhHNtO8R/rVQPrHwHvld1k1cSpz8o0eAbb3ZsN9tjQpOpqlJKGlW
         GrwSOQnzS9k0pLp3WVTGsfCkX2nwuK4/KULnQidX0PveC+EMFDCZsR5EPDsAU4hnW/C4
         FwjND5Y6WgjF+MR48bLLBhiZwio2a9ADpBpQiFIj+6TTVuegNGnGK+5dwnjCcZZiHSIO
         9G8jASY5hC9NeCi7D/s0svoVNRSESbWKf5XK5jmgjExYi5hfODHSRbI3XH+jyy9nFahP
         i+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EtH4/cbuQgykQYd+jjjiuY8limbLr894Hm1Wfr5TKQE=;
        b=Q4lrIP/BXFbwqahB/awBp3U08xeOUN8TMyBd5h57DMJoknx2ZLe/pitmokKUk0rpmG
         X4zG4gAb4vsW+5ysSxThP812ZMq4YyjRm45KHkAyG1FCsq9ITKBBBLFi4EbCUB8RfYxj
         ekzUEkuiMA+yrhACcK3asnqBDoHLQ0HpDq5MW/FSOY+LvPkXIXz2U3C3lXzinbVRJTY3
         jVOyNlKp2/vNCZQJV/pYdFitX/7i98oPS3Kt8dmmkJoiH95mzy+2JNqiy8JMZLXKMQCP
         dY2ppDmYA1X8buxNsRfuM3i102VEpMHADBsF6jGBkylxKNsTEr4257smdBRJRUFa21AL
         k3Bw==
X-Gm-Message-State: AOAM531lFArweD4URYZcTo1zYqtD/1GimgsAn+iCKxmWF4UbOJNVnDcC
        BvRApkW/M+/kWJznNOELVB1MVg==
X-Google-Smtp-Source: ABdhPJwAdcQbPsLcZZV58AgYAMNaXQbRRw54r+D+72HaJLI/PEWaAMsAwIznC1PUJ+lKzs+dj/3gLQ==
X-Received: by 2002:adf:df87:: with SMTP id z7mr32658549wrl.239.1600342544219;
        Thu, 17 Sep 2020 04:35:44 -0700 (PDT)
Received: from google.com (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id f14sm10591991wme.22.2020.09.17.04.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:35:42 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:35:40 +0000
From:   George Popescu <georgepope@google.com>
To:     Marco Elver <elver@google.com>
Cc:     Kees Cook <keescook@chromium.org>, maz@kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Brazdil <dbrazdil@google.com>, broonie@kernel.org,
        Fangrui Song <maskray@google.com>,
        Andrew Scull <ascull@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
Message-ID: <20200917113540.GA1742660@google.com>
References: <202009141509.CDDC8C8@keescook>
 <20200915102458.GA1650630@google.com>
 <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
 <20200915120105.GA2294884@google.com>
 <CANpmjNPpq7LfTHYesz2wTVw6Pqv0FQ2gc-vmSB6Mdov+XWPZiw@mail.gmail.com>
 <20200916074027.GA2946587@google.com>
 <CANpmjNMT9-a8qKZSvGWBPAb9x9y1DkrZMSvHGq++_TcEv=7AuA@mail.gmail.com>
 <20200916121401.GA3362356@google.com>
 <20200916134029.GA1146904@elver.google.com>
 <CANpmjNOfgeR0zpL-4AtOt0FL56BFZ_sud-mR3CrYB7OCMg0PaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOfgeR0zpL-4AtOt0FL56BFZ_sud-mR3CrYB7OCMg0PaA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 17, 2020 at 08:37:07AM +0200, Marco Elver wrote:
> On Wed, 16 Sep 2020 at 15:40, Marco Elver <elver@google.com> wrote:
> > On Wed, Sep 16, 2020 at 12:14PM +0000, George Popescu wrote:
> > > On Wed, Sep 16, 2020 at 10:32:40AM +0200, Marco Elver wrote:
> > > > On Wed, 16 Sep 2020 at 09:40, George Popescu <georgepope@google.com> wrote:
> > > > > On Tue, Sep 15, 2020 at 07:32:28PM +0200, Marco Elver wrote:
> > > > > > On Tue, 15 Sep 2020 at 14:01, George Popescu <georgepope@google.com> wrote:
> > > > > > > On Tue, Sep 15, 2020 at 01:18:11PM +0200, Marco Elver wrote:
> > > > > > > > On Tue, 15 Sep 2020 at 12:25, George Popescu <georgepope@google.com> wrote:
> > > > > > > > > On Mon, Sep 14, 2020 at 03:13:14PM -0700, Kees Cook wrote:
> > > > > > > > > > On Mon, Sep 14, 2020 at 05:27:42PM +0000, George-Aurelian Popescu wrote:
> > > > > > > > > > > From: George Popescu <georgepope@google.com>
> > > > > > > > > > >
> > > > > > > > > > > When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> > > > > > > > > > > the handler call, preventing it from printing any information processed
> > > > > > > > > > > inside the buffer.
> > > > > > > > > > > For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> > > > > > > > > > > -fsanitize=local-bounds, and the latter adds a brk after the handler
> > > > > > > > > > > call
> > > > > > > > > >
> > > > > > > > > This would mean losing the local-bounds coverage. I tried to  test it without
> > > > > > > > > local-bounds and with a locally defined array on the stack and it works fine
> > > > > > > > > (the handler is called and the error reported). For me it feels like
> > > > > > > > > --array-bounds and --local-bounds are triggered for the same type of
> > > > > > > > > undefined_behaviours but they are handling them different.
> > > > > > > >
> > > > > > > > Does -fno-sanitize-trap=bounds help?
> > [...]
> > > > Your full config would be good, because it includes compiler version etc.
> > > My full config is:
> >
> > Thanks. Yes, I can reproduce, and the longer I keep digging I start
> > wondering why we have local-bounds at all.
> >
> > It appears that local-bounds finds a tiny subset of the issues that
> > KASAN finds:
> >
> >         http://lists.llvm.org/pipermail/cfe-commits/Week-of-Mon-20131021/091536.html
> >         http://llvm.org/viewvc/llvm-project?view=revision&revision=193205
> >
> > fsanitize=undefined also does not include local-bounds:
> >
> >         https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#available-checks
> >
> > And the reason is that we do want to enable KASAN and UBSAN together;
> > but local-bounds is useless overhead if we already have KASAN.
> >
> > I'm inclined to say that what you propose is reasonable (but the commit
> > message needs to be more detailed explaining the relationship with
> > KASAN) -- but I have no idea if this is going to break somebody's
> > usecase (e.g. find some OOB bugs, but without KASAN -- but then why not
> > use KASAN?!)
> 
> So, it seems that local-bounds can still catch some rare OOB accesses,
> where KASAN fails to catch it because the access might skip over the
> redzone.
> 
> The other more interesting bit of history is that
> -fsanitize=local-bounds used to be -fbounds-checking, and meant for
> production use as a hardening feature:
> http://lists.llvm.org/pipermail/llvm-dev/2012-May/049972.html
> 
> And local-bounds just does not behave like any other sanitizer as a
> result, it just traps. The fact that it's enabled via
> -fsanitize=local-bounds (or just bounds) but hasn't much changed in
> behaviour is a little unfortunate.

> I suppose there are 3 options:
> 
> 1. George implements trap handling somehow. Is this feasible? If not,
> why not? Maybe that should also have been explained in the commit
> message.
> 
> 2. Only enable -fsanitize=local-bounds if UBSAN_TRAP was selected, at
> least for as long as Clang traps for local-bounds. I think this makes
> sense either way, because if we do not expect UBSAN to trap, it really
> should not trap!
> 
> 3. Change the compiler. As always, this will take a while to implement
> and then to reach whoever should have that updated compiler.
> 
> Preferences?
Considering of what you said above, I find option 2 the most elegant.
The first one doesn't sound doable for the moment, also the third.
I will edit this patch considering your comments and resend it to the
list.
Thank you for your support.

Thanks,
George


