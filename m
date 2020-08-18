Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CA224904B
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 23:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgHRVlw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 17:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRVlu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 17:41:50 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1F7C061389;
        Tue, 18 Aug 2020 14:41:50 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id o2so10307887qvk.6;
        Tue, 18 Aug 2020 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BV9nHKz7rPkGsIi+O/4jfrEZv5isGZdcPFjOb+WDLfE=;
        b=FOJz8GdjccX2cbuIKuz3pWT2p0F7/c+kmfoN5iv5WhhsrWwDZYzIjgnJz95owS6WI3
         UBG8sBpdx3nD+nnfuhMyblLHdjf6LGvd4UVn8Q00VFxenPEsBtLh0Ukr+Q4h7/EoJPw0
         d8qeXzJqxja8gZznvZhwvj1FgcbpiHi/uBrljyr8ia2qp0uiWQkFPcKsf9SEUsLWIZR6
         a+mKks42+TALVES2XNxnCqw3BNWp1pXPTmTJrjCtJvFCHqUAbN7FbKrvxlRhYKLE7kpM
         R7q+oA+uJ9dLf8bWgVEZ9+8dkF2+web4Qn/ym1VY+fSXhqJA3LcpeAhHgeUDJk1O5YvM
         QmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=BV9nHKz7rPkGsIi+O/4jfrEZv5isGZdcPFjOb+WDLfE=;
        b=OSQxc/N2T0amw2Uz8tGa/mJBLVzSnPT+8WwPA1mr6IVfuN42scswUCm+qijP0hSr64
         sFiXpWn/9PRWC3cjiuacBKTg+RMwUBLq93HrTB+tIBe1DNqkYkdABWCXAz/UHePHtfFd
         eb0PfstXEY281FBxOFBmePUS5840o1bDAlVMZ500l9eN2FTXSMISYhAVz2yK/+cT2cZU
         kG84TjJrbQ6IKaV81u2905fAWTE7B6mZ4IlO+8PJgGyV5Zw2rHDrJBUf8ifyUX+cpd9h
         OeLqdw7wgQ3WKxJyNidrQXOVhv1+jZe8r+xIyN6NtBiXEdLreJY3+9FJ4Ff7Why3PVp6
         JGPg==
X-Gm-Message-State: AOAM531thbjeNYlaNqIFEAmVCVHowr0k/mVIzF2A0g5NyMra20fzVpfy
        DtNJx4Hsv8dzWJZn95O8Fw4=
X-Google-Smtp-Source: ABdhPJx5kcAVLuRFF9ITUCoLkZdpuIlDMsxtqawjNkk6t/OVjcVpSXec18EcaffoQOJd+IPXDxS1KA==
X-Received: by 2002:a05:6214:290:: with SMTP id l16mr21439284qvv.187.1597786909673;
        Tue, 18 Aug 2020 14:41:49 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id i30sm26355390qte.30.2020.08.18.14.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:41:49 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 18 Aug 2020 17:41:46 -0400
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
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
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200818214146.GA3196105@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 01:58:51PM -0700, Nick Desaulniers wrote:
> On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > >
> > > On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
> > > > On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
> > > > >
> > > > > I'm not saying "change the semantics", nor am I saying that playing
> > > > > whack-a-mole *for a limited time* is unreasonable. But I would like to go back
> > > > > to the compiler authors and get them to implement such a #pragma: "this
> > > > > freestanding implementation *does* support *this specific library function*,
> > > > > and you are free to call it."
> > > >
> > > > I'd much rather just see the library functions as builtins that always
> > > > do the right thing (with the fallback being "just call the standard
> > > > function").
> > > >
> > > > IOW, there's nothing wrong with -ffreestanding if you then also have
> > > > __builtin_memcpy() etc, and they do the sane compiler optimizations
> > > > for memcpy().
> > > >
> > > > What we want to avoid is the compiler making *assumptions* based on
> > > > standard names, because we may implement some of those things
> > > > differently.
> > > >
> > >
> > > -ffreestanding as it stands today does have __builtin_memcpy and
> > > friends. But you need to then use #define memcpy __builtin_memcpy etc,
> > > which is messy and also doesn't fully express what you want. #pragma, or
> > > even just allowing -fbuiltin-foo options would be useful.
> 
> I do really like the idea of -fbuiltin-foo.  For example, you'd specify:
> 
> -ffreestanding -fbuiltin-bcmp
> 
> as an example. `-ffreestanding` would opt you out of ALL libcall
> optimizations, `-fbuiltin-bcmp` would then opt you back in to
> transforms that produce bcmp.  That way you're informing the compiler
> more precisely about the environment you'd be targeting.  It feels
> symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
> easy when there is such symmetry).  And it's already convention that
> if you specify multiple conflicting compiler flags, then the latter
> one specified "wins."  In that sense, turning back on specific
> libcalls after disabling the rest looks more ergonomic to me.
> 
> Maybe Eli or David have thoughts on why that may or may not be as
> ergonomic or possible to implement as I imagine?
> 

Note that -fno-builtin-foo seems to mean slightly different things in
clang and gcc. From experimentation, clang will neither optimize a call
to foo, nor perform an optimization that introduces a call to foo. gcc
will avoid optimizing calls to foo, but it can still generate new calls
to foo while optimizing something else. Which means that
-fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
just that gcc doesn't seem to have implemented those optimizations.
