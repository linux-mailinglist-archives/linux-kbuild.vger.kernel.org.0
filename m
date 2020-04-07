Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773DA1A15B0
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 21:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgDGTT2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 15:19:28 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52501 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgDGTT2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 15:19:28 -0400
Received: by mail-pj1-f65.google.com with SMTP id ng8so164498pjb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2020 12:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rG3gvegGYMuy2XFIc5WCw+t7albL71jqGTx3h+oz3PU=;
        b=fCkFOEvtzj2top7sZTwblS/ZXmLkcMYJ8BO67ogp03C115ys5kxUV0awOlROlf5Bfr
         J+3pA/OqikQfzArrvPi7mX+qMFyC6y/hiMQZOOKeQex3CPx6s3hXodEQuJWpOP6WAFo/
         1WiQSpoalWXTn8Zs7ab0/JgYioVxsr3U4/o0WeUk+nV7ZnCSXDaErkQ6elBolGznqrL2
         ThBdUnTuofOAWtkxbRq8mKlK6GDlTTLm6pWrTL07YI/GYk7n6NMJdEdnaoqOi40S8BbK
         /ri697JjwrOE3Xb8FlbNYfn4BFZsrS4ozV3KI1OR4VnZKH/uYoSHrKu4NFsS2pjZ9w6W
         EhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rG3gvegGYMuy2XFIc5WCw+t7albL71jqGTx3h+oz3PU=;
        b=jcuKKPs6Uqw0gWO2prlw9WF7HSrVAzFXKNYu/xl/8nd/SWjvOEKoII4XlxJ8J1tg4I
         rDAZ0WHfpWx6C06b8QebiiVTDIDoT4QAYeaZgI64ufn8mMRiap8Nu/UCB2iRWxe+ZKrg
         wpKXlZvpgjkcIo19PzdL1qPIksJhncKbz3ODJcByR0fIY301ep6RQiJh+v6+cGroW2KB
         YsOd42wDck6EfVJFdPA08s0qRDdprV8xrCRCrgH7AY4NSv6VxLvvXGIbmM1+ELiUXGjb
         HDn3pg3wbiI4+ZnOjgRIwxRZepypeXT47oe9HJEe6cqErVX4ln3KNTq911J8UtuXFzJt
         oB0w==
X-Gm-Message-State: AGi0PubhQpBjag1iaOr8Jli+Zp6rWnIlhq6Pp/64HnRROULDLXNPBDRg
        Gx9W/aaf87YwoOTRaABqikAW/Q==
X-Google-Smtp-Source: APiQypKbtHvUTzo3LK2UvrxJ5kRZIpW0la3EnQasySh2srKIIT5Mcfjx/x+UO6stBUScVd7zM8Iirw==
X-Received: by 2002:a17:902:598e:: with SMTP id p14mr3523199pli.276.1586287167194;
        Tue, 07 Apr 2020 12:19:27 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id 203sm320233pfw.25.2020.04.07.12.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:19:26 -0700 (PDT)
Date:   Tue, 7 Apr 2020 12:19:23 -0700
From:   Fangrui Song <maskray@google.com>
To:     'Nick Desaulniers' via Clang Built Linux 
        <clang-built-linux@googlegroups.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jian Cai <jiancai@google.com>,
        Stephen Hines <srhines@google.com>,
        Luis Lozano <llozano@google.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to
 Clang/LLVM
Message-ID: <20200407191923.txaggm7ntxrinddf@google.com>
References: <20200403051709.22407-1-masahiroy@kernel.org>
 <20200406112220.GB126804@google.com>
 <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
 <CAKwvOdmHxeZ+T1OsOhW25pPygHM4D21OgZqRk141xbjP437-1w@mail.gmail.com>
 <CAK7LNARSMvGZ6T4Ct=U4Xe1WQCgkaWE8m8BxRuYiaokKVjA_ig@mail.gmail.com>
 <CAKwvOdkicpNMqQipZ+AMTEz7JVou3bkcKiQ3Cih20qH0hoziDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdkicpNMqQipZ+AMTEz7JVou3bkcKiQ3Cih20qH0hoziDg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 2020-04-07, 'Nick Desaulniers' via Clang Built Linux wrote:
