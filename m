Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1621E2191D2
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 22:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgGHUth (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 16:49:37 -0400
Received: from a27-192.smtp-out.us-west-2.amazonses.com ([54.240.27.192]:33982
        "EHLO a27-192.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbgGHUth (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 16:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594241376;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=zj8dxdRQ6e3FoDRn3TzebJdfJ0go8ZmvzF4LfyujgJ4=;
        b=XzUpuQbOnGj6ZhG/owD8HrofeO3918Hvl7g5k+KEF7P4c9An9KLM0CCxAoEEAxjE
        zVFlQjgjh+Hbi9W+PcIdsBgvwOESqFC/QIWIcYk00DYNaSbmwrrsaCNusnFACtJHJe5
        3xNqUbbWNRWkr3UWN725IhnkVEzVlzvXkZ8cSHQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594241376;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=zj8dxdRQ6e3FoDRn3TzebJdfJ0go8ZmvzF4LfyujgJ4=;
        b=KFTjkZSh1BV6/fOeSCJg6OAFdi8QaRvSYfXnOY2Y1DmAzXZyCFJUbMn+6tLqcdUD
        fpYuVl5rhq0uczudIl48byjPkKnqz3rMcjnPaf3DsjXken2fw80B/sAhaCfVlEN02V2
        Xr7erfFHlC0HjN6bsZwpPE3gzhq2AvzGydK0PqGc=
Subject: [Kernel.org Helpdesk #93182] [linuxfoundation.org #93182] Re: linux-kbuild missing from lore?
From:   "Nick Desaulniers via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
 <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
Message-ID: <010101733030e04a-f798b5e8-0b1b-43be-8a61-fc777399ae37-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Wed, 8 Jul 2020 20:49:36 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.08-54.240.27.192
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 8, 2020 at 1:43 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 7/8/20 11:42 AM, Nick Desaulniers wrote:
> > On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> >>> Hi Nick,
> >>>
> >>> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> >>> <ndesaulniers@google.com> wrote:
> >>>>
> >>>> Hi Masahiro,
> >>>> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> >>>> https://lore.kernel.org/lists.html.  Is that intentional or
> >>>> accidental?
> >>>> --
> >>>> Thanks,
> >>>> ~Nick Desaulniers
> >>>
> >>>
> >>> Thanks for letting me know this.
> >>> I guess it is accidental.
> >>>
> >>> In fact, I do not know what to do
> >>> to take good care of the kbuild ML.
> >>
> >> Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.
> >>
> >> or see if they are available from some other ML archive site, like
> >> https://www.spinics.net/lists/linux-kbuild/
> >>
> >>
> >> My kbuild archive has about 20,000 emails in it, beginning around the
> >> middle of 2011.
> >> I could make that available, but I don't claim that it is complete.
> >>
> >> And I'm sure that it has some duplicate emails in it [if an email is
> >> kbuild-related, I put the email into this "folder", no matter what
> >> mailing list it came from].
> >
> > https://lore.kernel.org/lists.html links to
> > https://www.kernel.org/lore.html links to
> > https://korg.docs.kernel.org/lore.html
> > which seems to indicate that we need such an archive.
> >
> > cc'ing help desk for the request.  It looks like we need to
> > collect+merge then sanitize mboxes.  Randy, if we could start with
> > your archive, I'd be happy to help drive this across the finish line.
>
> Hi,
>
> As long as you or someone will go thru the mbox file (about 164 MB or
> 34 MB when gzipped) and select emails that are To: or Cc:
> linux-kbuild@vger.kernel.org, I'm OK with making it available.
> The reason I say that is because it just might have some personal
> emails in it that should not be added to a public archive.

Oh, sure. Maybe better than to try to get a cleaner copy from
marc.info then, as you suggest.

>
> Also, as I said earlier, once the correct emails are selected,
> there are going to be duplicates of many of them, so dropping
> those duplicates (or triplicates etc.) would be a Good Idea.
>
>
> Has anyone thought about trying to get the kbuild archive from
> marc.info/?l=linux-kbuild ?  or contacted the marc.info admin?

Clicking "add a list" on
https://marc.info/
opens an emailto: link to webguy@marc.info, so adding them here.
Dear marc.info admin, is exporting a copy of the linux-kbuild mail
archive something that you can help us with?

-- 
Thanks,
~Nick Desaulniers

