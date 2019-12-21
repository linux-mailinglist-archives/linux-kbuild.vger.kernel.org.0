Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0046A128A2E
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2019 16:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfLUPd3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 21 Dec 2019 10:33:29 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32604 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbfLUPd3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Dec 2019 10:33:29 -0500
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id xBLFXGSH025928;
        Sun, 22 Dec 2019 00:33:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBLFXGSH025928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576942397;
        bh=Q/Pi25U6wZzXySudemKHTKehy6ZVA3RmVQyI3kuCXqI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vkweo5dQVVb2IVK8a2c0QgGsEdI10Qsoq9eiCPENnmokW/0X7bFPZAZo3oJ7G8Mtr
         ddw3kbMN2EPY6IEcGLbOqYfX0930cUAvslk/yt5j7C22DbhAdW729dfcxtuPopQz/T
         YB/1KoAdxYs7IoRTIXVImi43RT2fx6gdviZ4Z84zIDzbIDg43F1RmbcGI5oK92Yoi8
         icTSVQxqiGZc8MPBeXmtObx+X4CB1O2jHvr/xfQNrhHt2jFD2+cvAtEIS6yT1SPnXu
         d9y846abwcNVT3cCf3MkbXbRWNGBdko06aPZxm+PXUPPQSG442HG1aCaf2Q2LKYbjD
         qy5lohbg5yo0w==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id x123so8027311vsc.2;
        Sat, 21 Dec 2019 07:33:17 -0800 (PST)
X-Gm-Message-State: APjAAAUehvma2VsDObd1LlbN0v7+dYEjd/9z6/GZ6HAX9rG/vO0sLkYC
        whpVDw/FAVWDZ+v4M2u4C1s+fmr8ETcrtYi/byw=
X-Google-Smtp-Source: APXvYqybYh+DGLDabsLVHn2MENs8kIxAwMehbZhNJo5bzv2fd+vymBCdQVmUrzSeb0ADMxUW5JBx0DyOJhF3CYDxIOM=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr1172403vsa.181.1576942396146;
 Sat, 21 Dec 2019 07:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20191219115100.958-1-masahiroy@kernel.org> <20191219164915.GS22665@localhost>
In-Reply-To: <20191219164915.GS22665@localhost>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 22 Dec 2019 00:32:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-G6GQC=HTDdbgAAWx-YaL65LPhm1SfGsarZq-HtGJ8Q@mail.gmail.com>
Message-ID: <CAK7LNAS-G6GQC=HTDdbgAAWx-YaL65LPhm1SfGsarZq-HtGJ8Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clarify the difference between obj-y and obj-m
 w.r.t. descending
To:     Johan Hovold <johan@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 20, 2019 at 1:49 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Dec 19, 2019 at 08:51:00PM +0900, Masahiro Yamada wrote:
> > Kbuild descends into a directory by either 'y' or 'm', but there is an
> > important difference.
> >
> > Kbuild combines the built-in objects into built-in.a in each directory.
> > The built-in.a in the directory visited by obj-y is merged into the
> > built-in.a in the parent directory. This merge happens recursively when
> > Kbuild is ascending back towards the top directory, so built-in objects
> > are linked into vmlinux eventually. This works properly only when the
> > Makefile that specifies obj-y is reachable by the chain of obj-y.
> >
> > On the other hand, Kbuild does not take built-in.a from the directory
> > visited by obj-m. This it, all the objects in that directory are supposed
> > to be modular. If Kbuild descends into a directory by obj-m, but the
> > Makefile in the sub-directory specifies obj-y, those objects are just
> > left orphan.
> >
> > The current statement "Kbuild only uses this information to decide that
> > it needs to visit the directory" is misleading. Clarify the difference.
> >
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Looks good! Thanks for fixing this.
>
> Reviewed-by: Johan Hovold <johan@kernel.org>

Applied to linux-kbuild.

> > ---
> >
> >  Documentation/kbuild/makefiles.rst | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> > index b9b50553bfc5..d7e6534a8505 100644
> > --- a/Documentation/kbuild/makefiles.rst
> > +++ b/Documentation/kbuild/makefiles.rst
> > @@ -297,9 +297,19 @@ more details, with real examples.
> >       If CONFIG_EXT2_FS is set to either 'y' (built-in) or 'm' (modular)
> >       the corresponding obj- variable will be set, and kbuild will descend
> >       down in the ext2 directory.
> > -     Kbuild only uses this information to decide that it needs to visit
> > -     the directory, it is the Makefile in the subdirectory that
> > -     specifies what is modular and what is built-in.
> > +
> > +     Kbuild uses this information not only to decide that it needs to visit
> > +     the directory, but also to decide whether or not to link objects from
> > +     the directory into vmlinux.
> > +
> > +     When Kbuild descends into the directory with 'y', all built-in objects
> > +     from that directory are combined into the built-in.a, which will be
> > +     eventually linked into vmlinux.
> > +
> > +     When Kbuild descends into the directory with 'm', in contrast, nothing
> > +     from that directory will be linked into vmlinux. If the Makefile in
> > +     that directory specifies obj-y, those objects will be left orphan.
> > +     It is very likely a bug of the Makefile or of dependencies in Kconfig.
> >
> >       It is good practice to use a `CONFIG_` variable when assigning directory
> >       names. This allows kbuild to totally skip the directory if the



-- 
Best Regards
Masahiro Yamada
