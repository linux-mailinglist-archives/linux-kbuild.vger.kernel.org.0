Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8702192C8
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 23:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgGHVr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 17:47:59 -0400
Received: from a27-30.smtp-out.us-west-2.amazonses.com ([54.240.27.30]:36694
        "EHLO a27-30.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbgGHVr7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 17:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594244878;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=rwQGupFmhzeIzO+HCIlWoNNKd+EmhBw4p/pS7IB47fY=;
        b=dHFWG11/aMa46K2WPC9qOzN2n6j0RdoWlL3KwHfHIWWGD9UJYJyOQTUyeEiVEEE0
        CIzkV37tU6oN6fz6RkkfNOSpG4Li/XrWuGrZrDpL0WzNFySoO1laafdzsZRSSSbCUAZ
        IQ/O6FdKLeZUgHnRqoI50UdK88d/m4CP+ZBWtfT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594244878;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=rwQGupFmhzeIzO+HCIlWoNNKd+EmhBw4p/pS7IB47fY=;
        b=JZtvL+LVfpvZPO/KGAaqifgjvDSknGm0AbMLwzdBbXd0Sdrq2pLpJdHUHRnFDFiW
        VPLOafWaveISiWnN4GPxyMQw14Uj1msNsPFmIAFXOKHgN5Rdy0g3HXhKS8k7MKtFyep
        e/9wQ4m99NLDzcYmjmt3KReyvgihY5DrhQEz80oo=
Subject: [Kernel.org Helpdesk #93182] [linuxfoundation.org #93182] Re: linux-kbuild missing from lore?
From:   "Nick Desaulniers via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOdnBNkJerfFXotFNMtgHUgY9PAb0ec1yQ+D20Y-Db5efQg@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
 <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
 <20200708214526.GA1893@ultron.spinoli.org>
 <CAKwvOdnBNkJerfFXotFNMtgHUgY9PAb0ec1yQ+D20Y-Db5efQg@mail.gmail.com>
Message-ID: <0101017330664f79-d15d0498-9817-4ef9-8072-4005c213489c-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Wed, 8 Jul 2020 21:47:58 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.08-54.240.27.30
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 8, 2020 at 2:45 PM Hank Leininger <hlein@marc.info> wrote:
>
> On Wed, Jul 08, 2020 at 01:49:18PM -0700, Nick Desaulniers wrote:
> > On Wed, Jul 8, 2020 at 1:43 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >
> > > On 7/8/20 11:42 AM, Nick Desaulniers wrote:
> > > > On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > >>
> > > >> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> > > >>> Hi Nick,
> > > >>>
> > > >>> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> > > >>> <ndesaulniers@google.com> wrote:
> > > >>>>
> > > >>>> Hi Masahiro,
> > > >>>> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> > > >>>> https://lore.kernel.org/lists.html.  Is that intentional or
> > > >>>> accidental?
> [snip]
> > > Has anyone thought about trying to get the kbuild archive from
> > > marc.info/?l=linux-kbuild ?  or contacted the marc.info admin?
> >
> > Clicking "add a list" on
> > https://marc.info/
> > opens an emailto: link to webguy@marc.info, so adding them here.
> > Dear marc.info admin, is exporting a copy of the linux-kbuild mail
> > archive something that you can help us with?
>
> Hi! That sounds like it should be doable; we keep .gz backups of all
> the lists we're subscribed to. At a quick glance I have them going back
> to Jan 2, 2008, I thiiiink uninterrupted. There's probably some spam
> that got sent to the list and/or sent to our subscribed address
> included.
>
> Can someone please contact me off-thread and we'll work out details of
> how to best get them to you?

(On thread) I'll follow up on this (so that we don't have a bunch of
off threads created)

>
> Thanks,
>
> --
>
> Hank Leininger <hlein@marc.info>
> ED0E 3040 4240 1DD9 5B2E  6DEC A60B CB9D 0939 76F7



-- 
Thanks,
~Nick Desaulniers

