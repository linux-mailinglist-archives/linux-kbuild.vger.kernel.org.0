Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A016C25B0DE
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Sep 2020 18:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgIBQL4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 12:11:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51819 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbgIBQLh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 12:11:37 -0400
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 082GBKCw025833;
        Thu, 3 Sep 2020 01:11:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 082GBKCw025833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599063081;
        bh=pmpNm0w+p5nlVYLPePodcVS+2N4Uzz6SNAcWSFoTljw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tBHyVFJzVx/oMfZevwZjdAxfAj4dnC48HGlQznfHvJTNjKRd73poWwY7U1q6ZJm4X
         GBmPjbGTMOxDzjIRTNM491keqtrTsA9SmD3FtQzNJpDMUoRF+XLbd0gy68HCnbufyi
         fn0RglKGtqhM1qpajMjBnNE0hbVKDcf5oZ/1GaXs+c1p7B1ImUyWi19M8yDYRXl7iT
         ryp5bKa0VWModKZYQx+TiVsefLN2xJ5Gvvbbqj9YgwMPMXI9iqhlUzmJor02EX+mdX
         FvcrbfyMU/OXpfFIVOw57JIkRcOn8sJx4cRWDD7bCkS1hauB66kvWXFMkLbIu6QXP1
         e7GFkK6M2DSLw==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id z15so2508376plo.7;
        Wed, 02 Sep 2020 09:11:21 -0700 (PDT)
X-Gm-Message-State: AOAM530odV6eY69qrp4T0IJ+zmdYNTl0viUXDgDVkSsdv4p0JNzu9XUd
        f7MzfhQiVGwHSfAgq8Rrg5R8awXItThlrTms7o0=
X-Google-Smtp-Source: ABdhPJyCqJK+5kgvvUd1wa6DSBhxAKsQe2h8sXywOVBayNFFwCj2zJHSi27A2mbZFv8H2iekRZne3+oyj3XaIJEoNvE=
X-Received: by 2002:a17:90b:360a:: with SMTP id ml10mr2755492pjb.198.1599063080458;
 Wed, 02 Sep 2020 09:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
 <20200806120438.GG35926@hirez.programming.kicks-ass.net> <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
