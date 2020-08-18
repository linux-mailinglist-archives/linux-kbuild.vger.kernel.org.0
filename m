Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31578248E9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 21:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgHRTZo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 15:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgHRTZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 15:25:42 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE7BC061342
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:25:42 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ep8so9675980pjb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/VmA06WjlqS7hJumtglP3Mb+v0u9+PDAlYaWZ4/eDGk=;
        b=NuXj/bviyolsRmu1RDbGz62VrMp2i+ohDBzBrMXgR+/HnFYFj/0i0LEFqlai3FiY2c
         kuQgJP40nkVZmAvEHb01vxOtwtfup5F8I4t3mmfPA+JMwR2OdWbevHG/++mRPaoSZ+h6
         Z/neGTcxbz6ZHKdi4jqvnpQ4DQ8Cy5OdPvx3EMxID0/JEPk+WBINjqEkq3YcIbZmoS2r
         1B7rxYFTF2g1fMnX1C70UCaAcNU/xYAcR/TZpQqoOOKgNip49d0iNQhJGyD+AV/QVjCh
         TRn/YZCIZQDPIXv4IxI3aAoQ+nmd0FFaUsj7vVZz7F5wClGHzyNTrcwNLtaaVTN+eYKe
         U/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/VmA06WjlqS7hJumtglP3Mb+v0u9+PDAlYaWZ4/eDGk=;
        b=LhlM4fwrnUDP6T/7A5Fzde3uY5GtnXM/fikTyzWZYDxfx2lg9fIHz/SYMpzix70Q43
         EAPq5zU4Zc2kKr/uUSqpw+FCyh/qLn8dSSdeJmbn5NQSTM/qh4BdC1f2LCKhRb3OKvKo
         bSFDmJ5+7GB0HIZd1U4vb0Etp3MkoAUmBZmZR9sg9jX2YR4s/SxKfbLTw9wX0MjEbBzN
         TS0pCyNO2IkVazNLRD/DfJwjSpGFpAA/isg7YV92U96NTA0H2/ydd6raOSFoIU9/Fy3g
         7A9Y6YwMMQfH+Sq7/CQsfl8XmpP+wgM+jwexz+gEFN6Yxi/z7uVrx5wpsyhv4v+jor3V
         Y05Q==
X-Gm-Message-State: AOAM531jmwSqzqwc5dv6QnZvVo8jJtDpUxAxMEfjY9J2Ya54V+DkOBdZ
        eo/1B2HAJkzctf0JLTZ/ztcD+XZTy6G9ejBz4KVQtw==
X-Google-Smtp-Source: ABdhPJwxx1f0NE1gsAd0REazhAGW9P8NHb/mLCL8RGa65Vokt+VBDaggXlEgOnSEpKnk0JZgk7WbE+XpHf3q4L/Ml+g=
X-Received: by 2002:a17:90a:a10c:: with SMTP id s12mr1162103pjp.32.1597778741520;
 Tue, 18 Aug 2020 12:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
In-Reply-To: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Aug 2020 12:25:30 -0700
Message-ID: <CAKwvOdkut+GTLxX9U=hxDC8SaugW487XD_98d9yFU2VzShyz0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Clement Courbet <courbet@google.com>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
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

On Tue, Aug 18, 2020 at 12:19 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
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
> And honestly, a compiler that uses 'bcmp' is just broken. WTH? It's
> the year 2020, we don't use bcmp. It's that simple. Fix your damn
> broken compiler and use memcmp. The argument that memcmp is more
> expensive than bcmp is garbage legacy thinking from four decades ago.
>
> It's likely the other way around, where people have actually spent
> time on memcmp, but not on bcmp.
>
> If somebody really *wants* to use bcmp, give them the "Get off my
> lawn" flag, and leave them alone. But never ever should "use bcmp" be
> any kind of default behavior. That's some batshit crazy stuff.
>
>                Linus

You'll have to ask Clement about that.  I'm not sure I ever saw the
"faster bcmp than memcmp" implementation, but I was told "it exists"
when I asked for a revert when all of our kernel builds went red.
-- 
Thanks,
~Nick Desaulniers
