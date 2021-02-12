Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2D23198E7
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 04:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhBLDnI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 22:43:08 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25841 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhBLDnH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 22:43:07 -0500
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 11C3fwme017367;
        Fri, 12 Feb 2021 12:41:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 11C3fwme017367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613101318;
        bh=jHXHPieW9tGuSK9kOfKjKVk5BXUnKFd1l53kYACYKQQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tJhPry8PUpWc2d1EaxdZNC1/rIUXOSqSEtY0JCX0phFHC2MnpqSeJIT/LDUMxNbE/
         uFbDxYUDnAIrhWn7FhS9UsjNrbgL3xYS3/52tOHI6bldwZUZ4evJv4JQR3wTvFM5SO
         vJTR1CwEs4t7Uu+IuhpAjzKgCDk5SW5EIctmgs+eXWTX7n9cFSw95cxqiGIYNo+S0F
         LDdf/XlosM48ZvDzGwDXcyDVQ+l6YT8UWzEI7jTCvWQV+4XBX6bduqn2IEsStasnBm
         5Q8qrxVh9UrbcKYeOWwJ+UQS83MXMBd11ChuRRRp4bVav7cZ55TiVmucCt/UIsZNXr
         lV1vdPGxm5iFw==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id x136so5024149pfc.2;
        Thu, 11 Feb 2021 19:41:58 -0800 (PST)
X-Gm-Message-State: AOAM531Y/y2uJRjybhw7R5WTbwWrBloC9iVivv5zs6bzvfLfC9lTbE5B
        y+tgCk19hPkTg0NwpGHlGn82H8CD5FWH3gW7R4s=
X-Google-Smtp-Source: ABdhPJxPsFyAj8DqgumnPxIRbZHCO+glC9Bpn42INXpv+/fhj+98LdUfQegcUgaVCJ1ff4NYTPiR0iy4Z8mZP/PcLk4=
X-Received: by 2002:a62:2f07:0:b029:1bb:5f75:f985 with SMTP id
 v7-20020a622f070000b02901bb5f75f985mr1093619pfv.76.1613101317853; Thu, 11 Feb
 2021 19:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20210207161352.2044572-1-sashal@kernel.org> <20210208175007.GA1501867@infradead.org>
 <20210208182001.GA4035784@sasha-vm> <CAK7LNAQtQTwGt4SCK88a=y4ydASXoR30cCCmcFFdsUk=WY7tfA@mail.gmail.com>
 <CAK7LNASo2i_NT8acBCJ2gYeLE_rjyncSteyqD_mrMMR5Wf261g@mail.gmail.com>
In-Reply-To: <CAK7LNASo2i_NT8acBCJ2gYeLE_rjyncSteyqD_mrMMR5Wf261g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Feb 2021 12:41:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQiSe3j5h_rjvruJJfMpRsvkTcKuU0RJ7EJvpjGVX7G_w@mail.gmail.com>
Message-ID: <CAK7LNAQiSe3j5h_rjvruJJfMpRsvkTcKuU0RJ7EJvpjGVX7G_w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
To:     Sasha Levin <sashal@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 12:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Feb 12, 2021 at 5:18 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Feb 9, 2021 at 3:20 AM Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > On Mon, Feb 08, 2021 at 05:50:07PM +0000, Christoph Hellwig wrote:
> > > >On Sun, Feb 07, 2021 at 11:13:52AM -0500, Sasha Levin wrote:
> > > >> +            (u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
> > > >> +            (u16)(LINUX_VERSION_SUBLEVEL));
> > > >
> > > >No need for the casts and braces.
> > > >
> >
> >
> > I agree.
> >
> > Shall I remove the casts when I apply this?
> >
> >
> >
> >
> > > >Otherwise this looks good, but please also kill off KERNEL_VERSION
> > > >and LINUX_KERNEL_VERSION entirely while you're at it.
> > >
> > > I don't think there are in-tree users left?
> > >
> > > We can't remove it completely because userspace is still using it, so if
> > > we drop those userspace will be sad.
> >
> >
> > Right.
> > Once we export a macros to userspace, we cannot remove it.
> >
> >
> >
> >
> >
> > > --
> > > Thanks,
> > > Sasha
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
>
>
>
>
> Wait, this patch does not work.
> None of the submitter or reviewers
> tested this patch... Sigh.
>
>
> masahiro@grover:~/workspace/linux-kbuild$ make
> Makefile:1249: *** missing 'endef', unterminated 'define'.  Stop.
>
>
>
>
>
>
>
> diff --git a/Makefile b/Makefile
> index ef81c8895abf..1fdd44fe1659 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1258,7 +1258,7 @@ define filechk_version.h
>         ((c) > 255 ? 255 : (c)))';                                       \
>         echo \#define LINUX_VERSION_MAJOR $(VERSION);                    \
>         echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL);            \
> -       echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL);                \
> +       echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
>  endef
>
>  $(version_h): FORCE
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada





Please send a correct patch,
also drop the unneeded casts.





-- 
Best Regards
Masahiro Yamada
