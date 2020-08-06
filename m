Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55D623DE93
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 19:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729855AbgHFR1h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 13:27:37 -0400
Received: from a27-192.smtp-out.us-west-2.amazonses.com ([54.240.27.192]:51316
        "EHLO a27-192.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730369AbgHFR1d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 13:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1596734851;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=7XGxqHa7N9NredT0VTXJdFUTHg3OaFDutLRn2lT5pHY=;
        b=EPmpwNsIhimDo78/YcilHsp2NqeUT1D18jvApDB3Q99yhd2EYPNpdXVg8ApXUkT7
        DeloezwrHCqaLjSRMNZmmx41qbYJCi0ACNJHw/H0uTDZOeiuxEuK+kkH2FoEZKGe8yX
        onqh6aZ8YLgZ+EyHypOvu35jRbxAoGbUkpTqgyKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1596734851;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=7XGxqHa7N9NredT0VTXJdFUTHg3OaFDutLRn2lT5pHY=;
        b=JGOiEcuMI4URtm6LqApXl4zm8At7YCz/c8fnJQ+c358Bv59xd9lsprpNgOSGD2jb
        rr50FS1k2sNg9zUiLfvUNld+LGHa5drGf8PWhCWr8nebf9d84vqSDLBBoqkTgxt45mX
        SKfrfzdF+LQzA54XHzfyZP6TlU3oCEBXaWdFjDtg=
Subject: Re: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "Nick Desaulniers via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOd=xLc1=kRRM8NBaeXqhXOTSYDg7AgLtqRth4vm7ODFA6w@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com> <CAKwvOd=xLc1=kRRM8NBaeXqhXOTSYDg7AgLtqRth4vm7ODFA6w@mail.gmail.com>
Message-ID: <01010173c4d0486a-c210b3db-b00a-414b-81a4-33abab967678-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Thu, 6 Aug 2020 17:27:31 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.08.06-54.240.27.192
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 5, 2020 at 8:49 PM Chris Hoy Poy via RT
<kernel-helpdesk@rt.linuxfoundation.org> wrote:
>
>
> Hi all,
>
> This should be active at
>
> https://lore.kernel.org/linux-kbuild

Looks great! Thanks for getting this stood up for us Chris, we appreciate it.

>
> I dont think we missed any, but there might have been a few slip past the gap between the archive and the subscription being active, feel free to forward a quick list of those days if necessary, and I'll pull them in too.

Comparing https://marc.info/?l=linux-kbuild, there's a small hole
between July 8-July 27/29.  I've reached out to Hank who can help get
me the archive for those dates, and I'll rerun the sanitizer and reach
out to you with a link.  Then it looks like lore.kernel.org should be
pretty complete for kbuild.
-- 
Thanks,
~Nick Desaulniers

