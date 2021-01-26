Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD373040F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 15:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731223AbhAZOxd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 09:53:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56621 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391262AbhAZOxa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 09:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611672722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JYmGL08JF+gArRQ9p5k0wHfnv2GHvkk5CmReF6hsoP4=;
        b=gLTsYT5tXl7cYR3lptw28rmQghstxPXNbKb6TxqKx4rX+6PeE7GaYPE1j4akkEB37bZ9nv
        V/w19cxO6C4FyPS+k1NpIwTcrm1lxj/+gxyWXJOfteXNcXR4ZbWhr+1coV81VZBcfUOCya
        DBiUM/vGmThwe7KO5eWLJAmPWN6nr/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-Fy7Ek9dBP26p1I4vvyZkDg-1; Tue, 26 Jan 2021 09:52:00 -0500
X-MC-Unique: Fy7Ek9dBP26p1I4vvyZkDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63A515722;
        Tue, 26 Jan 2021 14:51:58 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 79B3260CD1;
        Tue, 26 Jan 2021 14:51:57 +0000 (UTC)
Date:   Tue, 26 Jan 2021 08:51:55 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Greg KH <greg@kroah.com>
Cc:     Justin Forbes <jforbes@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210126145155.kcfbnzfqg5qugvcl@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YBAeYaDReAc9VscA@kroah.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 02:51:29PM +0100, Greg KH wrote:
> On Tue, Jan 26, 2021 at 06:44:44AM -0600, Justin Forbes wrote:
> > On Tue, Jan 26, 2021 at 2:21 AM Greg KH <greg@kroah.com> wrote:
> > >
> > > On Mon, Jan 25, 2021 at 04:07:57PM -0600, Josh Poimboeuf wrote:
> > > > On Tue, Jan 26, 2021 at 06:44:35AM +0900, Masahiro Yamada wrote:
> > > > > > > If people use a different compiler, they must be
> > > > > > > prepared for any possible problem.
> > > > > > >
> > > > > > > Using different compiler flags for in-tree and out-of-tree
> > > > > > > is even more dangerous.
> > > > > > >
> > > > > > > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > > > > > > for in-tree build, and then disabled for out-of-tree modules,
> > > > > > > the struct layout will mismatch, won't it?
> > > > > >
> > > > > > If you read the patch you'll notice that it handles that case, when it's
> > > > > > caused by GCC mismatch.
> > > > > >
> > > > > > However, as alluded to in the [1] footnote, it doesn't handle the case
> > > > > > where the OOT build system doesn't have gcc-plugin-devel installed.
> > > > > > Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> > > > > > succeeds!  That happens even without a GCC mismatch.
> > > > >
> > > > >
> > > > > Ah, sorry.
> > > > >
> > > > > I responded too early before reading the patch fully.
> > > > >
> > > > > But, I do not like to make RANDSTRUCT a special case.
> > > > >
> > > > > I'd rather want to stop building for any plugin.
> > > >
> > > > Other than RANDSTRUCT there doesn't seem to be any problem with
> > > > disabling them (and printing a warning) in the OOT build.  Why not give
> > > > users that option?  It's harmless, and will make distro's (and their
> > > > users') lives easier.
> > > >
> > > > Either GCC mismatch is ok, or it's not.  Let's not half-enforce it.
> > >
> > > As I said earlier, it's not ok, we can not support it at all.
> > >
> > 
> > Support and enforce are 2 completely different things.  To shed a bit
> > more light on this, the real issue that prompted this was breaking CI
> > systems.  As we enabled gcc plugins in Fedora, and the toolchain folks
> > went through 3 different snapshots of gcc 11 in a week. Any CI process
> > that built an out of tree module failed. I don't think this is nearly
> > as much of a concern for stable distros, as it is for CI in
> > development cycles.
> 
> It's better to have an obvious break like this than to silently accept
> things and then have a much harder issue to debug at runtime, right?

User space mixes compiler versions all the time.  The C ABI is stable.

What specifically is the harder issue you're referring to?

-- 
Josh

