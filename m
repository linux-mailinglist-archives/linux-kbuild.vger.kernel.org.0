Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BCD249DA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 14:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgHSMTV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 08:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgHSMTS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 08:19:18 -0400
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E191C061383
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 05:19:18 -0700 (PDT)
Received: by mail-wr1-x44a.google.com with SMTP id r14so9332081wrq.3
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc
         :content-transfer-encoding;
        bh=FMJtX5sE/ijHGQQo6or6WwI3AI9STC6T6y3elNBDyxc=;
        b=Np666du64zIhPkn7EXB9gnv2v97Mppfik8nrGpDKJs0LAnPQslKRdttJpfNBAhdYL1
         vbStB2psYT9wXiZXZepWE36Y9bT5aHgjWtK4MUYil9prJTaYTHJ6OqbrliGWQ5oZ+Ks6
         Bli8xLd5MBrKCQL/tiuqE9RaEKlvM9Z+MzkDUhDJwW8OFTX1cDkJ0EY189plnYbI5jzA
         fY05yT4YXYvd1qFkJD4PFHpsy6V4F3zXkFt+udf//0kROgRTdVcH0ngJO3PltdCjBy8X
         DyeRqSbYuw3qb1Ife0RGlGHuXxh5sSrceCnGD5/0yMSTtFei5ndOXm8EWNUWFtc9bdyc
         WW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc:content-transfer-encoding;
        bh=FMJtX5sE/ijHGQQo6or6WwI3AI9STC6T6y3elNBDyxc=;
        b=Pt1YxcXSkPCCnL8ppLazXDb65BSw4/bO4qzLzR/wmErTb1jivFJYVQwthUWx7zrMsM
         Hhq15eZSshy4W3mHC+RqddlEs66MPQNYWCuje7NjY7Zu2dDTewZF5yQ5py2xvlV47C2i
         7V3qYEbUFbLSbuJ8jhcY0KoOPaq/DYhCd+4lr6f1i6Rv+rbT/LuZ0vTalU6rCMQlZE+U
         yS5BZ6DNARGE4/CsuFu7HHEpXvEIEvzTHM0ajKdTQLHyVuxCC2GZ1XaRbVjWBDT0n64C
         O/xAIsecc9KsW9qdiXEtQ04UvdOxTMeuzxOO2hxYd79Aan/8OmhLnJubbodFoC9YEe4N
         5UxA==
X-Gm-Message-State: AOAM531uhbQpe8EC4pqa7qg4vjsJX3xEyMnoKYYCnmhkACW24EGmeGpZ
        vgBuPyLxZm96/QGkd+brrp9EFN7+etr8
X-Google-Smtp-Source: ABdhPJxHgJd9QRuk6MhBzMzz27/J81xqSRcU//003VyQCqmSVuYjQcdOow7AlT4rjFquBw5LTG+BFRThYB1Q
X-Received: by 2002:adf:cf10:: with SMTP id o16mr22954517wrj.380.1597839555928;
 Wed, 19 Aug 2020 05:19:15 -0700 (PDT)
Date:   Wed, 19 Aug 2020 14:19:13 +0200
In-Reply-To: <CAKwvOdkJxmSXg+v1pG4+DkhoJzEE47smce6pB=Zhy6viY_++xw@mail.gmail.com>
Message-Id: <20200819121913.3374601-1-courbet@google.com>
Mime-Version: 1.0
References: <CAKwvOdkJxmSXg+v1pG4+DkhoJzEE47smce6pB=Zhy6viY_++xw@mail.gmail.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
From:   Clement Courbet <courbet@google.com>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
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
        "maintainer : X86 ARCHITECTURE" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        "=?UTF-8?q?D=C3=A1vid=20Bolvansk=C3=BD?=" <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 9:58 PM Nick Desaulniers <ndesaulniers@google.com> =
wrote:
On Tue, Aug 18, 2020 at 12:25 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Aug 18, 2020 at 12:19 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > And honestly, a compiler that uses 'bcmp' is just broken. WTH? It's
> > the year 2020, we don't use bcmp. It's that simple. Fix your damn
> > broken compiler and use memcmp. The argument that memcmp is more
> > expensive than bcmp is garbage legacy thinking from four decades ago.
> >
> > It's likely the other way around, where people have actually spent
> > time on memcmp, but not on bcmp.
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linus
>
> You'll have to ask Clement about that.=C2=A0 I'm not sure I ever saw the
> "faster bcmp than memcmp" implementation, but I was told "it exists"
> when I asked for a revert when all of our kernel builds went red.

If **is** possible to make bcmp much faster then memcmp. We have one
such implementation internally (it's scheduled to be released as part of
llvm-libc some time this year), but most libc implementations just alias to
memcmp.

Below is a graph showing the impact of releasing this compiler optimization
with our optimized bcmp on the google fleet (the cumulative memcmp+bcmp usa=
ge
of all programs running on google datacenters, including the kernel). Scale=
 and
dates have been redacted for obvious reasons, but note that the graph start=
s at
y=3D0, so you can compare the values relative to each other. Note how as me=
mcmp
is progressively being replaced by bcmp (more and more programs being
recompiled with the compiler patch), the cumulative usage of memory
comparison drops significantly.
=C2=A0
https://drive.google.com/file/d/1p8z1ilw2xaAJEnx_5eu-vflp3tEOv0qY/view?usp=
=3Dsharing

The reasons why bcmp can be faster are:
=C2=A0- typical libc implementations use the hardware to its full capacity,=
 e.g. for
bcmp we can use vector loads and compares, which can process up to 64 bytes
(avx512) in one instruction. It's harder to implement memcmp with these for
little-endian architectures as there is no vector bswap. Because the kernel
only uses GPRs I can see how that might not perfectly fit the kernel use ca=
se.
But the kernel really is a special case, the compiler is written for most
programs, not specifically for the kernel, and most programs should benefit=
 from
this optimization.
=C2=A0- bcmp() does not have to look at the bytes in order, e.g. it can loo=
k at the
first and last . This is useful when comparing buffers that have common
prefixes (as happens in mostly sorted containers, and we have data that sho=
ws
that this is a quite common instance).
=C2=A0

> Also, to Clement's credit, every patch I've ever seen from Clement is
> backed up by data; typically fleetwide profiles at Google.=C2=A0 "we spen=
d
> a lot of time in memcmp, particularly comparing the result against
> zero and no other value; hmm...how do we spend less time in
> memcmp...oh, well there's another library function with slightly
> different semantics we can call instead."=C2=A0 I don't think anyone woul=
d
> consider the optimization batshit crazy given the number of cycles
> saved across the fleet.=C2=A0 That an embedded project didn't provide an
> implementation, is a footnote that can be fixed in the embedded
> project, either by using -ffreestanding or -fno-builtin-bcmp, which is
> what this series proposes to do.
