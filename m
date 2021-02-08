Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9893131373C
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 16:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhBHPWO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 8 Feb 2021 10:22:14 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:52964 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231818AbhBHPP7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 10:15:59 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-1-9vquwm_HNUmZehhOQPzyFQ-1;
 Mon, 08 Feb 2021 15:13:59 +0000
X-MC-Unique: 9vquwm_HNUmZehhOQPzyFQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 8 Feb 2021 15:13:56 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 8 Feb 2021 15:13:56 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>
CC:     'Sasha Levin' <sashal@kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: RE: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
Thread-Topic: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
Thread-Index: AQHW/EXgdIIsNPdi4UePFt1m8OJUzKpORpWQgAAI4wCAAA86wA==
Date:   Mon, 8 Feb 2021 15:13:56 +0000
Message-ID: <2c2c207cbece49ea9813e6069b4d73bf@AcuMS.aculab.com>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-2-sashal@kernel.org>
 <f8aa21157d0848cda0775a174bba05b2@AcuMS.aculab.com>
 <YCFGFqtr8T4jZWCJ@kroah.com>
In-Reply-To: <YCFGFqtr8T4jZWCJ@kroah.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: gregkh@linuxfoundation.org
> Sent: 08 February 2021 14:09
> 
> On Mon, Feb 08, 2021 at 01:48:06PM +0000, David Laight wrote:
> > From: Sasha Levin
> > > Sent: 06 February 2021 03:51
> > >
> > > Right now if SUBLEVEL becomes larger than 255 it will overflow into the
> > > territory of PATCHLEVEL, causing havoc in userspace that tests for
> > > specific kernel version.
> > >
> > > While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
> > > SUBLEVEL at any point as ABI changes don't happen in the context of
> > > stable tree.
> > >
> > > Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
> > > the context of LINUX_VERSION_CODE. This does not affect "make
> > > kernelversion" and such.
> > >
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > >  Makefile | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 49ac1b7fe8e99..157be50c691e5 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1258,9 +1258,15 @@ define filechk_utsrelease.h
> > >  endef
> > >
> > >  define filechk_version.h
> > > -	echo \#define LINUX_VERSION_CODE $(shell                         \
> > > -	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> > > -	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> > > +	if [ $(SUBLEVEL) -gt 255 ]; then                                 \
> > > +		echo \#define LINUX_VERSION_CODE $(shell                 \
> > > +		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 255); \
> > > +	else                                                             \
> > > +		echo \#define LINUX_VERSION_CODE $(shell                 \
> > > +		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
> > > +	fi;                                                              \
> > > +	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> > > +	((c) > 255 ? 255 : (c)))'
> > >  endef
> >
> > Why not use KERNEL_VERSION to define LINUX_VERSION_CODE ?
> > Basically just:
> > 	echo '#define LINUX_VERSION_CODE KERNEL_VERSION($(VERSION), $(PATCHLEVEL)+0, $(SUBLEVEL)+0)'
> 
> Because we are "clamping" LINUX_VERSION_CODE() at a x.y.255, while
> KERNEL_VERSION() continues on with the "real" minor number.

That particular patch (which I think Sasha applied) clamps both.

I know you (personally) don't care about OOT mudules, but a lot of
people do.
They will contain comparisons of KERNEL_VERSION against LINUX_VERSION_CODE.
They almost certainly don't care about the SUBLEVEL, but using different
encodings will break things.

The only real saving grace is that OOT modules tend to get built
against distro kernels which are likely to be 4.9.4-123456
so not hit whatever broken mapping you use for LTS kernels.

Another strange set of '#ifs' for new kernels is just part of the job.
It keeps me in work.

For a comparison the same driver object will load into windows 7
(and maybe even vista) and the current windows 10 kernel.
(But getting a windows driver signed is hard work.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

