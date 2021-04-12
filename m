Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D89F35C6A6
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Apr 2021 14:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241409AbhDLMrN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Apr 2021 08:47:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:54470 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241374AbhDLMrM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Apr 2021 08:47:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A676EAFEF;
        Mon, 12 Apr 2021 12:46:53 +0000 (UTC)
Date:   Mon, 12 Apr 2021 14:46:52 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
Message-ID: <20210412124652.GT6564@kitsune.suse.cz>
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
> 
> 
> [1]
> $ git checkout  add74f8473^
> $ make ARCH=arm CROSS_COMPILE=scripts/dummy-tools/ allmodconfig
> 
> [2]
> $ git checkout  add74f8473
> $ make ARCH=arm CROSS_COMPILE=scripts/dummy-tools/ allmodconfig

Indeed, the rust support is the cause of the issue:

add74f8473c5ca7d8947c760ff355df991a259bb (HEAD) Rust support
0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b (tag: v5.12-rc4, s390/master,
s390/linux/master) Linux 5.12-rc4

While v5.12-rc4 is OK add74f8473 produces the error.

There is additional issue that I noticed: dummy tools does not work
seamlessly with O=

$ make CROSS_COMPILE=$(pwd)/scripts/dummy-tools/ O=/scratch/ppc64/ V=1 ARCH=powerpc allmodconfig > /dev/null
which: no elfedit in (/home/michal/linux-2.6/scripts/dummy-tools)

$ make CROSS_COMPILE=scripts/dummy-tools/ O=/scratch/ppc64/ V=1 ARCH=powerpc allmodconfig > /dev/null
which: no elfedit in (./scripts/dummy-tools)
scripts/Kconfig.include:39: compiler 'scripts/dummy-tools/gcc' not found
make[2]: *** [/home/michal/linux-2.6/scripts/kconfig/Makefile:63:
allmodconfig] Error 1
make[1]: *** [/home/michal/linux-2.6/Makefile:636: allmodconfig] Error 2
make: *** [Makefile:222: __sub-make] Error 2

Perhaps linking dummy-tools into the target directory would be a good
idea?

Thanks

Michal

