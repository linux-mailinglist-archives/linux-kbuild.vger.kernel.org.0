Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B711269DF9
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 07:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgIOFll (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 01:41:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgIOFli (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 01:41:38 -0400
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7378220897;
        Tue, 15 Sep 2020 05:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600148497;
        bh=py1Ic3FYAxgFRhk1XbUcw+ZT1cHuHmyt/viWV46qu0E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ESYGSRzt+0NOzR1QGn6zBKUTfxx4NswZco32Tjhe2UAcSZdDi3y/rBDGUmTQDlcja
         top9++iUrnbpKYGJ4Bos26CgiPvlixi65L3GNyklinByZl1Q0QrT4DbklbuiWeynkg
         oYgnpjUL47suOYm0wsxe7me3y2VREXQpaYduVmX4=
Date:   Tue, 15 Sep 2020 07:41:26 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: xconfig is broken again on Qt5
Message-ID: <20200915074126.36a24f0e@coco.lan>
In-Reply-To: <CAK7LNAQ6M+9CSwEOb687jGQbtOX6GjKhQ3m45U7XrPs4_CJU0Q@mail.gmail.com>
References: <e04f1e9372f896d435d972cc6b70d1eb3b0c32a2.camel@redhat.com>
        <CAK7LNAQ6M+9CSwEOb687jGQbtOX6GjKhQ3m45U7XrPs4_CJU0Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Tue, 15 Sep 2020 00:25:07 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Sun, Sep 13, 2020 at 10:21 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> >
> > I hate to say it, but xconfig got broken again.
> >
> > After commit 68fd110b3e7e2 ("kconfig: qconf: remove redundant help in the info view")
> > help description disappered completely from xconfig (both normal and split mode)
> >
> > I reverted this and next commit to get this back.
> >
> > I have a feeling that there were several bugs introduced to xconfig recently
> > due to attempt to support both Qt4 and Qt5. Maybe we should only support one version?  
> 
> 
> xconfig was originally written for Qt3, and
> got broken in many ways after being converted to Qt5.
> (commit 8328447af88eaab1d thru b4ff1de3b8381a4)
> 
> That is my gut feeling.
> 
> So, xconfig carried broken code everywhere
> for many years.
> 
> I think supporting both Qt4 and Qt5
> is doable, but testing both versions is tedious.
> I'd like to want to drop Qt4 support in the future but
> not in this development cycle because there are still
> some people using Qt4.

My 2 cents here: I ported Kaffeine from Qt4 to Qt5. When I did that,
I tried to make it compatible with both, but that was not easy. So,
it now supports only Qt5. Ok, Kaffeine uses a lot of different APIs.

It is probably doable to keep xconfig compatible with both Qt4 and
Qt5, but not sure if it is worth the efforts, as Qt5 was released 
at the end of 2012. So, I guess that all distros should have Qt5
packages, even the LTS ones.

> Recently I changed xconfig a lot because I noticed
> various bugs, and also needed to simplify the code
> for better maintainability.
> 
> 
> Sorry for the pain, but we need to change the code
> to make it stable and maintainable.
> 
> For the reported issue,
> does this work for you?
> https://patchwork.kernel.org/patch/11774055/
> 
> 
> > I tried gconfig even thinking maybe nobody uses xconfig these days
> > but gconfig seems to lack search function.  
> 
> gconfig is not well maintained either.
> 
> I think it should be converted from gtk+2 to gtk+3
> and I know various bugs that need fixing
> (but I have not been able to find time to work on it...)

Such conversion can also be painful. I also did two such
conversions for other media packages (Camorama and ZBar). Also,
gtk4 is close to be released:

	https://www.phoronix.com/scan.php?page=news_item&px=GTK-3.99.1-Released

Porting from gtk+3 to gtk4 is also painful. I tried to prepare
Camorama (which currently supports both gtk+2 and gtk+3) for gtk4, 
but one of the fundamental features needed for it to work was dropped
(a way to write video images inside a widget). Last time I checked,
there were no obvious replacement for it (didn't check 3.99 yet).

Maybe the main point here is if we should keep maintaining two
GUI frontends.

Thanks,
Mauro
