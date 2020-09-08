Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A48126081F
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Sep 2020 04:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgIHCAY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Sep 2020 22:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgIHCAY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Sep 2020 22:00:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A7BC061573;
        Mon,  7 Sep 2020 19:00:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BlpJM6wcTz9sR4;
        Tue,  8 Sep 2020 12:00:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599530420;
        bh=9JFhYQPePdCxeoNOq8dWF3/mYkEAMyxOU5TeKiHaOoY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ETciMhqqiPSFjkZ9Lzp3azXbZwaJRBr7hmb+KLzFT7jxp9IsilnKKD/4zxs/7xlD4
         fSN51to3XSEI7pzlFy9KI/pj8dgRcelWF4GNVDcORK75UAw73on4f+4tizFII2sgO0
         y85FuwM3V9nev809WUSq6/qHiAjKOlUk9pJpuQAFlk7LCy4jZPazJJJ5UrpNiw83J2
         O07wFxEjorNqVHJ2O81IK9ktuTtRH8l3/GRI0b/DrDPaO9/Vkbigqv0jOt2gtf/Vnq
         oNtblehs3+aZ2KoRv8Paetc35O6z2RPma7Xp1zk4bfD/uaw1NzyWSlwgS6ZhFheRqi
         bFADSfxTebCEQ==
Date:   Tue, 8 Sep 2020 12:00:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Please revert kbuild commit for today's linux-next
Message-ID: <20200908120018.6b9fb552@canb.auug.org.au>
In-Reply-To: <CAK7LNARR3Hh0EwrHKU+gqyO7UVGJVK81pXO1CTNEKe-mbWAgqA@mail.gmail.com>
References: <CAK7LNARR3Hh0EwrHKU+gqyO7UVGJVK81pXO1CTNEKe-mbWAgqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CxUV.X3kbhCEdDzx07rKq51";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/CxUV.X3kbhCEdDzx07rKq51
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Tue, 8 Sep 2020 09:44:39 +0900 Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>
> As 0-day bot detected, the following commit
> in my kbuild tree turned out to be problematic.
>=20
> commit 8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5 (origin/kbuild, kbuild)
> Author: Masahiro Yamada <masahiroy@kernel.org>
> Date:   Fri Sep 4 22:31:21 2020 +0900
>=20
>     kbuild: preprocess module linker script
>=20
>=20
>=20
> Could you revert it for now?

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/CxUV.X3kbhCEdDzx07rKq51
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9W5bIACgkQAVBC80lX
0GzBgwf/YXF+EXcPkG2sVqUkbGMiEgxQ9eJH08/YKCFr8oj/0Z9EDhnRs/YxWP1q
7swt+PmxTjjW5nZqbzsx6LBxcAF2rUSupKUBdWlJbQp4jR8A9HeVreB7Zj5cDpZX
PrjPB3prRRuuCMcDtvzXrELEdv9YscvzNdBiD1KNYL6dnTNJM1D4HGpIaffpZQ7C
x/sfkkoyC354JSX0nvyJn2uoRi97lQCDVuKJvpuBEJaQGETeD89/BxwfG2LkGz5f
jZIWLRstkW2oSsojNNddRMvmsqTa0VGtcvTG9Pf6KMvK5YukWKMi9y3FAzbo/eKR
fjWAuFB1HeXa/ijioC+IrSeBqgfM3g==
=0MOV
-----END PGP SIGNATURE-----

--Sig_/CxUV.X3kbhCEdDzx07rKq51--
