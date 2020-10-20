Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6DD29414C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Oct 2020 19:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390715AbgJTRVX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Oct 2020 13:21:23 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43467 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730683AbgJTRVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Oct 2020 13:21:22 -0400
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DC542C0006;
        Tue, 20 Oct 2020 17:21:18 +0000 (UTC)
Date:   Tue, 20 Oct 2020 10:21:15 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: "make bindeb-pkg" fails with CONFIG_MODULES disabled
Message-ID: <20201020172115.GA135202@localhost>
References: <20200925222934.GA126388@localhost>
 <CAK7LNAR5ArP8RGHHOXAauTvXcQgvstP=Ydh8Nc+Kv-0NYhhP2g@mail.gmail.com>
 <20200926084519.GA8344@localhost>
 <CAK7LNATJZJyMBLkXbCib1B0uZ2qgNyAVkCfA4x=oR8ww73F9jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATJZJyMBLkXbCib1B0uZ2qgNyAVkCfA4x=oR8ww73F9jw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 14, 2020 at 01:48:28AM +0900, Masahiro Yamada wrote:
> On Sat, Sep 26, 2020 at 5:45 PM Josh Triplett <josh@joshtriplett.org> wrote:
> >
> > On Sat, Sep 26, 2020 at 02:45:38PM +0900, Masahiro Yamada wrote:
> > > On Sat, Sep 26, 2020 at 7:29 AM Josh Triplett <josh@joshtriplett.org> wrote:
> > > >
> > > > With CONFIG_MODULES disabled, "make bindeb-pkg" fails in
> > > > scripts/package/builddeb with:
> > > >
> > > > find: ‘Module.symvers’: No such file or directory
> > > >
> > > > The deploy_kernel_headers function in scripts/package/builddeb calls:
> > > >
> > > > find arch/$SRCARCH/include Module.symvers include scripts -type f
> > > >
> > > > But find errors out if any of its command-line arguments doesn't exist.
> > > >
> > > > This could be fixed by checking whether that file exists first, but if
> > > > CONFIG_MODULES is disabled, it doesn't really make sense to build the
> > > > linux-headers package at all. Perhaps that whole package could be
> > > > disabled when modules are disabled?
> > >
> > > I agree.
> > >
> > >
> > > How about something like the following?
> >
> > That looks good to me.
> >
> > (It would be nice, as well, to have some conditional wrapped around the
> > linux-libc-dev package. I had a patch for that a while ago at
> > https://lore.kernel.org/lkml/b45738b05bb396e175a36f67b02fa01de4c7472f.1583912084.git.josh@joshtriplett.org/
> > , but that's probably not the ideal way to do it. I'd love to see a way
> > to disable that extra deb, though, as it adds time to the deb build
> > process for a package that most people looking to build a deb won't
> > need or install.)
> 
> I am skeptical about this approach.
> 
> 
> I think the ideal way would be
> to support individual binary package build in dpkg-buildpackage.
> 
> I do not know if it has been already achieved, or
> it is a planned feature.

Given the way Debian packages are built, that's not really an option.
There are targets in debian/rules to build arch-specific and
arch-independent packages, but not targets to build individual binary
packages.

Are you more concerned about avoiding the code conditionally generating
the control file, or about avoiding the code that has to pass the
controlling environment variable down through build steps?
