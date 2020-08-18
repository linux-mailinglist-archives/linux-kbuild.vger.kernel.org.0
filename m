Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0796248F93
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 22:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgHRUYN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 16:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgHRUYK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 16:24:10 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEBEC061389;
        Tue, 18 Aug 2020 13:24:10 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id b2so10203605qvp.9;
        Tue, 18 Aug 2020 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FN5WVca8g0lZzsHLJ8keJk1VvNzHhQryY0MT+wdL1rs=;
        b=fqI5vxxdAdZ19Zsfnqp0P429m0BNQqUJ+Z2vwxcaHb86Nx0pO1YP06Je/uHZ11JGGk
         yv2r9Ri6hhRd5TnAaRruClLCgVEL0Fv+H/ZBFe65Qzz5epAShmFSdBe/BgtvGjO7GXNS
         Ad9VX/m1TlYx4f7bgQwXeozOQPlmSglnWC5HXSRWmjzqZ9XEJrVNPYBO83s5jvQvs6bO
         DBH5JYU8nwHiAT59xvaLkyyNOUzsqSsJ+fTfiNzUoSY/YfBVlL6pnB/7JW+mbmKstwHV
         GTT+luueyxE66T3/+p+eLQ0hJlTjMeHghltgABfriINehdxa8gFLSPo/nSt7wGo2B1uN
         biHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=FN5WVca8g0lZzsHLJ8keJk1VvNzHhQryY0MT+wdL1rs=;
        b=sv1pn6tiPUldrsOCsMRttjSqjYsEb2Jc7gPRAmPOjHLyXAgR4+S9aWZ6wufehq6HeX
         bE1Pixy/Eiqu3z5AnvUYhOwWqUxQtOE1SMryweE5IFVKnCT/g5KFzYJGyLImWr2lUwiW
         JjHtcH3CTi5rKwzFRB16gF64OdFRiU9wNHMyiD/0wp+P1xnd/9MCL4mkOIMuCwYJW/P0
         WB8E6a6AUNOXP4p3u6VywIoUA6WenONSPGHGvojx/zYwnx0/xMp/+WXiAU1DReFBXqsO
         ckCt6+WBFTm08ZOIxx1himaOKHAfoVvi7fGh+dwHwgX1up9wsI8K5jgP1UJU5oS+7n8D
         bbVQ==
X-Gm-Message-State: AOAM531fqLzOJklR3G9AHD7n7QgU/SKrtl8HjFl5KGAAdT9VBw+Z8CMs
        5HaW/d4l6URjlAfTpUHmTmU=
X-Google-Smtp-Source: ABdhPJzfx+wkjFI8S8WDNpbHy7FYmQWpT5C9LnamhEYOIuxBqAwbpajb0e4u5sImu58IKRaTrUUajQ==
X-Received: by 2002:ad4:518b:: with SMTP id b11mr21112217qvp.139.1597782249782;
        Tue, 18 Aug 2020 13:24:09 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id i20sm21533483qka.17.2020.08.18.13.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 13:24:09 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 18 Aug 2020 16:24:07 -0400
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
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
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200818202407.GA3143683@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
> On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > I'm not saying "change the semantics", nor am I saying that playing
> > whack-a-mole *for a limited time* is unreasonable. But I would like to go back
> > to the compiler authors and get them to implement such a #pragma: "this
> > freestanding implementation *does* support *this specific library function*,
> > and you are free to call it."
> 
> I'd much rather just see the library functions as builtins that always
> do the right thing (with the fallback being "just call the standard
> function").
> 
> IOW, there's nothing wrong with -ffreestanding if you then also have
> __builtin_memcpy() etc, and they do the sane compiler optimizations
> for memcpy().
> 
> What we want to avoid is the compiler making *assumptions* based on
> standard names, because we may implement some of those things
> differently.
> 

-ffreestanding as it stands today does have __builtin_memcpy and
friends. But you need to then use #define memcpy __builtin_memcpy etc,
which is messy and also doesn't fully express what you want. #pragma, or
even just allowing -fbuiltin-foo options would be useful.

The two compilers have some peculiarities, which means you really can't
have functions with the same name that do something else if you want to
use builtins at all, and can also lead to missed optimizations.

For eg, __builtin_strchr(s,'\0') can be optimized to strlen. gcc will
optimize it that way even if -ffreestanding is used (so strlen has to
mean strlen), while clang won't, so it misses a potential optimization.
This is admittedly a silly example, but you could imagine something like
strncpy being optimized to memcpy+memset if the source length was
previously computed.

PS: clang optimizes sprintf, but doesn't provide __builtin_sprintf?
