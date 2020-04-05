Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2A419EEB5
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 01:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgDEXzM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Apr 2020 19:55:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42551 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgDEXzM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 19:55:12 -0400
Received: by mail-pg1-f196.google.com with SMTP id g6so4728946pgs.9
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2020 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5IvCPMwMgCr9TiZep7pvcdmLlTzfKXXbeNVllBb7ZKM=;
        b=QacU9d9pgbn2olpWmTytcz2R44kVUGbsZmsvrcAiUW+hnrmXGAvzwG2IEyIdfujH71
         V6C+F6jDLwtzOw29rjDEO7xkx5DXlnvv8CXhr4B8mkxqd+dNkaFVLyRxb8XD4lLtJC4K
         tyGcIJzQM8wl+DtJ9LHfOY+08hnPdKaSL66pgn8LlP0TBQ4zeyV1d+3He5DSwCP3EW3e
         C5rN7O/wgXEyLSKR6nnFAA8UPh6PaSKsjY9BWnDSEu4hoZo07lKCe5xX9YjYoYPXgQgh
         BlCDWOvXHhlKOtFwXrWsknNfdq1sQC5vHiy1SQPwjR+fmScNPDl3+m797RWYQ38crji4
         RV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5IvCPMwMgCr9TiZep7pvcdmLlTzfKXXbeNVllBb7ZKM=;
        b=bzXSLYY5DGDRVz5qzLwiV3WkbWG0tjvxVgQr57we6+kxjf7oDlmTYnnPgUV4xCz7F4
         ih6qTqgNMShLpgzhnFNFDYvRloE9TOVXDoXUKGrw8Eo7YwznKyMCpdcpsTxyLkB1dXse
         a+enXCaaxQA1KuryndvHXFi4eBUr8pWePHx2MF+njQuPVHDTinRPMy/wd1n3P5dvoJQK
         8zxDRdtU4p7I2MllOCoS4mQqPK21mVqV+jP+VY/539Lz6J9j8NXwmSHpDjq8y0mNxHpV
         hMSSXr8Gd9FpA00RdiKJK3XVlT768/ZEEcD8f6kPrSlchvVY8BwB+E1tH/lXdtsBJg84
         0pNw==
X-Gm-Message-State: AGi0Pua3folelwjZG2ZKRezcBlN5WMXmEcuddXCRDh0HD9gs13MjZHK1
        s+MQJEKvGjllf3i+TW91C0t0sXwIiXaIXA==
X-Google-Smtp-Source: APiQypJ/c1APWSDEs1HWgo7i8KSN8VYZBsT6i0PAld/MINW71A0hLbNBLiLkJHYA43bP2MDhI0kjvg==
X-Received: by 2002:a63:be49:: with SMTP id g9mr18779316pgo.30.1586130910539;
        Sun, 05 Apr 2020 16:55:10 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id v8sm6477353pfn.213.2020.04.05.16.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 16:55:09 -0700 (PDT)
Date:   Sun, 5 Apr 2020 16:55:07 -0700
From:   Fangrui Song <maskray@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias =?utf-8?Q?M=C3=A4nnich?= <maennich@google.com>,
        Sandeep Patil <sspatil@google.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to
 Clang/LLVM
Message-ID: <20200405235507.psjjhqa3cxw57xra@google.com>
References: <20200403051709.22407-1-masahiroy@kernel.org>
 <CAKwvOdnaZ6qDVxaPY-GEH8pdUkzH6eqm16ok9_wzRSVRG-1kiQ@mail.gmail.com>
 <CAK7LNAQybfcYiosNU+ybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAQybfcYiosNU+ybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-04-06, Masahiro Yamada wrote:
