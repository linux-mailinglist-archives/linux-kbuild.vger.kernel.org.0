Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048B81D67F9
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 14:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgEQMeV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sun, 17 May 2020 08:34:21 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:24683 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727893AbgEQMeV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 08:34:21 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-77-e_XcCBs3NxeTTdl9ilXcdg-1; Sun, 17 May 2020 13:33:14 +0100
X-MC-Unique: e_XcCBs3NxeTTdl9ilXcdg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sun, 17 May 2020 13:33:14 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Sun, 17 May 2020 13:33:14 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
CC:     Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Thread-Topic: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Thread-Index: AQHWLDCKQVfb3e05HkmP445tLCctkqisNZ6A
Date:   Sun, 17 May 2020 12:33:13 +0000
Message-ID: <fe378a92bba24164a4f901902ab06820@AcuMS.aculab.com>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-10-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-10-masahiroy@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada
> Sent: 17 May 2020 10:49
> $(firstword ...) in scripts/Makefile.modpost was added by commit
> 3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
> to build multiple external module directories.
> 
> This feature has been broken for a while. Remove the bitrotten code, and
> stop parsing if M or KBUILD_EXTMOD contains multiple words.

ISTR that one of the kernel documentation files says that it is possible
to build multiple modules together in order to avoid 'faffing' with
exported symbol lists.

So the docs need updating to match.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

