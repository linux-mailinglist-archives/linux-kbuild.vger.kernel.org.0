Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0128A418
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 19:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfHLRPD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 13:15:03 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:57004 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfHLRPD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 13:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=62DNhgY92I/xYxIIyuwUy6NI8Aqx9n6XDl+BIi0xY/E=; b=T44Mwg8LAESsvIi1D5l5gpgrC
        l13OBrhVJCumprOHAYyAapWFly8DlLEUwf8zqTfWevITreFrcPFStx/2JTk3hmQSfgIkUPaKwCQ3k
        x7Nb8ZUVyTC8xDyooN2OJ3UG9PxA0oyb4fZeHZjlvR5K3+kb3c2l4/w8tUrDZuzwjlq5E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxDu9-0002MN-V2; Mon, 12 Aug 2019 17:14:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 086D62740CBD; Mon, 12 Aug 2019 18:14:44 +0100 (BST)
Date:   Mon, 12 Aug 2019 18:14:44 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <linux@roeck-us.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel@collabora.com
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190812171444.GL4592@sirena.co.uk>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
 <20190809051552.GA44466@archlinux-threadripper>
 <CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TnYVF1hk1c8rpHiF"
Content-Disposition: inline
In-Reply-To: <CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--TnYVF1hk1c8rpHiF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 01:37:14AM +0900, Masahiro Yamada wrote:
> On Fri, Aug 9, 2019 at 2:15 PM Nathan Chancellor

> > This is problematic because there is no way for CC, HOSTCC, and HOSTCXX
> > to be passed to make within scripts/kconfig/merge_config.sh.

> Is it so problematic?

> If you start from make, CC=3Dclang and HOSTCC=3Dclang are propagated to s=
ub-make
> even via shell scripts such as merge_config.sh

> Only the problem I see is the situation where
> a user directly runs scripts/kconfig/merge_config.sh
> without using make as a start-point.

This is really a very common thing for testing infrastructure to do,
it'll combine a base defconfig with a fragment enabling extra stuff
either to directly cover that extra stuff or to ensure that
configuration options needed for testsuites get turned on. =20

> A user can wrap merge_config.sh with a simple Makefile
> if they want to override CC, HOSTCC, etc.

If we want to do that it seems sensible to provide that Makefile
upstream so there's a standard thing, it might also help people notice
that they need to do this and avoid getting surprised.

--TnYVF1hk1c8rpHiF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RnoQACgkQJNaLcl1U
h9AI0gf9HZ4+J2ZsyQX3ztFSIxR8D3kUiBnX52C6bGhvl4wjFmpM1b98dE4n5Ks2
a3gxDjMkFwBQX44p8he+xeV/UTqLgmOAJ9d3FuIpd+x1q3m8w6z95c5Icrgzc4Wh
ubsv3kqC34c70HZ1tuQIusrUyHNLBIsgp8dlvfDQdrOY7qS+VLaPPiFCdVYQI0g6
UEChNPLMspP/rlEvshD0x34SnTMGYNdrLK2hXNhoOlgtgu5+KEy4rFUb6mALWL2x
1LWKLnY1lZlxMs1lfLmcFzGHvZoCmfAX+/F7YtpclnovOTk1euRw0BmzCYt7S5Wv
8O51Orz7UWvcpyQDPMiiUXjcT5kLrQ==
=6R2x
-----END PGP SIGNATURE-----

--TnYVF1hk1c8rpHiF--
