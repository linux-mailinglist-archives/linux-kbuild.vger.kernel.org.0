Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFC22137E
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 07:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfEQFhC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 01:37:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbfEQFhC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 01:37:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACC6120848;
        Fri, 17 May 2019 05:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558071421;
        bh=saVFeWx4qKBQbevY5CRLfQRXJKjxHWRxrtd/hzjO1D4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4c09mtGJTXYnEaFeIDfgP9dA0KKnSrinBudtGnmwB/svoRQsge75boD6bBrIm5ln
         pgmKM80pkHOLEgbkdyKyUPl80E503sSa4X7yv8JgWN8Bhqpo7RjA96uhq7R1hFG4Cz
         mPRsyVhA1brGcO2vZm/a8DFMSHfKPrbeRUceJ29g=
Date:   Fri, 17 May 2019 07:36:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
Message-ID: <20190517053658.GA3464@kroah.com>
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAK7LNARvQUPPBzdq7ac67h-xhB6tHZ4WPzBHZy+c3iHE_bi_Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARvQUPPBzdq7ac67h-xhB6tHZ4WPzBHZy+c3iHE_bi_Fg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 01:45:11PM +0900, Masahiro Yamada wrote:
> On Fri, May 17, 2019 at 1:29 PM Masahiro Yamada
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
> > Kbuild has not checked this before, and it suddenly shows up with
> > obscure error message when this kind of race occurs.
> >
> > Non-unique module names cause various sort of problems, but it is
> > not trivial to catch them by eyes.
> >
> > Hence, this script.
> >
> > It checks not only real modules, but also built-in modules (i.e.
> > controlled by tristate CONFIG option, but currently compiled with =y).
> > Non-unique names for built-in modules also cause problems because
> > /sys/modules/ would fall over.
> >
> > I tested allmodconfig on the latest kernel, and it detected the
> > following:
> >
> > warning: same basename if the following are built as modules:
> >   drivers/regulator/88pm800.ko
> >   drivers/mfd/88pm800.ko
> > warning: same basename if the following are built as modules:
> >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> >   drivers/media/i2c/adv7511.ko
> > warning: same basename if the following are built as modules:
> >   drivers/net/phy/asix.ko
> >   drivers/net/usb/asix.ko
> > warning: same basename if the following are built as modules:
> >   fs/coda/coda.ko
> >   drivers/media/platform/coda/coda.ko
> > warning: same basename if the following are built as modules:
> >   drivers/net/phy/realtek.ko
> >   drivers/net/dsa/realtek.ko
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > ---
> 
> 
> One more question popped up.
> 
> External modules are out of scope of the community,
> but it is possible that people create an external module
> that happens to have the same name as an upstream driver.

That is their bug, nothing we can do about that :)

thanks,

greg k-h
