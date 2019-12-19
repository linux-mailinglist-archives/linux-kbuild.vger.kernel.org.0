Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B818D125C77
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 09:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLSISV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 03:18:21 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35503 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLSISU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 03:18:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so3710764lfr.2;
        Thu, 19 Dec 2019 00:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lyRx4LhgT45X7mR4qaC6NB0RAe9XsPHCBgrwE/KgqOw=;
        b=MItNcs6ekz4Yu/YdXKvMt2RgHOg8Yk2x2RsADK2l/1WgfNaw4BQT9CVXVZ0zoYhaGu
         /D9nCrHIJj1oLVUK7e2xrbOhNuicUtCva5j1LLWf811BDB+etJ5nIEuDsLwbbjviicmt
         kqP2vJ6sYft+jZXlhf3K+NkEiNXaBI/TlB8daSQvvv3NcDjXrbsChH79r9qCwIfyM874
         4TzpLsQwW6aXHidU9Us9+ot/qnS3KP0EDqZ1TONfm7GabVd1WxlqXqwUQNuamEPKQxpy
         DFIiXev11M2rhGt+A9hSeKUFGgu9LMDAYR4mOsGXgQdndX5HgnPOAVNZNqJR4WtyRB7N
         damg==
X-Gm-Message-State: APjAAAWd/1SKJsRIo7uQEh3J4o+va2waLOu31wdM36IKIoJWAhrLk5WC
        FeQUFbznwCUvsgH6K2jYk3E=
X-Google-Smtp-Source: APXvYqwt1Uhyezg2/wwiQ1u+1vKKuE4R+kFpQJA9QKAFB+ocPpQgLulCZVV8HI2dV4nKMf8Bqjx/3g==
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr4644623lfg.34.1576743498552;
        Thu, 19 Dec 2019 00:18:18 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id s22sm2390789ljm.41.2019.12.19.00.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 00:18:17 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ihr0g-0003mF-2w; Thu, 19 Dec 2019 09:18:14 +0100
Date:   Thu, 19 Dec 2019 09:18:14 +0100
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
Message-ID: <20191219081814.GP22665@localhost>
References: <201912181000.82Z7czbN%lkp@intel.com>
 <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
 <20191218172353.GO22665@localhost>
 <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 11:00:15AM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Thu, Dec 19, 2019 at 2:23 AM Johan Hovold <johan@kernel.org> wrote:

> > The offending patch is broken since it effectively makes
> > CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reason
> > those symbols do not end up in vmlinux (despite being compiled) when you
> > add a built-in object goal under a directory that was entered using
> > obj-m.
> >
> > That seems like a bug to me and contradicts the kbuild documentation
> > (3.6):
> >
> >         Example:
> >
> >         #fs/Makefile
> >         obj-$(CONFIG_EXT2_FS) += ext2/
> >
> >         If CONFIG_EXT2_FS is set to either ‘y’ (built-in) or ‘m’
> >         (modular) the corresponding obj- variable will be set, and
> >         kbuild will descend down in the ext2 directory. Kbuild only uses
> >         this information to decide that it needs to visit the directory,
> >         it is the Makefile in the subdirectory that specifies what is
> >         modular and what is built-in.
> >
> > I tried adding other targets to obj-y directly and they are also are not
> > included, seemingly since the directory was entered using obj-m.
> >
> > Masahiro or Michal, can you shed some light?

> I saw similar questions in ML in the past.
> Yes, this is how Kbuild works;
> Kbuild only links objects in Makefiles visited by obj-y.
> 
> If you use
>     obj-m += serdev/
> all objects in serdev/ are considered as modular.

Well, any objects in serdev/ specified in obj-y would currently be built
but never included in either built-in.a or any module.

> I think it is better to make the document
> clarify this.

Yeah, I don't have a use case for this, but the documentation would need
to be updated to not have more people look into this.

And at least this behaviour allowed us to catch this bug, but only
because we had dependent modules that failed to build. I see now that
you posted a patch adding a general warning about obj-y under obj-m last
fall, but that was apparently never merged.

But when was this behaviour changed? And was that done on purpose?

Johan
