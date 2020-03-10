Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A9317F650
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 12:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgCJLbH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 10 Mar 2020 07:31:07 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:50186 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726316AbgCJLbG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 07:31:06 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-4-p-Ri5FvvOWKUDYolSD5F6g-13; Tue, 10 Mar 2020 11:31:02 +0000
X-MC-Unique: p-Ri5FvvOWKUDYolSD5F6g-13
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 10 Mar 2020 11:31:01 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 10 Mar 2020 11:31:01 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nathan Chancellor' <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        stable <stable@vger.kernel.org>
Subject: RE: [PATCH] kbuild: Disable -Wpointer-to-enum-cast
Thread-Topic: [PATCH] kbuild: Disable -Wpointer-to-enum-cast
Thread-Index: AQHV9nra+DJ/Yb9GEECSXKfRu6cHrKhBsStA
Date:   Tue, 10 Mar 2020 11:31:01 +0000
Message-ID: <c2a687d065c1463d8eea9947687b3b05@AcuMS.aculab.com>
References: <20200308073400.23398-1-natechancellor@gmail.com>
 <CAK7LNARcTHpd8fzrAhFVB_AR7NoBgenX64de0eS2uN8g0by9PQ@mail.gmail.com>
 <20200310012545.GA16822@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200310012545.GA16822@ubuntu-m2-xlarge-x86>
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

From: Nathan Chancellor
> Sent: 10 March 2020 01:26
...
> Sure, I can send v2 to do that but I think that sending 97 patches just
> casting the small values (usually less than twenty) to unsigned long
> then to the enum is rather frivolous. I audited at least ten to fifteen
> of these call sites when creating the clang patch and they are all
> basically false positives.

Such casts just make the code hard to read.
If misused casts can hide horrid bugs.
IMHO sprinkling the code with casts just to remove
compiler warnings will bite back one day.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

