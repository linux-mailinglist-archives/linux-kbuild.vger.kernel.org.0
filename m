Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811642A0E2A
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 19:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgJ3S57 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Oct 2020 14:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3S57 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Oct 2020 14:57:59 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486C0C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2020 11:57:59 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t11so7655235edj.13
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2020 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=wMvqkOCJvTY91wYiJ0Aaafr9exthCCEZgMNORSR618w=;
        b=noaau75tl6VwwplwwOoqcfHdNMG7Qc7AmR2CR9zty3qUNh/1YE/qUAqyW/nMzWLK4K
         mtTLnJROWdbx2t7LzUh0HIR1z2HF5ilfy7DQZ+k8qwvj6tZKlsD1CvBbBauBxVOHpcr4
         oFl8sNaPkG4+l6T6zzl28cGbUJuFEkwolNYd1k8lwNJV8Tew9V2XvMQgxEF7i24VjiCf
         T/FCDh8g85cwTGH5HfJ1RP1p2z2p4yRnWjAp1hzi3MMvbygBT+M8P6Ri3r6iAQqk+P5J
         Rk7stnvdreOkVDzhDzkZ00x8yKaipnxqAeUIUWWV22MMTs3m4LLMFtvxzU5fQ8ZTyblH
         IPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=wMvqkOCJvTY91wYiJ0Aaafr9exthCCEZgMNORSR618w=;
        b=sdXEysdqWZUsiM+OzBMrVfBv//DmQE1riGHe1UMfMvpRI1vIS42ykptgco7dV50jaN
         HaPlBJMJejzIHaNlpV810CX1sWXkjz6GDiOYCgImlp3DXhmsfYWsvt2+Ji54qOP7sYtx
         9wEyg3pls57XY/z7KlPBe2uHEbQFE5fNacxHin4eKpkmDHb9uIdn45Eml4nj6foT75lb
         ZEMsuSoxDh7xx5HUADtkFvIRPC5UXEHQ3MJBH8G88lqbsJ05cUZZqal9ST0OmXvaAkXR
         k0mSbvxelD53nxi+T7BKUberBcB/KHzWOJpQOdC5C3VmXkMsGA1At0OgXmeQNZ0Me+U/
         1xeA==
X-Gm-Message-State: AOAM533bTtapqosdxAmRhTpkd/14nRxFqFwelAzVn0txzMx2R3V24LA5
        ztC/DdpWsdS1VzWpisPclVpQYGpHiJIsdw==
X-Google-Smtp-Source: ABdhPJwozn9SIj2Ol+x8bfIm9oZcOYEZy/Hlu+GPjh4g+q+/n/JsILUt90g3sdX2Tk0hcto69tVjUA==
X-Received: by 2002:a50:8d48:: with SMTP id t8mr4092916edt.228.1604084277921;
        Fri, 30 Oct 2020 11:57:57 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id 22sm3234886ejw.27.2020.10.30.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 11:57:57 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:57:55 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     linux-kbuild@vger.kernel.org, Guillem Jover <guillem@hadrons.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] builddeb: Fix build on non-Debian/Ubuntu distros
Message-ID: <20201030185755.GA559821@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201030165607.290612-1-petr.vorel@gmail.com>
 <12abc099c30681e88107bb468ba1795f197f02f8.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12abc099c30681e88107bb468ba1795f197f02f8.camel@decadent.org.uk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ben,

first, thanks for your review.

> On Fri, 2020-10-30 at 17:56 +0100, Petr Vorel wrote:
> > This fixes make bindeb-pkg for RPM based distros, which don't have
> > dpkg-dev (and thus not /usr/bin/dpkg-buildpackage), which sets
> > $DEB_RULES_REQUIRES_ROOT.

> > Fixes: 3e8541803624 ("builddeb: Enable rootless builds")

> This doesn't seem to fix a bug, and in fact it would introduce one.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> [...]
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -37,7 +37,7 @@ create_package() {
> >                 | xargs -r0 md5sum > DEBIAN/md5sums"

> >         # Fix ownership and permissions
> > -       if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> > +       if [ -z "$DEB_RULES_REQUIRES_ROOT" -o "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> >                 dpkg_deb_opts="--root-owner-group"
> >         else
> >                 chown -R root:root "$pdir"

> This is the wrong default behaviour; it will cause a regression with
> older versions of dpkg that don't support this option.
Sorry for wrong report. I tested it on Debian, but only on unstable.

> If you invoke this script directly and do not use dpkg-buildpackage
> (which I don't think is really supported anyway) then you must either
> do so as root or use fakeroot (as dpkg-buildpackage does by default).
Well, both bindeb-pkg and deb-pkg use dpkg-buildpackage.
Thus fakeroot is used by default.

/bin/sh -c dpkg-buildpackage -r"fakeroot -u" -a$(cat debian/arch) -d -b -nc -uc

The root cause is that while calling chown -R root:root "$pdir" is ok on Debian,
it's refused for fakeroot in openSUSE. I can run it with
DEB_RULES_REQUIRES_ROOT=no, that should fix that, but I'd prefer it were working
by default (although I admit not many people need it).
I reported it because the default setup worked before 3e8541803624.
I'll have a look what configuration (permission) is missing on openSUSE to allow
chown -R root:root for non-root user.

> Ben.

Kind regards,
Petr
