Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D74FE35B
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 17:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfKOQva convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Fri, 15 Nov 2019 11:51:30 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:59274 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727559AbfKOQva (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 11:51:30 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-28-JYU6DzG4PJauNrdBTvHnwQ-1; Fri, 15 Nov 2019 16:51:25 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 15 Nov 2019 16:51:24 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 15 Nov 2019 16:51:24 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Shile Zhang' <shile.zhang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>
CC:     "H . Peter Anvin" <hpa@zytor.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: RE: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
Thread-Topic: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
Thread-Index: AQHVm4CqL2sS2uy4n0+BG1AUQK0Os6eMck/g
Date:   Fri, 15 Nov 2019 16:51:24 +0000
Message-ID: <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
In-Reply-To: <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: JYU6DzG4PJauNrdBTvHnwQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Shile Zhang
> Sent: 15 November 2019 06:48
...
>  arch/x86/kernel/unwind_orc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index 332ae6530fa8..280da6fa9922 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -273,9 +273,11 @@ void __init unwind_init(void)
>  		return;
>  	}
> 
> -	/* Sort the .orc_unwind and .orc_unwind_ip tables: */
> -	sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
> -	     orc_sort_swap);
> +	/*
> +	 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
> +	 * vmlinux link phase by sorttable tool at build time.
> +	 * Its ready for binary search now.
> +	 */

How fast is sort() if the table is sorted?
Relying on the kernel sources and build scripts always being in sync seems dangerous.
Probably better to leave the sort in for a release of two.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

