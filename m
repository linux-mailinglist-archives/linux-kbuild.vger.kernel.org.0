Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A149124C50F
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 20:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgHTSFT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 14:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHTSFR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 14:05:17 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDA3C061385;
        Thu, 20 Aug 2020 11:05:16 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c80so2524004wme.0;
        Thu, 20 Aug 2020 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=rDyjt8LmK9g1U3SIovfRJA6j3jEtje8UHC8f6ZFLpu8=;
        b=piEtm3ZtjTE90ohxVb1SRUInPjNp1S/nkKMYdMO+tb5evALD/rn6U5CnlBhnHbmMQL
         EJgP8LC0FUb6DpJTvtttDB8gnmaE4Nb/b+6jtr5j480cbicmofCkRECNcMxaiAG/OHpm
         1rc9iGiDKpZTbQ9CI2IJtcDcY+3L4JzVCJ/XOqEdWF/PIgogGvyV2da6VP/37Ib0SXNr
         jugi0JELzoFq/fbvCBXiKk415CORKjFrBIFWPt0dNYDAVNhz1DI9dw4XI/xgRoK9yIIv
         nOBrdUmqiVxKjluOXldIa1eWQCOe1DQOy9lZKpSgw87bsBgATMHJLBXymHoqOX6/TrhP
         t6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=rDyjt8LmK9g1U3SIovfRJA6j3jEtje8UHC8f6ZFLpu8=;
        b=HyR56im8LWuz7QlMjGDQ9IWgkYqJlun7rNLdXGYmxTAOE0O+59ygtE6b8BnwP+BKaC
         HH5EXOw1YOk3nfDcJnhmC8sv91xHI8zbRAS9FqM5nmWbXN1x04fzyEWjCp2jy4YfuXNF
         tYZV6A8dvarnrSLouN2u6f3OFkm36vAdnWAV7fD+SFQ/zA5eED6yxvKoxUtUOBYu7pgF
         RKFPCmkt3rsSvgFUcymfuSjwc5/3JDgXTwBuGQf4Rv7/LeXJdAF9kalQadDSk+wpNPdj
         sq0S/3K36H+cAVwMvei55RQSypmUFiVjaPJ2751duaEl9mu9/d/tSYz3GFhn0mYMKJ9i
         v5Gw==
X-Gm-Message-State: AOAM531qzoHARg108xHACdro74/ubsU165ruHbWov3IBiUcAjRfZC44/
        wfQGdrCewDbdhkYdVRKZcFI=
X-Google-Smtp-Source: ABdhPJzgdVkKwakJu73w1ahFH5W8y91FfqbxFJ2rfSyvOq0GqVRxcaT+2QbYHjG53oR+5l+1QZdntg==
X-Received: by 2002:a05:600c:224e:: with SMTP id a14mr39949wmm.80.1597946715343;
        Thu, 20 Aug 2020 11:05:15 -0700 (PDT)
Received: from [100.64.193.196] ([147.229.117.43])
        by smtp.gmail.com with ESMTPSA id o125sm5753332wma.27.2020.08.20.11.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 11:05:14 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   =?utf-8?Q?D=C3=A1vid_Bolvansk=C3=BD?= <david.bolvansky@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Date:   Thu, 20 Aug 2020 20:05:13 +0200
