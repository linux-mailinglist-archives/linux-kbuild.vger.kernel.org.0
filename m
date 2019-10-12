Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE20BD4C65
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 05:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfJLDUu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 23:20:50 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31646 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfJLDUu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 23:20:50 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x9C3KZvC029353;
        Sat, 12 Oct 2019 12:20:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x9C3KZvC029353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570850436;
        bh=fVr6myVWeNkwM1bzUYkAV3KR6w6/G/BTVwiRy1YKeFE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jBGzyU5Mq7JX//jH7mWGJu9NdKguZyZXnVGNj3iCJS5PRSD3xLkJRY0TGS4Dk2k0G
         PJQ7rHVBvJb3mZkIbGIpgatVzi0UNBGZW3Oa2TAi1tVvoegSiHlWCBzOUQtFg/wGSW
         9t9f3+QGAgRYXfE3wrIe0ip/p3bytfQVfw/nQvT4u3bYR4T8Vk6zvfIXG7KTzYmZfD
         3QERovRA/lXLHDqYZCmp4F2raHSRboVWEeLWepwohRaE56ray+aQB3i17uJAu9wpXj
         wiWyYHDDm4LRjw50yOhTz56hoox7MNupUsWV4924Ir95zuqk9ECeRDvXtUz0+XBKNc
         FVtnRymLipdlg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id z14so7481125vsz.13;
        Fri, 11 Oct 2019 20:20:35 -0700 (PDT)
X-Gm-Message-State: APjAAAW1xwzad01EzQvNacNbHmX0+XbtwRiUi9FQqHD8/aksLmU/mbFD
        epPPHsweGjzTP0pJT6Z3vEiwTkxpHfuWt2qS3yk=
X-Google-Smtp-Source: APXvYqxNrd3wl6DgsTBqbsxBQYF+1gG7D7r2FAwVB2ThW11Jz8W/5aeuJmNk7KKiWAHe87RF9lJgtuaoBtTuQKOpfXE=
X-Received: by 2002:a67:e354:: with SMTP id s20mr11109571vsm.54.1570850434646;
 Fri, 11 Oct 2019 20:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191010151443.7399-2-maennich@google.com>
 <20191011153253.GB1283883@kroah.com>
In-Reply-To: <20191011153253.GB1283883@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 12 Oct 2019 12:19:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbgtnP_P6aZEO7bHNL+w641ED+19TXCXKkU=dE+gyBGQ@mail.gmail.com>
Message-ID: <CAK7LNAQbgtnP_P6aZEO7bHNL+w641ED+19TXCXKkU=dE+gyBGQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] modpost: delegate updating namespaces to separate function
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 12, 2019 at 12:33 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 10, 2019 at 04:14:40PM +0100, Matthias Maennich wrote:
> > Let the function 'sym_update_namespace' take care of updating the
> > namespace for a symbol. While this currently only replaces one single
> > location where namespaces are updated, in a following patch, this
> > function will get more call sites.
> >
> > The function signature is intentionally close to sym_update_crc and
> > taking the name by char* seems like unnecessary work as the symbol has
> > to be looked up again. In a later patch of this series, this concern
> > will be addressed.
> >
> > This function ensures that symbol::namespace is either NULL or has a
> > valid non-empty value. Previously, the empty string was considered 'no
> > namespace' as well and this lead to confusion.
> >
> > Signed-off-by: Matthias Maennich <maennich@google.com>
> > ---
> >  scripts/mod/modpost.c | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 4d2cdb4d71e3..9f5dcdff4d2f 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -362,6 +362,22 @@ static char *sym_extract_namespace(const char **symname)
> >       return namespace;
> >  }
> >
> > +static void sym_update_namespace(const char *symname, const char *namespace)
> > +{
> > +       struct symbol *s = find_symbol(symname);
> > +       /* That symbol should have been created earlier and thus this is
> > +        * actually an assertion. */
>
> Do we care about checkpatch issues in tools?

Personally, I do.


>
> If so, you need a blank line before the comment :)

One more minor issue, the block comment style is not correct.
Please do like this:

/*
 * Blah Blah ...
 * Blah Blha ...
 */

With those addressed,

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>



>
> Anyway, not a big deal
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>





-- 
Best Regards
Masahiro Yamada
