Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4064825B895
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 04:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgICCIa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 22:08:30 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:18057 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgICCI3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 22:08:29 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 083286I6018641;
        Thu, 3 Sep 2020 11:08:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 083286I6018641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599098886;
        bh=FbRuuNFl7WBGq+7ZgXV+kPAug+eVnXiL2BhcCi5h+pQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NbpWpuI3P5Ymn+hHb+O5eANPQnnf2a3RDLjU/npfQgzVXZ6aGr88k2I2738t5JS4p
         1IPVpIgyoze8tJMhlR+py+oF/Z7RvqwkMPLYJ6g1HM82rTiFwKlfuCFPtRGvmp2p/H
         aIA5YxjK+0vwYQrlPAfpmPlkTkXO/9oCD3W8KkV7ynVLqwK9GS8vG9Y6jKN+yIxcCd
         5kCAACGouYBUE36HwdX8nusBfCfqFbiJrRCeUiJ+3GzJ3It2xMVAW1nB1HnmubCiWe
         rwGey5cupqUR8Es2eFYZxXQ4efSYlirNXE56v+eI1XHcR4eB5vGye6itC8lreW8ewT
         Oa/kP87H1tRNA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id s2so681615pjr.4;
        Wed, 02 Sep 2020 19:08:06 -0700 (PDT)
X-Gm-Message-State: AOAM533ZPILqodfq8BbGaHoFVGJDALpIPO26oiMnb040KydI3g4sdU9q
        vpIybWR7PiJEV+yhfqvorXUcGiDRxPqq0OWiJBI=
X-Google-Smtp-Source: ABdhPJyJOFojJtm7uxShN5a262TORZhyfaAW6yFIuIpfP+P1o4jX85Yweu7n/JhvKfWfS7anSmqJvhj93VGvz/6bv1s=
X-Received: by 2002:a17:90b:360a:: with SMTP id ml10mr730723pjb.198.1599098885716;
 Wed, 02 Sep 2020 19:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
 <20200806120438.GG35926@hirez.programming.kicks-ass.net> <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
 <20200902162649.GL1362448@hirez.programming.kicks-ass.net>
In-Reply-To: <20200902162649.GL1362448@hirez.programming.kicks-ass.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Sep 2020 11:07:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+0QtvgX1b77Y51cuMQ-eK4cKb8rebTQ=Ug3F2rkjP2g@mail.gmail.com>
Message-ID: <CAK7LNAS+0QtvgX1b77Y51cuMQ-eK4cKb8rebTQ=Ug3F2rkjP2g@mail.gmail.com>
Subject: Re: [PATCH -v2] scipts/tags.sh: Add custom sort order
To:     "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 3, 2020 at 1:26 AM <peterz@infradead.org> wrote:
>
> On Thu, Sep 03, 2020 at 12:58:14AM +0900, Masahiro Yamada wrote:
>
> > Sorry for the long delay.
> >
> > First, this patch breaks 'make TAGS'
> > if 'etags' is a symlink to exuberant ctags.
> >
> >
> > masahiro@oscar:~/ref/linux$ etags --version
> > Exuberant Ctags 5.9~svn20110310, Copyright (C) 1996-2009 Darren Hiebert
> >   Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
> >   Optional compiled features: +wildcards, +regex
> >
> > masahiro@oscar:~/ref/linux$ make TAGS
> >   GEN     TAGS
> > etags: Warning: include/linux/seqlock.h:738: null expansion of name pattern "\2"
> > sed: can't read TAGS: No such file or directory
> > make: *** [Makefile:1820: TAGS] Error 2
> >
> > The reason is the hard-coded ' > tags',
> > and easy to fix.
>
> Ah, my bad, I forgot to check.
>
> > But, honestly, I am not super happy about this patch.
> >
> > Reason 1
> >   In my understanding, sorting by the tag kind only works
> >   for ctags. My favorite editor is emacs.
> >   (Do not get me wrong. I do not intend emacs vs vi war).
> >   So, I rather do 'make TAGS' instead of 'make tags',
> >   but this solution would not work for etags because
> >   etags has a different format.
> >   So, I'd rather want to see a more general solution.
>
> It might be possible that emacs' tags implementation can already do this
> natively. Initially I tried to fix this in vim, with a macro, but I
> couldn't get access to the 'kind' tag.
>
> > Reason 2
> >   We would have more messy code, mixing two files/languages
>
> I could try and write the whole thing in bash I suppose.
>
> > When is it useful to tag structure members?
>
> Often, just not when there is a naming conflict.
>
> > If they are really annoying, why don't we delete them
> > instead of moving them to the bottom of the tag file?
>
> Because they're really useful :-)
>
> > I attached an alternative solution,
> > and wrote up my thoughts in the log.
> >
> > What do you think?
>
> > Exuberant Ctags supports the following kinds of tags:
> >
> >   $ ctags --list-kinds=c
> >   c  classes
> >   d  macro definitions
> >   e  enumerators (values inside an enumeration)
> >   f  function definitions
> >   g  enumeration names
> >   l  local variables [off]
> >   m  class, struct, and union members
> >   n  namespaces
> >   p  function prototypes [off]
> >   s  structure names
> >   t  typedefs
> >   u  union names
> >   v  variable definitions
> >   x  external and forward variable declarations [off]
> >
> > This commit excludes 'm', 'v', and 'x'.
>
> So my main beef is with m vs s conflicts (they're pretty prevalent),
> removing v is insane, but even removing m is undesired IMO.
>
> > Reviewed-by: Peter Zijlstra (Intel) <peterz@infradead.org>


Sorry, I intended Reported-by, not Reviewed-by.


> Very much not I'm afraid. I really do like my tags, it's just that I'd
> like to have a set precedence when there's a naming conflict.
>
> My claim is that a structure definition is more interesting than a
> member variable, not that member variables are not interesting.



OK, but is there any idea
to make the code cleaner and easier to maintain?


People play with whatever they want to do in this script.



f81b1be40c44b33b9706d64c117edd29e627ad12
introduced file-level ordering.


4f491bb6ea2aef2f5b184f385904a73796d98554
broke it.
(I pointed it out in the review,
but akpm picked it anyway.)


Now, here is the tag-level ordering
(only for exuberant ctags).



Contributors stop caring after their code is merged,
but maintaining it is tiring.


Will re-implementing your sorting logic
in bash look cleaner?

Or, in hindsight, we should have used python or perl?


--
Best Regards
Masahiro Yamada
