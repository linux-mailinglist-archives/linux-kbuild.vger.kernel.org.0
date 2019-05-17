Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7158721B90
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 18:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfEQQZB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 12:25:01 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37007 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfEQQZA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 12:25:00 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4HGOVdR004971;
        Sat, 18 May 2019 01:24:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4HGOVdR004971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558110272;
        bh=zIcbxBsGKT0njbeaFi6Mkg+6kcbGCAfu8DgoGnoVqWk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zqzD3+5Mwcnw4vsvf7bDEaHBqEkuESPJBfE5aZRk3sDjbM4rkYFAr1M9uBg5g0BO1
         Lvw4CYDx1NIETfDDxwUY67FdEXbi1IunRv53SIiuwVtBW2azOCaX0ngkFH0/VDFIn2
         sN5gO07hUMslQpg+FM9lNrA6Id753A6MJze96W9SW391FGjfMz7Wu1pRP4Y2KLniD7
         GmCdEIGAqOiwo4OR+p+IzVSyxQVkGGS6E/Bufxm3Bamw/YnERX2+5nh3EB2Vm8OT5s
         unkgghYgawo37tNbTbOrnCvRIt16cETTDl+GRoP6bOWtR8jrVRbLU/1n6gK2DfgZIZ
         lZqscROJPooQg==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id d128so4976565vsc.10;
        Fri, 17 May 2019 09:24:32 -0700 (PDT)
X-Gm-Message-State: APjAAAU9M+gBt+91NhImAzXKd8fmrb0MgA65vLwUhzjDuRq1QjKDmNHe
        EOUIPYvQ0VwNcDy+Ug712k5E/wnRIUXHbXWWuSw=
X-Google-Smtp-Source: APXvYqxOIzK1boEAfFi3DuhFikilPnfO6s12Yh1XSWACijiGDzmqTNBmEpssJoWLpVBXe/1JDftvlJA0O3bfGH974BI=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr9498363vsl.179.1558110271151;
 Fri, 17 May 2019 09:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com> <20190517153439.3b479334@canb.auug.org.au>
In-Reply-To: <20190517153439.3b479334@canb.auug.org.au>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 01:23:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQMCfEE2ncrGj3Cair8udQZea_ZsTGGSsFA_7T86-7vRA@mail.gmail.com>
Message-ID: <CAK7LNAQMCfEE2ncrGj3Cair8udQZea_ZsTGGSsFA_7T86-7vRA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 2:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> Thanks for this, looks good to me.  Just a nit below.
>
> On Fri, 17 May 2019 13:27:53 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
>
> > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > new file mode 100755
> > index 000000000000..c875f6eab01e
> > --- /dev/null
> > +++ b/scripts/modules-check.sh
> > @@ -0,0 +1,20 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +set -e
> > +
> > +# Check uniqueness of module names
> > +check_same_name_modules()
> > +{
> > +     same_name_modules=$(cat modules.order modules.builtin | \
>                                                                 ^
> This trailing '\' is unnecessary after a pipe symbol.


With the suggestion from Alexander Kapshuk,
the code in v3 became short enough to fit in 80-columns.

Anyway, thanks for pointing it out.





> > +                             xargs -r basename -a -- | sort | uniq -d)
> > +
> > +     for m in $same_name_modules
> > +     do
> > +             echo "warning: same basename if the following are built as modules:" >&2
> > +             grep -h -e "/$m" modules.order modules.builtin | \
>
> Same here
>
> > +                                             sed 's:^kernel/:  :' >&2
> > +     done
> > +}
> > +
> > +check_same_name_modules
>
> Reviewed-by: Stephen ROthwell <sfr@canb.auug.org.au>
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
