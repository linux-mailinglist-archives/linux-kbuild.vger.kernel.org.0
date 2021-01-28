Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464D0307FF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 21:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhA1UyT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 15:54:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36361 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231280AbhA1Uxn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 15:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611867136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PD52G8H8WowL1CDDPJCJ4ed7LFW1amADHytpNbhh8/8=;
        b=QkWXw6dp6ZQYR7mM79QX6DPe94kA7qGu0ac5ZOIx5CbRPqu+OxTP7IMDmQFOErxL7+AkvP
        OToGBR8Sgf4BdPjJBGZ3hs0qd50qC/+6fjMRoC5zB0D4sWMZFqmT9sPr/8xSd02fauw6SN
        +GA7VEUCfMu6q/VR8UXEFNhi4oDB54s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-xU2gCXcxPbiSGk6-B6kFwg-1; Thu, 28 Jan 2021 15:52:14 -0500
X-MC-Unique: xU2gCXcxPbiSGk6-B6kFwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6FC1344F2;
        Thu, 28 Jan 2021 20:52:12 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2491A8A9;
        Thu, 28 Jan 2021 20:52:10 +0000 (UTC)
Date:   Thu, 28 Jan 2021 14:52:07 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external
 modules
Message-ID: <20210128205207.awdbh4bmx56pxxjl@treble>
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 12:24:45PM -0800, Linus Torvalds wrote:
> On Thu, Jan 28, 2021 at 12:08 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > Add a check for compiler mismatch, but only check the major version.
> 
> I think this is wrong for multiple reasons.
> 
> The most fundamental reason is that it's pointless and doesn't
> actually do what you claim it does.
> 
> Just doing a "make oldconfig" will reset the CONFIG_xyz_VERSION to
> whatever is installed, and now your check doesn't actually do
> anything, since you're not actually checking what the kernel was
> compiled with!

Huh?  Why would you do a "make oldconfig" on a distro-released kernel
before building an OOT module?

Usually you build an OOT module against /lib/modules/$(uname -r)/build,
and the .config isn't even writable.

> So I think that check is pointless and entirely misleading. It doesn't
> do what you want it to do, and what you claim it does.

It's not a magic bullet, but doesn't it catch the vast majority of use
cases?  Which makes it a lot better than what we have now (nothing).

> I'm not convinced about the whole magic vs minor argument either. The
> whole "new compiler features" thing is a red herring - even if you do
> have new compiler features, that in itself has very little to do with
> whether the resulting object files are compatible or not.

Hm?  Are you saying the check is too strict, since GCC9 binaries _might_
be compatible with GCC10?

-- 
Josh

