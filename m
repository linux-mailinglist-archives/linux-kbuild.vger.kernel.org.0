Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241A524918E
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 01:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgHRXvZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 19:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgHRXvZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 19:51:25 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0027CC061389;
        Tue, 18 Aug 2020 16:51:22 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id t6so10487768qvw.1;
        Tue, 18 Aug 2020 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lo6iZLl7xE7OzIfrLMy/9DpiSarjn7eEJS7aRAeCfMo=;
        b=THN0APLDMqb2cLMhFHkO9+wC4AfYiMVPXep4tRXCgXS9mUN1zMAfDH2TgtkZUh2aHj
         WKemY2BuPrItRscDqpWtxeuqxn7oF3a2zg2ve1piL54VEPFWMJy/uA7xtVg5eyRR55QP
         eNRwdmVEgN0tGmX3+i5adL6HfusxMsrQYlMGnPzyHUwUHZzS5igDS+hmO7xGefDrHAjc
         6QEFHmLVnIXK+MiZILRKqsgGZJ1BE7MAJ+aX4xNYJZ+6KotCrwVlcX8IEk2Ev3ShbxbT
         o9IlaANh3EIFKVq2/rbNW6NRk+/aPyV0AgtTFCPzkexyVn3h0evAo+UwQz2qsAR/C7pi
         LCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Lo6iZLl7xE7OzIfrLMy/9DpiSarjn7eEJS7aRAeCfMo=;
        b=nLH1jaKk4qxIvJNwyIwXCdE9is9pDXxlLdMqnHikjHWszALPxBqQfVZl7MscEElQp2
         X7LoGxnbq0S8LA4jafPNlgpRlAauuRTHNGlB3urTX+4PvQ2O6oac6AEOLashh4bgX3f4
         fwoho5fMURCxZxLaVb7QTPm0avihTBCrp6JfgMtyh9lSB+BUjsRD2POS3tuZWj8ZsG30
         ACJdFtI9uDPour5udtH/RrBQWpbRm1Nm0WFaok1eYii6lzuMkqbcUHFPlpmJEV1/KNsN
         58Xe/bFOtX8P+sKqbo4e3c9z1iIQ53YdmJLHCFPJPtjBjTr3eR0TgQXpxzO1CRDTntvV
         DQJA==
X-Gm-Message-State: AOAM531qln6N/PW2ZMWd/9AG/OaCzVKLHcVGJZh/fnd2j9ahFYItXL9S
        zbzP+kMhRGni+Rp2F8mnxkk=
X-Google-Smtp-Source: ABdhPJz10xNEeu79aDW1NwxFJUjonsYSOUgQSPf0CDG3llEWl2zeHgZ/dASUCxFuvnFMBMICLOmpog==
X-Received: by 2002:a0c:e102:: with SMTP id w2mr21475510qvk.51.1597794681903;
        Tue, 18 Aug 2020 16:51:21 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id n184sm22515319qkn.49.2020.08.18.16.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 16:51:21 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 18 Aug 2020 19:51:18 -0400
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Eli Friedman <efriedma@quicinc.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200818235118.GA3380006@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <20200818222542.GA3254379@rani.riverdale.lan>
 <CAKwvOdmfiD1TNqRvFuX07BqonYzh1eKFE9mFmOpaSyrbR0d5Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdmfiD1TNqRvFuX07BqonYzh1eKFE9mFmOpaSyrbR0d5Lw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 03:59:45PM -0700, Nick Desaulniers wrote:
> On Tue, Aug 18, 2020 at 3:25 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > Another thing that needs to be fixed is that at least lib/string.c needs
> > to be compiled with -ffreestanding.
> >
> > gcc-10 optimizes the generic memset implementation in there into a call
> > to memset. Now that's on x86 which doesn't use the generic
> > implementation, but this is just waiting to bite us.
> >
> > https://godbolt.org/z/6EhG15
> 
> I'll let you send the patch for that this time.  (It's too bad godbolt
> doesn't have newer versions of GCC for cross compilation...cant test
> aarch64 gcc-10, for example.)  It would be interesting for sure to see
> resulting differences in disassembly observed in lib/string.o with
> -ffreestanding.

https://lore.kernel.org/lkml/20200818234307.3382306-1-nivedita@alum.mit.edu/

> 
> But, oof, that's not good.  Certainly impressive and powerful loop
> idiom recognition, but wouldn't you consider it a bug that this
> optimization should probably first check that it's not replacing part
> of a loop with a potentially recursive call to itself?

Difficult to check that in general, but I would have thought they'd at
least add a check for memset directly calling memset. It looks like they
considered that but then decided to go with -ffreestanding disabling the
optimization. Even gcc 4.x does it :)

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56888

> 
> Admittedly, we've had the same shenanigans with memcpy implemented in
> terms of calls to __builtin_memcpy being lowered to infinitely
> recursive calls...which feels like the same kind of bug.  ("You wanted
> infinite recursion in the kexec purgatory image, right?" "No,
> compiler, I did not.")  example: https://godbolt.org/z/MzrTaM
> (probably should fix this in both implementations; at the least I feel
> like Clang's -Winfinite-recursion should try to help us out here).
> 
> Feels almost like it may be difficult to provide an implementation of
> memset without stepping on a landmine.  One thing I'd be curious about
> is whether all of lib/string.c would need -ffreestanding, or if you
> could move just memset to its own TU then use -ffreestanding on that.
> A free standing environment must always provide a core set of
> functions like memset, memcpy, memcmp, memmove, according to
> https://gcc.gnu.org/onlinedocs/gcc/Standards.html.  Maybe those four
> should be in a separate TU compiled as -ffreestanding, so that they
> can never be lowered to calls to themselves (potentially infinitely
> recursive)?
> -- 
> Thanks,
> ~Nick Desaulniers

I think all of it should be freestanding. Since eg the compiler could
recognize strcpy and turn it into a call to strcpy.

It turns out that at least memcpy can also be recognized, but gcc only
does that if the arguments have the restrict qualifier, so the version
in the kernel doesn't get broken.