In-Reply-To: <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Sep 2020 01:10:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLtE-vuZD6ZAnUGT2zxn72e_-NWg3kD=DigLMQ4-ZDTw@mail.gmail.com>
Message-ID: <CAK7LNASLtE-vuZD6ZAnUGT2zxn72e_-NWg3kD=DigLMQ4-ZDTw@mail.gmail.com>
Subject: Re: [PATCH -v2] scipts/tags.sh: Add custom sort order
To:     "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 3, 2020 at 12:58 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Aug 7, 2020 at 2:28 AM <peterz@infradead.org> wrote:
> >
> >
> > One long standing annoyance I have with using vim-tags is that our tags
> > file is not properly sorted. That is, the sorting exhuberant Ctags does
> > is only on the tag itself.
> >
> > The problem with that is that, for example, the tag 'mutex' appears a
> > mere 505 times, 492 of those are structure members. However it is _far_
> > more likely that someone wants the struct definition when looking for
> > the mutex tag than any of those members. However, due to the nature of
> > the sorting, the struct definition will not be first.
> >
> > So add a script that does a custom sort of the tags file, taking the tag
> > kind into account.
> >
> > The kind ordering is roughly: 'type', 'function', 'macro', 'enum', rest.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> > Changes since v1:
> >  - removed the need for tags.unsorted by using a pipe
> >
> > Due to this change 'make tags' is now actually faster than it was before
> > due to less sorting.
> >
> >  scripts/sort-tags.awk | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  scripts/tags.sh       | 11 +++++--
> >  2 files changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/sort-tags.awk b/scripts/sort-tags.awk
> > new file mode 100755
> > index 000000000000..1eb50406c9d3
> > --- /dev/null
> > +++ b/scripts/sort-tags.awk
> > @@ -0,0 +1,79 @@
> > +#!/usr/bin/awk -f
> > +
> > +# $ ctags --list-kinds
> > +# C
> > +#   c  classes
> > +#   s  structure names
> > +#   t  typedefs
> > +#   g  enumeration names
> > +#   u  union names
> > +#   n  namespaces
> > +
> > +#   f  function definitions
> > +#   p  function prototypes [off]
> > +#   d  macro definitions
> > +
> > +#   e  enumerators (values inside an enumeration)
> > +#   m  class, struct, and union members
> > +#   v  variable definitions
> > +
> > +#   l  local variables [off]
> > +#   x  external and forward variable declarations [off]
> > +
> > +BEGIN {
> > +       FS = "\t"
> > +
> > +       sort = "LC_ALL=C sort"
> > +
> > +       # our sort order for C kinds:
> > +       order["c"] = "A"
> > +       order["s"] = "B"
> > +       order["t"] = "C"
> > +       order["g"] = "D"
> > +       order["u"] = "E"
> > +       order["n"] = "F"
> > +       order["f"] = "G"
> > +       order["p"] = "H"
> > +       order["d"] = "I"
> > +       order["e"] = "J"
> > +       order["m"] = "K"
> > +       order["v"] = "L"
> > +       order["l"] = "M"
> > +       order["x"] = "N"
> > +}
> > +
> > +# pass through header
> > +/^!_TAG/ {
> > +       print $0
> > +       next
> > +}
> > +
> > +{
> > +       # find 'kinds'
> > +       for (i = 1; i <= NF; i++) {
> > +               if ($i ~ /;"$/) {
> > +                       kind = $(i+1)
> > +                       break;
> > +               }
> > +       }
> > +
> > +       # create sort key
> > +       if (order[kind])
> > +               key = $1 order[kind];
> > +       else
> > +               key = $1 "Z";
> > +
> > +       # get it sorted
> > +       print key "\t" $0 |& sort
> > +}
> > +
> > +END {
> > +       close(sort, "to")
> > +       while ((sort |& getline) > 0) {
> > +               # strip key
> > +               sub(/[^[:space:]]*[[:space:]]*/, "")
> > +               print $0
> > +       }
> > +       close(sort)
> > +}
> > +
> > diff --git a/scripts/tags.sh b/scripts/tags.sh
> > index 4e18ae5282a6..51087c3d8b1e 100755
> > --- a/scripts/tags.sh
> > +++ b/scripts/tags.sh
> > @@ -251,8 +251,10 @@ setup_regex()
> >
> >  exuberant()
> >  {
> > +       (
> > +
> >         setup_regex exuberant asm c
> > -       all_target_sources | xargs $1 -a                        \
> > +       all_target_sources | xargs $1                           \
> >         -I __initdata,__exitdata,__initconst,__ro_after_init    \
> >         -I __initdata_memblock                                  \
> >         -I __refdata,__attribute,__maybe_unused,__always_unused \
> > @@ -266,12 +268,15 @@ exuberant()
> >         -I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
> >         -I static,const                                         \
> >         --extra=+fq --c-kinds=+px --fields=+iaS --langmap=c:+.h \
> > +       --sort=no -o -                                          \
> >         "${regex[@]}"
> >
> >         setup_regex exuberant kconfig
> > -       all_kconfigs | xargs $1 -a                              \
> > -       --langdef=kconfig --language-force=kconfig "${regex[@]}"
> > +       all_kconfigs | xargs $1                                 \
> > +       --langdef=kconfig --language-force=kconfig --sort=no    \
> > +       -o - "${regex[@]}"
> >
> > +       ) | scripts/sort-tags.awk > tags
> >  }
> >
> >  emacs()
>
>
> Sorry for the long delay.
>
> First, this patch breaks 'make TAGS'
> if 'etags' is a symlink to exuberant ctags.
>
>
> masahiro@oscar:~/ref/linux$ etags --version
> Exuberant Ctags 5.9~svn20110310, Copyright (C) 1996-2009 Darren Hiebert
>   Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
>   Optional compiled features: +wildcards, +regex
>
> masahiro@oscar:~/ref/linux$ make TAGS
>   GEN     TAGS
> etags: Warning: include/linux/seqlock.h:738: null expansion of name pattern "\2"
> sed: can't read TAGS: No such file or directory
> make: *** [Makefile:1820: TAGS] Error 2
>
>
>
>
> The reason is the hard-coded ' > tags',
> and easy to fix.
>
>
>
> But, honestly, I am not super happy about this patch.
>
> Reason 1
>   In my understanding, sorting by the tag kind only works
>   for ctags. My favorite editor is emacs.
>   (Do not get me wrong. I do not intend emacs vs vi war).
>   So, I rather do 'make TAGS' instead of 'make tags',
>   but this solution would not work for etags because
>   etags has a different format.
>   So, I'd rather want to see a more general solution.
>
> Reason 2
>   We would have more messy code, mixing two files/languages
>
>
>
> When is it useful to tag structure members?
>
> If they are really annoying, why don't we delete them
> instead of moving them to the bottom of the tag file?
>
>
>
> I attached an alternative solution,
> and wrote up my thoughts in the log.
>
> What do you think?
>



Sorry, the commit log of the attachment was wrong.

The correct sentence is:

"OK, [3] clearly explained why 'p' is useful, but turned --c-kinds=-px
into --c-kinds=+px. So, 'x' was also (accidentally?) enabled."



-- 
Best Regards
Masahiro Yamada
