Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888F478BE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 14:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfG2MkL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 08:40:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58383 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbfG2MkL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 08:40:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45xzmT2FFpz9s7T;
        Mon, 29 Jul 2019 22:40:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1564404009;
        bh=4dbux8Y2IDJ4EDhwD0REmwTgzoEb9eQxcpaRGFuIzmM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FMdTb7NCf+Lf6WP2/YPUZrqnlJlghpg1I156bYWPP43qkXO7a2EgOTl3JGK8Fl6n5
         uyqOn4Q7Czkw++Fvbo5epE/6LKXNYY73dwg0C23tSm4sTALah3+jROYd+BdDUWoFLz
         YdH8/Tny3UB1IOjlretfoo74we7pkmVLvua/QCFGN21i5ZSKg3sUNwcPnWre4lco+2
         DKO9bjKV545W928GJD+rVtFN+B3rpHHHCTxXw89JAYxMzWwZFADU1ysve13RiyILLv
         Quqqy/lHeiKhWou0q9E+e0erRkA6tOKBD4v57v/h0bo01TeS4EfE3VXU7TujyKKOAP
         oQFzKE/EEbUvw==
Date:   Mon, 29 Jul 2019 22:40:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Denis Efremov <efremov@linux.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
Message-ID: <20190729224007.2f7fdcb4@canb.auug.org.au>
In-Reply-To: <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
References: <20190714152817.24693-1-efremov@linux.com>
        <20190728100906.18847-1-efremov@linux.com>
        <20190729151351.24f9eeb9@canb.auug.org.au>
        <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5dSy6MPx/cOnKQYrF6_o2JA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/5dSy6MPx/cOnKQYrF6_o2JA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Mon, 29 Jul 2019 12:16:29 +0300 Denis Efremov <efremov@linux.com> wrote:
>
> > Just a reminder that some of us (just me?) do well over 100+ builds per
> > day ...  if this can be optimised some what that would be good. =20
>=20
> These measurements for the worst case (allmodconfig). Is it possible to=20
> measure the slowdown in your case? How it will perform on your typical=20
> workflow?

I did 3 x86_64 allmodconfig builds without and with the patch (I do
-j 80 powerpc64 le hosted cross builds) and it doesn't look like the
patch has much impact at all.

Without the patch:

real	8m41.390s user	587m25.249s sys	22m0.411s
real	8m40.100s user	587m32.148s sys	21m58.419s
real	8m40.084s user	587m25.311s sys	22m2.794s

With the patch:

real	8m40.351s user	587m21.819s sys	21m57.389s
real	8m40.868s user	587m23.730s sys	21m58.737s
real	8m40.970s user	587m22.525s sys	22m2.467s

I do other builds as well, but that is the biggest, so actually looks
ok.
--=20
Cheers,
Stephen Rothwell

--Sig_/5dSy6MPx/cOnKQYrF6_o2JA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+6ScACgkQAVBC80lX
0GxtVwf+MXedKDg7Tc/3WCsRA44hxudZyWbH10T4khIcptSuioPqoBgz9abNYI3K
IKyTryqu6lXAgyQvY+bYs/qqdZp9FuDcIJPVOdPmCBlRvslVom4GtJecR+DXa6Rb
6NxWWglkWJf4iJl8izJKdQTyWRI4utWrW8iERkgK3GyNubvtS8p0ZJPtOox4LhJL
sL4sqBrgoZcNyUiK5LLAAt/iYZQ+IeMFDWJ5C+T4kv1JpTM1FlpqRVrIJcHLrG2N
kV3DK59Si0OFGq+4FajbI72YEw+0B3qEVCBZQjYEc6gr1Gxpm8XN/9EIqJqJ2AN+
/thOOrhvw7v3oh/ZEHdSRtKGdHt1Qw==
=tynr
-----END PGP SIGNATURE-----

--Sig_/5dSy6MPx/cOnKQYrF6_o2JA--
