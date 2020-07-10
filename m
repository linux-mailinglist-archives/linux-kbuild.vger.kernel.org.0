Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5217D21BCA7
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2020 19:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgGJR45 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Jul 2020 13:56:57 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:61619 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJR45 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jul 2020 13:56:57 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 06AHub5b001972
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Jul 2020 02:56:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 06AHub5b001972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1594403798;
        bh=f8i4YhsdI1fHoTCSVZQjU6iu0nTYokqcq+huOiLePkU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hAKKBCAnSEG+70PM+wWWzEVA3uFOPU4NdPVmugJseneHF5VGkhRuFMCx7sWF2jE5r
         os1UFOOH+Th7ELma+tXGuuCiHq8XsgX+cZvohKET8JGNSF4fk09IMj4QWoxh+kkHC7
         H8mHT1RhR+xE7RnKRi7S+tZoLjid+3itmYKfB5mKwrnvDDDNuzCnnRNnJxm3B9tEWq
         azItAXBn684qxbMphgG3Rh/cLGheQHojSwo52hciD7W1fkMC0CWqtQGukFcCSy3TOg
         chfPlWL1CIt2qsctzx0X2yOIT5Z2iwpphiilD5rusylCCjIcHUXfFx3u6FHG52kLCH
         xEk6/2WoaneHw==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id x13so3419887vsx.13
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2020 10:56:37 -0700 (PDT)
X-Gm-Message-State: AOAM533pSnSZj6P3gN6TZ3j+1FDWAxmQz56/vmFUPBxyCPNeGdsHXwgM
        FUzcQsdDOfqZHH1RUyQsFrQ0grYrpeJgaEmshqs=
X-Google-Smtp-Source: ABdhPJxs3XrXtNP2MO4bIFFLzTwoXYej8NBoJpgJL59a1Ys0mmnvIWObHgEKa9Nv4idmtsR4aL+jk+uwx5RQpnnwCeQ=
X-Received: by 2002:a67:694d:: with SMTP id e74mr54954198vsc.155.1594403796394;
 Fri, 10 Jul 2020 10:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jul 2020 02:55:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
Message-ID: <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
Subject: Re: linux-kbuild missing from lore?
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        helpdesk@kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 9, 2020 at 3:42 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> > > Hi Nick,
> > >
> > > On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > >>
> > >> Hi Masahiro,
> > >> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> > >> https://lore.kernel.org/lists.html.  Is that intentional or
> > >> accidental?
> > >> --
> > >> Thanks,
> > >> ~Nick Desaulniers
> > >
> > >
> > > Thanks for letting me know this.
> > > I guess it is accidental.
> > >
> > > In fact, I do not know what to do
> > > to take good care of the kbuild ML.
> >
> > Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.
> >
> > or see if they are available from some other ML archive site, like
> > https://www.spinics.net/lists/linux-kbuild/
> >
> >
> > My kbuild archive has about 20,000 emails in it, beginning around the
> > middle of 2011.
> > I could make that available, but I don't claim that it is complete.
> >
> > And I'm sure that it has some duplicate emails in it [if an email is
> > kbuild-related, I put the email into this "folder", no matter what
> > mailing list it came from].
>
> https://lore.kernel.org/lists.html links to
> https://www.kernel.org/lore.html links to
> https://korg.docs.kernel.org/lore.html
> which seems to indicate that we need such an archive.
>
> cc'ing help desk for the request.  It looks like we need to
> collect+merge then sanitize mboxes.  Randy, if we could start with
> your archive, I'd be happy to help drive this across the finish line.


Thank you very much for your help, Nick!


-- 
Best Regards
Masahiro Yamada
