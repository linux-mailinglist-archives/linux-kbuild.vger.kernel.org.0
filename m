Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC4D3134B2
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 15:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhBHOMd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 09:12:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:40372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232098AbhBHOKK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 09:10:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 312E764E2E;
        Mon,  8 Feb 2021 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612793369;
        bh=pfuX+SzeabT/4QNFzcyDToqBwhJ8kDvzDqbqprBktCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ICxPscZFkIdbaqA030bVRyjK2mIi2htQa+qCk4ekMu9LkQeo7dYvrzmhj+nWhApmg
         ykl2732A3kFCW8scyIudlIbKzvXSaT29U+uEikAeK9akVxBvmiL3hY1I9kvvWnOexR
         xFsuWx9/4FXpNyut/htwfv3hfaWUE808AFi4NaeI=
Date:   Mon, 8 Feb 2021 15:09:26 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Sasha Levin' <sashal@kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
Message-ID: <YCFGFqtr8T4jZWCJ@kroah.com>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-2-sashal@kernel.org>
 <f8aa21157d0848cda0775a174bba05b2@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8aa21157d0848cda0775a174bba05b2@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 08, 2021 at 01:48:06PM +0000, David Laight wrote:
> From: Sasha Levin
> > Sent: 06 February 2021 03:51
> > 
> > Right now if SUBLEVEL becomes larger than 255 it will overflow into the
> > territory of PATCHLEVEL, causing havoc in userspace that tests for
> > specific kernel version.
> > 
> > While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
> > SUBLEVEL at any point as ABI changes don't happen in the context of
> > stable tree.
> > 
> > Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
> > the context of LINUX_VERSION_CODE. This does not affect "make
> > kernelversion" and such.
> > 
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Makefile | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 49ac1b7fe8e99..157be50c691e5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1258,9 +1258,15 @@ define filechk_utsrelease.h
> >  endef
> > 
> >  define filechk_version.h
> > -	echo \#define LINUX_VERSION_CODE $(shell                         \
> > -	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> > -	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> > +	if [ $(SUBLEVEL) -gt 255 ]; then                                 \
> > +		echo \#define LINUX_VERSION_CODE $(shell                 \
> > +		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 255); \
> > +	else                                                             \
> > +		echo \#define LINUX_VERSION_CODE $(shell                 \
> > +		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
> > +	fi;                                                              \
> > +	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> > +	((c) > 255 ? 255 : (c)))'
> >  endef
> 
> Why not use KERNEL_VERSION to define LINUX_VERSION_CODE ?
> Basically just:
> 	echo '#define LINUX_VERSION_CODE KERNEL_VERSION($(VERSION), $(PATCHLEVEL)+0, $(SUBLEVEL)+0)'

Because we are "clamping" LINUX_VERSION_CODE() at a x.y.255, while
KERNEL_VERSION() continues on with the "real" minor number.

thanks,

greg k-h
