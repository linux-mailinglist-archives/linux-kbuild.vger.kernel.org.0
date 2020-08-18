Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DF62480FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 10:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgHRI42 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 18 Aug 2020 04:56:28 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:36034 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726581AbgHRI41 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 04:56:27 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-54-fr6a1Gp7PCek2qBtx_YSwg-1; Tue, 18 Aug 2020 09:56:22 +0100
X-MC-Unique: fr6a1Gp7PCek2qBtx_YSwg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 18 Aug 2020 09:56:22 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 18 Aug 2020 09:56:22 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Ingo Molnar' <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Michael Witten <mfwitten@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        "Johannes Weiner" <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        John Levon <john.levon@joyent.com>,
        "John Levon" <levon@movementarian.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
Thread-Topic: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
Thread-Index: AQHWdR7fdrR7Y2b6OUCIIALK0604z6k9jrEQ
Date:   Tue, 18 Aug 2020 08:56:22 +0000
Message-ID: <e986450210154d49aee1a3885d76c862@AcuMS.aculab.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
 <20200816175303.GB1236603@ZenIV.linux.org.uk> <20200817204223.GB12414@amd>
 <87lfid6kpi.fsf@x220.int.ebiederm.org>
 <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
 <20200817220908.GA3701@amd>
 <CAHk-=wh7Rn=8mVi_KWV71ZaQ2HrCz240DbjEJMDdARTwB3CYvA@mail.gmail.com>
 <20200818051717.GA3134537@gmail.com>
In-Reply-To: <20200818051717.GA3134537@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> I'm a big fan of -Wdeclaration-after-statement and I think C++ style
> mixed variables/statements code has several disadvantages:

Agreed.
Personally I think declarations should either be either right
at the top of a function or in a very small code block.

Otherwise they are annoying to find.

You also get very hard to spot bugs unless -Wshadow
is enabled (I can't remember if the linux kernel has
it enabled).

C++ (sort of) has to allow definitions in the middle
of code blocks because it doesn't allow uninitialised
variables - so definitions are best delayed until the
copy-constructor can be used.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

