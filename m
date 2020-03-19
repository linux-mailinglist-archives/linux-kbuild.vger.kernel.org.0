Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666A318BB33
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2020 16:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCSPfJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Mar 2020 11:35:09 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21122 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCSPfJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 11:35:09 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02JFYfKx010180;
        Fri, 20 Mar 2020 00:34:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02JFYfKx010180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584632082;
        bh=ZudRjw8d2mmE6Qh0MNmRmyStzy23KZnPj7KGn+JhVk4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IO+hiNmLXYruFLdzoVMQNC5p4AT+C+SS2aDSDJHXJIZ1CW5COBIZshODKxYi69o6R
         0m3CilCMjWrrxZOSBWkP6xZDUasCG2dmf1hxxVLDVFenfqTHZ8hxelBswxUb7uPZCJ
         XZTjCrjZFlAfhJFwsoVUJe4g9VTbh0ckEijjPDL6joVoqv1hceqQocA/l0fvGxIsbw
         lUPH7TFYsi+ZGUYt3uUD0bVXPnVetljYdIKLoKCSLOILuMxxmJZw9S8rBBdJ0vxy3l
         2dv1776bkZ+3CudusR6j167fNy7+xF7h1iXlpbK0UNSOhcmNlJNG6fBmzFJHPv6Jqz
         M2tqRv44NILXQ==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id j2so945647uak.9;
        Thu, 19 Mar 2020 08:34:42 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3a6wlyeR3U1iBJMiz165v55xVGGe5Qhy98Akqz/3loRFQYS4Mr
        SsfTjSjuf9pHnf/4R7xzCAuT9o/l+dFhbGMxf3c=
X-Google-Smtp-Source: ADFU+vt3y1uz57wFaSIYffv4+/U5DMz8PYOgRl8m+08bn6AZbd9wh2PcZ8DWrvfAGgwXzg7GPW0S09jfOPg8WVuy0kw=
X-Received: by 2002:ab0:3485:: with SMTP id c5mr2220678uar.109.1584632080969;
 Thu, 19 Mar 2020 08:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200317000718.177637-1-slyfox@gentoo.org> <nycvar.YFH.7.76.2003170154580.19500@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2003170240410.19500@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2003170240410.19500@cbobk.fhfr.pm>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 20 Mar 2020 00:34:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKBjfYsqvaksDhSwhDHxLv0o6c8cLx=eWuVYGHCGZ_Sw@mail.gmail.com>
Message-ID: <CAK7LNARKBjfYsqvaksDhSwhDHxLv0o6c8cLx=eWuVYGHCGZ_Sw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: disallow data races on gcc-10 as well
To:     Jiri Kosina <jikos@kernel.org>,
        Sergei Trofimovich <slyfox@gentoo.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 17, 2020 at 10:41 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 17 Mar 2020, Jiri Kosina wrote:
>
> > > The flag change happened at https://gcc.gnu.org/PR92046.
> > >
> > > CC: Jiri Kosina <jkosina@suse.cz>
> > > CC: Masahiro Yamada <masahiroy@kernel.org>
> > > CC: Michal Marek <michal.lkml@markovi.net>
> > > CC: linux-kbuild@vger.kernel.org
> > > Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> > > ---
> > >  Makefile | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 171f2b004c8a..9696eb2cd5a1 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -714,6 +714,7 @@ endif
> > >
> > >  # Tell gcc to never replace conditional load with a non-conditional one
> > >  KBUILD_CFLAGS      += $(call cc-option,--param=allow-store-data-races=0)
> > > +KBUILD_CFLAGS      += $(call cc-option,-fno-allow-store-data-races)
> >
> > I have to say I can't really read gcc sources without major cerebral pain,
> > so let me me dense here: what happens to gcc<10 if you pass
> > -fno-allow-store-data-races to it?
>
> Sorry, brainfart on my side, your patch is good :)
>
>         Acked-by: Jiri Kosina <jkosina@suse.cz>
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Applied to linux-kbuild with Jiri's Ack.

Thanks.

-- 
Best Regards
Masahiro Yamada
