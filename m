Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EA83286CB
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Mar 2021 18:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbhCARPG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 1 Mar 2021 12:15:06 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:41276 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237566AbhCARMZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 12:12:25 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-272-GvFi4ZV3PGyydurjz5eoxA-1; Mon, 01 Mar 2021 17:10:39 +0000
X-MC-Unique: GvFi4ZV3PGyydurjz5eoxA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 1 Mar 2021 17:10:39 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 1 Mar 2021 17:10:39 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Christian Zigotzky <chzigotzky@xenosoft.de>
CC:     Sasha Levin <sashal@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] kbuild: Fix <linux/version.h> for empty SUBLEVEL or
 PATCHLEVEL again
Thread-Topic: [PATCH] kbuild: Fix <linux/version.h> for empty SUBLEVEL or
 PATCHLEVEL again
Thread-Index: AQHXDRQhwqNXEZip6k6FhC5f09+yOapvX7Rg
Date:   Mon, 1 Mar 2021 17:10:39 +0000
Message-ID: <43d9bcb59bdc4ac7aa42de1be78fa339@AcuMS.aculab.com>
References: <20210227142023.63480-1-masahiroy@kernel.org>
In-Reply-To: <20210227142023.63480-1-masahiroy@kernel.org>
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

From: Masahiro Yamada
> Sent: 27 February 2021 14:20
> 
> Commit 9b82f13e7ef3 ("kbuild: clamp SUBLEVEL to 255") breaks the build
> if SUBLEVEL or PATCHLEVEL is empty.
> 
> Commit 78d3bb4483ba ("kbuild: Fix <linux/version.h> for empty SUBLEVEL
> or PATCHLEVEL") fixed the issue by prepending a zero.
> 
> This time, we cannot take the same approach because we have C code:
> 
>   #define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL)
>   #define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
> 
> Replace empty SUBLEVEL or PATCHLEVEL with a zero.

You could do:

#define LINUX_VERSION_PATCHLEVEL ($(PATCHLEVEL) + 0)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

