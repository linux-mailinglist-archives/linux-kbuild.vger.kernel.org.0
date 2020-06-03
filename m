Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C445D1EC843
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2020 06:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgFCEYI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 00:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCEYI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 00:24:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B61C05BD43;
        Tue,  2 Jun 2020 21:24:07 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cG511KFFz9sT5;
        Wed,  3 Jun 2020 14:24:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591158245;
        bh=r0R8fDB5G7w0Tlxan8H0hYX05CazfC4S0A+8TedrTBk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Rd3qwk1JOaET7JxrE4UItomv49lEW3TyEk5Rmz2qyGprbi5tUjQ18KT0UZ86/S//o
         lzeNzWCYtv9h2EDGCkz4xLAnHPmMfPsVT8LHqdgzch5hp0cwYWzVjymaxYaLax6OIm
         pGaIQN0Hi75UnHEmaxFrjqoOLkkj2HGEp89EO/OOhCLyQKgMueBkCZwHMmqt8eyT+a
         RV7/xPIl1eMr44w6FxTDjf8eGCzxYJRGktWmOvWe7saUmm4ixsKU7p1pEFVl6byG8b
         sOrU5vCZ5fLNb/40sOLbt9LvphXPlHUDHfMrh8MX8xRAQST/ZL8/XM7Jbzng94cewW
         /FLBjVUf0d4Ig==
Date:   Wed, 3 Jun 2020 14:24:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: ARCH=arm64 build breakage for Kbuild for-next branch
Message-ID: <20200603142404.33123d7d@canb.auug.org.au>
In-Reply-To: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
References: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 3 Jun 2020 13:11:59 +0900 Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>=20
> If you pull the latest kbuild for-next branch,
> ARCH=3Darm64 will fail to build.
>=20
> I will fix it soon.
>=20
> For today's linux-next, you can patch
> as follows.
> (or, you can use the old branch)
>=20
>=20
> diff --git a/Makefile b/Makefile
> index f80c4ff93ec9..fbb4b95ae648 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1074,7 +1074,7 @@ build-dirs        :=3D $(vmlinux-dirs)
>  clean-dirs     :=3D $(vmlinux-alldirs)
>=20
>  # Externally visible symbols (used by link-vmlinux.sh)
> -KBUILD_VMLINUX_OBJS :=3D $(head-y) $(addsuffix built-in.a, $(core-y))
> +KBUILD_VMLINUX_OBJS :=3D $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
>  KBUILD_VMLINUX_OBJS +=3D $(addsuffix built-in.a, $(filter %/, $(libs-y)))
>  ifdef CONFIG_MODULES
>  KBUILD_VMLINUX_OBJS +=3D $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))

OK, thanks, I will apply that at some point, since I have already
merged your tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XJeQACgkQAVBC80lX
0GzUbggAkU/kt74T6bUPKK+eofowxA+Kn0iM6h19munVmEu91EtXbQk1+BVhzB1U
Nc39JXnpDQtNP+Zw9E3L/NNriIj7pJZpRQrD+ER0i2w7GUtn7ZhuqhgvD2T8bwV4
BVBx3+boUwab72mPbvU8ZeaMnFkVqyYz9Y1fwx5QqWmZzfmzfcJq5G/iKd5yab7z
inzNPGWJIqkGOZSGzOjqsWc450TbL+ewYGVyQDFvW2a+P60pqMZ0WeFffy1u8Pqo
MR8YisqJNTIYkPbXP6TPJI0Vxy4w830TKB9Yb8tQlm5sYSVCnMd+5xAUAa4tY9iH
CnoNJbs+6i7xE9FIJ5MqSrmKCcBmUg==
=1GnE
-----END PGP SIGNATURE-----

--Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa--
