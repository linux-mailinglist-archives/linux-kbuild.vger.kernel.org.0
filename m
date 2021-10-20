Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8824C4354DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 22:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhJTVBk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 17:01:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58015 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhJTVBj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 17:01:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZNJh0W9cz4xbY;
        Thu, 21 Oct 2021 07:59:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634763559;
        bh=C0b3hYLhUCLhY/QAW3vmGSj026zviXMrdnNfnNI5iyI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hgg9FxcYS7/jt5TDamrW4JA23UE+GPP1hTPO+Wf0r4SM+K/LaizGNrtNLOPtyqE3P
         Hj1o53PUR6mt1t6Ke3/S7Zdbc/CsJVo7Lfh2bqR6R/YkHJ7WNMmIJsFSEcxJN1Kgx3
         m2E6IidYGoI+8//iYEdy14to6F+7I62XZXP3dkR+JycdpUPZAHZdGglUZqiAnTTFau
         SogK1rExymCByr99pM6jtS/d0xlSvr61hqeuSbzH3jmepA/h0aAWOoV6nS1OHCr4O2
         Ade17mOSszvmOOTnl9JQAVgtDwvlCgkbpxpdD41qXdZtyYIAz37o9zOzhtETokkQH4
         beByRtdX/PFiQ==
Date:   Thu, 21 Oct 2021 07:59:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Subject: Re: linux-next: Tree for Oct 18 ('make' error on ARCH=um)
Message-ID: <20211021075913.3d6f8adb@canb.auug.org.au>
In-Reply-To: <b0eddd67-e62f-c6c3-37d1-8c69f27c51fb@infradead.org>
References: <20211018203023.036d8362@canb.auug.org.au>
        <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
        <20211019085811.362b4304@canb.auug.org.au>
        <CANiq72=+5w7KzVKmN57ud5+GGEiuRbtgezfROGAuO=b-OYeWAA@mail.gmail.com>
        <20211020155627.7d6f6637@canb.auug.org.au>
        <81c2e5c6-7388-3d1d-87a9-1b000517661b@infradead.org>
        <b0eddd67-e62f-c6c3-37d1-8c69f27c51fb@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YFuEnSKXicKp7XvjTGlhP4K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/YFuEnSKXicKp7XvjTGlhP4K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Wed, 20 Oct 2021 07:46:24 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> No problems like this in linux-next 2021-10-20.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/YFuEnSKXicKp7XvjTGlhP4K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFwgyEACgkQAVBC80lX
0GwC2Qf7BxUbVTPtimV8VXVOL1I/Ahks5nPzI6tI5l7qGtsNVHLbtIF56EiIxLXk
auT4QNSdysrlafV4dzRZPxA5DcXcYrpvfRcO75NuY+UB7aL45l0BU2T/xJrZk9Io
vQ7QaHvn8Hw7hZzK0pXoaxRX2WQixCFJIVsuEMD1BrgNzHxLFa/5N7DYdZTkT1s9
7yJXKH+DNiobOZXLXR7Zfm+DRfKUXHFOMAMdZLthngnTfd9LDlLqwOK4t3sl+4fj
1APoIHirsD9alN45IVTS+o51JmcnF6X0fpmZJPptV81fu+q1sLgFbYRwDq5zYig+
Evb2MxSTmucy16DUsqyCyvOhiqRYaQ==
=47v7
-----END PGP SIGNATURE-----

--Sig_/YFuEnSKXicKp7XvjTGlhP4K--
