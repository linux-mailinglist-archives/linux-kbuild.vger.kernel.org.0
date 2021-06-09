Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911AB3A1D8A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jun 2021 21:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhFITSG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Jun 2021 15:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhFITSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jun 2021 15:18:05 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CB0C061574;
        Wed,  9 Jun 2021 12:15:56 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id h9so26216649oih.4;
        Wed, 09 Jun 2021 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BD7/wf84UTSHopoIOB/3p9ZqN2EMQtESjgnlUjRQYOA=;
        b=l8TxkH7sVyAh2HIBfQD8t8ZaA/HKV6sJ5g1+4MsDydzayQdy/XnpFsQyj/N7PUBUgv
         WaQ52SVwtl3rUQcB/IqGiEliwpdN95QEGrFz5qL64wejzAgWlk9t2yNKiVPNt+c2Deap
         EFt9nEHiHd6yFycWScGM/qFF4fdtxa7Zq4i16Id899GDssR84IyItfeSQn0LW7gnueA9
         c2nW/dQxVfl0HaZwHAuXM+qf3QuoAdDi1gHxsc+ax4D0z/u/lYm0RCLiT/2sl2q9ouid
         +ZODRlF9d6aKe3NciTcOsO1QpWFpaCqTj6tezS86pavZZgR3sFklkpLtd7U/QNchKpnl
         f14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=BD7/wf84UTSHopoIOB/3p9ZqN2EMQtESjgnlUjRQYOA=;
        b=pAm8KZbdaYtcb30SlqQtip17GaaRqGVscJ6v/Pm718bh0ZzT+7zWc/7pZrXUPDt0xz
         o6kc5WPrZFChzmX1kFWdJanQA2roJt4swG+giG5HeVUotVyNaZUaYeQprpWI3RyS1HV7
         Z6I7FKy0UN2jmvdIF7hocpZV+KcQyGml+L28qUGdWUM5Gsv/2H/EF553ewvKGW8SfviE
         sFHiGAtJks08c0ZC0KBvKeiBxbQU3Qnnwiifmjo4Y3hpAmqDNBT5enqCnR0ZU3VlENG/
         mDtmMgjYfl1l86Oq3NUANfBc0DybNrps/VklaXHUsTRzw68str29sH6RjrOHuFfEG8AY
         kQmQ==
X-Gm-Message-State: AOAM5307bm0g5DTlAYlEu2MUk5S9bmErN01CUTeEY4GEOAWs+wAuShuP
        pZTeDbCH3/ZJoAYLUGPbMR0=
X-Google-Smtp-Source: ABdhPJyxL26CHvlEwjthjpNg8fDXLW5VftXPaU5UdRifedREg84ZGggF61f3czCoYiEXWRzS7gwGZA==
X-Received: by 2002:aca:4e8c:: with SMTP id c134mr7142679oib.62.1623266155865;
        Wed, 09 Jun 2021 12:15:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 184sm122523ooi.3.2021.06.09.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 12:15:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 12:15:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        mfaltesek@google.com
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
Message-ID: <20210609191553.GA2535199@roeck-us.net>
References: <20210204152957.1288448-1-arnd@kernel.org>
 <20210609110531.GA1528247@roeck-us.net>
 <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
 <20210609151608.GA3389541@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609151608.GA3389541@roeck-us.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 09, 2021 at 08:16:11AM -0700, Guenter Roeck wrote:
> On Wed, Jun 09, 2021 at 01:24:18PM +0200, Arnd Bergmann wrote:
> > On Wed, Jun 9, 2021 at 1:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On Thu, Feb 04, 2021 at 04:29:47PM +0100, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > ARM randconfig builds with lld sometimes show a build failure
> > > > from kallsyms:
> > > >
> > > >   Inconsistent kallsyms data
> > > >   Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> > > >
> > > > The problem is the veneers/thunks getting added by the linker extend
> > > > the symbol table, which in turn leads to more veneers being needed,
> > > > so it may take a few extra iterations to converge.
> > > >
> > > > This bug has been fixed multiple times before, but comes back every time
> > > > a new symbol name is used. lld uses a different set of idenitifiers from
> > > > ld.bfd, so the additional ones need to be added as well.
> > > >
> > > > I looked through the sources and found that arm64 and mips define similar
> > > > prefixes, so I'm adding those as well, aside from the ones I observed. I'm
> > > > not sure about powerpc64, which seems to already be handled through a
> > > > section match, but if it comes back, the "__long_branch_" and "__plt_"
> > > > prefixes would have to get added as well.
> > > >
> > >
> > > This is such a whack-a-mole. The problem is hitting us yet again. I suspect
> > > it may be due to a new version of lld using new symbols, but I didn't really
> > > try to track it down. Is there an easy way to search for missed symbols ?
> > 
> > The way I did it previously was to hack Kbuild to not remove the temporary
> > files after a failure, and then compare the "objdump --syms" output of the
> > last two stages.
> 
> Problem with that is that we have a non-deterministic problem: The build
> fails for us on some build servers, but we are unable to reproduce the
> problem when building the same image manually on a development server.
> That is similar to what I had observed before, where powerpc builds would
> pass on one server, but the same kernel with the same configuration would
> fail to build on a second almost identical server. It would really be great
> if we can find a better solution.
> 
> > 
> > I suppose we could improve the situation if scripts/link-vmlinux.sh was able
> > to do that automatically, and compare the kallsyms output .S file between
> > steps 1 and 2.
> 
> Comparing the .S files doesn't result in useful data; turns out there are
> always irrelevant differences. We'll try to run a diff on the output of
> "objdump --syms". Hopefully that will generate something useful.
> 

Turns out it wasn't that useful.

chromeos-kernel-5_10-5.10.42-r406: Symbol file differences:
chromeos-kernel-5_10-5.10.42-r406: 7c7
chromeos-kernel-5_10-5.10.42-r406: < 00000000000325c8 g       .rodata	0000000000000000 kallsyms_relative_base
chromeos-kernel-5_10-5.10.42-r406: ---
chromeos-kernel-5_10-5.10.42-r406: > 00000000000325c0 g       .rodata	0000000000000000 kallsyms_relative_base
chromeos-kernel-5_10-5.10.42-r406: 9,13c9,13
chromeos-kernel-5_10-5.10.42-r406: < 00000000000325d0 g       .rodata	0000000000000000 kallsyms_num_syms
chromeos-kernel-5_10-5.10.42-r406: < 00000000000325d8 g       .rodata	0000000000000000 kallsyms_names
chromeos-kernel-5_10-5.10.42-r406: < 00000000000cd7f0 g       .rodata	0000000000000000 kallsyms_markers
chromeos-kernel-5_10-5.10.42-r406: < 00000000000cdb18 g       .rodata	0000000000000000 kallsyms_token_table
chromeos-kernel-5_10-5.10.42-r406: < 00000000000cde78 g       .rodata	0000000000000000 kallsyms_token_index
chromeos-kernel-5_10-5.10.42-r406: ---
chromeos-kernel-5_10-5.10.42-r406: > 00000000000325c8 g       .rodata	0000000000000000 kallsyms_num_syms
chromeos-kernel-5_10-5.10.42-r406: > 00000000000325d0 g       .rodata	0000000000000000 kallsyms_names
chromeos-kernel-5_10-5.10.42-r406: > 00000000000cd7d8 g       .rodata	0000000000000000 kallsyms_markers
chromeos-kernel-5_10-5.10.42-r406: > 00000000000cdb00 g       .rodata	0000000000000000 kallsyms_token_table
chromeos-kernel-5_10-5.10.42-r406: > 00000000000cde60 g       .rodata	0000000000000000 kallsyms_token_index

I thought I'd see the added symbols, but it looks like the only difference
between the two files is the addresses.

What am I missing ?

Thanks,
Guenter
