Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CF6339491
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 18:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhCLRTn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 12:19:43 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:35891 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhCLRT3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 12:19:29 -0500
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 12CHJ0Fr003425;
        Sat, 13 Mar 2021 02:19:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 12CHJ0Fr003425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615569541;
        bh=GozglGRmJ4MmfZBSlP11BHzsPKe31X7+unemMC3S8jQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ckIYs/z2fF6DrYfZVam098tADF4n+CXsg8qIgRlrZV1tI5jftkOwC+n3+NLoRvDRE
         +s/RmwUvwsHuwkxQEUojAwLlCKOnWnJbIuzp2UT1Q9Sg/+spJPHNG+k8MnjE8WH8QC
         37hscqGvaexPinH5ntodV8zpiZz4xQBipmEwFfrnoxurmmqqeYZ9WoMsPJ3KqGsojt
         Ga2F/2nONaMr98uFcC8ZhZPzWDg4A1199dd2hbeeCUUJMG6QRW08FmwetBl3ipdWiy
         wg+vehhZVMOMAhOmaNLusNcTv8DzVtcLit1wXBHQkUawB7KvN0x7y2bymVw43zrDAQ
         pWakjHsrE6ICQ==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so11377617pjb.0;
        Fri, 12 Mar 2021 09:19:01 -0800 (PST)
X-Gm-Message-State: AOAM5316MxNnTXVAo1/1i7OptbsCxogJ6whnXPc61hiW4iZKnsQu91VN
        3LxU3J9qSEriq+c9CP5mioITo5QoL59Tik+jjrA=
X-Google-Smtp-Source: ABdhPJx4kjKatvvX3YUK1AwXdNBNH+gIfE6Nz6EskjoF+x7wQaAkgMc+r8DF8Op0JCR2ruQXf1fspCsaR8ljEbfDrp0=
X-Received: by 2002:a17:90a:fb54:: with SMTP id iq20mr10676742pjb.153.1615569540243;
 Fri, 12 Mar 2021 09:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <20210303183333.46543-4-masahiroy@kernel.org>
 <CAKwvOdmNKKpZY38=ayM3NfU5K_27P_CqkKtLx7CbRw6_mFuxPA@mail.gmail.com>
In-Reply-To: <CAKwvOdmNKKpZY38=ayM3NfU5K_27P_CqkKtLx7CbRw6_mFuxPA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Mar 2021 02:18:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNASBQ-WOWLgLCWa1Qb74PU_HrU1jk=SeRwH+XoT_NF93AA@mail.gmail.com>
Message-ID: <CAK7LNASBQ-WOWLgLCWa1Qb74PU_HrU1jk=SeRwH+XoT_NF93AA@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: dwarf: use AS_VERSION instead of test_dwarf5_support.sh
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 5:44 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Wed, Mar 3, 2021 at 10:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > The test code in scripts/test_dwarf5_support.sh is somewhat difficult
> > to understand, but after all, we want to check binutils >= 2.35.2
> >
> > From the former discussion, the requrement for generating DRAWF v5 from
>
> ^typos: s/requrement/requirement, s/DRAWF/DWARF
>
> (in vim you can `:set spell` (`:set nospell` to disable), there's
> probably a nice way to auto set this on buffer entry for a commit
> message)


I cannot be accustomed to vim.

I use emacs for coding, and nano editor
for editing simple text files, and input commit log.

I invoke aspell from nano (Ctrl-t, Ctrl-s), but
I sometimes forget to do spell checking.



> >
> >  config DEBUG_INFO_DWARF5
> >         bool "Generate DWARF Version 5 debuginfo"
> > -       depends on GCC_VERSION >= 50000 || CC_IS_CLANG
> > -       depends on CC_IS_GCC || $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> > +       depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && AS_IS_GNU && AS_VERSION >= 23502) || (CC_IS_CLANG && AS_IS_LLVM)
>
> Would this be more concise as:
> +       depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM
> || (AS_IS_GNU && AS_VERSION >= 23502))
>

Yes, this is simpler.
I will do it in v2.

Thanks.


-- 
Best Regards
Masahiro Yamada
