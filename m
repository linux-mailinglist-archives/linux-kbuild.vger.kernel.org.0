Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03728218FD5
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgGHSmP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGHSmP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:42:15 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDB9C061A0B
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2020 11:42:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so22060463pge.12
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jul 2020 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjGxaib2iwmEg1N9XTXXuaYcIUKEZ+NgkLDyMvB8y6A=;
        b=dtJwFFMiOqnj5wASnjlqYWV8OmvHbRYplzwFYEMuRK3To7rfzGS4MQm3bgNygH/qKR
         ZRb+aVP2/znc0fT/dprxr0hTAkrQF3ENUTdqskXFFsOUFAVrUwPtVMuGTBBnwIlLsiVV
         liIR0AYKn/aJ6JaaCjgjThN3d/p029tafxPAFzdih7uIcPxJP3YXWK5lM1xoiv582pge
         UhuiTcf+xJcVZA4czbvdC1tXD7bZPYK+0GkURtAWMXpe8FWUqmuioU8oO8PxaKGtIGgi
         tL6OB7owjnLnpcKjZqod+24ZVOkJja8v6QMcu3tnCFsBApnq7i9BPiBFYS+5vgJUdeDn
         K94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjGxaib2iwmEg1N9XTXXuaYcIUKEZ+NgkLDyMvB8y6A=;
        b=gtQ1HGsIagHpss+yrWKiEiCt7jgG4fnUKQgStzbfSEuEURp47g/LMxeLm/oCWca3Do
         zjW8RamuXkXoGdnbAksaB9g62jYGfwryNThrTTnFtdqJxUPGrlhejl3PlS19c8C9dH7U
         YXp6pWS/LuZImOxl5N2xT+UrnKQ2ZiJPAH9dPhQXn4YvmF+sJ6R3z9rfu+LI9OrTenm6
         mw8V7dq3DQHyqP3fVKK4eRz6Y4KyEH3NIT1svyryziX2uKlN1VSqXpYvmVpyJassZ/tU
         3Ib30Z+lhaF1tMEBfW0yiGmAg0h4u1im6npuAUA3xu2EBFZYSRRf3N7Urvw9UF5aD3+f
         nkrw==
X-Gm-Message-State: AOAM532xJ9b9jghN4sNGmeHD6OGsABPhbEVxRju9N9d/TQCgAZqsZgb8
        7NdBIfurfyh5Tk/5rLw75wkDZUiXJrP3PTq5G7sK7MfcYa8=
X-Google-Smtp-Source: ABdhPJzGU/s7DNU/0v9xxeGT6ZKWzMfx5JW6cmsQTwrkRVa/0NAsK1EnhBxwptMkNVGUH23XxjPJDOfsdigHGncFSK8=
X-Received: by 2002:a63:7e55:: with SMTP id o21mr51887999pgn.263.1594233734645;
 Wed, 08 Jul 2020 11:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com> <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
In-Reply-To: <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 8 Jul 2020 11:42:03 -0700
Message-ID: <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
Subject: Re: linux-kbuild missing from lore?
To:     Randy Dunlap <rdunlap@infradead.org>
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

On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> > Hi Nick,
> >
> > On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> >>
> >> Hi Masahiro,
> >> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> >> https://lore.kernel.org/lists.html.  Is that intentional or
> >> accidental?
> >> --
> >> Thanks,
> >> ~Nick Desaulniers
> >
> >
> > Thanks for letting me know this.
> > I guess it is accidental.
> >
> > In fact, I do not know what to do
> > to take good care of the kbuild ML.
>
> Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.
>
> or see if they are available from some other ML archive site, like
> https://www.spinics.net/lists/linux-kbuild/
>
>
> My kbuild archive has about 20,000 emails in it, beginning around the
> middle of 2011.
> I could make that available, but I don't claim that it is complete.
>
> And I'm sure that it has some duplicate emails in it [if an email is
> kbuild-related, I put the email into this "folder", no matter what
> mailing list it came from].

https://lore.kernel.org/lists.html links to
https://www.kernel.org/lore.html links to
https://korg.docs.kernel.org/lore.html
which seems to indicate that we need such an archive.

cc'ing help desk for the request.  It looks like we need to
collect+merge then sanitize mboxes.  Randy, if we could start with
your archive, I'd be happy to help drive this across the finish line.
-- 
Thanks,
~Nick Desaulniers
