Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9A821297
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 05:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfEQDkP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 23:40:15 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24977 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfEQDkP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 23:40:15 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4H3dq7C000772;
        Fri, 17 May 2019 12:39:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4H3dq7C000772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558064393;
        bh=aPOO/0Ic2Zo5pJTXO2MkJ+6Frm2tT+vQWrhjA4zb4BI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZeFhm8iNQvKxOgOzJWr7/o6OtX7F4Lxa0wUCTBGV69TYMLML6wQ7K9UOnXlJU0wLf
         8ffdI+68f+YBkErO8l1H/SR1Uz0DKZeJZ+WNwmmn6/89QxwHKWep8ma0tK5h99p0BJ
         WY0frH74nw9YksjDx4MJ6IO8iuALC4Q83DGcbGRp2gVMMRohQWCdEtEhXurKTEcx5Q
         LScG0KR3IAwo8OcjQRVESTckMsH+UBtQWReKYZ/T/TBlqpQT7wRPBIg462YjRRn8xZ
         SVz9v5ZXq5swtT+4781LPSq96Ky868bAgG8sgt4BHpApBuqp2VkGTH5cczGAEDBPVg
         lx7sV7Nxv8ebQ==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id o10so3700327vsp.12;
        Thu, 16 May 2019 20:39:53 -0700 (PDT)
X-Gm-Message-State: APjAAAWNkBV3U/FkyHeebOVCMzSTfXU2iz5TPcz0s3wvytP3NB0gs+DG
        zk3066Dy57ZgilKc6L+zyQdfc6w55dR80zdY2IU=
X-Google-Smtp-Source: APXvYqyJYt//bi0OLphS4zjzMdOO8iQShOOU3Cv+ZZqhidFdjKZjqjhjLt6s4xx0+3+cHb8C5qRppv8T9a2h1KGBGHY=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr7818917vsl.179.1558064391987;
 Thu, 16 May 2019 20:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
 <201905150913.C23BD99AD@keescook> <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
 <201905151131.EBB45E5@keescook>
In-Reply-To: <201905151131.EBB45E5@keescook>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 17 May 2019 12:39:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATKwkc66ebKG8YY2GVBuFzazODp_vM=KAkjY45WP2Rd+w@mail.gmail.com>
Message-ID: <CAK7LNATKwkc66ebKG8YY2GVBuFzazODp_vM=KAkjY45WP2Rd+w@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Kees,

On Thu, May 16, 2019 at 3:38 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 16, 2019 at 02:55:02AM +0900, Masahiro Yamada wrote:
> >
> > On Thu, May 16, 2019 at 1:20 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Wed, May 15, 2019 at 04:53:15PM +0900, Masahiro Yamada wrote:
> > > > On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> > > > <yamada.masahiro@socionext.com> wrote:
> > > > >
> > > > > [...]
> > > > > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > > > > new file mode 100755
> > > > > index 000000000000..944e68bd22b0
> > > > > --- /dev/null
> > > > > +++ b/scripts/modules-check.sh
> > > > > @@ -0,0 +1,18 @@
> > > > > +#!/bin/sh
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +# Warn if two or more modules have the same basename
> > > > > +check_same_name_modules()
> > > > > +{
> > > > > +       same_name_modules=$(cat modules.order modules.builtin | \
> > > > > +                               xargs basename -a | sort | uniq -d)
> > >
> > > While probably it'll never be a problem, just for robustness, I'd add "--"
> > > to the end basename to terminate argument interpretation:
> > >
> > >     xargs basename -a -- | sort | ...
> >
> >
> > Sorry for my ignorance, but could you
> > teach me the effect of "--" ?
> >
> >
> > I sometimes use "--" as a separator
> > when there is ambiguity in arguments
> > for example, "git log <revision> -- <path>"
> >
> >
> > In this case, what is intended by "--"?
>
> It means "end of arguments" so that whatever xargs passes into the
> program aren't interpretted as an argument. In this case, if there was
> a module path somehow ever named --weird/build/path/foo.o, xargs would
> launch basename as:
>
>         basename -a --weird/build/path/foo.o
>
> and basename would fail since it didn't recognize the argument. Having
> "--" will stop argument parsing:
>
>         basename -a -- --weird/build/path/foo.o
>
> This is just a robustness suggestion that I always recommend for xargs
> piping, since this can turn into a security flaw (though not here) when
> an argument may have behavioral side-effects. So, it's just a thing that
> always jumps out at me, though in this particular case I don't think
> we could ever see it cause a problem, but better to always write these
> xargs patterns as safely as possible.

I did not think about the security issue.
Thanks for your expert comments!


-- 
Best Regards
Masahiro Yamada
