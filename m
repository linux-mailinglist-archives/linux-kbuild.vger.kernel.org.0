Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A5C3608E7
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 14:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhDOMJW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 08:09:22 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20166 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhDOMJV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 08:09:21 -0400
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 13FC8a7C012312;
        Thu, 15 Apr 2021 21:08:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13FC8a7C012312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618488517;
        bh=fBU0e3wh3Mom706ETwnR4bgCESN5le9tpp4a2Slh/Go=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BH2vx4+vGXPaFHjwRWUz9JbdhIM5LvJ/7QUYSmAYtjdbgIaL7MT6eNci2NpGTnkuL
         PeQPAmim/vg2+83XGxVbNIeFpMNeiXarBVcB1Ga6OE8YzjtEbrW7nSrbLieUFCHzjb
         E66gBv21r9BZqBvHkG/Eb/lkVdn7pfkxyYA0VXNkIuJwP8DE6G0vZV3b9azkuJLHrO
         83h8U1sOsS55A5m2tcZAooLcBwDEGnpTUcfCNGMemCYMlac5YK+zJ9ArkABTjKM3j1
         Z9flPDtcNBgBRFVDdHmDPsI9liE9F/WPkEARVpYZzu+1rRlw4xfo0m36en4fMT6OjD
         D1/8+wM8dDLdQ==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id g16so2631889pfq.5;
        Thu, 15 Apr 2021 05:08:36 -0700 (PDT)
X-Gm-Message-State: AOAM531gF266pyJ2Pe1jkTkvgQVaYTuUao9GPiBuFCwLdB2dkDTG9vvY
        +U1PB76bk9FtBMHtBg+TH9rdz6fm34XdvvGBsw8=
X-Google-Smtp-Source: ABdhPJyjn4sw1JTwutd/yD5gNoyB6Fw2Ngrf3DHRYBC+t/zhb31Ngs1mfAJJc6yXk9EWdgOqCEgcKvZ3O757gfXO824=
X-Received: by 2002:a65:45cf:: with SMTP id m15mr3137730pgr.7.1618488515802;
 Thu, 15 Apr 2021 05:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210413150817.110282-1-masahiroy@kernel.org> <boris.20210415125211@codesynthesis.com>
In-Reply-To: <boris.20210415125211@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Apr 2021 21:07:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNASL8XziE3to9gOO6X2G5yEO_c9OyVFKp_dra-xMAf0Gcg@mail.gmail.com>
Message-ID: <CAK7LNASL8XziE3to9gOO6X2G5yEO_c9OyVFKp_dra-xMAf0Gcg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: split menu.c out of parser.y
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 7:54 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > --- /dev/null
> > +++ b/scripts/kconfig/internal.h
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef INTERNAL_H
> > +#define INTERNAL_H
> > +
> > +struct menu;
> > +
> > +extern struct menu *current_menu, *current_entry;
> > +
> > +#endif /* INTERNAL_H */
>
> Maybe call it menu.h instead of internal.h? Unless you have plans
> to put other "internal" stuff in there.


Yes, I will use this header for further cleanups
of headers.



>
> > --- a/scripts/kconfig/parser.y
> > +++ b/scripts/kconfig/parser.y
> > @@ -28,7 +29,7 @@ static bool zconf_endtoken(const char *tokenname,
> >
> >  struct symbol *symbol_hash[SYMBOL_HASHSIZE];
> >
> > -static struct menu *current_menu, *current_entry;
> > +struct menu *current_menu, *current_entry;
>
> Why not put these in menu.c?


These variables are defined here
before I started to maintain Kconfig.

For now, I am just removing the 'static' directive.


-- 
Best Regards
Masahiro Yamada
