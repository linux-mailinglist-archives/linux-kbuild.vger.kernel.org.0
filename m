Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA21A6B4BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 04:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbfGQCw7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 22:52:59 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65326 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfGQCw6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 22:52:58 -0400
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6H2qiRS010105;
        Wed, 17 Jul 2019 11:52:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6H2qiRS010105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563331965;
        bh=C+wyLnsv5jaWhGibytQsVxu8t+X3/B+2vxTy6JbgW+I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y4Apnqqmg0fHi32ojx7zYmrAlFinFJepmbLRZo7THm1pETRdu7c/GvFslrlFMTNHj
         MmqW06GTayJhBm/i7spzLSn9Pd8cX04vSMOlPRfH35Es00bTxYrzQLEZziodPhFmkW
         kM1LvfcN+RhfdTz75CVdAeI7a0WeJDRND/lhLAbrSg3vRqL4nVXVVFGhwhMuD/fVql
         9JRkIox7iP12yGOXq5FsldZixILdt8PV+KoRTpf5MtAoP6UI/VIcXnBiNtnMNsWYj4
         PCr+LJppmEwSuaqW+pbKv4AdZLLmZpLQzKO+rkyTPRPTeYSzbY5GbwEDn7AVSwjrqm
         jr/o77whneUNQ==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id b64so4639129vke.13;
        Tue, 16 Jul 2019 19:52:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXb4wGCEewF2Wj9u0Ixm/kIzR2W/kHq3qalWPZrVrJWEVs3NbWb
        Nh/Ao0etAkDgQO9idxTwLNtTxbOfPJVCIKyxawA=
X-Google-Smtp-Source: APXvYqwRFyinMCAXqo1zyqGd/lyRlfnxSvqFnfvwljjQoO6XpzOI45n8PcIvX4h5eSdCtWJKl+3CHF9ehTbPtS6Rz8s=
X-Received: by 2002:a1f:b0b:: with SMTP id 11mr14045482vkl.64.1563331963693;
 Tue, 16 Jul 2019 19:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <201907160706.9xUSQ36X%lkp@intel.com> <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
 <20190716124249.GP5418@ubuntu-xps13> <20190716162014.iu47g6o7ralxhcf5@treble>
In-Reply-To: <20190716162014.iu47g6o7ralxhcf5@treble>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 17 Jul 2019 11:52:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDRFuwC4jxvjgs0bUU8EJ93k1_eQTynK2wRfJCRfmFjw@mail.gmail.com>
Message-ID: <CAK7LNASDRFuwC4jxvjgs0bUU8EJ93k1_eQTynK2wRfJCRfmFjw@mail.gmail.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Seth Forshee <seth.forshee@canonical.com>, kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 17, 2019 at 1:20 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Tue, Jul 16, 2019 at 07:42:49AM -0500, Seth Forshee wrote:
> > On Tue, Jul 16, 2019 at 03:57:24PM +0900, Masahiro Yamada wrote:
> > > (+ Josh Poimboeuf)
> > >
> > > On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
> > > >
> > > > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > > > head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> > > > commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> > > > config: x86_64-randconfig-s2-07160214 (attached as .config)
> > > > compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> > > > reproduce:
> > > >         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
> > > >         # save the attached .config to linux build tree
> > > >         make ARCH=x86_64
> > >
> > > 0-day bot reports objtool warnings with the following applied:
> > > https://patchwork.kernel.org/patch/11037379/
> > >
> > > I have no idea about objtool.
> > >
> > > Is it better to drop this patch for now?
> >
> > I'm surprised that the change would have any impact on a build with
> > gcc-4.9, since -fcf-protection seems to have been introduced in gcc-8. I
> > guess there's no full build log that would let us see the actual flags
> > passed to the compiler.
> >
> > I'll try to reproduce this result. If you think the patch should be
> > dropped in the meantime, that's fine.
>
> The problem with this patch is that it's breaking the following check in
> arch/x86/Makefile.  GCC 4.9 doesn't support retpolines, so it's supposed
> to fail with the below error.
>
> ifdef CONFIG_RETPOLINE
> ifeq ($(RETPOLINE_CFLAGS),)
>         @echo "You are building kernel with non-retpoline compiler." >&2
>         @echo "Please update your compiler." >&2
>         @false
> endif
> endif
>
> Maybe the flags should be placed in another variable other than
> RETPOLINE_CFLAGS.



Josh,
Thanks. You are right.


Seth,
I think you can add the flag to KBUILD_CFLAGS.

If you want to make sure this does not affect non-retpoline
build, you can surround the code with ifdef.

ifdef CONFIG_RETPOLINE
KBUILD_CFLAGS  += $(call cc-option,-fcf-protection=none)
endif



-- 
Best Regards
Masahiro Yamada
