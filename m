Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112683043BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 17:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404510AbhAZQXv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 26 Jan 2021 11:23:51 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:31343 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404975AbhAZQXt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 11:23:49 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-151-Ju8sTwOHNSCxWvwjAee00g-1; Tue, 26 Jan 2021 16:22:09 +0000
X-MC-Unique: Ju8sTwOHNSCxWvwjAee00g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 26 Jan 2021 16:22:08 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 26 Jan 2021 16:22:08 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Peter Zijlstra' <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
CC:     Greg KH <greg@kroah.com>, Justin Forbes <jforbes@redhat.com>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: RE: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Thread-Topic: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Thread-Index: AQHW8/0BS8d19DyYhUmaAJxxd6lVCKo6FXmA
Date:   Tue, 26 Jan 2021 16:22:08 +0000
Message-ID: <802a01db010d4170998d49c1a17cc783@AcuMS.aculab.com>
References: <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble> <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com> <20210126145155.kcfbnzfqg5qugvcl@treble>
 <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
 <20210126154651.itfrnhwfistia3ss@treble>
 <YBA9r13+1uuyDYuR@hirez.programming.kicks-ass.net>
In-Reply-To: <YBA9r13+1uuyDYuR@hirez.programming.kicks-ass.net>
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

From: Peter Zijlstra <peterz@infradead.org>
> Sent: 26 January 2021 16:05
> 
> On Tue, Jan 26, 2021 at 09:46:51AM -0600, Josh Poimboeuf wrote:
> > On Tue, Jan 26, 2021 at 04:15:37PM +0100, Peter Zijlstra wrote:
> > > On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> > > > User space mixes compiler versions all the time.  The C ABI is stable.
> > > >
> > > > What specifically is the harder issue you're referring to?
> > >
> > > I don't think the C ABI captures nearly enough. Imagine trying to mix a
> > > compiler with and without asm-goto support (ok, we fail to build without
> > > by now, but just imagine).
> > >
> > > No C ABI violated, but having that GCC extention vs not having it
> > > radically changes the kernel ABI.
> > >
> > > I think I'm with Greg here, just don't do it.
> >
> > Ok, thank you for an actual example.  asm goto is a good one.
> >
> > But it's not a cut-and-dry issue.  Otherwise how could modversions
> > possibly work?
> >
> > So yes, we should enforce GCC versions, but I still haven't seen a
> > reason it should be more than just "same compiler and *major* version".
> 
> Why bother? rebuilding the kernel and all modules is a matter of 10
> minutes at most on a decently beefy build box.
> 
> What actual problem are we trying to solve here?

People build modules to load into disrto-provided kernels.

I'd have though the compiler would need to support the same options
as that used to build the kernel - but not necessarily be exactly
the same version.

Ignoring compiler bugs (which will bight you if the compiler you
have is broken) then a newer compiler ought to be fine.
Or a kernel might have been built with config options that don't
require features of the compiler being used - so that modules can
be built with an older compiler.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

