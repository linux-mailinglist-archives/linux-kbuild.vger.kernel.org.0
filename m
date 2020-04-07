Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F212D1A132A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 19:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgDGRxV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 13:53:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35652 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgDGRxV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 13:53:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id a13so1147199pfa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2020 10:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZsnHknmPnzlDnnD+lsQB+SUZRKz07GU9C9BlgnfmqY=;
        b=nAefzkZ2JinyQVrK0n8MAikkoMhgx+2j7FIdTNzirnsibGhl1/ylmS9MckoCSPcMb8
         dRSjnFECwT2RvISJR+xYvmQ/xy6L0148d4mdHPpIsERRxpYZXRO3sKuXnMPRnGhH+gnd
         2pQMBdjOFQKmY75VSFEhg+4Jf41epd7vMuwTcMRqlF3K/eWMUKqWffaB+6qJGL6qDweb
         VVIv+/v6NhVSbVfgdDCnmRMXKZDhX8nbYLcdk1cwCaceANNvWGIiT3q7rYhe4zu9w4qy
         J9x/+QmbdeIGyzQHl8tNcqFzwrUtLYmKickm7OYk9HCN7aYHpQBRZMjyclL278K7la5R
         ys1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZsnHknmPnzlDnnD+lsQB+SUZRKz07GU9C9BlgnfmqY=;
        b=NynAI3wHDtlLWzWolsXItdAmjrkMl4caUKpBOdxjyV1F3qW6Y9r7ACVsTY80P6+E4U
         Ky4Ljd91obitAIpukZNkCO6x2e7/Cc5G0O+NQKQEJYwJMoRYNaEMyH3BjP3N2gF6wkhQ
         IQqHdwZatcTuu3iVxJ6EX2aR5axgRd5K6hPIEzWBT29yjY7FdY0+odsSSNYw41RGsIEX
         ct73JV5Kj/rTubrOaNDkKoWUyrVa/+H9nBQFC22EdLH27K2yO+eaqjX9d4igWwNXsZwQ
         sdNLAjGsYr649IxZijB0dAmGTP1Y9Spy91+gPgGX++rLsSA8k1dLNcRcOF4apow7NLwi
         Zu6A==
X-Gm-Message-State: AGi0PuZqzCXVucazOXSZdkL4NYFh1C+AkGfnSyk0VkMMrY8KZqderHHD
        DS+8AzzmCVBDIrjASTn975O0W26NYSGUAMseV93Vfw==
X-Google-Smtp-Source: APiQypLB3JMGfjj1f8dB6FLLTXomkxBIMaJn/cb7wImwzv7yIcwXQzsSVve3/b4RHeQVbVDMWtqdmcz5Rs9M4XVTndc=
X-Received: by 2002:a62:e415:: with SMTP id r21mr3651186pfh.169.1586281999850;
 Tue, 07 Apr 2020 10:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <20200406112220.GB126804@google.com>
 <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
 <CAKwvOdmHxeZ+T1OsOhW25pPygHM4D21OgZqRk141xbjP437-1w@mail.gmail.com> <CAK7LNARSMvGZ6T4Ct=U4Xe1WQCgkaWE8m8BxRuYiaokKVjA_ig@mail.gmail.com>
In-Reply-To: <CAK7LNARSMvGZ6T4Ct=U4Xe1WQCgkaWE8m8BxRuYiaokKVjA_ig@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Apr 2020 10:53:08 -0700
Message-ID: <CAKwvOdkicpNMqQipZ+AMTEz7JVou3bkcKiQ3Cih20qH0hoziDg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jian Cai <jiancai@google.com>,
        Stephen Hines <srhines@google.com>,
        Luis Lozano <llozano@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 7, 2020 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Apr 8, 2020 at 2:01 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Tue, Apr 7, 2020 at 9:17 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Mon, Apr 6, 2020 at 8:22 PM 'Matthias Maennich' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > > >
