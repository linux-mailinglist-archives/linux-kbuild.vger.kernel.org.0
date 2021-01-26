Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85FE3046A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 19:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391234AbhAZRWN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 12:22:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:46054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389720AbhAZIN7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 03:13:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DE99206FB;
        Tue, 26 Jan 2021 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611648782;
        bh=HQ0RvmxJxs52CqdTiUiI0CR2mcbWiihq3JryBJZLrgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NQ1PUXcHuAWiJhA0GR+IcS5bWeIN22E/hpxGEqZ1t8QIXTk9jX9dbLsau/njWNbma
         9fkSRxah2ekblIdZmUmbVWJhaKHX7cZOM8eBgPvXSv5jS7il/LiuLmhzyMQn7xjJNv
         J4qlnwA2rfWlSjHbmM3YAIpwOrvx3RE/UvNFFsd8=
Date:   Tue, 26 Jan 2021 09:12:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <YA/PC/qAAmzfI2GE@kroah.com>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125212755.jfwlqogpcarmxdgt@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 25, 2021 at 03:27:55PM -0600, Josh Poimboeuf wrote:
> On Tue, Jan 26, 2021 at 06:16:01AM +0900, Masahiro Yamada wrote:
> > On Tue, Jan 26, 2021 at 5:42 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > >
> > > When building out-of-tree kernel modules, the build system doesn't
> > > require the GCC version to match the version used to build the original
> > > kernel.  That's probably [1] fine.
> > >
> > > In fact, for many distros, the version of GCC used to build the latest
> > > kernel doesn't necessarily match the latest released GCC, so a GCC
> > > mismatch turns out to be pretty common.  And with CONFIG_MODVERSIONS
> > > it's probably more common.
> > >
> > > So a lot of users have come to rely on being able to use a different
> > > version of GCC when building OOT modules.
> > >
> > > But with GCC plugins enabled, that's no longer allowed:
> > >
> > >   cc1: error: incompatible gcc/plugin versions
> > >   cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so
> > >
> > > That error comes from the plugin's call to
> > > plugin_default_version_check(), which strictly enforces the GCC version.
> > > The strict check makes sense, because there's nothing to prevent the GCC
> > > plugin ABI from changing -- and it often does.
> > >
> > > But failing the build isn't necessary.  For most plugins, OOT modules
> > > will otherwise work just fine without the plugin instrumentation.
> > >
> > > When a GCC version mismatch is detected, print a warning and disable the
> > > plugin.  The only exception is the RANDSTRUCT plugin which needs all
> > > code to see the same struct layouts.  In that case print an error.
> > >
> > > [1] Ignoring, for the moment, that the kernel now has
> > >     toolchain-dependent kconfig options, which can silently disable
> > >     features and cause havoc when compiler versions differ, or even when
> > >     certain libraries are missing.  This is a separate problem which
> > >     also needs to be addressed.
> > >
> > > Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > > ---
> > 
> > 
> > We are based on the assumption that we use the same
> > compiler for in-tree and out-of-tree.
> 
> Sorry, but that assumption isn't based in reality.  And it's not
> enforced.

It's "enforced" in that if something breaks because of this, no one will
support it :)

We have always said, "all kernel code must be built with the exact same
compiler and with the same build options".  Anyone who does anything
different, is on their own.  So please, let's not change things to make
it as of this might work to hide real problems that are known to show up
when people mix/match compilers with modules.

thanks,

greg k-h
