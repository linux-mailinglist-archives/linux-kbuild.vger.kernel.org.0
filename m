Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9831C23D5DF
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 05:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHFDtd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Aug 2020 23:49:33 -0400
Received: from a27-29.smtp-out.us-west-2.amazonses.com ([54.240.27.29]:39798
        "EHLO a27-29.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbgHFDtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Aug 2020 23:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1596685770;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=bjF7TKD4pgOH2TGnBtrjPqREp6EyEGR+Es4rP/9LHWs=;
        b=IwASm2g1Yng5zOD4zIPGqeS5eJwnqUG5gO0wevnFexF2nisns43OHO0Mn9S5aosd
        0xfG3h3GL4vmxxBl3xH2FsbASjmv2tpKvePlwi+NaRKsKPhrG3nYSDCv4r6/yW8Xq0/
        goT7v9UUpmA1lUwfOfGn8bwsjMuJ3aD21sE4eiHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1596685770;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=bjF7TKD4pgOH2TGnBtrjPqREp6EyEGR+Es4rP/9LHWs=;
        b=hB7r7HFpyfOUUrjqk+9zZ+qCaB8/TbbpBKeXILKBCjV9We2Gd8iLlAZfYpAAe0Ip
        aACdIYtrwSqYMoP7UsafE4UI3kLsuAX4kvLry/6W+j/yrrE4h/RDAXrfRBkCRVxmyWm
        ZQwiJyKWwvFS9uShX/g0qCxtxIcPr4Vg//91aL/I=
Subject: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "Chris Hoy Poy via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
Message-ID: <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: choypoy@linuxfoundation.org
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Thu, 6 Aug 2020 03:49:30 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.08.06-54.240.27.29
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Hi all, 

This should be active at 

https://lore.kernel.org/linux-kbuild

I dont think we missed any, but there might have been a few slip past the gap between the archive and the subscription being active, feel free to forward a quick list of those days if necessary, and I'll pull them in too. 

cheers
/Chris

On Thu Jul 09 02:42:33 2020, ndesaulniers@google.com wrote:
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


-- 
Chris Hoy Poy
Collaborative Projects IT
The Linux Foundation
