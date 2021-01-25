Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E311302DB7
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 22:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732649AbhAYV3q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 16:29:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59847 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732361AbhAYV3a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 16:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611610081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=j5BAnkcKu0iXTsZM9+PxuOLyHl8DKz/n3Sg7EK2+zzU=;
        b=Te3H9W+vVYEa36AC/0Rz3bGa1QsXR8JCD7qhhyGC2734gw06vfgQKI00X4j4UtCsv/78YK
        la4R0qh6gVaXFK/ah3qPvw+yL414PMbMzvxXeCiMM60AU+liMChA60NF8zlmvft8KpVKGw
        Zh67xuR5EqcqUWSHG3FpmfIWCuAdmro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-ufg7fRfAMkqDK9Jy7oZDEQ-1; Mon, 25 Jan 2021 16:27:59 -0500
X-MC-Unique: ufg7fRfAMkqDK9Jy7oZDEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6649B18C89CF;
        Mon, 25 Jan 2021 21:27:58 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BC260938;
        Mon, 25 Jan 2021 21:27:57 +0000 (UTC)
Date:   Mon, 25 Jan 2021 15:27:55 -0600
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
Message-ID: <20210125212755.jfwlqogpcarmxdgt@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 06:16:01AM +0900, Masahiro Yamada wrote:
> On Tue, Jan 26, 2021 at 5:42 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > When building out-of-tree kernel modules, the build system doesn't
> > require the GCC version to match the version used to build the original
> > kernel.  That's probably [1] fine.
> >
> > In fact, for many distros, the version of GCC used to build the latest
> > kernel doesn't necessarily match the latest released GCC, so a GCC
> > mismatch turns out to be pretty common.  And with CONFIG_MODVERSIONS
> > it's probably more common.
> >
> > So a lot of users have come to rely on being able to use a different
> > version of GCC when building OOT modules.
> >
> > But with GCC plugins enabled, that's no longer allowed:
> >
> >   cc1: error: incompatible gcc/plugin versions
> >   cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so
> >
> > That error comes from the plugin's call to
> > plugin_default_version_check(), which strictly enforces the GCC version.
> > The strict check makes sense, because there's nothing to prevent the GCC
> > plugin ABI from changing -- and it often does.
> >
> > But failing the build isn't necessary.  For most plugins, OOT modules
> > will otherwise work just fine without the plugin instrumentation.
> >
> > When a GCC version mismatch is detected, print a warning and disable the
> > plugin.  The only exception is the RANDSTRUCT plugin which needs all
> > code to see the same struct layouts.  In that case print an error.
> >
> > [1] Ignoring, for the moment, that the kernel now has
> >     toolchain-dependent kconfig options, which can silently disable
> >     features and cause havoc when compiler versions differ, or even when
> >     certain libraries are missing.  This is a separate problem which
> >     also needs to be addressed.
> >
> > Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
> > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > ---
> 
> 
> We are based on the assumption that we use the same
> compiler for in-tree and out-of-tree.

Sorry, but that assumption isn't based in reality.  And it's not
enforced.

> If people use a different compiler, they must be
> prepared for any possible problem.
>
> Using different compiler flags for in-tree and out-of-tree
> is even more dangerous.
> 
> For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> for in-tree build, and then disabled for out-of-tree modules,
> the struct layout will mismatch, won't it?

If you read the patch you'll notice that it handles that case, when it's
caused by GCC mismatch.

However, as alluded to in the [1] footnote, it doesn't handle the case
where the OOT build system doesn't have gcc-plugin-devel installed.
Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
succeeds!  That happens even without a GCC mismatch.

> This patch is ugly, and not doing the right thing.

Maybe, but I doubt the solution is to make assumptions.

-- 
Josh

