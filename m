Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C30303E59
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 14:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391795AbhAZNP1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 08:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391777AbhAZMq0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 07:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611665100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MNJERmT7Vuz6QxflZTnA+auIcqBlbQ/3RdflYOHk/Tk=;
        b=SN8f9OFHYVVd9I7H9lbgBtg1uBJvMeL4355+5xE4aoaQx+8qeC7/CgfYfUp8eVOmOQF/fU
        WHLt9QZewOqK4IBve2+7Zl2LNRexBb8hLevT+U8IV3D0eUcrvULcYo7S0m3+wwtTbGtu8g
        +7OTXeUJxnzXWk+77F+fEEdKyPe9LVU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-DaWTReI8Ns-B9oTFcK_WRw-1; Tue, 26 Jan 2021 07:44:56 -0500
X-MC-Unique: DaWTReI8Ns-B9oTFcK_WRw-1
Received: by mail-wr1-f69.google.com with SMTP id x7so30728wrp.9
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jan 2021 04:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MNJERmT7Vuz6QxflZTnA+auIcqBlbQ/3RdflYOHk/Tk=;
        b=h0QxJmQ/sn3KR0OzH7xAfiFwxPaNzK2FvjRmEnOwHUF3Wy76xYC+PyZ/e3+otIof7C
         Bhk81H+f9CKa4pf1gqQ83S8frHEjTD7AqWlUEki4ujLp2tpJEPHXK/9wC1KuPNtFvqD/
         WGtA9CWQYOW3oAefUei1JuDTV/Y79L/GpRVm4GUJHpuZ5K3ass19PoxgDtufue4Sm1mm
         XsVQeDi/1GmjkIJ0nDn5UVV4sDWkvvVuP7OSYbhQjMwQfRV8TJakaYkWu9zS/fCv5fDx
         u9oU/27ewsbzwvQLHczjCxwwNaaC320d0WfennFo+GVotKt5eNAHtKDRkAh6pChlOHzq
         vZyg==
X-Gm-Message-State: AOAM5323tRNUm10R27bYuyntBEx6ey+xzUgNnp7urWwKhpsxNZLRXdHl
        A5XWBv+6BjnyOFHWaYm3u344MEwUg+2AvBuKE3PN/NN8WdMNCABBNt0Z4GSPSNFiK8Qm6exSuCU
        isvtsfCE14TtKrtr/Q6lb3f/kLey3+uSSZC2MGRTl
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr6052885wrd.33.1611665095173;
        Tue, 26 Jan 2021 04:44:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwidMAkaJwMIbKsfh4oZmDF/v+rGyEjI2VgDeYGU4BuvgYrjHrnFErK1GdiavCeAFABamnHBsxDCBqo39sR5jg=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr6052870wrd.33.1611665095013;
 Tue, 26 Jan 2021 04:44:55 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble> <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble> <YA/PLdX5m9f4v+Yl@kroah.com>
In-Reply-To: <YA/PLdX5m9f4v+Yl@kroah.com>
From:   Justin Forbes <jforbes@redhat.com>
Date:   Tue, 26 Jan 2021 06:44:44 -0600
Message-ID: <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Greg KH <greg@kroah.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 2:21 AM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Jan 25, 2021 at 04:07:57PM -0600, Josh Poimboeuf wrote:
> > On Tue, Jan 26, 2021 at 06:44:35AM +0900, Masahiro Yamada wrote:
> > > > > If people use a different compiler, they must be
> > > > > prepared for any possible problem.
> > > > >
> > > > > Using different compiler flags for in-tree and out-of-tree
> > > > > is even more dangerous.
> > > > >
> > > > > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > > > > for in-tree build, and then disabled for out-of-tree modules,
> > > > > the struct layout will mismatch, won't it?
> > > >
> > > > If you read the patch you'll notice that it handles that case, when it's
> > > > caused by GCC mismatch.
> > > >
> > > > However, as alluded to in the [1] footnote, it doesn't handle the case
> > > > where the OOT build system doesn't have gcc-plugin-devel installed.
> > > > Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> > > > succeeds!  That happens even without a GCC mismatch.
> > >
> > >
> > > Ah, sorry.
> > >
> > > I responded too early before reading the patch fully.
> > >
> > > But, I do not like to make RANDSTRUCT a special case.
> > >
> > > I'd rather want to stop building for any plugin.
> >
> > Other than RANDSTRUCT there doesn't seem to be any problem with
> > disabling them (and printing a warning) in the OOT build.  Why not give
> > users that option?  It's harmless, and will make distro's (and their
> > users') lives easier.
> >
> > Either GCC mismatch is ok, or it's not.  Let's not half-enforce it.
>
> As I said earlier, it's not ok, we can not support it at all.
>

Support and enforce are 2 completely different things.  To shed a bit
more light on this, the real issue that prompted this was breaking CI
systems.  As we enabled gcc plugins in Fedora, and the toolchain folks
went through 3 different snapshots of gcc 11 in a week. Any CI process
that built an out of tree module failed. I don't think this is nearly
as much of a concern for stable distros, as it is for CI in
development cycles.

Justin

