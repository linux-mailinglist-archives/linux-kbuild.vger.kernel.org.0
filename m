Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F86635B6D4
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 22:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbhDKUDz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 16:03:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:56422 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235486AbhDKUDz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 16:03:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 38982B036;
        Sun, 11 Apr 2021 20:03:37 +0000 (UTC)
Date:   Sun, 11 Apr 2021 22:03:35 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
Message-ID: <20210411200335.GS6564@kitsune.suse.cz>
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
 <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com>
 <20210411101829.GR6564@kitsune.suse.cz>
 <CAK7LNASycuqb2wyizXgVs4aN33LOrxCBikLbSXs+anWJ0-SW_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASycuqb2wyizXgVs4aN33LOrxCBikLbSXs+anWJ0-SW_Q@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 08:37:03PM +0900, Masahiro Yamada wrote:
> On Sun, Apr 11, 2021 at 7:18 PM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > On Sun, Apr 11, 2021 at 03:12:40AM +0900, Masahiro Yamada wrote:
> > > On Fri, Apr 9, 2021 at 6:31 AM Michal Suchanek <msuchanek@suse.de> wrote:
> > > >
> > > > elfedit is used in Makefile
> > > >
> > > >  Makefile:GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > > >
> > > > which causes this error getting printed
> > > >
> > > >  which: no elfedit in (./scripts/dummy-tools)
> > >
> > >
> > > I am OK with this patch, but how did you reproduce it?
> >
> > make ARCH=arm CROSS_COMPILE=scripts/dummy-tools/ allmodconfig
> >
> > it possibly depends on the config you already have, too.
> >
> > Thanks
> >
> > Michal
> 
> 
> Maybey, are you working on linux-next?

Yes, I do have the rust support.

> 
> 
> [1]
> $ git checkout  add74f8473^
> $ make ARCH=arm CROSS_COMPILE=scripts/dummy-tools/ allmodconfig
> 
> [2]
> $ git checkout  add74f8473
> $ make ARCH=arm CROSS_COMPILE=scripts/dummy-tools/ allmodconfig
> 
> 
> 
> If [1] is OK, but [2] is NG,
> commit add74f8473 is the root cause.

Sounds like it. Before that the elfedit test was conditional on clang.

I can try to do the bisect but I think the reason it broke is quite
clear.

Thanks

Michal
