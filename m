Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A620E24905B
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 23:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgHRVvE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 17:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRVvD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 17:51:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC63C061389;
        Tue, 18 Aug 2020 14:51:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id p14so295668wmg.1;
        Tue, 18 Aug 2020 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=BSABekpEbgyR8FIOb3+UbUAwmPio9uloyrrOhgrIEdc=;
        b=V5EREzyu9AwjVNEDwVVRm+WyiwYmK/38e2TcfeLrHRFr2QcJ0ZBV8smeSpE3GQmXmF
         BBqctpe/Gy+gZF9WNc9+u/cO0lMOxUQmbYmEcJEjqwyQyTMlLlW896OPYW7ez+jImRqw
         x7MkV4T+QphRxfKKzVV+L4NEzswScHNXOPDWp6oiCkwLhvIsHxnTiH4hG6rFoLmSvS4d
         XPT8jiGL4FVqgI+MGyKbz30ikf2zEAvHuzlObt+vHlwqUubWGBRLQXxeiEfG4ePJ3M0m
         wGBnfSGsFzZnibUCbFN6ur6vJC54JkEJWLXYBKnaL23X5HzOulC9E6/k7BAy+gRBvTPL
         O6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=BSABekpEbgyR8FIOb3+UbUAwmPio9uloyrrOhgrIEdc=;
        b=N4Kd0Mrih55xPIZj4ajVW8IXB+V1n8RyJE/UABEvL71rQtjdXZ+Hq9mjFXh965awOq
         yvK5tXfcQ9aaReRwqox7jKj5zpEGhL1qoeND1Jz2pmJj3fm9u+EI+ri8TAll8smE0TdI
         OBVmyhaKuFoGfqkHCz/S4V7095TJc9fV7H84P+pFBAj0LAj1Li4qpwRKpfOjN8FPs3mA
         S4EZzJYu/oFaxxyG4Pnozonp/t1BCeSZdCYlcuNyYHoYNuMZCQdjNwsKto4wj6tzcuku
         LxeiI4WGPgUPGWS+h6k/xwqIiR8h1vRu9dO8CTgmTh1gOnHZQgSsK7FGi9ex59MitQuM
         eNGQ==
X-Gm-Message-State: AOAM533scKkcALncA+3TJVqpSECRNnCD2qAojOpgfo0gLGQBqDyC828G
        39SLUp/4IZMkcM+oVhp6Wjs=
X-Google-Smtp-Source: ABdhPJyDzIKdttoTMtQ1tDdiApioS6r3Xq/iLT8S9kLBRqZAAPFVsFeIYUZLl8YmZskRlpJduOoc7A==
X-Received: by 2002:a1c:9e11:: with SMTP id h17mr1783647wme.106.1597787461886;
        Tue, 18 Aug 2020 14:51:01 -0700 (PDT)
Received: from [100.64.193.196] ([147.229.117.41])
        by smtp.gmail.com with ESMTPSA id t14sm35579344wrv.14.2020.08.18.14.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 14:51:00 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   =?utf-8?Q?D=C3=A1vid_Bolvansk=C3=BD?= <david.bolvansky@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Date:   Tue, 18 Aug 2020 23:51:00 +0200
Message-Id: <CAB29ED6-DF63-4973-9B02-345E13D38A87@gmail.com>
References: <20200818214146.GA3196105@rani.riverdale.lan>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
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
In-Reply-To: <20200818214146.GA3196105@rani.riverdale.lan>
To:     Arvind Sankar <nivedita@alum.mit.edu>
X-Mailer: iPhone Mail (17F75)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

So -fno-builtin-stpcpy is not ideal solution then.. gcc may implement this o=
pt too and here we go again, red builds.

We should either provide stpcpy implementation or fix few places and do not u=
se sprintf there.

> D=C5=88a 18. 8. 2020 o 23:41 u=C5=BE=C3=ADvate=C4=BE Arvind Sankar <nivedi=
ta@alum.mit.edu> nap=C3=ADsal:
>=20
> =EF=BB=BFOn Tue, Aug 18, 2020 at 01:58:51PM -0700, Nick Desaulniers wrote:=

>>> On Tue, Aug 18, 2020 at 1:27 PM Nick Desaulniers
>>> <ndesaulniers@google.com> wrote:
>>>=20
>>> On Tue, Aug 18, 2020 at 1:24 PM Arvind Sankar <nivedita@alum.mit.edu> wr=
ote:
>>>>=20
>>>> On Tue, Aug 18, 2020 at 12:13:22PM -0700, Linus Torvalds wrote:
>>>>> On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:=

>>>>>>=20
>>>>>> I'm not saying "change the semantics", nor am I saying that playing
>>>>>> whack-a-mole *for a limited time* is unreasonable. But I would like t=
o go back
>>>>>> to the compiler authors and get them to implement such a #pragma: "th=
is
>>>>>> freestanding implementation *does* support *this specific library fun=
ction*,
>>>>>> and you are free to call it."
>>>>>=20
>>>>> I'd much rather just see the library functions as builtins that always=

>>>>> do the right thing (with the fallback being "just call the standard
>>>>> function").
>>>>>=20
>>>>> IOW, there's nothing wrong with -ffreestanding if you then also have
>>>>> __builtin_memcpy() etc, and they do the sane compiler optimizations
>>>>> for memcpy().
>>>>>=20
>>>>> What we want to avoid is the compiler making *assumptions* based on
>>>>> standard names, because we may implement some of those things
>>>>> differently.
>>>>>=20
>>>>=20
>>>> -ffreestanding as it stands today does have __builtin_memcpy and
>>>> friends. But you need to then use #define memcpy __builtin_memcpy etc,
>>>> which is messy and also doesn't fully express what you want. #pragma, o=
r
>>>> even just allowing -fbuiltin-foo options would be useful.
>>=20
>> I do really like the idea of -fbuiltin-foo.  For example, you'd specify:
>>=20
>> -ffreestanding -fbuiltin-bcmp
>>=20
>> as an example. `-ffreestanding` would opt you out of ALL libcall
>> optimizations, `-fbuiltin-bcmp` would then opt you back in to
>> transforms that produce bcmp.  That way you're informing the compiler
>> more precisely about the environment you'd be targeting.  It feels
>> symmetric to existing `-fno-` flags (clang makes -f vs -fno- pretty
>> easy when there is such symmetry).  And it's already convention that
>> if you specify multiple conflicting compiler flags, then the latter
>> one specified "wins."  In that sense, turning back on specific
>> libcalls after disabling the rest looks more ergonomic to me.
>>=20
>> Maybe Eli or David have thoughts on why that may or may not be as
>> ergonomic or possible to implement as I imagine?
>>=20
>=20
> Note that -fno-builtin-foo seems to mean slightly different things in
> clang and gcc. =46rom experimentation, clang will neither optimize a call
> to foo, nor perform an optimization that introduces a call to foo. gcc
> will avoid optimizing calls to foo, but it can still generate new calls
> to foo while optimizing something else. Which means that
> -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
> just that gcc doesn't seem to have implemented those optimizations.
