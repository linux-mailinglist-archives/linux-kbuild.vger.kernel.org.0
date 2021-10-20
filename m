Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9BF434468
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 06:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhJTE6u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 00:58:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60255 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhJTE6t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 00:58:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HYyxm0cS1z4xbT;
        Wed, 20 Oct 2021 15:56:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634705794;
        bh=DVggtuQGNksrHkAenCza8zmIaIPraDIvMVX6iFMk9gM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZBxEGQR764mNNmNu7Yb7Sf656pkZ/9DbktDYHtZNr/m1ij6LVhfdhBS58VJmarb6g
         NOXRtl7XBf+w0JZY2CSSaC0hZWLGjTK1qM0jljJvUT3J7ejn+sQUYLvbgOVYmGfFtR
         1CXjvbdcNIbhFNFunUit4Lt6SbEH4tPUEquLZfNZ04a5+juBzMGb/x8ugGDKa8P6pM
         IDP2/UwsQrb0OaNoJuAqeWXOeEDLqg09m75iUsij5aFD6uH6Lk9MvmkGppArpXQooM
         5eEFaSHOYkPwmCHDLJ+8G1OSSTv6SuV/i98QjyXmx0ghqxFcq4cdEUNqQEH0rYeSqO
         qvDVladvQVwng==
Date:   Wed, 20 Oct 2021 15:56:27 +1100
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
Message-ID: <20211020155627.7d6f6637@canb.auug.org.au>
In-Reply-To: <CANiq72=+5w7KzVKmN57ud5+GGEiuRbtgezfROGAuO=b-OYeWAA@mail.gmail.com>
References: <20211018203023.036d8362@canb.auug.org.au>
        <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
        <20211019085811.362b4304@canb.auug.org.au>
        <CANiq72=+5w7KzVKmN57ud5+GGEiuRbtgezfROGAuO=b-OYeWAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X152GgG.dRbfF.3qwxnQxkD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/X152GgG.dRbfF.3qwxnQxkD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, 19 Oct 2021 00:18:44 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> On Mon, Oct 18, 2021 at 11:58 PM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > In commit
> >
> >   c862c7fee526 ("Kbuild: add Rust support")
> >
> > from the rust tree, these bits should probably not be there:
> >
> > -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> >  include $(srctree)/scripts/Makefile.clang
> > -endif =20
>=20
> So this was on purpose -- we need the Clang flags even in GCC builds
> for bindgen. But now there is that `$(error ...)` added there :(
>=20
> > Miguel, does that seem reasonable? =20
>=20
> Of course, for today please feel free to apply your fix (i.e. to put
> the conditional back to where it was). I will solve it on my side
> tomorrow.

Can you please check that this is fixed for you after I do the release
today?

--=20
Cheers,
Stephen Rothwell

--Sig_/X152GgG.dRbfF.3qwxnQxkD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFvoXsACgkQAVBC80lX
0GxsZwf+Jpxyh+PvH8WWGTQgv+jM6Ss1MTFH9SfxkgnZcbJ/Ib72CtXkbTd2/Ikk
SJMdQN+te3HzoBQF7PT4vAJywkNp4eH8OYB5+dG8Pt43Hyh0CveaspxInw6RZrSB
PIdOqQOI2NpIbbADPRG1G8MJKB8RB5jxpiUroK2EA8Pn9oJpm7z/hvhitrOeB115
AsqnjpHncYipZEYYOCCcbADzdbecvfQHKmzREFJCsP/PpyZ7lT9vBH4EKCsj9Vqh
RyjZqh/wlMfF3YDJOVyXHYt8P2DaxqoqWu8eleZUPHlSBMSy52/HTpIlAnfxqAzO
wp0H1891I4vFYaDcMivxaSQZr31wvw==
=iC2V
-----END PGP SIGNATURE-----

--Sig_/X152GgG.dRbfF.3qwxnQxkD--
