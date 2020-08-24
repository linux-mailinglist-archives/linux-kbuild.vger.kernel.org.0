Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537E724F3F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 10:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgHXI0U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 24 Aug 2020 04:26:20 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:43321 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725968AbgHXI0U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 04:26:20 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-280-YmP3yX5pPw6c5HnJR1Czfw-1; Mon, 24 Aug 2020 09:26:14 +0100
X-MC-Unique: YmP3yX5pPw6c5HnJR1Czfw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 24 Aug 2020 09:26:13 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 24 Aug 2020 09:26:13 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nicolas Boichat' <drinkcat@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>
CC:     "dianders@chromium.org" <dianders@chromium.org>,
        "groeck@chromium.org" <groeck@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Will Deacon <will@kernel.org>, Yue Hu <huyue2@yulong.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Thread-Topic: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Thread-Index: AQHWecKchjFb7pHUGUqNEDurUkt7jKlG664w
Date:   Mon, 24 Aug 2020 08:26:13 +0000
Message-ID: <3f84781f12424cbfa552981af42dfaf2@AcuMS.aculab.com>
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
In-Reply-To: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nicolas Boichat
> Sent: 24 August 2020 03:59
> 
> trace_printk is meant as a debugging tool, and should not be
> compiled into production code without specific debug Kconfig
> options enabled, or source code changes, as indicated by the
> warning that shows up on boot if any trace_printk is called:
>  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
>  **                                                      **
>  ** trace_printk() being used. Allocating extra memory.  **
>  **                                                      **
>  ** This means that this is a DEBUG kernel and it is     **
>  ** unsafe for production use.                           **
> 
> If DISALLOW_TRACE_PRINTK=1 is passed on the make command
> line, the kernel will generate a build-time error if
> trace_printk is used. We expect distributors to set this
> option for their production kernels.
> 
> Note that the code to handle trace_printk is still present,
> so this does not prevent people from compiling out-of-tree
> kernel modules, or BPF programs.
> 
> Also, we are not making this a kernel config option as we
> want the developer convenience of being able to reuse a
> production kernel config, add trace_printk for debugging,
> and rebuild, without any config changes.

Since the objective seems to be to ensure there are no
calls to trace_printk() in the git tree, but to allow
them in uncommitted sources. Why not use a config option
and rely on rand-config builds to detect any 'accidental'
commits?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

