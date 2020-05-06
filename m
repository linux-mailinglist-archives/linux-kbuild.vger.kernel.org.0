Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74ABB1C76CF
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 18:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgEFQoX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 12:44:23 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39790 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730055AbgEFQoV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 12:44:21 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 046GhjRm017691;
        Thu, 7 May 2020 01:43:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 046GhjRm017691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588783426;
        bh=utvgGRsMw8+CW4P3BXfPw8wbFM86fzbR5axYMY0vIGg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HVH9aqAW7dSrdCAjK6LWzWts7qi2i3l9S1k/K3/lF6QsA57Ee6mFgi8K6fwZERevF
         rjCXb5fR5X2r4POSS6b8fjaiRn0t2cQk1AeEGXRt9wL+uQDy4ASmfOiC+ew0tjRC+x
         bGLyot+eGg+hRaeaiyKW7Hr3KxZJmsW2zqxmTtyrKvmvS9W6F1rkmA2UQgk/ZWXbvy
         jsJIl03DzkDtOxu39qqNndEyguJO/fmWeMWTPt59h320vs1fcLIz+0RqLbE5a2jLx/
         vHKsWeeOcmAuLyiiLftS7dibF6eA1SMP+X2kS9phHcrcQ25sB/uAMLcj6xUIbkWNiW
         JsJJogMZ5YlRw==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id u12so742721uau.10;
        Wed, 06 May 2020 09:43:46 -0700 (PDT)
X-Gm-Message-State: AGi0PuaII36n1U0693WqgVgZ0rGswZYbWwux97Wn0dOFJTlDch2l9p9u
        XIll8Z3it55Hgnnc4CWPYqwZk32QvPfwPPPzSTk=
X-Google-Smtp-Source: APiQypLwLaVV3HiKerrKQmnXe6ZFcFF3HTIhVjsUpf+ssyj1nm7hvmk9gnii/QfOzPVIh3ds2SJSZMDp2FaPdcevn04=
X-Received: by 2002:ab0:4ac9:: with SMTP id t9mr8255622uae.40.1588783425219;
 Wed, 06 May 2020 09:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr>
 <87imhqb3le.fsf@intel.com> <nycvar.YSQ.7.76.2004231155060.2671@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2004231155060.2671@knanqh.ubzr>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 May 2020 01:43:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNARpRMZb18FFnX1WPV4Xzh2B_n2E+KLf5QXqiqkZEKhTbQ@mail.gmail.com>
Message-ID: <CAK7LNARpRMZb18FFnX1WPV4Xzh2B_n2E+KLf5QXqiqkZEKhTbQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: allow for conditional dependencies
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 24, 2020 at 1:05 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Thu, 23 Apr 2020, Jani Nikula wrote:
>
> > On Thu, 23 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> > > This might appear to be a strange concept, but sometimes we want
> > > a dependency to be conditionally applied. One such case is currently
> > > expressed with:
> > >
> > >         depends on FOO || !FOO
> > >
> > > This pattern is strange enough to give one's pause. Given that it is
> > > also frequent, let's make the intent more obvious with some syntaxic
> > > sugar by effectively making dependencies optionally conditional.
> > >
> > > This also makes the kconfig language more uniform.
> >
> > Thanks, I prefer this over all the previous proposals. Versatile yet
> > self-explanatory.
> >
> > > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> > >
> > > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > > index d0111dd264..0f841e0037 100644
> > > --- a/Documentation/kbuild/kconfig-language.rst
> > > +++ b/Documentation/kbuild/kconfig-language.rst
> > > @@ -114,7 +114,7 @@ applicable everywhere (see syntax).
> > >    This is a shorthand notation for a type definition plus a value.
> > >    Optionally dependencies for this default value can be added with "if".
> > >
> > > -- dependencies: "depends on" <expr>
> > > +- dependencies: "depends on" <expr> ["if" <expr>]
> > >
> > >    This defines a dependency for this menu entry. If multiple
> > >    dependencies are defined, they are connected with '&&'. Dependencies
> > > @@ -130,6 +130,16 @@ applicable everywhere (see syntax).
> > >     bool "foo"
> > >     default y
> > >
> > > +  The dependency definition itself may be conditional by appending "if"
> > > +  followed by an expression. If such expression is false (n) then this
> > > +  dependency is ignored. One possible use case is:
> > > +
> > > +    config FOO
> > > +   tristate
> > > +   depends on BAZ if BAZ != n
> >
> > I presume this is the same as
> >
> >       depends on BAZ if BAZ
> >
> > which makes me wonder if that should be the example. At least current
> > usage for select is predominantly
> >
> >       select FOO if BAR
> >
> > without "!= n".
>
> Yes, it is the same thing. I prefer making the documentation a little
> more explicit than necessary so the explanation is really obvious.


For the case of 'select',

  select FOO if BAR != n

is NOT equivalent to:

  select FOO if BAR



I do not think "if <expr>" in Kconfig
is so easy to understand.
I tend to hesitate to extend it.

Sometimes, it means "the property is visible if <expr> != n".
Sometimes, not.




For the case of 'depends on',
the 'depends on' is effective if <expr> != n
because Nicolas implemented it in this way.



We can do:

    depends on X || X = n

instead of:

    depends on X || !X

        or

    depends on X if X






I guess the source of the complaint is
!X is difficult to understand
when X is tristate.

But, is there any confusion in 'X = n' ?
I think not.

-- 
Best Regards
Masahiro Yamada
