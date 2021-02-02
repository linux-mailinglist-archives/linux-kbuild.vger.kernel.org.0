Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD5C30CDDE
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 22:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhBBVWD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 16:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhBBVVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 16:21:31 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9FEC0613ED;
        Tue,  2 Feb 2021 13:20:51 -0800 (PST)
Received: from zn.tnic (p200300ec2f0e1f0020339110b9493ea9.dip0.t-ipconnect.de [IPv6:2003:ec:2f0e:1f00:2033:9110:b949:3ea9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2D0861EC051E;
        Tue,  2 Feb 2021 22:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1612300850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=hyUKLsuJa5X7hTRsrEs/Gns9rZBnaxa+bEy+ow3U0dA=;
        b=auC5xokEYLtGqgDzt531CVvQOzBlZprxPFAuvH+FZHonS/r3EeiDiqjHFPlGUfSZrvShzg
        ICat4G1ndS1jR4hrP7EuLNg+1P72PE2TZLk8V3oI9scJE2agm+5Pi3zvwFO3ySsRHkdbKC
        rNh0HRA0GYdRQ8QWpJWlno5nx1Ynpfk=
Date:   Tue, 2 Feb 2021 22:20:48 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Amy Parker <enbyamy@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Michael Matz <matz@suse.de>
Subject: Re: Alternative compilers to GCC/Clang
Message-ID: <20210202212048.GG18075@zn.tnic>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
 <20210202201920.GA18106@zn.tnic>
 <20210202210039.GB29751@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210202210039.GB29751@1wt.eu>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ Micha.

On Tue, Feb 02, 2021 at 10:00:39PM +0100, Willy Tarreau wrote:
> On Tue, Feb 02, 2021 at 09:19:20PM +0100, Borislav Petkov wrote:
> > On Tue, Feb 02, 2021 at 11:11:32AM -0800, Amy Parker wrote:
> > > On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > > > > It compiles extremely fast, implements some subsets of gcc (a few
> > > > > attributes for example), but is far from being able to compile a kernel
> > > >
> > > > Well, we'll see what I can do with that. :)
> > > 
> > > Well, just installed it and tried building the kernel. Fails every file. :)
> > > 
> > > It's definitely something to work towards - but I don't know if kernel
> > > advancements requiring newer GCC versions will go slow enough to allow
> > > TCC improvements to arise. This isn't just something like with Clang
> > > where a few tweaks to files and to Clang itself did the trick.
> > 
> > Maybe this'll help you find something to do:
> > 
> > https://www.youtube.com/watch?v=iU0Z0vBKrtQ
> > 
> > Yes, it would be lovely to be able to compile the kernel with tcc but it
> > is not going to be trivial.
> 
> In any case there will always be numerous limitations, but at least being
> able to perform the basic build check with limited options could save quite
> some time to many developers. Using gcc once the tcc-based "typo check"
> passes would already be a nice start. Getting the kernel to boot would
> indeed be a huge step forward! In haproxy we can only build with threading
> disabled and it works slowly but sufficiently for basic tests and printf-
> based debugging. It's convenient for bisecting certain bugs.
> 
> Thanks for the video Boris, I wasn't aware of it, definitely interesting!

Yeah, and there's a repo with that stuff:

https://github.com/susematz/linux

and also:

https://github.com/susematz/linux/blob/tcc46/README.tcc

It would be good to start forward-porting and integrating some of the
fixes and even extend tcc to handle some of the gnuisms we're using in
the kernel so that we can build the kernel with it too.

I can imagine having CONFIG_TCC - as long as that doesn't get too
intrusive and get in the way of things - and those who wanna build the
kernel with it, can enable it. For example...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
