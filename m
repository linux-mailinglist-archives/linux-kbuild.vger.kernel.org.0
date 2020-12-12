Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA9E2D8A35
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 22:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395521AbgLLVtT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sat, 12 Dec 2020 16:49:19 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:30785 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393039AbgLLVtT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Dec 2020 16:49:19 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-19-lcDaBSusM8WSczU6TB4oZA-1; Sat, 12 Dec 2020 21:47:40 +0000
X-MC-Unique: lcDaBSusM8WSczU6TB4oZA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 12 Dec 2020 21:47:40 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Sat, 12 Dec 2020 21:47:40 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
CC:     Dominique Martinet <asmadeus@codewreck.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
Thread-Topic: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
Thread-Index: AQHW0KfRQeCeMjpix0eG5Uz36Tqg2qnz/UVA
Date:   Sat, 12 Dec 2020 21:47:40 +0000
Message-ID: <ff1adc79f7884ba1a1dcbdd806e81d7b@AcuMS.aculab.com>
References: <20201212165431.150750-1-masahiroy@kernel.org>
 <20201212165431.150750-3-masahiroy@kernel.org>
In-Reply-To: <20201212165431.150750-3-masahiroy@kernel.org>
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
> Sent: 12 December 2020 16:55
> 
> This script was written in awk in spite of the file extension '.sh'.
> Rewrite it as a shell script.
...
> +#
> +# Usage: $ ./scripts/ld-version.sh ld
> +#
> +# Print the linker version of `ld' in a 5 or 6-digit form
> +# such as `23501' for GNU ld 2.35.1 etc.
> +
> +first_line="$($* --version | head -n 1)"
> +
> +if ! ( echo $first_line | grep -q "GNU ld"); then
> +	echo 0
> +	exit 1
> +fi
> +
> +# Distributions may append an extra string like 2.35-15.fc33
> +# Take the part that consists of numbers and dots.
> +VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1/')
> +MAJOR=$(echo $VERSION | cut -d . -f 1)
> +MINOR=$(echo $VERSION | cut -d . -f 2)
> +PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL


Hmmmm.....
You've managed to convert an awk script into something that requires
sh, head, grep, sed (twice), and cut (thrice).
Plus (probably) a few sub-shells.

It is quite ease to do it all in all in the shell.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

