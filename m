Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DF726A298
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 11:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgIOJ6R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 05:58:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49270 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726130AbgIOJ6Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 05:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600163895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EaqzeCSiFYpnrPbjV8HOVWxBr3ZpqgtNxUf3qRub4/I=;
        b=hVZPMOuYnZ03PGx2lBONjsdVKXcCdqNJMReSFFe4zOClcStHH4UhNX67/KnvJ7TVljukiQ
        ufJV06TUH9tywKXrVqRxG2kx06rPEe/IyQPNOOtwo4Q9zUUTyt7Bsqkz2jeequAA+7OZ6a
        isSfOjgOjaWxd0Drs2qA09z1nsJI0uQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-RPb1n06cNySajK6IDqouJw-1; Tue, 15 Sep 2020 05:58:10 -0400
X-MC-Unique: RPb1n06cNySajK6IDqouJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAE5D1084D73;
        Tue, 15 Sep 2020 09:58:08 +0000 (UTC)
Received: from starship (unknown [10.35.207.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2504B2C31E;
        Tue, 15 Sep 2020 09:57:55 +0000 (UTC)
Message-ID: <01a04948e9a2b1cf1b3d85e615d76197cf3d45d5.camel@redhat.com>
Subject: Re: xconfig is broken again on Qt5
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Tue, 15 Sep 2020 12:57:49 +0300
In-Reply-To: <fba403b3-75b5-5e97-a2d5-784fd7f10f1f@infradead.org>
References: <e04f1e9372f896d435d972cc6b70d1eb3b0c32a2.camel@redhat.com>
         <CAK7LNAQ6M+9CSwEOb687jGQbtOX6GjKhQ3m45U7XrPs4_CJU0Q@mail.gmail.com>
         <20200915074126.36a24f0e@coco.lan>
         <fba403b3-75b5-5e97-a2d5-784fd7f10f1f@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2020-09-14 at 22:56 -0700, Randy Dunlap wrote:
> On 9/14/20 10:41 PM, Mauro Carvalho Chehab wrote:
> > Em Tue, 15 Sep 2020 00:25:07 +0900
> > Masahiro Yamada <masahiroy@kernel.org> escreveu:
> > 
> > > On Sun, Sep 13, 2020 at 10:21 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > > > I hate to say it, but xconfig got broken again.
> > > > 
> > > > After commit 68fd110b3e7e2 ("kconfig: qconf: remove redundant help in the info view")
> > > > help description disappered completely from xconfig (both normal and split mode)
> > > > 
> > > > I reverted this and next commit to get this back.
> > > > 
> > > > I have a feeling that there were several bugs introduced to xconfig recently
> > > > due to attempt to support both Qt4 and Qt5. Maybe we should only support one version?  
> > > 
> > > xconfig was originally written for Qt3, and
> > > got broken in many ways after being converted to Qt5.
> > > (commit 8328447af88eaab1d thru b4ff1de3b8381a4)
> > > 
> > > That is my gut feeling.
> > > 
> > > So, xconfig carried broken code everywhere
> > > for many years.
> > > 
> > > I think supporting both Qt4 and Qt5
> > > is doable, but testing both versions is tedious.
> > > I'd like to want to drop Qt4 support in the future but
> > > not in this development cycle because there are still
> > > some people using Qt4.
> > 
> > My 2 cents here: I ported Kaffeine from Qt4 to Qt5. When I did that,
> > I tried to make it compatible with both, but that was not easy. So,
> > it now supports only Qt5. Ok, Kaffeine uses a lot of different APIs.
> > 
> > It is probably doable to keep xconfig compatible with both Qt4 and
> > Qt5, but not sure if it is worth the efforts, as Qt5 was released 
> > at the end of 2012. So, I guess that all distros should have Qt5
> > packages, even the LTS ones.
> > 
> > > Recently I changed xconfig a lot because I noticed
> > > various bugs, and also needed to simplify the code
> > > for better maintainability.
> > > 
> > > 
> > > Sorry for the pain, but we need to change the code
> > > to make it stable and maintainable.
> > > 
> > > For the reported issue,
> > > does this work for you?
> > > https://patchwork.kernel.org/patch/11774055/
> > > 
> > > 
> > > > I tried gconfig even thinking maybe nobody uses xconfig these days
> > > > but gconfig seems to lack search function.  
> > > 
> > > gconfig is not well maintained either.
> > > 
> > > I think it should be converted from gtk+2 to gtk+3
> > > and I know various bugs that need fixing
> > > (but I have not been able to find time to work on it...)
> > 
> > Such conversion can also be painful. I also did two such
> > conversions for other media packages (Camorama and ZBar). Also,
> > gtk4 is close to be released:
> > 
> > 	https://www.phoronix.com/scan.php?page=news_item&px=GTK-3.99.1-Released
> > 
> > Porting from gtk+3 to gtk4 is also painful. I tried to prepare
> > Camorama (which currently supports both gtk+2 and gtk+3) for gtk4, 
> > but one of the fundamental features needed for it to work was dropped
> > (a way to write video images inside a widget). Last time I checked,
> > there were no obvious replacement for it (didn't check 3.99 yet).
> > 
> > Maybe the main point here is if we should keep maintaining two
> > GUI frontends.
> 
> I can't recall (m)any gconfig users.
> And it is missing some critical features IMO, like Search.
> 
> 
Thank you very much. The patch works.

I wish I could myself fix the issues that I find in xconfig to avoid bothering
you with that, so I am thinking maybe you can write a short piece of documentation
on how the things are connected in xconfig? Through my life I deciphered
a lot of code, but I kind of tried to understand xconfig, and while I do
have some rough Qt knoweldge (like that I know what slot/signals are),
but still I wasn't able to wrap my head around it yet.

Best regards,
	Maxim Levitsky


