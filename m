Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED1C8B487
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 11:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfHMJsH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 13 Aug 2019 05:48:07 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:51515 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726650AbfHMJsH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 05:48:07 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-150-kKZsyMR6MtydRYGBEb95CQ-1; Tue, 13 Aug 2019 10:48:02 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 13 Aug 2019 10:48:01 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 13 Aug 2019 10:48:01 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Joe Perches' <joe@perches.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
CC:     Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: RE: [PATCH v2] kbuild: Change fallthrough comments to attributes
Thread-Topic: [PATCH v2] kbuild: Change fallthrough comments to attributes
Thread-Index: AQHVUaVgEyLklNacm0CAPm1TaF5b6ab40/BA
Date:   Tue, 13 Aug 2019 09:48:01 +0000
Message-ID: <85e25647ae404bf38bc008ea914e08b3@AcuMS.aculab.com>
References: <20190812214711.83710-1-nhuck@google.com>
         <20190812221416.139678-1-nhuck@google.com>
         <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
         <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
         <20190813063327.GA46858@archlinux-threadripper>
 <3078e553a777976655f72718d088791363544caa.camel@perches.com>
In-Reply-To: <3078e553a777976655f72718d088791363544caa.camel@perches.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: kKZsyMR6MtydRYGBEb95CQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Joe Perches
> Sent: 13 August 2019 08:05
...
> The afs ones seem to be because the last comment in the block
> is not the fallthrough, but a description of the next case;
> 
> e.g.: from fs/afs/fsclient.c:
> 
> 		/* extract the volume name */
> 	case 3:
> 		_debug("extract volname");

I'd change those to:
	case 3:  /* extract the volume name */

Then the /* fall through */ would be fine.

The /* FALLTHROUGH */ comment has been valid C syntax (for lint)
for over 40 years.
IMHO since C compilers are now doing all the checks that lint used
to do, it should be using the same syntax.
Both the [[]] and attribute forms look horrid.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

