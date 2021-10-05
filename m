Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEF5422CD8
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 17:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhJEPrK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 11:47:10 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54006 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbhJEPpg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 11:45:36 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 195FhVOe018297;
        Wed, 6 Oct 2021 00:43:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 195FhVOe018297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633448612;
        bh=7KHzNJArunt+AsZQcYX78r05TGgrRkmM/OebmoHU69I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YxT73IQ81QudBOGAj4BAW5zoykIp0GNFGGa8drvpaWabJOEzytzaKrfnPO3GRaus7
         pNv8h76mzquXi8aXMcbsLB7HSh8x9OPyCfIP6HJpUlhTfMrx+2+wIgaNEgBq/njWl5
         SRpVHSo6a3eSd8KQDC2sKljYFk6rklTQ57eC70hxJLuzVHet5ajrB6fgLa4n9T6i/d
         28YnXkHEN+DBIZnk795lNn9utPG6jCC7lTLNZW5SUW4GZRfgJFn4MOGBXrF9tNoN94
         HldKvWTBdzQGyY9joM7cwZ585xreAl2cvq3DNAipnAxpGNIcNMHcQOs5sS0/u+i9+r
         MFqnraxFGLqPA==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id np13so4440625pjb.4;
        Tue, 05 Oct 2021 08:43:31 -0700 (PDT)
X-Gm-Message-State: AOAM5306jRA1p1pEPIdFlnvQjxkYd1iGQj6XdaKp+ulshoOQVfRDaGRj
        38IT4MXDd27emopMNAEnZDwPeZUsZyJNnV9RHYM=
X-Google-Smtp-Source: ABdhPJxa0XnjdhgyGfp1YcU5HxWZALDV0EYXv+orqK/WSc01E/ow6WDMY6Pe9Plq+sfbz7omUjr2mMhKD6v6JOELnOQ=
X-Received: by 2002:a17:902:6b01:b0:13e:50bb:790f with SMTP id
 o1-20020a1709026b0100b0013e50bb790fmr5873181plk.42.1633448610986; Tue, 05 Oct
 2021 08:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210920213957.1064-1-richard@nod.at> <CAK7LNAQd1d89J8GjLExgeirQ3cR+tnP6GMgekeBcrGJ-=ArrCQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQd1d89J8GjLExgeirQ3cR+tnP6GMgekeBcrGJ-=ArrCQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 6 Oct 2021 00:42:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASS0NeAhwevT1AXoknRJK0RQdysK0F9Rp=F9PXxGB+j5g@mail.gmail.com>
Message-ID: <CAK7LNASS0NeAhwevT1AXoknRJK0RQdysK0F9Rp=F9PXxGB+j5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Refactor sym_escape_string_value
To:     Richard Weinberger <richard@nod.at>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 27, 2021 at 9:36 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Sep 21, 2021 at 6:42 AM Richard Weinberger <richard@nod.at> wrote:
> >
> > sym_escape_string_value() can take a struct symbol directly
> > and use sym_get_string_value() itself to obtain the string value.
> > We will need struct symbol later for error reporting.
> >
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
>
> I think this is a nice clean-up regardless of 2/2.
> Applied to linux-kbuild. Thanks.
>

I changed my mind after all.
I dropped this patch to clean up the code in a different way.


-- 
Best Regards
Masahiro Yamada