>On Sat, Apr 4, 2020 at 3:24 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>>
>> On Thu, Apr 2, 2020 at 10:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> >
>> > As Documentation/kbuild/llvm.rst implies, building the kernel with a
>> > full set of LLVM tools gets very verbose and unwieldy.
>> >
>> > Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
>> > GCC and Binutils. You can pass LLVM=1 from the command line or as an
>> > environment variable. Then, Kbuild will use LLVM toolchains in your
>> > PATH environment.
>> >
>> > Please note LLVM=1 does not turn on the LLVM integrated assembler.
>> > You need to explicitly pass AS=clang to use it. When the upstream
>> > kernel is ready for the integrated assembler, I think we can make
>> > it default.
>>
>> Having this behavior change over time may be surprising.  I'd rather
>> that if you want to not use the integrated assembler, you explicitly
>> negate it, or just don't use the LLVM=1 syntax, ie. `make CC=clang
>> LD=ld.lld ...`.
>>
>> We could modify how `-no-integrated-as` is chosen when LLVM=1.
>>
>> make LLVM=1 LLVMIA=0 ... # add `-no-integrated-as`
>> # what the flag is doesn't really matter to me, something shorter might be nice.
>> make LLVM=1 # use all LLVM tools
>>
>> Since we got rid of $(AS), it would be appropriate to remove/change it
>> there, since no one really relies on AS=clang right now. (We do have 1
>> of our 60+ CI targets using it, but we can also change that trivially.
>> So I think we have a lot of freedom to change how `-no-integrated-as`
>> is set.
>>
>> This could even be independent of this patch.
>
>
>I also thought a boolean flag is preferred.
>
>AS=clang will not live long anyway, and
>I hesitated to break the compatibility
>for the short-term workaround.
>
>But, if this is not a big deal, I can
>replace AS=clang with LLVMIA=1.

My mere complaint is that it may be difficult to infer the intention (integrated
assembler) from the abbreviation "IA" in "LLVMIA" :/

Something with "AS" in the name may be easier for a user to understand,
e.g. CLANG_AS or LLVM_AS.

>> >
>> > We discussed what we need, and we agreed to go with a simple boolean
>> > switch (https://lkml.org/lkml/2020/3/28/494).
>> >
>> > Some items in the discussion:
>> >
>> > - LLVM_DIR
>> >
>> >   When multiple versions of LLVM are installed, I just thought supporting
>> >   LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
>> >
>> >   CC      = $(LLVM_DIR)clang
>> >   LD      = $(LLVM_DIR)ld.lld
>> >     ...
>> >
>> >   However, we can handle this by modifying PATH. So, we decided to not do
>> >   this.
>> >
>> > - LLVM_SUFFIX
>> >
>> >   Some distributions (e.g. Debian) package specific versions of LLVM with
>> >   naming conventions that use the version as a suffix.
>> >
>> >   CC      = clang$(LLVM_SUFFIX)
>> >   LD      = ld.lld(LLVM_SUFFIX)
>> >     ...
>> >
>> >   will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
>> >   but the suffixed versions in /usr/bin/ are symlinks to binaries in
>> >   /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
>> >
>> > - HOSTCC, HOSTCXX, etc.
>> >
>> >   We can switch the host compilers in the same way:
>> >
>> >   ifneq ($(LLVM),)
>> >   HOSTCC       = clang
>> >   HOSTCXX      = clang++
>> >   else
>> >   HOSTCC       = gcc
>> >   HOSTCXX      = g++
>> >   endif
>> >
>> >   This may the right thing to do, but I could not make up my mind.
>> >   Because we do not frequently switch the host compiler, a counter
>> >   solution I had in my mind was to leave it to the default of the
>> >   system.
>> >
>> >   HOSTCC       = cc
>> >   HOSTCXX      = c++
>> >
>> >   Many distributions support update-alternatives to switch the default
>> >   to GCC, Clang, or whatever, but reviewers were opposed to this
>> >   approach. So, this commit does not touch the host tools.
>>
>> update-alternatives assumes you've installed Clang via a package manager?
>> $ update-alternatives --list cc
>> /usr/bin/gcc
>> On my system even though clang and friends are in my PATH.
>>
>> And previously, there was feedback that maybe folks don't want to
>> change `cc` on their systems just for Clang kernel builds.
>> https://lkml.org/lkml/2020/3/30/836
>> https://lkml.org/lkml/2020/3/30/838
>>
>> A goal for ClangBuiltLinux is to build a kernel image with no GCC or
>> binutils installed on the host.  Let the record reflect that.  And
>> there's been multiple complaints that the existing syntax is too long
>> for specifying all of the tools.
>>
>> LLVM=1 is meant to be one flag.  Not `make LLVM=1 HOSTCC=clang
>> HOSTCXX=clang`.  If folks want fine grain flexibility, use the
>> existing command line interface, which this patch does not change.
>> LLVM=1 is opinionated, and inflexible, because it makes a strong
>> choice to enable LLVM for everything.
>>
>> Another reason why I don't want to change these over time, and why I
>> want them all to be in sync is that there are 4 different CI systems
>> for the kernel, and they are currently fragmented in terms of who is
>> using what tools:
>>
>> KernelCI: CC=clang only
>> Kbuild test robot aka 0day bot: CC=clang LD=ld.lld
>> Linaro TCWG: CC=clang only
>> our CI: a complete mix due to combinatorial explosion, but more
>> coverage of LLVM than everyone else.
>>
>> That is a mess that we must solve.  Having 1 flag that works
>> consistently across systems is one solution.  Now if those were all
>> using LLVM=1, but some were enabling Clang's integrated assembler, and
>> some weren't because we changed the default over time, then we'd be
>> right back to this mismatch between systems.  I'd much rather draw the
>> line in the sand, and say "this is how this flag will work, since day
>> 1."  Maybe it's too rigid, but it's important to me that if we create
>> something new to solve multiple objectives (1. simplifies existing
>> interface. 2. turns on everything.) that it does so.  It is a partial
>> solution, if it eliminates some of the flags while leaving others. I
>> want a full solution.
>>
>> If folks want the flexibility to mix and match tools, the existing
>> interface is capable.  But for us to track who is using what, we need
>> 1 flag that we know is not different depending on the cc of the
>> system.  Once clang's integrated assembler is good to go, we will
>> begin recommending LLVM=1 to everyone.  And we want feedback if we
>> regress building the host utilities during a kernel build, even if
>> there are not many.
>>
>> I'm on the fence about having all of the above satisfied by one patch,
>> or taking this patch as is and following up on the above two points
>> (related to disabling `-no-integrated-as` and setting HOSTCC).  I
>> trust your judgement and respect your decisions, so I'll defer to you
>> Masahiro, but I need to make explicit the design goals.  Maybe with
>> this additional context it can help inform the design.
>> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
>
>Thanks for the comments.
>
>I'd rather want to do this incrementally,
>making sure I am doing right.
>
>
>The meaning of LLVM=1 may change over time.
>It means "the recommended settings" at the moment.
>
>If CI does not want to change the behavior across
>kernel versions, it can pass individual variables
>explicitly.
>
>--
>Best Regards
>Masahiro Yamada
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNAQybfcYiosNU%2Bybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew%40mail.gmail.com.
