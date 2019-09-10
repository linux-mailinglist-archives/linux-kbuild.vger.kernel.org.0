Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7916CAE24D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2019 04:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389021AbfIJCV0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 22:21:26 -0400
Received: from pb-smtp1.pobox.com ([64.147.108.70]:57299 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388855AbfIJCV0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 22:21:26 -0400
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 196762E7B1;
        Mon,  9 Sep 2019 22:21:24 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=3uVY+/vCeyBFYTF8HZgOWLSrqkY=; b=Q/pq/w
        k37wAzBOswvxWWLbHXwkbMV9A4bwzVVB8wCgN/gmuiEfvdTGGRnqA5bSj/Ipf4Yh
        cA3led+OGkIjvhOawr4jfzR8qgHeD7pQJCsfxc8gIdChLWj5bdqy1cHBEDsLNvdN
        l+Q5Se4BuIgHLLN6nmd8J2z4/pSkBzeuCvQns=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 10A882E7B0;
        Mon,  9 Sep 2019 22:21:24 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=mM2cT/KO/Kh0p+hNabg5T75OZEj8HxdC6mWFljOTELs=; b=YvI4DyvqY79b0o7dreSUgK1LAHgLktpz0fuzX1z/g/RQ8+TqSeJG2OcWNCAbFxKQ60n5j2wDwwF+PFtLoYDrVUSEmLvG1t3hmUG7tYu8hqlDxvxANiUYfWzufFd8rRd2P+7NdrYsvLhcUvmoBg/4eG4e2J0DfKJex1e2tvmjNgs=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 7E2312E7AF;
        Mon,  9 Sep 2019 22:21:23 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id A727E2DA0774;
        Mon,  9 Sep 2019 22:21:22 -0400 (EDT)
Date:   Mon, 9 Sep 2019 22:21:22 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Denis Efremov <efremov@linux.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
In-Reply-To: <CAK7LNASiavMOYDGs0sRm2xAzznd8_Q0vT9T+PFT-bN=mhYezWA@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1909092220020.3091@knanqh.ubzr>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr> <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com> <nycvar.YSQ.7.76.1909091158200.3091@knanqh.ubzr>
 <CAK7LNASiavMOYDGs0sRm2xAzznd8_Q0vT9T+PFT-bN=mhYezWA@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: AF2E4D72-D371-11E9-A9B9-C28CBED8090B-78420484!pb-smtp1.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 10 Sep 2019, Masahiro Yamada wrote:

> On Tue, Sep 10, 2019 at 1:06 AM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> >
> > > Hi Nicolas,
> > >
> > > On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > > >
> > > > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> > > >
> > > > > This line was touched by commit f235541699bc ("export.h: allow for
> > > > > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > > > > not explain why.
> > > > >
> > > > > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
> > > >
> > > > I'm pretty sure it was needed back then so not to interfere with users
> > > > of this file. My fault for not documenting it.
> > >
> > > Hmm, I did not see a problem in my quick build test.
> > >
> > > Do you remember which file was causing the problem?
> >
> > If you build commit 7ec925701f5f with CONFIG_TRIM_UNUSED_KSYMS=y and the
> > defined(__KERNEL__) test removed then you'll get:
> >
> >   HOSTCC  scripts/mod/modpost.o
> > In file included from scripts/mod/modpost.c:24:
> > scripts/mod/../../include/linux/export.h:81:10: fatal error: linux/kconfig.h: No such file or directory
> >
> >
> > Nicolas
> 
> 
> Thanks for explaining this.
> 
> It is not the case any more.
> 
> 
> I will reword the commit message as follows:
> 
> ------------------------>8---------------------------------------
> export.h: remove defined(__KERNEL__), which is no longer needed
> 
> The conditional define(__KERNEL__) was added by commit f235541699bc
> ("export.h: allow for per-symbol configurable EXPORT_SYMBOL()").
> 
> It was needed at that time to avoid the build error of modpost
> with CONFIG_TRIM_UNUSED_KSYMS=y.
> 
> Since commit b2c5cdcfd4bc ("modpost: remove symbol prefix support"),
> modpost no longer includes linux/export.h, thus the define(__KERNEL__)
> is unneeded.
> ------------------------>8---------------------------------------
> 

Acked-by: Nicolas Pitre <nico@fluxnic.net>


Nicolas
