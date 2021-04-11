Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DB535B30C
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbhDKKSt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:18:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:37434 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhDKKSs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:18:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 806FAAF2F;
        Sun, 11 Apr 2021 10:18:30 +0000 (UTC)
Date:   Sun, 11 Apr 2021 12:18:29 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
Message-ID: <20210411101829.GR6564@kitsune.suse.cz>
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
 <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 03:12:40AM +0900, Masahiro Yamada wrote:
> On Fri, Apr 9, 2021 at 6:31 AM Michal Suchanek <msuchanek@suse.de> wrote:
> >
> > elfedit is used in Makefile
> >
> >  Makefile:GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >
> > which causes this error getting printed
> >
> >  which: no elfedit in (./scripts/dummy-tools)
> 
> 
> I am OK with this patch, but how did you reproduce it?

make ARCH=arm CROSS_COMPILE=scripts/dummy-tools/ allmodconfig

it possibly depends on the config you already have, too.

Thanks

Michal