> > > > On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
> > > > >As Documentation/kbuild/llvm.rst implies, building the kernel with a
> > > > >full set of LLVM tools gets very verbose and unwieldy.
> > > > >
> > > > >Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> > > > >GCC and Binutils. You can pass LLVM=1 from the command line or as an
> > > > >environment variable. Then, Kbuild will use LLVM toolchains in your
> > > > >PATH environment.
> > > > >
> > > > >Please note LLVM=1 does not turn on the LLVM integrated assembler.
> > > > >You need to explicitly pass AS=clang to use it. When the upstream
> > > > >kernel is ready for the integrated assembler, I think we can make
> > > > >it default.
> > > > >
> > > > >We discussed what we need, and we agreed to go with a simple boolean
> > > > >switch (https://lkml.org/lkml/2020/3/28/494).
> > > > >
> > > > >Some items in the discussion:
> > > > >
> > > > >- LLVM_DIR
> > > > >
> > > > >  When multiple versions of LLVM are installed, I just thought supporting
> > > > >  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> > > > >
> > > > >  CC      = $(LLVM_DIR)clang
> > > > >  LD      = $(LLVM_DIR)ld.lld
> > > > >    ...
> > > > >
> > > > >  However, we can handle this by modifying PATH. So, we decided to not do
> > > > >  this.
> > > > >
> > > > >- LLVM_SUFFIX
> > > > >
> > > > >  Some distributions (e.g. Debian) package specific versions of LLVM with
> > > > >  naming conventions that use the version as a suffix.
> > > > >
> > > > >  CC      = clang$(LLVM_SUFFIX)
> > > > >  LD      = ld.lld(LLVM_SUFFIX)
> > > > >    ...
> > > > >
> > > > >  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
> > > > >  but the suffixed versions in /usr/bin/ are symlinks to binaries in
> > > > >  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> > > > >
> > > > >- HOSTCC, HOSTCXX, etc.
> > > > >
> > > > >  We can switch the host compilers in the same way:
> > > > >
> > > > >  ifneq ($(LLVM),)
> > > > >  HOSTCC       = clang
> > > > >  HOSTCXX      = clang++
> > > > >  else
> > > > >  HOSTCC       = gcc
> > > > >  HOSTCXX      = g++
> > > > >  endif
> > > > >
> > > > >  This may the right thing to do, but I could not make up my mind.
> > > > >  Because we do not frequently switch the host compiler, a counter
> > > > >  solution I had in my mind was to leave it to the default of the
> > > > >  system.
> > > > >
> > > > >  HOSTCC       = cc
> > > > >  HOSTCXX      = c++
> > > >
> > > > What about HOSTLD ? I saw recently, that setting HOSTLD=ld.lld is not
> > > > yielding the expected result (some tools, like e.g. fixdep still require
> > > > an `ld` to be in PATH to be built). I did not find the time to look into
> > > > that yet, but I would like to consistently switch to the llvm toolchain
> > > > (including linker and possibly more) also for hostprogs.
> > >
> > >
> > > HOSTLD=ld.lld worked for me, but HOSTCC=clang did not.
> > >
> > >
> > >
> > > HOSTCC=clang without CC=clang fails to build objtool.
> > >
> > > The build system of objtool is meh.  :(
> >
> > Let's tackle that in a follow up, with the goal of build hermiticity
> > in mind.  I think there's good feedback in this thread to inform the
> > design of a v2:
> > 1. CLANG_AS=0 to disable integrated as.  Hopefully we won't need this
> > much longer, so we don't need to spend too much time on this, Masahiro
> > please just choose a name for this.  llvm-as naming conventions
> > doesn't follow the rest of binutils.
>
> I am not so familiar with the terminology in LLVM,
> but I feel 'integrated' is a keyword IMHO.
> I prefer LLVM_IA=1.  (or  LLVM_INTEGRATED_AS=1)

I'm happy with either, and I trust your judgement.  You choose.
Hopefully we will fix all our assembler bugs soon and won't need the
flag much longer.

-- 
Thanks,
~Nick Desaulniers
