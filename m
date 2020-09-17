Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395DF26E834
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 00:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgIQWVu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 18:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIQWVu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 18:21:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CBCC061756
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2020 15:21:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id v14so1924929pjd.4
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2020 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9DPIpM4LW2/8oZNQwQFTEuyuoQvJ/tNgC5mR+LCoUuA=;
        b=ciFNzf+hWaaGAKU6nkGzF1KKLKx3MJ70q8Ni0LPweKihXGvpq6moFu4zD/nw+2Lsu2
         hG7z5Vbe2Fr+pZbcXaXgeQOOcwOSHXdKYdGRyAb3lYBBjHrdV/XrZmxlXYGyh8CQWs4j
         ANuu2VhQPJzyzwyw6dJ3li/I9SmdUgDjG3jzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9DPIpM4LW2/8oZNQwQFTEuyuoQvJ/tNgC5mR+LCoUuA=;
        b=U+GX4dk+Sbu0g4LmR7koYa9AhkfJh4WcK0XzGUwiY+m6Nc/PUrNw19JjIhdr9+499J
         xc+c/84CqNH9/v54AixiTTyIPxhnzU8kuu+fJZ+ClUQPjHcVwqo3XN1OuAvTnDZWGSj+
         VtI68ovZ1+4Z1P5n7VUmv0jif5wWZvWV/5ARNijgSQDppJzcnsuGg1Fnlwhs9UpbdaAE
         SZWT3GZ6GoHmw0OmMLWduH6+f7ewc9phfZncVMKiO8sCylfwF+ZLOe8NfcZkOhvYy9mh
         O9YQbbCme31xxmbYvEcugBj/3W9cmAFrmmGVYXpKjcIclkdcKCOhX/rHu4yiH/KMKItI
         v9gg==
X-Gm-Message-State: AOAM53293C8468t8U4IwGxqfMwup4VehyFwbk7tUOh3wpBHixzXBCGcD
        ZSqET4AHYEGd81ilYcM/gPH2LA==
X-Google-Smtp-Source: ABdhPJwbTUDkLG7CpK2l4q0THRgaxSIQsaFQZa0MeaaJn7k/XwhUlLp3dEUsHAcW8oF24GhOQ/5eBg==
X-Received: by 2002:a17:902:c212:b029:d1:e629:92f4 with SMTP id 18-20020a170902c212b02900d1e62992f4mr12676668pll.75.1600381309149;
        Thu, 17 Sep 2020 15:21:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m5sm627685pjn.19.2020.09.17.15.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 15:21:48 -0700 (PDT)
Date:   Thu, 17 Sep 2020 15:21:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     George Popescu <georgepope@google.com>
Cc:     Marco Elver <elver@google.com>, maz@kernel.org,
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
Message-ID: <202009171519.951D26DB@keescook>
References: <20200915102458.GA1650630@google.com>
 <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
 <20200915120105.GA2294884@google.com>
 <CANpmjNPpq7LfTHYesz2wTVw6Pqv0FQ2gc-vmSB6Mdov+XWPZiw@mail.gmail.com>
 <20200916074027.GA2946587@google.com>
 <CANpmjNMT9-a8qKZSvGWBPAb9x9y1DkrZMSvHGq++_TcEv=7AuA@mail.gmail.com>
 <20200916121401.GA3362356@google.com>
 <20200916134029.GA1146904@elver.google.com>
 <CANpmjNOfgeR0zpL-4AtOt0FL56BFZ_sud-mR3CrYB7OCMg0PaA@mail.gmail.com>
 <20200917113540.GA1742660@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917113540.GA1742660@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 17, 2020 at 11:35:40AM +0000, George Popescu wrote:
> On Thu, Sep 17, 2020 at 08:37:07AM +0200, Marco Elver wrote:
> > So, it seems that local-bounds can still catch some rare OOB accesses,
> > where KASAN fails to catch it because the access might skip over the
> > redzone.
> > 
> > The other more interesting bit of history is that
> > -fsanitize=local-bounds used to be -fbounds-checking, and meant for
> > production use as a hardening feature:
> > http://lists.llvm.org/pipermail/llvm-dev/2012-May/049972.html
> > 
> > And local-bounds just does not behave like any other sanitizer as a
> > result, it just traps. The fact that it's enabled via
> > -fsanitize=local-bounds (or just bounds) but hasn't much changed in
> > behaviour is a little unfortunate.
> 
> > I suppose there are 3 options:
> > 
> > 1. George implements trap handling somehow. Is this feasible? If not,
> > why not? Maybe that should also have been explained in the commit
> > message.
> > 
> > 2. Only enable -fsanitize=local-bounds if UBSAN_TRAP was selected, at
> > least for as long as Clang traps for local-bounds. I think this makes
> > sense either way, because if we do not expect UBSAN to trap, it really
> > should not trap!
> > 
> > 3. Change the compiler. As always, this will take a while to implement
> > and then to reach whoever should have that updated compiler.
> > 
> > Preferences?
> Considering of what you said above, I find option 2 the most elegant.
> The first one doesn't sound doable for the moment, also the third.
> I will edit this patch considering your comments and resend it to the
> list.

I have a slightly different suggestion that is very nearly #2 above:
split local-bounds into a separate CONFIG that requires UBSAN_TRAP, and
then carefully document both:
- what does it catch that "bounds" doesn't
- why it only operates in trap mode

The rationale I have is that I don't like the coverage of some
mitigation or detection to "silently" vary between builds. e.g. someone
would build with/without UBSAN_TRAP and end up with unexpectedly
different coverage. I'd rather there be a separate CONFIG that appears.

-- 
Kees Cook
