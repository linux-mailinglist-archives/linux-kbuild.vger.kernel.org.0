Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FAC2A33A8
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 20:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgKBTFu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 14:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgKBTFu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 14:05:50 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2412DC0617A6
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Nov 2020 11:05:50 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id l16so15471498eds.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2020 11:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=51QvJ2cz4Zjtw8OeQ5bUSC4AjF7HKeYeRL6c7egcABQ=;
        b=S1vfMazZDDvwf8C7ZJHtQRVZWKQLQmFNjpBzjLISGflv3A0AiUPtPsri3JvbvN61PB
         A0tA8yV8fx1yL6Tj3bpt84oHClDFGcR4CxUywhNUMWNXGItggK1lNQ5C4+QM8ic7cYdt
         7L+tlqk5M02IcjUu9DMZnw7I3Ywh2Lth2MrreswkqvtzMHW6LbpQmFbZ8lsZ0lu1atPj
         keuA7vlh5trsaYWCZCM9BtSOuCp+Q9fooUkjnpxAtoawxRfFC+DrrfVe0G65CrwIGJ/i
         Y7n74V31sngK7hJhecVpT7IPCUwGKVwK8U2Z8rdQSxD67/O4I2AISiA0KQQVzFv8j5sV
         tTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=51QvJ2cz4Zjtw8OeQ5bUSC4AjF7HKeYeRL6c7egcABQ=;
        b=JIDtYMLx7ILpNRbQIx4jy/Rtl2Ou6r3o41xzRayInBKcCsNUBQnjYgassF+U7bcL0t
         pIuewZhpGFOZ+I9DeFOjZS3/aRdZHd9fs/YDn3wmly9aBOniuS18cmf5GpxLXkxmXJHV
         ueA9b6JScnGzLWbUs33uTY+Aq7usYTHBdgqWSV+J9aLsQeaNnP3H+eY/KCGclaJz+zd+
         yJcmTnXe3EdrLe4XmipGNJ4i70d20lRj/9J55d/WVZ5X2dbOWv3AXWR4GVMIEo6ADWX6
         JJ7LPnwmDbT++XI0vwSxOrpiu9U4vT3MHM5lgZeQmDLep+ftLMBSSbAW4q2bx9RNvUFd
         8Qfw==
X-Gm-Message-State: AOAM530oNcFKSvRbkhL1fZrl5IVTH97lLMhbK5Y4NLkpjK4Uq4zE4rFp
        xhb8gmRCJDQUewo6s21LBVyUoL9sKj/2Hg==
X-Google-Smtp-Source: ABdhPJz/JtQXGQTP0wls3refQptKiPNlj/5GdSzKKhWJFvUBMI4PazUX2fDLS1pLQkEuOLfK1n+0Ig==
X-Received: by 2002:aa7:c44d:: with SMTP id n13mr2079141edr.138.1604343948812;
        Mon, 02 Nov 2020 11:05:48 -0800 (PST)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id dp1sm9964624ejc.74.2020.11.02.11.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 11:05:48 -0800 (PST)
Date:   Mon, 2 Nov 2020 20:05:46 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Guillem Jover <guillem@hadrons.org>
Subject: Re: [PATCH] builddeb: Fix build on non-Debian/Ubuntu distros
Message-ID: <20201102190546.GA1884@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201030165607.290612-1-petr.vorel@gmail.com>
 <12abc099c30681e88107bb468ba1795f197f02f8.camel@decadent.org.uk>
 <20201030185755.GA559821@pevik>
 <CAK7LNATETTMobRu26yoDhinv7mWOyg5JkzL5UGBtPS4KB37r6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATETTMobRu26yoDhinv7mWOyg5JkzL5UGBtPS4KB37r6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Sat, Oct 31, 2020 at 3:58 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi Ben,

> > first, thanks for your review.

> > > On Fri, 2020-10-30 at 17:56 +0100, Petr Vorel wrote:
> > > > This fixes make bindeb-pkg for RPM based distros, which don't have
> > > > dpkg-dev (and thus not /usr/bin/dpkg-buildpackage), which sets
> > > > $DEB_RULES_REQUIRES_ROOT.

> > > > Fixes: 3e8541803624 ("builddeb: Enable rootless builds")

> > > This doesn't seem to fix a bug, and in fact it would introduce one.

> > > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > > [...]
> > > > --- a/scripts/package/builddeb
> > > > +++ b/scripts/package/builddeb
> > > > @@ -37,7 +37,7 @@ create_package() {
> > > >                 | xargs -r0 md5sum > DEBIAN/md5sums"

> > > >         # Fix ownership and permissions
> > > > -       if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> > > > +       if [ -z "$DEB_RULES_REQUIRES_ROOT" -o "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> > > >                 dpkg_deb_opts="--root-owner-group"
> > > >         else
> > > >                 chown -R root:root "$pdir"

> > > This is the wrong default behaviour; it will cause a regression with
> > > older versions of dpkg that don't support this option.
> > Sorry for wrong report. I tested it on Debian, but only on unstable.

> > > If you invoke this script directly and do not use dpkg-buildpackage
> > > (which I don't think is really supported anyway) then you must either
> > > do so as root or use fakeroot (as dpkg-buildpackage does by default).
> > Well, both bindeb-pkg and deb-pkg use dpkg-buildpackage.
> > Thus fakeroot is used by default.

> > /bin/sh -c dpkg-buildpackage -r"fakeroot -u" -a$(cat debian/arch) -d -b -nc -uc

> > The root cause is that while calling chown -R root:root "$pdir" is ok on Debian,
> > it's refused for fakeroot in openSUSE. I can run it with
> > DEB_RULES_REQUIRES_ROOT=no, that should fix that, but I'd prefer it were working
> > by default (although I admit not many people need it).
> > I reported it because the default setup worked before 3e8541803624.
> > I'll have a look what configuration (permission) is missing on openSUSE to allow
> > chown -R root:root for non-root user.

> > > Ben.

> > Kind regards,
> > Petr



> I do not know what is different on openSUSE, but
> my understanding is like follows:



> For old dpkg tools (which does not know "Rules-Requires-Root: no"),
> $DEB_RULES_REQUIRES_ROOT is empty.
> -> We run chown -R root:root like before.


> For new dpkg tools (which knows "Rules-Requires-Root: no"),
> $DEB_RULES_REQUIRES_ROOT is "no".
> -> We pass --root-owner-group to dpkg-deb.

Yes. I'm using dpkg 1.19.0.4, which knows "Rules-Requires-Root: no", but does
not know --rules-requires-root (added in 1.19.1). export
DEB_RULES_REQUIRES_ROOT=no fixes the problem for my version (but that does not
break the build). I just wanted to save time for the others, but 1) there are
probably not many people using OBS to build Debian packages and 2) maybe it's
just me who does not know it.

It looks to me debhelper is not used for kernel Debian packaing, right?
At least building works even I don't have it.

As a result of this I'll also update openSUSE dpkg package to latest release.

Thanks all for explanation.

Kind regards,
Petr
