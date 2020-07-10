Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8372521BCA6
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2020 19:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgGJR4u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Jul 2020 13:56:50 -0400
Received: from a27-192.smtp-out.us-west-2.amazonses.com ([54.240.27.192]:48446
        "EHLO a27-192.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbgGJR4t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jul 2020 13:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594403808;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=PILpCxIPPJMiq8E3HSwoxFoEO4FqKvEAsjZt+JguyAw=;
        b=G3UoqGTuLsLHWz09ZmvlP6nugTD7+eCxnZ4EoKeVHUU+5Cj7Pnu398WhTaYKJatp
        CGUtwJI5Sy+DaMt430Le+z8DgrvW06siCnNJ8RBwMEVgKivsEQyDAGgDp+SZbZc4+VL
        3Zv3i36gFFncrAKDVBvHpP2w3DBDmWwuj2oReBIs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594403808;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=PILpCxIPPJMiq8E3HSwoxFoEO4FqKvEAsjZt+JguyAw=;
        b=OskfcTyZ7VAJmtFZZ7NYF3ReIHBmeSXmF/vr5BAs4Cncm/w4+AXny4Oq8AK9QGf0
        mBGz+7k0huxKxzCTIesMLg5x6FggCQqo8TYYEMCshkUsyNCecRJgInp6xAoQS/hKGIM
        nLw67wWmbYR77TCrbXEar3LnLPsmAUEvWenTzR0A=
Subject: [Kernel.org Helpdesk #93182] [linuxfoundation.org #93182] Re: linux-kbuild missing from lore?
From:   "masahiroy@kernel.org via RT" 
        <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
Message-ID: <0101017339df64d3-1487ba88-0f36-4608-9297-1507ad4e60e8-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: masahiroy@kernel.org
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, michal.lkml@markovi.net,
        nhuck@google.com, rdunlap@infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Fri, 10 Jul 2020 17:56:48 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.10-54.240.27.192
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
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

