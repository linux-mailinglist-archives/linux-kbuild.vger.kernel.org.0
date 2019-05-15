Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3909F1E9E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 10:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfEOIOZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 04:14:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfEOIOZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 04:14:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D218620862;
        Wed, 15 May 2019 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557908064;
        bh=GRT/jLNPQVryXaf71VKkI7ShZUT/dxnCTpWIhHaxcmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A6UrR7LBqScO0/79+lSEsYyUVF1N2tuDZfT5Z5cO15m2/apXOPYWYZxZYzJwLxGEQ
         tBF/TW96dblCBm4U6SkW1bf6s4BcSwobKmIKsDrIsj8ZayUYHqiJAhnGd7GS9qd1Rf
         sogw6LyjkUf4HIK+hcuxFSnXo8AO5VaZIc0ryXi8=
Date:   Wed, 15 May 2019 10:14:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Message-ID: <20190515081422.GA22750@kroah.com>
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK8P3a1y7hxME0me_Zu-F8a8jU6n=T+c32mv83utOtsL-+gc0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1y7hxME0me_Zu-F8a8jU6n=T+c32mv83utOtsL-+gc0A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 15, 2019 at 10:08:12AM +0200, Arnd Bergmann wrote:
> On Wed, May 15, 2019 at 9:39 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > In the recent build test of linux-next, Stephen saw a build error
> > caused by a broken .tmp_versions/*.mod file:
> >
> >   https://lkml.org/lkml/2019/5/13/991
> >
> > drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> > basename, and there is a race in generating .tmp_versions/asix.mod
> >
> > Kbuild has not checked this before, and it occasionally shows up with
> > obscure error message when this kind of race occurs.
> >
> > It is not trivial to catch this potential issue by eyes.
> >
> > Hence, this script.
> >
> > I compile-tested allmodconfig for the latest kernel as of writing,
> > it detected the following:
> >
> > warning: same basename '88pm800.ko' if the following are built as modules:
> >   drivers/regulator/88pm800.ko
> >   drivers/mfd/88pm800.ko
> > warning: same basename 'adv7511.ko' if the following are built as modules:
> >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> >   drivers/media/i2c/adv7511.ko
> > warning: same basename 'asix.ko' if the following are built as modules:
> >   drivers/net/phy/asix.ko
> >   drivers/net/usb/asix.ko
> > warning: same basename 'coda.ko' if the following are built as modules:
> >   fs/coda/coda.ko
> >   drivers/media/platform/coda/coda.ko
> > warning: same basename 'realtek.ko' if the following are built as modules:
> >   drivers/net/phy/realtek.ko
> >   drivers/net/dsa/realtek.ko
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> That looks great!
> 
> > ---
> >
> >  [Alternative fix ? ]
> >
> > I do not know about the user experience of modprobe etc.
> > when two different modules have the same name.
> > It does not matter if this is correctly handled by modules.order?
> >
> > If this is just a problem of the build system, it is pretty easy to fix.
> > For example, if we prepend the directory path, parallel build will
> > never write to the same file simultanously.
> >
> >   asix.mod -> drivers/net/phy/asix.mod
> >   asix.mod -> drivers/net/usb/asix.mod
> 
> non-unique module names cause all kinds of problems, and
> modprobe can certainly not handle them correctly, and there
> are issues with symbols exported from a module when another
> one has the same name.

/sys/modules/ will fall over when this happens as well.  I thought we
had the "rule" that module names had to be unique, I guess it was only a
matter of time before they started colliding :(

So warning is good, but forbidding this is better, as things will break.

Or we need to fix up the places where things will break.

thanks,

greg k-h
