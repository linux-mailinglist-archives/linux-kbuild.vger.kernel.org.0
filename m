Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4847D202B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2019 11:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfEPJjc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 05:39:32 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52210 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfEPJjc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 05:39:32 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4G9dDcO030758;
        Thu, 16 May 2019 18:39:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4G9dDcO030758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557999553;
        bh=ItLMaSNmBZIJXqfk6ZYo/ABq2muq0aQgTGE1TDAZluI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GD3HsR78UCna+gSw5HCykseeD6debzsHpA71mVspp2in1ReVMEMxQBqe703Ue/fjp
         utphWWctY851H1dys2a/kQYRn7i+IfDBFk+RiS4a74OWtwea+9nhdKHY0SciahRXpF
         7Kbe6Uy8rfC5kSLGClZKKVv37p8X+xG8kieVgkXp4vIdeHzJd3+gQ0FubxON1xhnrB
         B96Yur0UrPpBUstPDXZ9hxGzbvfmDHXNsfg7YdhFUx/uTjhdvIIkFDzfRh+zguwt4X
         nVeYhHKpmKX9qrvoSXH2nmTfwcZOAlWGLv3gJS/d7iqaSfZDXDiIOehR+8zd2DHKzl
         WE9CPdtYf5eFg==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id r19so428506uap.5;
        Thu, 16 May 2019 02:39:13 -0700 (PDT)
X-Gm-Message-State: APjAAAX9CyBBb4Qit0OO2KUpst9OHq2dgg3NjF233uPI1Vko+Fxc9v8O
        D3kkTfm2BCCzcRx70Mex6qjK0c6HrPb/QV1Jquc=
X-Google-Smtp-Source: APXvYqwNo/oJRSKfwe0wmnho9as9QLLtnjg88c0HIcR9+AvwzmThx+PSLc05Hb8dCyppmmhNiycTMtE0k5OTdld/FRc=
X-Received: by 2002:a9f:24a3:: with SMTP id 32mr607007uar.109.1557999552098;
 Thu, 16 May 2019 02:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
 <201905150913.C23BD99AD@keescook> <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
 <5e6999f3d0b349bd86a32a612cff7b4b@AcuMS.aculab.com>
In-Reply-To: <5e6999f3d0b349bd86a32a612cff7b4b@AcuMS.aculab.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 16 May 2019 18:38:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbtxRxg=1_ZDMmX=q8AGYQescqXZ1TqAjDufMFww6pyQ@mail.gmail.com>
Message-ID: <CAK7LNAQbtxRxg=1_ZDMmX=q8AGYQescqXZ1TqAjDufMFww6pyQ@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
To:     David Laight <David.Laight@aculab.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

Hi David,

On Thu, May 16, 2019 at 6:00 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 15 May 2019 18:55
> ...
> > >     xargs basename -a -- | sort | ...
> >
> > Sorry for my ignorance, but could you
> > teach me the effect of "--" ?
> >
> > I sometimes use "--" as a separator
> > when there is ambiguity in arguments
> > for example, "git log <revision> -- <path>"
> >
> > In this case, what is intended by "--"?
>
> The '--' stops getopt() from parsing any more parameters.
> Useful things like 'grep -- -q' which will search for the
> string '-q' rather than treating it as a command line option.
>
> This is all made more horrid by a decision by the writers
> of glibc getopt() to 'permute' argv[] so that 'options'
> can follow 'nonoptions' ie it converts:
>         prog file -arg
> to
>         prog -arg file
> The only program the historically allowed 'late' options
> was 'rlogin hostname -l username'.
> This is just broken.....


Ah, I see.  This does not happen for
modules.order or modules.builtin,
but I will use '--' just in case.

Thanks.


>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
Masahiro Yamada
