Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204873BF12B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 23:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhGGVGd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 17:06:33 -0400
Received: from gimli.kloenk.dev ([195.39.247.182]:49490 "EHLO gimli.kloenk.dev"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230033AbhGGVGd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 17:06:33 -0400
X-Greylist: delayed 411 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Jul 2021 17:06:32 EDT
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.dev; s=mail;
        t=1625691419; bh=XvBNqB53b+UDSkntbWZIwDkF0py1FkstKOl/6BKenl4=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=IPvT50/Xp4G2h8l04mSx++YIcxglQIDHHizSnRO2ZnxX0PKbtV3D9ePnIgIMWwqMY
         M0D3v37ZhwzV/AqFmqfFk8iDnzVER6Ev6oNjjR5YRraEAQlkl5ffjXyhGKpp2U655J
         BR2ceK9WZPjRY5KFKG68TKJcpSOEo+7qWOR9wkD0=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 00/17] Rust support
From:   Finn Behrens <finn@kloenk.dev>
In-Reply-To: <YOXB7FRqldZik2Xn@kroah.com>
Date:   Wed, 7 Jul 2021 22:56:57 +0200
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFD5298D-00CD-4FEF-AE77-61E69AF78604@kloenk.dev>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com> <YOW1Nj8+a2Yth2++@google.com>
 <YOXB7FRqldZik2Xn@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On 7. Jul 2021, at 17:02, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
>=20
> On Wed, Jul 07, 2021 at 03:07:50PM +0100, Wedson Almeida Filho wrote:
>>> Last I looked at this thing, it was not
>>> feature-complete compared to the in-kernel binder code, has that =
been
>>> resolved and the needed filesystem changes added?
>>=20
>> It is not feature-complete in comparison to the C one just yet, it is =
missing a
>> few things but not for any fundamental reason -- we were mostly =
focusing on the
>> kernel crate and tests.
>=20
> I love it how you call "binderfs is missing" a "few things" :)
>=20
>> Miguel's point is that it does implement the vast majority of binder =
features
>> and is non-trivial, so it could be used as evidence that useful =
kernel drivers
>> can be built with Rust; not just "transpiled" from C, but written =
with the Rust
>> safety guarantees.
>=20
> As Christoph said, and I and others have said before, binder is in no
> way shape or form anything that resembles any sort of "driver" at all.
> It is a crazy IPC mechanism that is tacked onto the side of the =
kernel.
> Not to say that it doesn't have its usages, but the interactions =
between
> binder and the rest of the kernel are very small and specific.
> Something that almost no one else will ever write again.
>=20
> Please work on a real driver to help prove, or disprove, that this all
> is going to be able to work properly.  There are huge unanswered
> questions that need to be resolved that you will run into when you do
> such a thing.
>=20

There is a more general use driver (network dummy) still in the making, =
It is fully operational, just the documentation of the rust bindings are =
not finished yet, so it is not merged into the rust tree yet, also I =
have to rebase it.
I testet the network dummy (dummyrs) driver and for stupid tests like =
Iperf3 or ping it performed slightly better that the C version. See =
https://github.com/Kloenk/linux/blob/rust-netdevice/drivers/net/dummy_rs.r=
s for the actually driver.

Yes this driver is still only virtually, but the network apis are =
probably more general usage than the binder apis.

> Good luck!
>=20
> greg k-h

CU,
Finn

