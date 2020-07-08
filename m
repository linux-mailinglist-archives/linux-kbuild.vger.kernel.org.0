Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481362192C5
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 23:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgGHVrV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 17:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHVrU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 17:47:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21F7C061A0B
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2020 14:47:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k5so143276pjg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jul 2020 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=reqbx8p/xkVgFAZv2HVx0tGL1nAHWDqVnFtn9PTRdQw=;
        b=BroKPxibvJhKV3HFHmYeJoeBlWzqEogyGUuU3dKAwZcTfWC0SfNlkaQJKAOUvxtcxr
         csUrrt+p05r71VQVl0uhlV4oJnPK6g3+BGVaym8AEtuyyoHzwXuAZsDyQ+2WBvBPNq3D
         1lk0vht/gwRZE/Z8rMUmZSuomzI+cxROlf/1uyRQ8mbpvad7csY8zsMRRMxvaB9dlVgr
         zc3vCR0Y+RuvvPjf4qfARHvpq4U3KYl2Yrf5FUrghRvlWHbljW1wxiS6juQvjqEt9bSh
         komPrSNPRe3H/WhS9Q8/3epupR03GBA+/92bpXHHeWiLxBao0kYjh1r+wJmYFs/EiweG
         AuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=reqbx8p/xkVgFAZv2HVx0tGL1nAHWDqVnFtn9PTRdQw=;
        b=qIay+/plu2FlufsH9Jjh8lRU8o6smY/ZcT5VY1vKxA3Go3s6Z+Z5Bv0NQV+jtZBZog
         OctrC3PIAjVSgZMn4D3JvrQTXjPxtL3ee7m/ZXl2PCnMuO2iEy4UImfkzDtWJvHovG4H
         uNlc2P4kuF0hNmcJV0Jide5/GrHv/jEgjf4K3Zhra1q/3k6qL38acGwVvyrzR8jhDUko
         67jHca4sJaqQQw6ujtkn0joLsY46qGN5VLKC04YcVCs5SkWaRjM9wQcNnH8yJfR8h4me
         /LgNOCOafsX9GMlewM4Y7Ar/TkvDapPzna71pxW36GoNTvuUbNiRBdOGTg2/d/j0hu8T
         jLjQ==
X-Gm-Message-State: AOAM533HXCAQu7DX2sbFysvNyheJvogYsEKbk3OXUGEEYCC8oYXLucj/
        2VkzKwKZMIOI869y7dUjsMSegGUns+GAvO3pj9Vq4Q==
X-Google-Smtp-Source: ABdhPJz0u0Mm9RTIpBexcwuLEjb185mZGMIRXeoDiRHNQPMtq2ZrewyEEyBhwNUU0ICKd8TXYbCXqFO+D84+XAAbtkE=
X-Received: by 2002:a17:90a:21ef:: with SMTP id q102mr11980080pjc.101.1594244840242;
 Wed, 08 Jul 2020 14:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org> <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
 <20200708214526.GA1893@ultron.spinoli.org>
In-Reply-To: <20200708214526.GA1893@ultron.spinoli.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 8 Jul 2020 14:47:08 -0700
Message-ID: <CAKwvOdnBNkJerfFXotFNMtgHUgY9PAb0ec1yQ+D20Y-Db5efQg@mail.gmail.com>
Subject: Re: linux-kbuild missing from lore?
To:     Hank Leininger <hlein@marc.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, webguy@marc.info,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        helpdesk@kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
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