>On Tue, Apr 7, 2020 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Wed, Apr 8, 2020 at 2:01 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>> >
>> > On Tue, Apr 7, 2020 at 9:17 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> > >
>> > > On Mon, Apr 6, 2020 at 8:22 PM 'Matthias Maennich' via Clang Built
>> > > Linux <clang-built-linux@googlegroups.com> wrote:
>> > > >
>> > > > On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
>> > > > >As Documentation/kbuild/llvm.rst implies, building the kernel with a
>> > > > >full set of LLVM tools gets very verbose and unwieldy.
>> > > > >
>> > > > >Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
>> > > > >GCC and Binutils. You can pass LLVM=1 from the command line or as an
>> > > > >environment variable. Then, Kbuild will use LLVM toolchains in your
>> > > > >PATH environment.
>> > > > >
>> > > > >Please note LLVM=1 does not turn on the LLVM integrated assembler.
>> > > > >You need to explicitly pass AS=clang to use it. When the upstream
>> > > > >kernel is ready for the integrated assembler, I think we can make
>> > > > >it default.
>> > > > >
>> > > > >We discussed what we need, and we agreed to go with a simple boolean
>> > > > >switch (https://lkml.org/lkml/2020/3/28/494).
>> > > > >
>> > > > >Some items in the discussion:
>> > > > >
>> > > > >- LLVM_DIR
>> > > > >
>> > > > >  When multiple versions of LLVM are installed, I just thought supporting
>> > > > >  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
>> > > > >
>> > > > >  CC      = $(LLVM_DIR)clang
>> > > > >  LD      = $(LLVM_DIR)ld.lld
>> > > > >    ...
>> > > > >
>> > > > >  However, we can handle this by modifying PATH. So, we decided to not do
>> > > > >  this.
>> > > > >
>> > > > >- LLVM_SUFFIX
>> > > > >
>> > > > >  Some distributions (e.g. Debian) package specific versions of LLVM with
>> > > > >  naming conventions that use the version as a suffix.
>> > > > >
>> > > > >  CC      = clang$(LLVM_SUFFIX)
>> > > > >  LD      = ld.lld(LLVM_SUFFIX)
>> > > > >    ...
>> > > > >
>> > > > >  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
>> > > > >  but the suffixed versions in /usr/bin/ are symlinks to binaries in
>> > > > >  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
>> > > > >
>> > > > >- HOSTCC, HOSTCXX, etc.
>> > > > >
>> > > > >  We can switch the host compilers in the same way:
>> > > > >
>> > > > >  ifneq ($(LLVM),)
>> > > > >  HOSTCC       = clang
>> > > > >  HOSTCXX      = clang++
>> > > > >  else
>> > > > >  HOSTCC       = gcc
>> > > > >  HOSTCXX      = g++
>> > > > >  endif
>> > > > >
>> > > > >  This may the right thing to do, but I could not make up my mind.
>> > > > >  Because we do not frequently switch the host compiler, a counter
>> > > > >  solution I had in my mind was to leave it to the default of the
>> > > > >  system.
>> > > > >
>> > > > >  HOSTCC       = cc
>> > > > >  HOSTCXX      = c++
>> > > >
>> > > > What about HOSTLD ? I saw recently, that setting HOSTLD=ld.lld is not
>> > > > yielding the expected result (some tools, like e.g. fixdep still require
>> > > > an `ld` to be in PATH to be built). I did not find the time to look into
>> > > > that yet, but I would like to consistently switch to the llvm toolchain
>> > > > (including linker and possibly more) also for hostprogs.
>> > >
>> > >
>> > > HOSTLD=ld.lld worked for me, but HOSTCC=clang did not.
>> > >
>> > >
>> > >
>> > > HOSTCC=clang without CC=clang fails to build objtool.
>> > >
>> > > The build system of objtool is meh.  :(
>> >
>> > Let's tackle that in a follow up, with the goal of build hermiticity
>> > in mind.  I think there's good feedback in this thread to inform the
>> > design of a v2:
>> > 1. CLANG_AS=0 to disable integrated as.  Hopefully we won't need this
>> > much longer, so we don't need to spend too much time on this, Masahiro
>> > please just choose a name for this.  llvm-as naming conventions
>> > doesn't follow the rest of binutils.
>>
>> I am not so familiar with the terminology in LLVM,
>> but I feel 'integrated' is a keyword IMHO.
>> I prefer LLVM_IA=1.  (or  LLVM_INTEGRATED_AS=1)
>
>I'm happy with either, and I trust your judgement.  You choose.
>Hopefully we will fix all our assembler bugs soon and won't need the
>flag much longer.

Maybe "IAS", e.g. LLVM_IAS=1 or CLANG_IAS=1

IAS is referred to in a few places. IA is not a common abbreviation.

I don't have strong opinion here and thank Masahiro a lot for the
improvement!

>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkicpNMqQipZ%2BAMTEz7JVou3bkcKiQ3Cih20qH0hoziDg%40mail.gmail.com.
