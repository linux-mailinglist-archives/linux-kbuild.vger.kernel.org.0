Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79AF248E75
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 21:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgHRTNp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 15:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHRTNo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 15:13:44 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F20C061342
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:13:43 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j22so10808563lfm.2
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kRmD2QbAj0vfmoNVvNMP8rPvVPoSWyCAf8x4746i4Lw=;
        b=ZiA1XO+PyilZibQ5JpzVQt282FyQ/PBbpJhA+sKTp1s1vswJWQf1scFga1vTAE+ARg
         4xqurqK3liy7M7SNb2CHhwbyLKyZXfPwxp4DydMZ8KOiGYBOiuCjfb3aUjYuibGo3rSq
         HTV4diqJba5aOLalPMWyrvr+6H/PSP3/9c4Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kRmD2QbAj0vfmoNVvNMP8rPvVPoSWyCAf8x4746i4Lw=;
        b=M0fksJ0LZvKnXlfW8RSH6CHeQgZjdBvkC3v6fL36AQcjZAprb+KMEYaGjJijM/DhCK
         WtdyGUBZYytfP4bSRt2BKr7EccBlvAxPuN5GqlDn8HJuRA/yHX0k2a0u/laM8wY/CjB5
         zdqtuiTpjCEp06ct4SAlVkmP1cAWuzMd6jCavg/Lw/G9SEFbNbj+nvq1erqKDDDJVZbX
         nPuu7xWIlY8tHidEZQ3CPZoQPiR5O4l4/ANsKo8S1Nuqd8vO81ojN8crQIw/+cR3c/4S
         fjO+jG/h9JC39TWsNXrW0cBswMRPKrOEyPb/zsEUzfoQtXFIyBT3EMAM/UAjX3Z+bZ10
         2oXw==
X-Gm-Message-State: AOAM53024o8hcWIf755UuF2cW6BBmKWDmQuwsAW4MgcgEMzz4AGvlTcB
        S3vfWModhLAyqjNG+8IAetsuDumj8Xf4cw==
X-Google-Smtp-Source: ABdhPJw4D2Ev4tEDAlAig1RAp9EVdNE8ZiiPSPA8KwnUxf0wI6uMieSOoCBGI94fTwy3MjkQ8La2ew==
X-Received: by 2002:a05:6512:63:: with SMTP id i3mr10657766lfo.116.1597778020392;
        Tue, 18 Aug 2020 12:13:40 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id m142sm6745653lfa.47.2020.08.18.12.13.38
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 12:13:39 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id i10so22689665ljn.2
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:13:38 -0700 (PDT)
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr11115885ljp.312.1597778018119;
 Tue, 18 Aug 2020 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
In-Reply-To: <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 18 Aug 2020 12:13:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
Message-ID: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
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
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
>
> I'm not saying "change the semantics", nor am I saying that playing
> whack-a-mole *for a limited time* is unreasonable. But I would like to go back
> to the compiler authors and get them to implement such a #pragma: "this
> freestanding implementation *does* support *this specific library function*,
> and you are free to call it."

I'd much rather just see the library functions as builtins that always
do the right thing (with the fallback being "just call the standard
function").

IOW, there's nothing wrong with -ffreestanding if you then also have
__builtin_memcpy() etc, and they do the sane compiler optimizations
for memcpy().

What we want to avoid is the compiler making *assumptions* based on
standard names, because we may implement some of those things
differently.

And honestly, a compiler that uses 'bcmp' is just broken. WTH? It's
the year 2020, we don't use bcmp. It's that simple. Fix your damn
broken compiler and use memcmp. The argument that memcmp is more
expensive than bcmp is garbage legacy thinking from four decades ago.

It's likely the other way around, where people have actually spent
time on memcmp, but not on bcmp.

If somebody really *wants* to use bcmp, give them the "Get off my
lawn" flag, and leave them alone. But never ever should "use bcmp" be
any kind of default behavior. That's some batshit crazy stuff.

               Linus
