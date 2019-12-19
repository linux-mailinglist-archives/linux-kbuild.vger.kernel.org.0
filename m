Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04C0125E0D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 10:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfLSJtI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 04:49:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37602 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLSJtI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 04:49:08 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so5502873lja.4;
        Thu, 19 Dec 2019 01:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZjgDeshjeiNQm7U2IpWlnWn/GpLHmcq5Ng4N0RI+hO8=;
        b=udyjswlzrxiUIOp68/+yhqYl1HMspJgplTMw7wlV4tqSYpSUaNdO+DjXQoD0Lofpj1
         GqIBUB1xfA7epXZCQM96pJ3pMDvNOxNS1GZeRymBXfKWg/J4XvZwJgsmxMKBPSqtj65V
         rzFStUubgjlgPhIEjel/E2xWcS2Hx/DlVB4TId6c5gxasUr6Yb8nWSHjUrSThQZp0knj
         SsI710IVReclOi8eG5JoQgAhZKvI2gfXH5O2X4Y+RgHv8pSvwfsrkPYITE5oeWLutaO+
         Sq11ay4leBu3PUDfSBBE1L5FLs1AABaxiaqmQk+SgrLh+NS3Xn0lK7f+BY5KSbtPXmE7
         AtCQ==
X-Gm-Message-State: APjAAAVmmzhkNXEVIFlQ2ciMF8VoQQOBJYXGQpKkGyo1yIbuXnZLp4el
        QG97SzC+zrf2umRVhhUiU1o=
X-Google-Smtp-Source: APXvYqxLP93hcgwGaARbYpfHGfs84f8VXAhmPaqSxR5gy3xFKIp28pllD2Eav4/aLA4gQno70JWQfA==
X-Received: by 2002:a2e:a361:: with SMTP id i1mr5053198ljn.29.1576748945700;
        Thu, 19 Dec 2019 01:49:05 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id q27sm2423048ljm.25.2019.12.19.01.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:49:04 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ihsQX-00048r-9A; Thu, 19 Dec 2019 10:49:01 +0100
Date:   Thu, 19 Dec 2019 10:49:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        kbuild test robot <lkp@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: kbuild obj-m directory descend (was: Re: [PATCH] serdev: fix
 builds with CONFIG_SERIAL_DEV_BUS=m)
Message-ID: <20191219094901.GR22665@localhost>
References: <201912181000.82Z7czbN%lkp@intel.com>
 <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
 <20191218172353.GO22665@localhost>
 <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
 <20191219081814.GP22665@localhost>
 <CAK7LNASHZ9HsYj+sncDqOBWRV+YoFNTciKOxfeYrA7MtBJ9T7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASHZ9HsYj+sncDqOBWRV+YoFNTciKOxfeYrA7MtBJ9T7A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 05:55:54PM +0900, Masahiro Yamada wrote:
> On Thu, Dec 19, 2019 at 5:18 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Thu, Dec 19, 2019 at 11:00:15AM +0900, Masahiro Yamada wrote:
> > > Hi.
> > >
> > > On Thu, Dec 19, 2019 at 2:23 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > > > The offending patch is broken since it effectively makes
> > > > CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reason
> > > > those symbols do not end up in vmlinux (despite being compiled) when you
> > > > add a built-in object goal under a directory that was entered using
> > > > obj-m.
> > > >
> > > > That seems like a bug to me and contradicts the kbuild documentation
> > > > (3.6):
> > > >
> > > >         Example:
> > > >
> > > >         #fs/Makefile
> > > >         obj-$(CONFIG_EXT2_FS) += ext2/
> > > >
> > > >         If CONFIG_EXT2_FS is set to either ‘y’ (built-in) or ‘m’
> > > >         (modular) the corresponding obj- variable will be set, and
> > > >         kbuild will descend down in the ext2 directory. Kbuild only uses
> > > >         this information to decide that it needs to visit the directory,
> > > >         it is the Makefile in the subdirectory that specifies what is
> > > >         modular and what is built-in.
> > > >
> > > > I tried adding other targets to obj-y directly and they are also are not
> > > > included, seemingly since the directory was entered using obj-m.
> > > >
> > > > Masahiro or Michal, can you shed some light?
> >
> > > I saw similar questions in ML in the past.
> > > Yes, this is how Kbuild works;
> > > Kbuild only links objects in Makefiles visited by obj-y.
> > >
> > > If you use
> > >     obj-m += serdev/
> > > all objects in serdev/ are considered as modular.
> >
> > Well, any objects in serdev/ specified in obj-y would currently be built
> > but never included in either built-in.a or any module.
> 
> Right.
> 
> > > I think it is better to make the document
> > > clarify this.
> >
> > Yeah, I don't have a use case for this, but the documentation would need
> > to be updated to not have more people look into this.
> >
> > And at least this behaviour allowed us to catch this bug, but only
> > because we had dependent modules that failed to build. I see now that
> > you posted a patch adding a general warning about obj-y under obj-m last
> > fall, but that was apparently never merged.
> 
> This one?
> 
> https://lore.kernel.org/patchwork/patch/1126959/

Yep, that's the one I meant.
 
> This patch detected several Makefile/Kconfig bugs,
> and it is good.
> 
> But, it also turned out to cause false positive warnings
> on some architectures.
> I thought it was not so easy to fix it.
> So, I decided to postpone it.

Ok.

> > But when was this behaviour changed? And was that done on purpose?
> 
> No. Not changed at all.
> 
> In my understanding, the current behavior has been kept
> from the beginning.

Ok, thanks for confirming. The contradicting documentation I refer to
above has been there since before git at least however.

Here's a random example of someone being bit by this five years ago:

	https://www.spinics.net/lists/linux-kbuild/msg10887.html

Would you mind taking a stab at updating the docs?

Johan
