Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B38C397BD1
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jun 2021 23:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234671AbhFAVmL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Jun 2021 17:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234656AbhFAVmL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Jun 2021 17:42:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97863C061574;
        Tue,  1 Jun 2021 14:40:28 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f30so36043lfj.1;
        Tue, 01 Jun 2021 14:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GJ4iW9ne/KKSp4HSYBLS3JGEPYqPP2i6X+oTP0z2Ns=;
        b=og8bAN+l7Cqtt/P5jxWrxAUlELIHKbc0JTIU+F8ZTifVTRzdg607kDLuI0FuXdh8AY
         Qu6bGR9qZeI/jPgFlDy9EjwXCzwrYSSvxTum4fp0MVGo/zRzajIAX4Edws1O+EpeC9pD
         KUGlJa80oAW7gSA18Kqk9iD8UOxRQdhdCtRGOgUI1BaYUcYmoQHvHpFDdtgfwOHoVUjN
         jF7FeS9Em52ZR3UjnCZYtl699YD9YIa0VA/3nLDm+wiyi6sz4NzThMTVGH4T5oD+xfnN
         tCFtxRJbhnL9GNhUrn06ZuecXwp7oR90YiAp50EBcgQmJx6mPM0ffjaIFL/KNyqKXnM0
         YSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GJ4iW9ne/KKSp4HSYBLS3JGEPYqPP2i6X+oTP0z2Ns=;
        b=kpHO7PTe/WJFzI2pu+VrzL3MFwI0sjhBllAdRsWEwZkMwvBIsNzetwAje2GQxTfb8K
         mjJBneY06h86MgguvKFrpkN+/Zl7rQiIoBuXILFm12okrK8o1dkobLERI4sGbSqiY6Dg
         9uhFuo/7e18KGCyzEUg+d6/g7NWr5ydOFimP5J/ak7knX7Uhd/S8hx2ONet6f0ywms4n
         06Hd2VQqB1SQHjoEaz5hSlnC08o+fBNeDNFFN4rrljz20XVYO9u8STvWpr9J+CG8bsb0
         e8Df+5oCUJ499qgH/PfXCPYZrdUKBecd3atu7quqVbF2snSDd/CyLRUfwGby7WyS/fhn
         ffUQ==
X-Gm-Message-State: AOAM5306PXtXp3sOUsWoCbVGpWCIU68waAFzJkApJHj8MC+0Z/5rHP/F
        O4VC3od9XFkCXrPrOeLGO0g=
X-Google-Smtp-Source: ABdhPJxGpqZxl3VjWMjtR1d2dLTnLrbTz7xVmRgiR8fjJZp7t4f7DjR/BNxM2PIBDwo2tZ6tXO8kbA==
X-Received: by 2002:a05:6512:46c:: with SMTP id x12mr6130853lfd.203.1622583626848;
        Tue, 01 Jun 2021 14:40:26 -0700 (PDT)
Received: from hyperiorarchmachine.localnet (dcx7x4yb9bh06yk5jm2qt-3.rev.dnainternet.fi. [2001:14ba:14f7:3c00:3d09:bda0:2327:559b])
        by smtp.gmail.com with ESMTPSA id p9sm626662lfo.276.2021.06.01.14.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 14:40:26 -0700 (PDT)
From:   jarmo.tiitto@gmail.com
To:     Bill Wendling <morbo@google.com>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jarmo Tiitto <jarmo.tiitto@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
Date:   Wed, 02 Jun 2021 00:40:25 +0300
Message-ID: <5615959.Mqr2uNrfH2@hyperiorarchmachine>
In-Reply-To: <202106011210.B5A8881214@keescook>
References: <20210531202044.426578-1-morbo@google.com> <CAGG=3QVdXxLf0T9+n9FidrRcfdWY36m-i=4kPRJjOojWhjiywg@mail.gmail.com> <202106011210.B5A8881214@keescook>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kees Cook wrote tiistaina 1. kes=E4kuuta 2021 22.13.21 EEST:
> On Tue, Jun 01, 2021 at 01:24:39AM -0700, 'Bill Wendling' via Clang Built=
=20
Linux wrote:
> > On Mon, May 31, 2021 at 1:29 PM Nathan Chancellor <nathan@kernel.org>=20
wrote:
> > > On 5/31/2021 1:20 PM, Bill Wendling wrote:
> > > > Future PGO features may create other files in /sys/kernel/debug/pgo.
> > > > So
> > > > rename the kernel's raw profile data file to "vmlinux.profraw" to m=
ake
> > > > which part of the kernel the file is for more explicit.
> > > >=20
> > > > Note that future files in /sys/kernel/debug/pgo should follow a
> > > > similar
> > > > naming convention.
> > > >=20
> > > > Signed-off-by: Bill Wendling <morbo@google.com>
> > >=20
> > > Guess this clears up my confusion around the module patches :)
> >=20
> > To clarify, Jarmo did those patches on his own. I just wanted to
> > clarify the naming convention. :-)
>=20
> Is the expectation that there would be 1 file per module in
> /sys/kernel/debug/pgo/ after the modules patch?
>=20
> > -bw
> >=20
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >=20
> > > > ---
> > > >=20
> > > >   Documentation/dev-tools/pgo.rst | 6 +++---
> > > >   kernel/pgo/Kconfig              | 7 ++++---
> > > >   kernel/pgo/fs.c                 | 2 +-
> > > >   3 files changed, 8 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/dev-tools/pgo.rst
> > > > b/Documentation/dev-tools/pgo.rst index b7f11d8405b7..0200449c4843
> > > > 100644
> > > > --- a/Documentation/dev-tools/pgo.rst
> > > > +++ b/Documentation/dev-tools/pgo.rst
> > > >=20
> > > > @@ -76,7 +76,7 @@ The PGO kernel support creates the following file=
s in=20
debugfs:
> > > >   ``/sys/kernel/debug/pgo/reset``
> > > >  =20
> > > >       Global reset file: resets all coverage data to zero when writ=
ten
> > > >       to.
> > > >=20
> > > > -``/sys/kernel/debug/profraw``
> > > > +``/sys/kernel/debug/pgo/vmlinux.profraw``
> > > >=20
> > > >       The raw PGO data that must be processed with ``llvm_profdata`=
`.
> > > >=20
> > > > @@ -108,7 +108,7 @@ using the result to optimize the kernel:
> > > >      .. code-block:: sh
> > > >=20
> > > > -      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> > > > +      $ cp -a /sys/kernel/debug/pgo/vmlinux.profraw
> > > > /tmp/vmlinux.profraw
>=20
> And if so, these instructions would change (in the future) to something
> like:
>=20
>      $ cp -a /sys/kernel/debug/pgo/*.profraw /tmp/prof/
>=20
> ?
>=20
> -Kees

Hi,

To be clear the mucked up patches I sent are more like of RFC to get in=20
contact with the development.
Back to the code:

Yes, my future intention is that there will be one *.profraw file per modul=
e.
And curiously I would also have renamed the current profile data file to=20
"vmlinux.profraw" to disambiguate it from what part of kernel generated it.

I already wrote an small fix up that I think should be part of the upstream=
=20
code so that profiling the vmlinux works better.
It filters out any module originated content from vmlinux.profraw.

Above will be probably a good exercise for me.

Next, my future v2 module profiling machinery
would probably follow on top of your work.

=2DJarmo


