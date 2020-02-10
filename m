Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2EB415842A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2020 21:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgBJUOZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Feb 2020 15:14:25 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61808 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgBJUOZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 15:14:25 -0500
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 01AKEG8v025443;
        Tue, 11 Feb 2020 05:14:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01AKEG8v025443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581365657;
        bh=OIC2IL6NAo1TCjyWmce0RFIqaE9MA3FUoGaflhN9R74=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RVBvgi66rTbLqDDAr+h0VSt/geuoej2xlRxd5CYWKXDDP+9lixWgWVjUevd/rdara
         TL9v0dqG7PtZiyJ9OwSNXLu4/YRINqyM+G1NJdFB5FJiOuD6eZs1tOjVO/7sfJw8tn
         4yN36qZppsFN3Ano3cwTTdCv+im0RoZhCZk/9BGzDffJ+7mNUZq+T/kM4tJP1MJ6xX
         Gw/HW8Jm2zdF9U79FpMQZp7ScXn4heCDsl7di0yzdw5y0aLlhCK/wcGsPyR5BpWjpc
         AJ4L30Z/1M4EbLcf2IVlIuSjp3EUxgz22z3hjmT85kLeV5RT8K3xSzt+1nD16SQQtA
         +X2ZpvMkUEuFg==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id i4so2190103vkc.3;
        Mon, 10 Feb 2020 12:14:17 -0800 (PST)
X-Gm-Message-State: APjAAAXcBREuB0uFRnPO+pEoIm+Zux9wqZjMdtNxMPT+rL8Z2jGxRGbR
        m8L/IK3fx6n9KHc+7VX4JzbLAHk7DbPOYC+2cX8=
X-Google-Smtp-Source: APXvYqzJS4naQg52GQccTG72db3gni8J+ICEApHBL4C4bI54ORpCd0l3/5uKjLBvJKi1cb4UFzilAV86gj16RQ7U0/g=
X-Received: by 2002:a1f:bfc2:: with SMTP id p185mr1867956vkf.73.1581365655864;
 Mon, 10 Feb 2020 12:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com> <20200127100542.GV32742@smile.fi.intel.com>
In-Reply-To: <20200127100542.GV32742@smile.fi.intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 11 Feb 2020 05:13:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
Message-ID: <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Fix off-by-one error when generate a new version
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michal Simek <monstr@monstr.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Andy,

On Mon, Jan 27, 2020 at 7:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jan 24, 2020 at 09:58:59PM +0200, Andy Shevchenko wrote:
> > When build on, for example, x86 using `make O=... -j64` the version
> > in the built kernel comes from include/generated/compile.h, which is:
> >
> >       #define UTS_VERSION "#351 SMP Fri Jan 24 18:46:34 EET 2020"
> >
> > While at the end the x86 specific Makefile prints the contents of
> > the .version file:
> >
> >       Kernel: arch/x86/boot/bzImage is ready  (#352)
> >
> > Obviously the latter is not true. This happens because we first
> > check compile.h and update it and then generate new version, which is
> > incorrect flow:
> >
> >   CHK     include/generated/compile.h
> >   UPD     include/generated/compile.h
> >   ...
> >   GEN     .version
> >
> > In order to fix this, move the version generation from link-vmlinux.sh
> > to scripts/version.sh and re-use it in init/Makefile.
> >
> > Additionally provide a unified way to get the current version of the build
> > and use this in few callers. This will respect the KBUILD_BUILD_VERSION
> > in case it's provided.
>
> Hmm... It looks like a mess in my build tree.
> I have to setup more experiments here.
>


Sorry for the late reply.

I remember I was also hit by this one month ago or so.

I did not dig into it at that time
because the problem disappeared after doing something.

Today, I took a look at this again.
This is a regression caused by 56d589361572

This patch should fix it:
https://patchwork.kernel.org/patch/11374047/

-- 
Best Regards
Masahiro Yamada
