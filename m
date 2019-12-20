Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5257D12803E
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2019 17:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLTQBR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Dec 2019 11:01:17 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52435 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfLTQBR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Dec 2019 11:01:17 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBKG0xIR030187;
        Sat, 21 Dec 2019 01:01:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBKG0xIR030187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576857660;
        bh=JBuboHPmNik0ZyiwIictN4KeobZ3dSMDBlvswdJAN1Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N8suPW5iMMTgQpTfKkpYa1su5lB5daMEQJFrqp23jtmgma+NW9aKRGHGG98bJyTmb
         MbEZCfQRoG6G0Qc4Pi7irDB3vqvM/fbIyvep7penqC6EeDsZaRQOZpcSDSCK2dS/RM
         5TJMHrP0U72OtIBzZGeZmYNpWR7x3Z8hmsPYCTlFlUz8I/MIUK2QAFayQtRwZhMCF5
         cjJipHIKxrlopjyFSTl/pUhOP0xLtqeaFQagKxhFkCPjVYonco08BEy26lGQfw3JLg
         e75YNvtrk0+ZSxOEUOO0xaLJI3h0FOiBsctSzutyjbucsHpbbWcIO+l5RNl9U64+fr
         eazArGdy84JFw==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id g15so6354709vsf.1;
        Fri, 20 Dec 2019 08:01:00 -0800 (PST)
X-Gm-Message-State: APjAAAUNzXZkXwmhkuZa+ckG/cSTp0H1RBzYbh4As4sW84dBOVGdwVws
        IxOxHD/jnd+BGYcEbGAWAoPhqaoiTVGAehJhqME=
X-Google-Smtp-Source: APXvYqyf2+mR65DbEIYHCtHErAD0DJUeTFqmUFTgm9371QmntjF5JtbnI0f7yAkOzt5lC3WpCJl5apomzmiwZaBt2YE=
X-Received: by 2002:a67:7ac4:: with SMTP id v187mr9102940vsc.181.1576857658971;
 Fri, 20 Dec 2019 08:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20191219115100.958-1-masahiroy@kernel.org> <20191219195302.GG32169@bombadil.infradead.org>
In-Reply-To: <20191219195302.GG32169@bombadil.infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 21 Dec 2019 01:00:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsD5KMA-DrDS-9krNdQLfHJEnJ2NB6mq2aLemY2xs+-w@mail.gmail.com>
Message-ID: <CAK7LNAQsD5KMA-DrDS-9krNdQLfHJEnJ2NB6mq2aLemY2xs+-w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clarify the difference between obj-y and obj-m
 w.r.t. descending
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Johan Hovold <johan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 20, 2019 at 4:53 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Dec 19, 2019 at 08:51:00PM +0900, Masahiro Yamada wrote:
> > Kbuild descends into a directory by either 'y' or 'm', but there is an
> > important difference.
> >
> > Kbuild combines the built-in objects into built-in.a in each directory.
> > The built-in.a in the directory visited by obj-y is merged into the
> > built-in.a in the parent directory. This merge happens recursively when
> > Kbuild is ascending back towards the top directory, so built-in objects
> > are linked into vmlinux eventually. This works properly only when the
> > Makefile that specifies obj-y is reachable by the chain of obj-y.
> >
> > On the other hand, Kbuild does not take built-in.a from the directory
> > visited by obj-m. This it, all the objects in that directory are supposed
> > to be modular. If Kbuild descends into a directory by obj-m, but the
> > Makefile in the sub-directory specifies obj-y, those objects are just
> > left orphan.
> >
> > The current statement "Kbuild only uses this information to decide that
> > it needs to visit the directory" is misleading. Clarify the difference.
>
> > +     Kbuild uses this information not only to decide that it needs to visit
> > +     the directory, but also to decide whether or not to link objects from
> > +     the directory into vmlinux.
> > +
> > +     When Kbuild descends into the directory with 'y', all built-in objects
> > +     from that directory are combined into the built-in.a, which will be
> > +     eventually linked into vmlinux.
> > +
> > +     When Kbuild descends into the directory with 'm', in contrast, nothing
> > +     from that directory will be linked into vmlinux. If the Makefile in
> > +     that directory specifies obj-y, those objects will be left orphan.
> > +     It is very likely a bug of the Makefile or of dependencies in Kconfig.
>
> Perhaps the implementation should be changed to match the documentation?
> This seems like a very subtle point for people to know.

I also considered this, but
I do not think the current behavior is too odd.
So, I am not changing it.

-- 
Best Regards
Masahiro Yamada
