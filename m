Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B271A1980
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 03:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDHBYD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 21:24:03 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21382 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgDHBYD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 21:24:03 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0381Nf6X015733;
        Wed, 8 Apr 2020 10:23:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0381Nf6X015733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586309022;
        bh=1OXWtTS4gBVnU+5EZcvipXPbnrhrnm9+PH7xSCtTkNM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sh3YrU5f+6aFFeYjyIBwVYBBruWTBeGLcS85Q0e7RJ3pRPlgAw0qeMvfK5fguI5TE
         ecgmTZKi+A4jtN07ZwJk0OttCHGKRDcr/PaSWZnwKoob6bCjE4WJ5uPE07HTgHfOso
         pbLDwSqJiUNpwEtD0WMpP+ZVf4Od677EjESZM1POMQq1I+s0Aq5hvbH25afPPAXbvn
         T8ZeO8fiJyV+4/O2buYTzbvxt10J/Z8gJuFKnMBtd/7WB8aRWe3yVjvARVUevWkpK/
         AWQQFfKv0/18HZEOMcdS28rIjeLbhgoUENb0Nx+ozkAxjIhEUTWfx1kSusniTYQMO8
         aQrCbYtmBiGAw==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id s194so1438083vkb.11;
        Tue, 07 Apr 2020 18:23:42 -0700 (PDT)
X-Gm-Message-State: AGi0PuYZsyaZMOHjoqX8NhizTUBBxlga/zGnddbJoH7a+Qh5fsjSVx3B
        LnqdiS8euvRsR4O4/bqAUBha7fwaBgjA9Ouivpo=
X-Google-Smtp-Source: APiQypIuGfqhkB2hNw06pDGA/OtJgKWvtZ8wnT+RnKI9oxP3RmAMCkeSbst1QiR+Lk/vPxL/lSRc5QC9r/N4r9ycQjM=
X-Received: by 2002:a1f:32cf:: with SMTP id y198mr3643371vky.96.1586309021182;
 Tue, 07 Apr 2020 18:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <20200406112220.GB126804@google.com>
 <CAK7LNARkFN8jTD8F3CU7r_AL8dbqaKpUuou4MCLZvAYLGs9bYA@mail.gmail.com>
 <CAKwvOdmHxeZ+T1OsOhW25pPygHM4D21OgZqRk141xbjP437-1w@mail.gmail.com>
 <CAK7LNARSMvGZ6T4Ct=U4Xe1WQCgkaWE8m8BxRuYiaokKVjA_ig@mail.gmail.com>
 <CAKwvOdkicpNMqQipZ+AMTEz7JVou3bkcKiQ3Cih20qH0hoziDg@mail.gmail.com> <20200407191923.txaggm7ntxrinddf@google.com>
In-Reply-To: <20200407191923.txaggm7ntxrinddf@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 8 Apr 2020 10:23:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATV0sNqHr6+ypkCE-H4Xm3fiV3-Ai2N88JQ9BQAcTqxpw@mail.gmail.com>
Message-ID: <CAK7LNATV0sNqHr6+ypkCE-H4Xm3fiV3-Ai2N88JQ9BQAcTqxpw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Fangrui Song <maskray@google.com>
Cc:     "'Nick Desaulniers' via Clang Built Linux" 
        <clang-built-linux@googlegroups.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 8, 2020 at 4:19 AM Fangrui Song <maskray@google.com> wrote:
>
>
> On 2020-04-07, 'Nick Desaulniers' via Clang Built Linux wrote:
> >On Tue, Apr 7, 2020 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>
> >> On Wed, Apr 8, 2020 at 2:01 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >> >
> >> > On Tue, Apr 7, 2020 at 9:17 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> > >
> >> > > On Mon, Apr 6, 2020 at 8:22 PM 'Matthias Maennich' via Clang Built
> >> > > Linux <clang-built-linux@googlegroups.com> wrote:
> >> > > >
> >> > > > On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
> >> > > > >As Documentation/kbuild/llvm.rst implies, building the kernel with a
> >> > > > >full set of LLVM tools gets very verbose and unwieldy.
> >> > > > >
> >> > > > >Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> >> > > > >GCC and Binutils. You can pass LLVM=1 from the command line or as an
> >> > > > >environment variable. Then, Kbuild will use LLVM toolchains in your
> >> > > > >PATH environment.
> >> > > > >
> >> > > > >Please note LLVM=1 does not turn on the LLVM integrated assembler.
> >> > > > >You need to explicitly pass AS=clang to use it. When the upstream
> >> > > > >kernel is ready for the integrated assembler, I think we can make
> >> > > > >it default.
> >> > > > >
> >> > > > >We discussed what we need, and we agreed to go with a simple boolean
> >> > > > >switch (https://lkml.org/lkml/2020/3/28/494).
> >> > > > >
> >> > > > >Some items in the discussion:
> >> > > > >
> >> > > > >- LLVM_DIR
> >> > > > >
> >> > > > >  When multiple versions of LLVM are installed, I just thought supporting
> >> > > > >  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> >> > > > >
> >> > > > >  CC      = $(LLVM_DIR)clang
> >> > > > >  LD      = $(LLVM_DIR)ld.lld
> >> > > > >    ...
> >> > > > >
> >> > > > >  However, we can handle this by modifying PATH. So, we decided to not do
> >> > > > >  this.
> >> > > > >
> >> > > > >- LLVM_SUFFIX
> >> > > > >
> >> > > > >  Some distributions (e.g. Debian) package specific versions of LLVM with
> >> > > > >  naming conventions that use the version as a suffix.
> >> > > > >
> >> > > > >  CC      = clang$(LLVM_SUFFIX)
> >> > > > >  LD      = ld.lld(LLVM_SUFFIX)
> >> > > > >    ...
> >> > > > >
> >> > > > >  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
> >> > > > >  but the suffixed versions in /usr/bin/ are symlinks to binaries in
> >> > > > >  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> >> > > > >
> >> > > > >- HOSTCC, HOSTCXX, etc.
> >> > > > >
> >> > > > >  We can switch the host compilers in the same way:
> >> > > > >
> >> > > > >  ifneq ($(LLVM),)
> >> > > > >  HOSTCC       = clang
> >> > > > >  HOSTCXX      = clang++
> >> > > > >  else
> >> > > > >  HOSTCC       = gcc
> >> > > > >  HOSTCXX      = g++
> >> > > > >  endif
> >> > > > >
> >> > > > >  This may the right thing to do, but I could not make up my mind.
> >> > > > >  Because we do not frequently switch the host compiler, a counter
> >> > > > >  solution I had in my mind was to leave it to the default of the
> >> > > > >  system.
> >> > > > >
> >> > > > >  HOSTCC       = cc
> >> > > > >  HOSTCXX      = c++
> >> > > >
> >> > > > What about HOSTLD ? I saw recently, that setting HOSTLD=ld.lld is not
> >> > > > yielding the expected result (some tools, like e.g. fixdep still require
> >> > > > an `ld` to be in PATH to be built). I did not find the time to look into
> >> > > > that yet, but I would like to consistently switch to the llvm toolchain
> >> > > > (including linker and possibly more) also for hostprogs.
> >> > >
> >> > >
> >> > > HOSTLD=ld.lld worked for me, but HOSTCC=clang did not.
> >> > >
> >> > >
> >> > >
> >> > > HOSTCC=clang without CC=clang fails to build objtool.
> >> > >
> >> > > The build system of objtool is meh.  :(
> >> >
> >> > Let's tackle that in a follow up, with the goal of build hermiticity
> >> > in mind.  I think there's good feedback in this thread to inform the
> >> > design of a v2:
> >> > 1. CLANG_AS=0 to disable integrated as.  Hopefully we won't need this
> >> > much longer, so we don't need to spend too much time on this, Masahiro
> >> > please just choose a name for this.  llvm-as naming conventions
> >> > doesn't follow the rest of binutils.
> >>
> >> I am not so familiar with the terminology in LLVM,
> >> but I feel 'integrated' is a keyword IMHO.
> >> I prefer LLVM_IA=1.  (or  LLVM_INTEGRATED_AS=1)
> >
> >I'm happy with either, and I trust your judgement.  You choose.
> >Hopefully we will fix all our assembler bugs soon and won't need the
> >flag much longer.
>
> Maybe "IAS", e.g. LLVM_IAS=1 or CLANG_IAS=1
>
> IAS is referred to in a few places. IA is not a common abbreviation.
>
> I don't have strong opinion here and thank Masahiro a lot for the
> improvement!
>

OK, I will rename it to LLVM_IAS.

Thanks for the advice.

-- 
Best Regards
Masahiro Yamada
