Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D717D24908C
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 00:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgHRWFv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 18:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgHRWFr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 18:05:47 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E80C061389;
        Tue, 18 Aug 2020 15:05:45 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id u126so22650632iod.12;
        Tue, 18 Aug 2020 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dQQ7nxmbbtqPjMJ2v1Fd/tVads8v7A1o12xPycfzDck=;
        b=YlDFccnv1UsuHHlQzmM690C7v5BvX0FQV4SVnxlk1r34xvRCg89M4up+6M50Vk9wEE
         Y2AteDF2L+d+fP3EhlI1cwk+MOKK68zbdaMsRaneQgG0Qa50cTFaOtYUXpuQteQPYRuw
         HI/01vu5IL39hjTzCS81cCrcLUFZbFmKjwRyf5JPcQ2k4wye8vdDWxwAxy2rtMcJdOB+
         +7XGA3O3cbaIP2O0UmO8u7wA+l3zoCyuxw5sOQZHJHpTR5PSsjTleP9w5PGSH7anFPQC
         XHa3Ipk8wHGiDURmM9E3vujONTW1+d3dZ/FS3T5Sa+vndQVzaM7prYOsZXwebQb5uA5q
         jYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dQQ7nxmbbtqPjMJ2v1Fd/tVads8v7A1o12xPycfzDck=;
        b=TDQH71yUdbjoHZzehoR0/toGCpruJ/rVviPowD8/V5iQSvqEE9XStkA7u5cyDYfZev
         Ra68CTtOyL5ELG34a57yuzjOC+QS6B/bFh1l9AXDyNVtP2qadkIwZZrzuiRtUSoV8VPO
         JPyJG/jw4WviDZ4PU2FkGw5gQ2g/yMfoDOTefMA7v0cHL0HFdT02+nblMqS9P5z5tRgl
         CK9QO++Ow3fBVjJjProYNOkCEzf/YdQxFhixWNTm/Xu2kXVMQ/KIvPev82eOW+I7G2rP
         r+cU24AZ4El9Y3W6s5AeJlcN7FgHzPqsT9Fb8SadH2LLMJzNf2uFgvRKaU89aqdVB1G8
         Lkqg==
X-Gm-Message-State: AOAM532vW5DxSDN8rbeizUEceD11oM8ATbnqK2xk38kyTvwyXyXvnewN
        fHfpljyLR59IQYFucWEGPWs7q0V1ZJ27S6IjY2Q=
X-Google-Smtp-Source: ABdhPJxSul2CgvgJsr+gxMYAytA+CCKs5CyZNyNI4AEkrKww4DBx6RbQLmuzZWsruLM+ETlPn8/0PVdVmUf+gjRqdX4=
X-Received: by 2002:a05:6638:594:: with SMTP id a20mr21415996jar.127.1597788345058;
 Tue, 18 Aug 2020 15:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <CAKwvOdnW8zjcxmHwu5PhHa1hMFu=S=qPh5gfC6tN7FrSE+3kKg@mail.gmail.com>
In-Reply-To: <CAKwvOdnW8zjcxmHwu5PhHa1hMFu=S=qPh5gfC6tN7FrSE+3kKg@mail.gmail.com>
From:   =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>
Date:   Wed, 19 Aug 2020 00:05:34 +0200
Message-ID: <CAOrgDVO=NBaqGP2Fs6X4FHeLfbaAA7Km8i2ttcGf0kwfojmVSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Eli Friedman <efriedma@quicinc.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
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
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Here:
https://godbolt.org/z/qjo5P6

st 19. 8. 2020 o 0:00 Nick Desaulniers <ndesaulniers@google.com> nap=C3=ADs=
al(a):
>
> On Tue, Aug 18, 2020 at 2:41 PM Arvind Sankar <nivedita@alum.mit.edu> wro=
te:
> >
> > On Tue, Aug 18, 2020 at 01:58:51PM -0700, Nick Desaulniers wrote:
> > > On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.ed=
u> wrote:
> > > > >
> > > > > On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
> > > > > > On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com>=
 wrote:
> > > > > > >
> > > > > > > I'm not saying "change the semantics", nor am I saying that p=
laying
> > > > > > > whack-a-mole *for a limited time* is unreasonable. But I woul=
d like to go back
> > > > > > > to the compiler authors and get them to implement such a #pra=
gma: "this
> > > > > > > freestanding implementation *does* support *this specific lib=
rary function*,
> > > > > > > and you are free to call it."
> > > > > >
> > > > > > I'd much rather just see the library functions as builtins that=
 always
> > > > > > do the right thing (with the fallback being "just call the stan=
dard
> > > > > > function").
> > > > > >
> > > > > > IOW, there's nothing wrong with -ffreestanding if you then also=
 have
> > > > > > __builtin_memcpy() etc, and they do the sane compiler optimizat=
ions
> > > > > > for memcpy().
> > > > > >
> > > > > > What we want to avoid is the compiler making *assumptions* base=
d on
> > > > > > standard names, because we may implement some of those things
> > > > > > differently.
> > > > > >
> > > > >
> > > > > -ffreestanding as it stands today does have __builtin_memcpy and
> > > > > friends. But you need to then use #define memcpy __builtin_memcpy=
 etc,
> > > > > which is messy and also doesn't fully express what you want. #pra=
gma, or
> > > > > even just allowing -fbuiltin-foo options would be useful.
> > >
> > > I do really like the idea of -fbuiltin-foo.  For example, you'd speci=
fy:
> > >
> > > -ffreestanding -fbuiltin-bcmp
> > >
> > > as an example. `-ffreestanding` would opt you out of ALL libcall
> > > optimizations, `-fbuiltin-bcmp` would then opt you back in to
> > > transforms that produce bcmp.  That way you're informing the compiler
> > > more precisely about the environment you'd be targeting.  It feels
> > > symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
> > > easy when there is such symmetry).  And it's already convention that
> > > if you specify multiple conflicting compiler flags, then the latter
> > > one specified "wins."  In that sense, turning back on specific
> > > libcalls after disabling the rest looks more ergonomic to me.
> > >
> > > Maybe Eli or David have thoughts on why that may or may not be as
> > > ergonomic or possible to implement as I imagine?
> > >
> >
> > Note that -fno-builtin-foo seems to mean slightly different things in
> > clang and gcc. From experimentation, clang will neither optimize a call
> > to foo, nor perform an optimization that introduces a call to foo. gcc
> > will avoid optimizing calls to foo, but it can still generate new calls
> > to foo while optimizing something else. Which means that
> > -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
> > just that gcc doesn't seem to have implemented those optimizations.
>
> Can you please share some godbolt links that demonstrate these observatio=
ns?
> --
> Thanks,
> ~Nick Desaulniers
