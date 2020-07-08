Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADE42191B7
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 22:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgGHUnY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 16:43:24 -0400
Received: from a27-45.smtp-out.us-west-2.amazonses.com ([54.240.27.45]:59910
        "EHLO a27-45.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725848AbgGHUnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 16:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594241003;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=0XuuHxhTj3pXUBaguDEoOrwypxsS5fT9C48MJTISIrY=;
        b=OX6/l0gtdyU0zYp2wL5q2qPFi0SV+Sc83ouNX2xlKGgEqq8VkuNTUElzY9ojiLfz
        Fxb6eqVR2OyHm7C7K9rvHIL4qAa8n+oP32usITmbY5Zav8GZTQWuFzUdcA5LANrzsMz
        Jq9BT9CO0NOLROkTlN2sv1jlTgx4ujC9Nve6mKcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594241003;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=0XuuHxhTj3pXUBaguDEoOrwypxsS5fT9C48MJTISIrY=;
        b=eKVKdhskt2U7abqyS2PGdbG+T3kWg7mW8uvSZZSKEk64H7VmJ7PKjudL9JWVv4XB
        KBu+yRFo0JhO9elx6njobeBGXAZrbRDSvLxa1+gnpBjNfBhep557v38z4/oYdtMATiS
        VA8N1svaLQE9j4mT9Fo/X1lnCCOFmZ8m1tmbpftk=
Subject: [Kernel.org Helpdesk #93182] [linuxfoundation.org #93182] Re: linux-kbuild missing from lore?
From:   "rdunlap@infradead.org via RT" 
        <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
Message-ID: <01010173302b2dad-aee643d2-a7ff-4dfc-a162-f1fe17fcec26-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: rdunlap@infradead.org
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Wed, 8 Jul 2020 20:43:22 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.08-54.240.27.45
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/8/20 11:42 AM, Nick Desaulniers wrote:
> On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
>>> Hi Nick,
>>>
>>> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
>>> <ndesaulniers@google.com> wrote:
>>>>
>>>> Hi Masahiro,
>>>> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
>>>> https://lore.kernel.org/lists.html.  Is that intentional or
>>>> accidental?
>>>> --
>>>> Thanks,
>>>> ~Nick Desaulniers
>>>
>>>
>>> Thanks for letting me know this.
>>> I guess it is accidental.
>>>
>>> In fact, I do not know what to do
>>> to take good care of the kbuild ML.
>>
>> Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.
>>
>> or see if they are available from some other ML archive site, like
>> https://www.spinics.net/lists/linux-kbuild/
>>
>>
>> My kbuild archive has about 20,000 emails in it, beginning around the
>> middle of 2011.
>> I could make that available, but I don't claim that it is complete.
>>
>> And I'm sure that it has some duplicate emails in it [if an email is
>> kbuild-related, I put the email into this "folder", no matter what
>> mailing list it came from].
> 
> https://lore.kernel.org/lists.html links to
> https://www.kernel.org/lore.html links to
> https://korg.docs.kernel.org/lore.html
> which seems to indicate that we need such an archive.
> 
> cc'ing help desk for the request.  It looks like we need to
> collect+merge then sanitize mboxes.  Randy, if we could start with
> your archive, I'd be happy to help drive this across the finish line.

Hi,

As long as you or someone will go thru the mbox file (about 164 MB or
34 MB when gzipped) and select emails that are To: or Cc:
linux-kbuild@vger.kernel.org, I'm OK with making it available.
The reason I say that is because it just might have some personal
emails in it that should not be added to a public archive.

Also, as I said earlier, once the correct emails are selected,
there are going to be duplicates of many of them, so dropping
those duplicates (or triplicates etc.) would be a Good Idea.


Has anyone thought about trying to get the kbuild archive from
marc.info/?l=linux-kbuild ?  or contacted the marc.info admin?


-- 
~Randy


