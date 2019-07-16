Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17F36AC98
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 18:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfGPQUR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 12:20:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55570 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbfGPQUR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 12:20:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 328AB308FBAF;
        Tue, 16 Jul 2019 16:20:17 +0000 (UTC)
Received: from treble (ovpn-123-204.rdu2.redhat.com [10.10.123.204])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6181260A9F;
        Tue, 16 Jul 2019 16:20:16 +0000 (UTC)
Date:   Tue, 16 Jul 2019 11:20:14 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Seth Forshee <seth.forshee@canonical.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>, kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
Message-ID: <20190716162014.iu47g6o7ralxhcf5@treble>
References: <201907160706.9xUSQ36X%lkp@intel.com>
 <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
 <20190716124249.GP5418@ubuntu-xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190716124249.GP5418@ubuntu-xps13>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 16 Jul 2019 16:20:17 +0000 (UTC)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 07:42:49AM -0500, Seth Forshee wrote:
> On Tue, Jul 16, 2019 at 03:57:24PM +0900, Masahiro Yamada wrote:
> > (+ Josh Poimboeuf)
> > 
> > On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > > head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> > > commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> > > config: x86_64-randconfig-s2-07160214 (attached as .config)
> > > compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> > > reproduce:
> > >         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
> > >         # save the attached .config to linux build tree
> > >         make ARCH=x86_64
> > 
> > 0-day bot reports objtool warnings with the following applied:
> > https://patchwork.kernel.org/patch/11037379/
> > 
> > I have no idea about objtool.
> > 
> > Is it better to drop this patch for now?
> 
> I'm surprised that the change would have any impact on a build with
> gcc-4.9, since -fcf-protection seems to have been introduced in gcc-8. I
> guess there's no full build log that would let us see the actual flags
> passed to the compiler.
> 
> I'll try to reproduce this result. If you think the patch should be
> dropped in the meantime, that's fine.

The problem with this patch is that it's breaking the following check in
arch/x86/Makefile.  GCC 4.9 doesn't support retpolines, so it's supposed
to fail with the below error.

ifdef CONFIG_RETPOLINE
ifeq ($(RETPOLINE_CFLAGS),)
	@echo "You are building kernel with non-retpoline compiler." >&2
	@echo "Please update your compiler." >&2
	@false
endif
endif

Maybe the flags should be placed in another variable other than
RETPOLINE_CFLAGS.

-- 
Josh
