Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F5F1CC09F
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2020 13:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgEILJB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 May 2020 07:09:01 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52554 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgEILJA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 07:09:00 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 049B8TGB019771;
        Sat, 9 May 2020 20:08:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 049B8TGB019771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589022510;
        bh=T9AGnaI49ilVpVFvPCs2mRRQGAPg1sYG/5bfmVNCeKs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iGJMWAvpVbbomUe6H94322ZC42OtmM12LwlmFxH0yVgqwoI6UXfML+/4Y33WGQRjH
         nTiCQeQHtLxPQ6laDjoA4j+eecj0NevKTAEYOnOPUMfyglahk9qwu/57KaCAnAJXmk
         nJZFcRovp+/nENMICarDOzAtk+dzDDsh8yYZmzCZA3bIkMDo66RhWTw4U2awIyWzny
         zZq93cuxXQpyrfYvJXfs1GmVpnrh58Nct+9tiLk4Uu+p5zJrFdZXabvxZoTzMgLiTL
         TClOHl9f1q3PIeX+Mv+MZav1ZhXi7IzywsszQLdmmY6Nvv8DIV8q7I7cwD87ESLgEy
         uQZeqx2SaGN7A==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id e10so2668890vsp.12;
        Sat, 09 May 2020 04:08:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuaAEOR7J663FS9aTqsDlq1FklASaTQjaG+EBU/CgnlrBbb4gcbh
        F8Y/ZjI8kh6IrMRTjE58kql2FJZjybkhaSNjuAI=
X-Google-Smtp-Source: APiQypJJNwRWO3ga/F8SM/zTZXyOwULYR5luFTgX4WluozXetan8cuFLhrppaB6XnCQ7WCZ7mjsqBkaafkwI2PA3+3A=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr5262295vsc.181.1589022508905;
 Sat, 09 May 2020 04:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200503001141.9647-1-changbin.du@gmail.com> <CAK7LNATBt1NxRSWiv8Ab-pKBRemp43WUs96KWELTf+vFq_VPTA@mail.gmail.com>
 <20200507091807.0a789fbd@gandalf.local.home> <20200508140047.rln4iogroxw7esxa@mail.google.com>
In-Reply-To: <20200508140047.rln4iogroxw7esxa@mail.google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 9 May 2020 20:07:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARt3k47OSJYFTcc6z6MWb2oSLmQZwRwecsxu6j9r9dnVw@mail.gmail.com>
Message-ID: <CAK7LNARt3k47OSJYFTcc6z6MWb2oSLmQZwRwecsxu6j9r9dnVw@mail.gmail.com>
Subject: Re: [PATCH v4] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 8, 2020 at 11:00 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> On Thu, May 07, 2020 at 09:18:07AM -0400, Steven Rostedt wrote:
> > On Thu, 7 May 2020 12:19:57 +0900
> > Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > On Sun, May 3, 2020 at 9:11 AM Changbin Du <changbin.du@gmail.com> wrote:
> > > >
> > > > Sometimes it is useful to preserve batches of configs when making
> > > > localmodconfig. For example, I usually don't want any usb and fs
> > > > modules to be disabled. Now we can do it by:
> > > >
> > > >  $ make LMC_KEEP="drivers/usb;fs" localmodconfig
> > > >
> > > > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > > >
> > > > ---
> > > > v4: fix typo.
> > > > v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> > > > v2: fix typo in documentation. (Randy Dunlap)
> > > > ---
> > >
> > >
> > > Personally, I do not mind the long LOCALMODCONFIG_PRESERVE,
> >
> > Perhasp we allow both? ;-)
> >
> > And just have one set to the other.
> >
> > > but this tends to be bike-sheding.
> > > I do not have a strong opinion.
> > >
> > >
> > > >  Documentation/admin-guide/README.rst |  8 +++++++-
> > > >  scripts/kconfig/Makefile             |  1 +
> > > >  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
> > > >  3 files changed, 31 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> > > > index cc6151fc0845..1371deab8bc7 100644
> > > > --- a/Documentation/admin-guide/README.rst
> > > > +++ b/Documentation/admin-guide/README.rst
> > > > @@ -209,10 +209,16 @@ Configuring the kernel
> > > >                             store the lsmod of that machine into a file
> > > >                             and pass it in as a LSMOD parameter.
> > > >
> > > > +                           Also, you can preserve modules in certain folders
> > > > +                           or kconfig files by specifying their paths in
> > > > +                           parameter LMC_KEEP.
> > > > +
> > > >                     target$ lsmod > /tmp/mylsmod
> > > >                     target$ scp /tmp/mylsmod host:/tmp
> > > >
> > > > -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> > > > +                   host$ make LSMOD=/tmp/mylsmod \
> > > > +                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \
> > >
> > >
> > > This might be another bike-sheding item, but
> > > can you use a space for the delimiter?
> > >
> > >
> > > LMC_KEEP="drivers/usb drivers/gpu fs"
> > >
> > > If you pass multiple directories,
> > > you will need to surround them with double-quotes.
> >
> > I agree that spaces look better.
> >
> I am okay with space. But what about ":" which is used by shell PATH and many
> others?


I am not sure 'many others',
but you can pick what you like.





-- 
Best Regards
Masahiro Yamada
