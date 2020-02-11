Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A87115922B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 15:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgBKOrc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 09:47:32 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42840 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbgBKOrc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 09:47:32 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01BElErD023152;
        Tue, 11 Feb 2020 23:47:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01BElErD023152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581432435;
        bh=eK4UEfP1oZq3xGwyYCFOa/ywH4zsvgqp7UQXXtIcfqs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=crroNUFQPqc5SssgcTr9um9PNEZK2LvgAeaZkwnGSWhon21TAY4Tp5uZmJ2X8r1nX
         GGhnlMxrGyK7//gl8GrNAOKd5Gkts/LeSgIMQOIaCOT1r9BH6e6ehhmPZNMpGwYJQB
         wsj+5Hm5/YVm8ZPnqYG7lVQU+Tk10YW0pNH2nmbhzntPvycP3BPNcliqyXK2mbLab8
         N0TN9jvUiIUgh/dkvOrLstIGUcBELQzEoayKMC+FDCu4ret7NfFRbG593PVhdGLneN
         Vf4jTBHirudUZqst9vtnbBkL2f39jTc/XdQbZZ1MvIgCnH1+h1t1AL2cyGbzDlaXxO
         16YnFG/BXQBNQ==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id w15so4041015uap.0;
        Tue, 11 Feb 2020 06:47:15 -0800 (PST)
X-Gm-Message-State: APjAAAUeES/6yNFHUaxEIFsHkB3acpSzXa8A42rQ/J1Lr8ng7H04AtgD
        O/+3BoBHZHbHZtFLFbNKxZzkGUdRKUXv9VtM3zQ=
X-Google-Smtp-Source: APXvYqzDPRbZecWv+oOo/Lrsuuq5Z7QghTxTaXBXXeUAt6x2WB0jCtkjC+HDS/jqpuSByLl+CoFvHPehizJkb1SyP4I=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr3961359uau.109.1581432434139;
 Tue, 11 Feb 2020 06:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20200210161852.842-1-masahiroy@kernel.org> <CAMrEMU86jmds8LMmbdVk=54h+ziY=6MHwyzHxVRXy5dLGFTmGA@mail.gmail.com>
In-Reply-To: <CAMrEMU86jmds8LMmbdVk=54h+ziY=6MHwyzHxVRXy5dLGFTmGA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 11 Feb 2020 23:46:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNARV34onaXiZA-UAvKZdwnfX_D3g=k0a8EJkD4HzEWRo-Q@mail.gmail.com>
Message-ID: <CAK7LNARV34onaXiZA-UAvKZdwnfX_D3g=k0a8EJkD4HzEWRo-Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
To:     Justin Capella <justincapella@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Tue, Feb 11, 2020 at 11:36 AM Justin Capella <justincapella@gmail.com> wrote:
>
> Looks like len is already +1, maybe it shouldn't be?

This increment is for storing one more character, 'type'.

        sym->sym[0] = type;



> >         len = strlen(name) + 1;
> >
> > -       sym = malloc(sizeof(*sym) + len);
> > +       sym = malloc(sizeof(*sym) + len + 1);


This increment is for the '\0' termination.



So, malloc() needs to allocate:
sizeof(*sym) + strlen(name) + 2.





>
>
> Maybe strlcpy or if len wasn't incremented?
>
> >
> > -       memcpy(sym_name(sym), name, len);
> > +       strcpy(sym_name(sym), name);
> >



-- 
Best Regards
Masahiro Yamada
