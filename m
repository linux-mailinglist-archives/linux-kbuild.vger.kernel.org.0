Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3458C2CADE1
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 21:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgLAU4p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 15:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgLAU4o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 15:56:44 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F1AC0613CF
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 12:56:04 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t3so1933584pgi.11
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jvZxaR1uxdRFvn7XeforUrhpQcomda06FE9z8v9SF+I=;
        b=TFwSRXZw8tzrXF6TjZXpiOFHg1eTcIgsU/gnBsZvwrvBMi/VZtwhWsjJP6MDcyV7Xq
         EY1E3QlJDD2LP1zBZrGfMVxa/86yeHYBcTCHMhgcRUuE1NU55SXri1WRb5qI4RcXvbGK
         JWM4/WDllREpTawjswqFJddFIBj+qQ75I3XUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jvZxaR1uxdRFvn7XeforUrhpQcomda06FE9z8v9SF+I=;
        b=gx35gQtcOkgw7CzQ3+SBx/dtXgvb8f905e6KkVfoBdYQGRZtUdH2a9fvDLd6baDZ9D
         lHrCq6y9faam6P92qfveH5C2sq+bmgfnQl2yT0jOX9ms4oVcgOyaWbtNHk/jgt0FD0pi
         1D8DuM1r3qIeOlw6SwDFODeWCIQ/D3FTQd09UgRyWBgQlmJhD4xXKIIPZ7SWEpaYTy6m
         z2iWGOcMDkPa1Vbas1xQ6+cpsOJcqpCmuKWe9UezFZZ8wXLNK4LXcw0WBfXg8BVy2obF
         NQM8O2KTlf5ubtC2LhvR3B3VCpOJp09xANPwT0QnnhWajbrtjS1Bl+cF/NcvWubobRyJ
         9/Cw==
X-Gm-Message-State: AOAM531lXTEq6BgGCor2H1ErcZhON0I4tFZyO96nX1CuKRi2YKdkAZsC
        K2o9fUsRC1A1HH0zFWoVqgbEBw==
X-Google-Smtp-Source: ABdhPJzCxMuBuZrRcsbYPBK43PxlNzAPIn7sX9mea5Y6YmB2SSRco81+JiT9a3Pib4DSr+575XOIFA==
X-Received: by 2002:a62:293:0:b029:197:96c2:bef6 with SMTP id 141-20020a6202930000b029019796c2bef6mr4299536pfc.62.1606856164000;
        Tue, 01 Dec 2020 12:56:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i26sm597443pfq.148.2020.12.01.12.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 12:56:02 -0800 (PST)
Date:   Tue, 1 Dec 2020 12:56:01 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <202012011255.9D677ED3@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook>
 <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 01, 2020 at 10:31:37PM +0900, Masahiro Yamada wrote:
> On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > > along with a few others. Newer versions of ld.lld do not have these
> > > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > > Reported-by: Mark Brown <broonie@kernel.org>
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > >
> > > Thanks for the additions in v2.
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > I'm going to carry this for a few days in -next, and if no one screams,
> > ask Linus to pull it for v5.10-rc6.
> >
> > Thanks!
> >
> > --
> > Kees Cook
> 
> 
> Sorry for the delay.
> Applied to linux-kbuild.

Great, thanks!

> But, I already see this in linux-next.
> Please let me know if I should drop it from my tree.

My intention was to get this to Linus this week. Do you want to do that
yourself, or Ack the patches in my tree and I'll send it?

-Kees

-- 
Kees Cook