Message-Id: <DEA79575-B84D-4AE4-A751-8D86E72B541F@gmail.com>
References: <20200820175617.GA604994@rani.riverdale.lan>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
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
In-Reply-To: <20200820175617.GA604994@rani.riverdale.lan>
To:     Arvind Sankar <nivedita@alum.mit.edu>
X-Mailer: iPhone Mail (17F75)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Yeah, gcc is doing weird things here : (

It is kinda sad that same flag does different things with gcc and clang.



> D=C5=88a 20. 8. 2020 o 19:56 u=C5=BE=C3=ADvate=C4=BE Arvind Sankar <nivedi=
ta@alum.mit.edu> nap=C3=ADsal:
>=20
> =EF=BB=BFOn Thu, Aug 20, 2020 at 04:56:02PM +0200, Rasmus Villemoes wrote:=

>>> On 18/08/2020 23.41, Arvind Sankar wrote:
>>>=20
>>> Note that -fno-builtin-foo seems to mean slightly different things in
>>> clang and gcc. =46rom experimentation, clang will neither optimize a cal=
l
>>> to foo, nor perform an optimization that introduces a call to foo. gcc
>>> will avoid optimizing calls to foo, but it can still generate new calls
>>> to foo while optimizing something else. Which means that
>>> -fno-builtin-{bcmp,stpcpy} only solves things for clang, not gcc. It's
>>> just that gcc doesn't seem to have implemented those optimizations.
>>>=20
>>=20
>> I think it's more than that. I've always read gcc's documentation
>>=20
>> '-fno-builtin'
>> '-fno-builtin-FUNCTION'
>>     Don't recognize built-in functions that do not begin with
>>     '__builtin_' as prefix. ...
>>=20
>>     GCC normally generates special code to handle certain built-in
>>     functions more efficiently; for instance, calls to 'alloca' may
>>     become single instructions which adjust the stack directly, and
>>     calls to 'memcpy' may become inline copy loops.
>>     ...
>>=20
>> to mean exactly that observed above and nothing more, i.e. that
>> -fno-builtin-foo merely means that gcc stops treating a call of a
>> function named foo to mean a call to a function implementing the
>> standard function by that name (and hence allows it to e.g. replace a
>> memcpy(d, s, 1) by byte load+store). It does not mean to prevent
>> emitting calls to foo, and I don't think it ever will - it's a bit sad
>> that clang has chosen to interpret these options differently.
>=20
> That documentation is misleading, as it also goes on to say:
> "...nor can you change the behavior of the functions by linking with a
> different library"
> which implies that you _can_ change the behavior if you use the option,
> and which is what your "i.e." is saying as well.
>=20
> My point is that this is not completely true: in gcc, foo by default is
> defined to be __builtin_foo, and -fno-builtin-foo simply removes this
> definition. So the effect is just that calls to foo in the original
> source will be left alone.
>=20
> But in order for an optimization that introduces a new call to foo to be
> valid, foo _must_ have standard semantics: strchr(s,'\0') is not s +
> strlen(s) unless strlen has standard semantics. This is an oversight in
> gcc's optimizations: it converts to s + __builtin_strlen(s), which then
> (normally) becomes s + strlen(s).
>=20
> Check out this horror: https://godbolt.org/z/a1r9fK
>=20
> Clang will disable this optimization if -fno-builtin-strlen is
> specified.
>=20
> Clang's interpretation is more useful for embedded, since you can use
> -fno-builtin-foo and avoid calling __builtin_foo directly, and be
> guaranteed that there will be no calls to foo that you didn't write
> explicitly (outside of memcpy/memset/memcmp). In this case you are free
> to implement foo with non-standard semantics, or avoid implementing it
> altogether, and be reasonably confident that it will all work.
>=20
>>=20
>> Thinking out load, it would be useful if both compilers grew
>>=20
>>  -fassume-provided-std-foo
>>=20
>> and
>>=20
>>  -fno-assume-provided-std-foo
>>=20
>> options to tell the compiler that a function named foo with standard
>> semantics can be assumed (or not) to be provided by the execution
>> environment; i.e. one half of what -f(no-)builtin-foo apparently does
>> for clang currently.
>=20
> Not following: -fno-assume-provided-std-foo sounds like it would have
> exactly the same semantics as Clang's -fno-builtin-foo, except maybe in
> addition it should cause the compiler to error on seeing __builtin_foo
> if it can't implement that without calling foo.
>=20
>>=20
>> And yes, the positive -fbuiltin-foo would also be quite useful in order
>> to get the compiler to recognize a few important functions (memcpy,
>> memcmp) while using -ffreestanding (or just plain -fno-builtin) to tell
>> it to avoid assuming anything about most std functions - I've worked on
>> a VxWorks target where snprintf() didn't have the correct "return what
>> would be written" semantics but rather behaved like the kernel's
>> non-standard scnprintf(), and who knows what other odd quirks that libc h=
ad.
>>=20
>> Rasmus
