Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D0B302EBA
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 23:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731997AbhAYWOK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 17:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45065 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbhAYWJb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 17:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611612485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YEfGCW9pOkAOxQjE9Kgiz1zr3syKfIZyR2H1zYGJuOs=;
        b=Xycli50YhPe4pATq94uSlZegONdUOX79Nqy44Xg2jIc/8L6bLap654J7djZNkxB84XRwMH
        x+9+0iVHa1c7bV5vrWff/0J4DIZn2uBopmoENO61aen38JeRCGu/BxEZ+yVDU7ynR6QNvz
        WKZ3aKsa6d24331S2mnX/ut+ZwsoD8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-f-xxbEYqOyqco9IPcad1rA-1; Mon, 25 Jan 2021 17:08:03 -0500
X-MC-Unique: f-xxbEYqOyqco9IPcad1rA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C291218C8C00;
        Mon, 25 Jan 2021 22:08:01 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2276F978;
        Mon, 25 Jan 2021 22:08:00 +0000 (UTC)
Date:   Mon, 25 Jan 2021 16:07:57 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210125220757.vxdsf6sttpy46cq7@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 06:44:35AM +0900, Masahiro Yamada wrote:
> > > If people use a different compiler, they must be
> > > prepared for any possible problem.
> > >
> > > Using different compiler flags for in-tree and out-of-tree
> > > is even more dangerous.
> > >
> > > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > > for in-tree build, and then disabled for out-of-tree modules,
> > > the struct layout will mismatch, won't it?
> >
> > If you read the patch you'll notice that it handles that case, when it's
> > caused by GCC mismatch.
> >
> > However, as alluded to in the [1] footnote, it doesn't handle the case
> > where the OOT build system doesn't have gcc-plugin-devel installed.
> > Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> > succeeds!  That happens even without a GCC mismatch.
> 
> 
> Ah, sorry.
> 
> I responded too early before reading the patch fully.
> 
> But, I do not like to make RANDSTRUCT a special case.
> 
> I'd rather want to stop building for any plugin.

Other than RANDSTRUCT there doesn't seem to be any problem with
disabling them (and printing a warning) in the OOT build.  Why not give
users that option?  It's harmless, and will make distro's (and their
users') lives easier.

Either GCC mismatch is ok, or it's not.  Let's not half-enforce it.

Also, how do you propose we solve the other problem, where a missing
optional library (gcc-plugin-devel) causes the OOT module build to
silently disable the plugin?  This is related to my earlier complaint
about the dangers of toolchain-dependent kconfig options.

-- 
Josh

