Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531BF21292
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 05:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfEQDip (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 23:38:45 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22897 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfEQDip (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 23:38:45 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4H3cN1D032721;
        Fri, 17 May 2019 12:38:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4H3cN1D032721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558064304;
        bh=srN3/L+Kx9Et/22233UjKG5aslu8L3GpgixAoCxQ5yM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2J8eWrbpwFM7LwNHSWsazJJFrN5fl01HfReLlbmiilaQfPechGIKeZlsWTeya4CFM
         MZEanIsQXaJaHoOfn5k7faFhGNhcoR/l+dEB3Qw8+Bm1ZJO4QbL9ceOX+tLCqy90I9
         Qmu+a8rVPNplx2tOmLANdrfvcWqigsbyZwkrWAFij3uGe4Vjpr8ZrFX+XxancqmhR2
         +39LaUHIK3my8MBHGe+1J9aftycL/czcjV5Qa+aPIOJZZvm1s5DLzi2feDq3lx/Fmd
         u4W9VtunapeEo7/SD1blIryCl5O/O6shSzBgayIf4i9moqu20qBBUlptVvUMhYwC3z
         uf5iZ+0pVWFDw==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id n7so2140654uap.12;
        Thu, 16 May 2019 20:38:23 -0700 (PDT)
X-Gm-Message-State: APjAAAUkqtag2YS5RKdEfhMfOWWbZ6Z5o2cn+3hy1cFRWYn8J8EhHSec
        Rygm+h7KCxG5EdcjicbB8JBfvvIl4K2iU9BmxWQ=
X-Google-Smtp-Source: APXvYqy+E3KgmeybTo+0K8ZSAolNzMC/m2XGEox38LXflIwOHcq9J7NMqQNWklD80zDReYHBoxwzEJczldJfvWFYxXw=
X-Received: by 2002:ab0:3058:: with SMTP id x24mr23025836ual.95.1558064302467;
 Thu, 16 May 2019 20:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com> <201905151130.87CDB73C0@keescook>
In-Reply-To: <201905151130.87CDB73C0@keescook>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 17 May 2019 12:37:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKnWkJhw3Hn1vKK=dB_vHOo0MtMd9duTpHoQSdgYoZLA@mail.gmail.com>
Message-ID: <CAK7LNASKnWkJhw3Hn1vKK=dB_vHOo0MtMd9duTpHoQSdgYoZLA@mail.gmail.com>
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

On Thu, May 16, 2019 at 3:31 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 16, 2019 at 03:07:54AM +0900, Masahiro Yamada wrote:
> > On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >
> > >         $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> > > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > > new file mode 100755
> > > index 000000000000..944e68bd22b0
> > > --- /dev/null
> > > +++ b/scripts/modules-check.sh
> > > @@ -0,0 +1,18 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +# Warn if two or more modules have the same basename
> > > +check_same_name_modules()
> > > +{
> > > +       same_name_modules=$(cat modules.order modules.builtin | \
> > > +                               xargs basename -a | sort | uniq -d)
> >
> >
> > I noticed a bug here.
> >
> >
> > allnoconfig + CONFIG_MODULES=y
> > will create empty modules.order and modules.builtin.
> >
> > Then, 'basename -a' will emit the error messages
> > since it receives zero arguments.
>
> You can skip running it by adding "-r" to xargs:
>
>        -r, --no-run-if-empty
>               If the standard input does not contain any nonblanks, do not run
>               the command.  Normally, the command is run once even if there is
>               no input.  This option is a GNU extension.

Good idea!

I will use this in v2.

Thanks.


-- 
Best Regards
Masahiro Yamada
