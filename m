Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47D62A2630
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 09:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbgKBIgq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 03:36:46 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41667 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgKBIgq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 03:36:46 -0500
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0A28aQHs002364
        for <linux-kbuild@vger.kernel.org>; Mon, 2 Nov 2020 17:36:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0A28aQHs002364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604306187;
        bh=grSolXCy+/no3D3+gQ4l6LieN/TOYk2f98SssaRVw5o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OXBFmN92gNVLj+az8RbdvBvGP1OVrZSH9UfezKZL/adV+hcVJPebT8QCF+XweeK8T
         PMb0S5NFMg+OUy3Q4XA3yFj1h/kMc5Ps0yp7NCK4nxByIOma2eKcbYh5u8xmMsa9PN
         u7l8gcepSy5hYaFJlN3Jry6FsEuPmbwund0IByWPKjloDdwOVE4iW5o+SZhELAzCzf
         faHKx3bXfXDWYMjFKlT939hdiU3b/JZUra2eAmHbwSmkl8wBcmtf8JG9hgxQTFwvRU
         17UV4zGVkcOhsQu+IftjGtlbCO/US4nwtcGbJOrZh+AjHlObUOqLXvqN19IVzRAhQY
         XA9S+/4lJ6nuA==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id x13so10458554pfa.9
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2020 00:36:27 -0800 (PST)
X-Gm-Message-State: AOAM5339ZKSsk3aS1kWaG6V0PuKLKp9ZiDniIoKiEYVfmRqDfcRvdNRt
        Vp04h2/ukXRousrJcOjSHduF3CpMYNbGdJSgIFQ=
X-Google-Smtp-Source: ABdhPJy+iO4dRPqPD2izQokmUE923i0ognUO6wplpBAjbWyvfWGKYMh5fznP+Hsvql9e1/CbCGSfyUIu/yhOY6rsTws=
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr16854662pjb.153.1604306186332;
 Mon, 02 Nov 2020 00:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20201030165607.290612-1-petr.vorel@gmail.com> <12abc099c30681e88107bb468ba1795f197f02f8.camel@decadent.org.uk>
 <20201030185755.GA559821@pevik>
In-Reply-To: <20201030185755.GA559821@pevik>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Nov 2020 17:35:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATETTMobRu26yoDhinv7mWOyg5JkzL5UGBtPS4KB37r6g@mail.gmail.com>
Message-ID: <CAK7LNATETTMobRu26yoDhinv7mWOyg5JkzL5UGBtPS4KB37r6g@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Fix build on non-Debian/Ubuntu distros
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Guillem Jover <guillem@hadrons.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 31, 2020 at 3:58 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Ben,
>
> first, thanks for your review.
>
> > On Fri, 2020-10-30 at 17:56 +0100, Petr Vorel wrote:
> > > This fixes make bindeb-pkg for RPM based distros, which don't have
> > > dpkg-dev (and thus not /usr/bin/dpkg-buildpackage), which sets
> > > $DEB_RULES_REQUIRES_ROOT.
>
> > > Fixes: 3e8541803624 ("builddeb: Enable rootless builds")
>
> > This doesn't seem to fix a bug, and in fact it would introduce one.
>
> > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > [...]
> > > --- a/scripts/package/builddeb
> > > +++ b/scripts/package/builddeb
> > > @@ -37,7 +37,7 @@ create_package() {
> > >                 | xargs -r0 md5sum > DEBIAN/md5sums"
>
> > >         # Fix ownership and permissions
> > > -       if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> > > +       if [ -z "$DEB_RULES_REQUIRES_ROOT" -o "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> > >                 dpkg_deb_opts="--root-owner-group"
> > >         else
> > >                 chown -R root:root "$pdir"
>
> > This is the wrong default behaviour; it will cause a regression with
> > older versions of dpkg that don't support this option.
> Sorry for wrong report. I tested it on Debian, but only on unstable.
>
> > If you invoke this script directly and do not use dpkg-buildpackage
> > (which I don't think is really supported anyway) then you must either
> > do so as root or use fakeroot (as dpkg-buildpackage does by default).
> Well, both bindeb-pkg and deb-pkg use dpkg-buildpackage.
> Thus fakeroot is used by default.
>
> /bin/sh -c dpkg-buildpackage -r"fakeroot -u" -a$(cat debian/arch) -d -b -nc -uc
>
> The root cause is that while calling chown -R root:root "$pdir" is ok on Debian,
> it's refused for fakeroot in openSUSE. I can run it with
> DEB_RULES_REQUIRES_ROOT=no, that should fix that, but I'd prefer it were working
> by default (although I admit not many people need it).
> I reported it because the default setup worked before 3e8541803624.
> I'll have a look what configuration (permission) is missing on openSUSE to allow
> chown -R root:root for non-root user.
>
> > Ben.
>
> Kind regards,
> Petr



I do not know what is different on openSUSE, but
my understanding is like follows:



For old dpkg tools (which does not know "Rules-Requires-Root: no"),
$DEB_RULES_REQUIRES_ROOT is empty.
-> We run chown -R root:root like before.


For new dpkg tools (which knows "Rules-Requires-Root: no"),
$DEB_RULES_REQUIRES_ROOT is "no".
-> We pass --root-owner-group to dpkg-deb.







--
Best Regards
Masahiro Yamada
