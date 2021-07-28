Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459923D87E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jul 2021 08:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhG1G1z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Jul 2021 02:27:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233949AbhG1G1y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jul 2021 02:27:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7694560F9B;
        Wed, 28 Jul 2021 06:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627453673;
        bh=axAytxu0yowkL8okhc9sDtY44R3JVEYci6IiSE5czns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HvmIlwAJ/t/pxAr1FIf/7z2/TDgGEQkagTiGcUAzwKrGfzWSlg1q9nqU1mHmLOloN
         E/fU71tiXpJGF2exxglmyV4jq59+IGwxYqxM8uNl8h+qpTklQMXYppVqMbV9uX7SC7
         DZzwTzuOosqcuC6ml24IKrbIjyYV0n8taZ41+P24=
Date:   Wed, 28 Jul 2021 08:27:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] scripts: make some scripts executable
Message-ID: <YQD45STjL160RnzR@kroah.com>
References: <20210727153924.79473-1-masahiroy@kernel.org>
 <YQAsth0TA3AwtxvK@kroah.com>
 <CAK7LNAQM2WzfHdJhukiaeq=qYtJ7U8UbMZdFWSuAJG86bBVHnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQM2WzfHdJhukiaeq=qYtJ7U8UbMZdFWSuAJG86bBVHnA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 10:03:56AM +0900, Masahiro Yamada wrote:
> On Wed, Jul 28, 2021 at 12:56 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 28, 2021 at 12:39:24AM +0900, Masahiro Yamada wrote:
> > > Set the x bit to some scripts to make them directly executable.
> > >
> > > Especially, scripts/checkdeclares.pl is not hooked by anyone.
> > > It should be executable since it is tedious to type
> > > 'perl scripts/checkdeclares.pl'.
> > >
> > > The original patch [1] set the x bit properly, but it was lost when
> > > it was merged as commit 21917bded72c ("scripts: a new script for
> > > checking duplicate struct declaration").
> > >
> > > [1] https://lore.kernel.org/lkml/20210401110943.1010796-1-wanjiabing@vivo.com/
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/checkdeclares.pl               | 0
> > >  scripts/gcc-plugins/gen-random-seed.sh | 0
> > >  scripts/syscallnr.sh                   | 0
> > >  scripts/xen-hypercalls.sh              | 0
> > >  4 files changed, 0 insertions(+), 0 deletions(-)
> > >  mode change 100644 => 100755 scripts/checkdeclares.pl
> > >  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
> > >  mode change 100644 => 100755 scripts/syscallnr.sh
> > >  mode change 100644 => 100755 scripts/xen-hypercalls.sh
> >
> > Please no, as other tools (i.e. patch), can not set mode bits, and some
> > people still rely on patch in places.
> >
> > If these need to be called by other parts of the build, we should
> > execute them properly, not rely on the mode settings.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> I believe tools should be executable.
> 
> If the x bit were missing in scripts/checkpatch.pl
> for example, we would need to run 'perl scripts/checkpatch.pl'
> instead of 'scripts/checkpatch.pl'. That is annoying.
> 
> 
> Most of the scripts under the scripts/ directory
> are already executable, and we rely on that fact.
> Some of them are run directly, and I do not hear
> from anyone who complains about that.

Ok, fair enough, I just run into problems when dealing with this with
backports to stable trees, and I know Andrew has also had problems when
dealing with patches like this.

> BTW, my 'patch' command on Ubuntu can handle the
> x bit.  Doesn't it work on your 'patch' ?

Somehow quilt can not handle it, I do not know if that is a problem with
patch not knowing how to read the git-generated-patch or not, but we
have had issues in the past here.

thanks,

greg k-h
