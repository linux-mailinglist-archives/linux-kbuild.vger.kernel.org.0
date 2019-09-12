Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 024A9B069F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 03:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbfILBst (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 21:48:49 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38867 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfILBst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 21:48:49 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x8C1mXxD024027;
        Thu, 12 Sep 2019 10:48:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x8C1mXxD024027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568252914;
        bh=u5WOSjHtrgExkU5MCA6YyWChC8CYCZIhyO+ug7ePq98=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bdWNzUPLiK+0Gw06gmu2W4EjLUJVea+jWRX2za23tPWonpLN78gsWqeLScDOeV/lr
         tz8FblG4dvoEsxA8JDmEVJyVGbe8LLyvffS/aqpLjZLmLD5xZSCAiiGwboBz555Yjl
         HtHYvk0hmm0ZcwEdx8B/IT3ZI9wwY7+J7YJYyWFvG//tZ5EZKgjxGUdpYzkefrlI4w
         BH7QN7JkRtuoEhd9pvjp3WTgsbFnvzzbBX4+WTgiTJdg/RGxXCteQg77utEPKyBQgO
         bQX8AkT/MaweRsQ9yBtnjLSZzHmKBrOpJVbnJKU5E88pLWScQmnBtt0lcp6ny2PS4j
         hvnQ67NC4JIaQ==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id u18so7489679uap.2;
        Wed, 11 Sep 2019 18:48:33 -0700 (PDT)
X-Gm-Message-State: APjAAAXdyroyIKJCIGPT0LqROC/Q+9RRzunHy0LkubEXcdTQjG9Lgyt3
        ZX23URfShEjh+gl1dtKdqpeUZceQpMl25ovB8Po=
X-Google-Smtp-Source: APXvYqx6xn2e6rtnyUyABsfsw1sKz3FT6Ypi5PVsZqg11WzX7/B9VOoOiaS3qgrMJLlY6JWZBsTuTjJORG/hqsbPp90=
X-Received: by 2002:a9f:21f6:: with SMTP id 109mr18076373uac.109.1568252912456;
 Wed, 11 Sep 2019 18:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
 <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
 <21a058586badfd42df46d94d539aae08658cde5b.camel@decadent.org.uk> <0c7c99639df61572aeb37c461df4cca101f78d3a.camel@decadent.org.uk>
In-Reply-To: <0c7c99639df61572aeb37c461df4cca101f78d3a.camel@decadent.org.uk>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 12 Sep 2019 10:47:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsmWGKF+gogON0pZHYAsUFH17sV+CkDv0DuoervwuJzg@mail.gmail.com>
Message-ID: <CAK7LNAQsmWGKF+gogON0pZHYAsUFH17sV+CkDv0DuoervwuJzg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible builds
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        ab@php.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 11, 2019 at 10:15 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Wed, 2019-09-11 at 14:04 +0100, Ben Hutchings wrote:
> > On Wed, 2019-09-11 at 21:17 +0900, Masahiro Yamada wrote:
> > > Hi Ben,
> > >
> > >
> > > Thanks for this.
> > > Please let me add some comments.
> > >
> > >
> > > On Wed, Sep 11, 2019 at 8:54 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> > [...]
> > > > +Absolute filenames
> > > > +------------------
> > > > +
> > > > +When the kernel is built out-of-tree, debug information may include
> > > > +absolute filenames for the source files.  The ``__FILE__`` macro may
> > > > +also expand to an absolute filename.  This must be overridden by
> > > > +including `prefix-map options`_ in the `KCFLAGS`_ variable.
> > >
> > > Do you mean -fmacro-prefix-map ?
> >
> > No, I mean -ffile-prefix-map or the older -fdebug-prefix-map.
> >
> > > If so, it is already taken care of by the top Makefile.
> > > If you use GCC 8 or newer, it is automatically added to
> > > KBUILD_CFLAGS.
> >
> > Ah, that's helpful.  So, I suppose I should just mention
> > -fdebug-prefix-map here and warn that __FILE__ will still be a proble
> > if using older compiler versions.
>
> My revised text for this section is:
>
> ---
> When the kernel is built out-of-tree, debug information may include
> absolute filenames for the source files.  This must be overridden by
> including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
>
> Depending on the compiler used, the ``__FILE__`` macro may also expand
> to an absolute filename in an out-of-tree build.  Kbuild automatically
> uses the ``-fmacro-prefix-map`` option to prevent this, if it is
> supported.
>
> The Reproducible Builds web site has more information about these
> `prefix-map options`_.
> ---
>
> Does that look OK to you?


Both hunks sound good.

Thanks.






> > > > +Generated files in source packages
> > > > +----------------------------------
> > > > +
> > > > +The build processes for some programs under the ``tools/``
> > > > +subdirectory do not completely support out-of-tree builds.  This may
> > > > +cause source packages built using e.g. ``make rpm-pkg`` to include
> > > > +generated files and so be unreproducible.  It may be necessary to
> > > > +clean the source tree completely (``make mrproper`` or
> > > > +``git clean -d -f -x``) before building a source package.
> > >
> > > Currently, the source package building does not support
> > > out-of-tree build anyway.
> >
> > Yes, I realise that.
> >
> > > 'make O=foo rpm-pkg' fails with an error message.
> > >
> > > Building in a pristine source will solve the issue.
> > [...]
> >
> > The issue I'm thinking about is that an out-of-tree build, prior to the
> > package build, *should* leave the source pristine and sometimes does
> > not.
> >
> > For Debian's official kernel packages, we build a binary package of the
> > upstream source, and at some times this has unexpectedly included some
> > generated files.  I believe a similar issue would affect the upstream
> > package scripts.
>
> My revised text for this section is:
>
> ---
> The build processes for some programs under the ``tools/``
> subdirectory do not completely support out-of-tree builds.  This may
> cause a later source package build using e.g. ``make rpm-pkg`` to
> include generated files.  You should ensure the source tree is
> pristine by running ``make mrproper`` or ``git clean -d -f -x`` before
> building a source package.
> ---
>
> Ben.
>
> --
> Ben Hutchings
> The obvious mathematical breakthrough [to break modern encryption]
> would be development of an easy way to factor large prime numbers.
>                                                            - Bill Gates
>
>


-- 
Best Regards
Masahiro Yamada
