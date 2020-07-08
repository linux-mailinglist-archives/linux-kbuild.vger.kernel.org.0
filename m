Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BB92191D1
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 22:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgGHUtb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 16:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHUtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 16:49:31 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1B0C061A0B
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2020 13:49:30 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so15371905pgm.11
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jul 2020 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCPxv30eZAbAtJRYrDv+cadlYT8blEN4fRsWAUbqI0k=;
        b=Ljrg4bgu7DHzaOlViYGAlBIcu6S/GGm+7BhqfMS5jx9x84mqdJ8LcIrQRgCXGSjs8Y
         vBvEVIeAOd5eJeusUOSy1GgygIVhbueCkLZwckG4lWCIxNnsoSq79RW5ggD3A1k/ZV/+
         pvV0l06hmdegOhtySrEh/+lkpV6TNhgRoZkG0DX5scfwC15lMHfgHef5giSw+I4j8zOk
         XKx+QHpczvADVnia9+itLzv49CnlM7obG7Oya8+eEbxc6liVHXM7rpsD9OBeZMpqtW9Z
         7OB42/SZKNBCXvyPTBkGJPn92IV2s4DjVm808mjYoaIzHLks+g1jJ8AWRF4ef1s4ajk/
         DS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCPxv30eZAbAtJRYrDv+cadlYT8blEN4fRsWAUbqI0k=;
        b=Jw6Lt4MBZ6VqdlO8ZBhq755VDFtrHjn/jrDrTOBDAQc+nLd/S5JPEXnC68bfxwHSiT
         fumQ3YKCGoPBc63l3YfZkTmFxlSLFXivND8r2oIZjXnzwA3/6MGz9SMyqqp/mqglffol
         hLPLbivcCBQjrFt/kna7LKhgKEHfNVxfVGOrV5AhywbHAImsetHFRrRgsupd6S4HdF3R
         CF+9l3l8X/tkmuwCF5YVtZqwfHOUBb/lOkQQZ8sI3ChdyjOQIe3RD0rGAsRUkAjBMVoR
         DGOKIJEBzLbiu9pQeJUbcXdeAAK0nUGl/MIPJL8ZrLPMLRp8vAuuiK/zX3KNFjUI0MMS
         cjdw==
X-Gm-Message-State: AOAM530QAdNpZ1KiWVgIBTTLBCHXGPxtb/6uXCQvrGUOpcJYRsuwB+Y3
        fmFMDEY+dYSDnNMkP/bnBDX+VNyezkaserQ6fI/CXQ==
X-Google-Smtp-Source: ABdhPJxf3Cabzq7Fh/iYhjvVxxIfpMhNh95ilMVpCudv1Nr8xfh5j+OaGA0FDIH6FcNho802b9Y3ZSjTg73xVO1agY8=
X-Received: by 2002:a62:86cc:: with SMTP id x195mr48142565pfd.39.1594241370178;
 Wed, 08 Jul 2020 13:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
In-Reply-To: <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 8 Jul 2020 13:49:18 -0700
Message-ID: <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
Subject: Re: linux-kbuild missing from lore?
To:     Randy Dunlap <rdunlap@infradead.org>, webguy@marc.info
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        helpdesk@kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
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
