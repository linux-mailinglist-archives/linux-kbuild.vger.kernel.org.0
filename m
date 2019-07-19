Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 543386D793
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2019 02:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfGSAGA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Jul 2019 20:06:00 -0400
Received: from ozlabs.org ([203.11.71.1]:40671 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbfGSAGA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 20:06:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45qWVt2D6pz9s3Z;
        Fri, 19 Jul 2019 10:05:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1563494758;
        bh=3W+rGCBlv9qH/WcczfGAgAysyijlmfF2crVhHqwraek=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tcKoBa8e0EAO+BSWJiiDEISQP8nqquUCBFaDc3/fi9Sqspt9Tnil3oCbD2Ws8l8sV
         RBcRV9w1oDWYphT8Oz4qoaPNlX4x7UyCnxVH/oot+zsZAXa9IIBaP09QAa6NOCrAo1
         7GniPU/dFONVT/r5tzZ7Y6pD9+F0Dr3BrlRlCJ5hXXNJ8RCkb+dLAqxpX+CLZocDhj
         UJ7kVyz4nDJdphwc1Fjr2tlr+8F++fwGtxanRuz2MFbJFd0NbvXcimWZQEFEL0kXWS
         KYhtJY1ygog30kTm1leiwS06tav+vBF28lC7d73uB5sdP5KcVR+HnCjT6hni2XGpTG
         0zovX42Va5Jdw==
Date:   Fri, 19 Jul 2019 10:05:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: linux-next: Tree for Jul 18 (header build error)
Message-ID: <20190719100557.3ead3285@canb.auug.org.au>
In-Reply-To: <127d228c-322d-6349-382b-d304974df148@infradead.org>
References: <20190718133751.3cf036be@canb.auug.org.au>
        <127d228c-322d-6349-382b-d304974df148@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z1=xYY.a9cTfhHO35FJ79pe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/z1=xYY.a9cTfhHO35FJ79pe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Jul 2019 10:00:22 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on x86_64, when CONFIG_BLOCK is not set:
>=20
>   CC      include/linux/iomap.h.s
> In file included from <command-line>:0:0:
> ./../include/linux/iomap.h: In function =E2=80=98iomap_sector=E2=80=99:
> ./../include/linux/iomap.h:76:48: error: =E2=80=98SECTOR_SHIFT=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98SECTIONS_SHIF=
T=E2=80=99?
>   return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
>                                                 ^~~~~~~~~~~~

include/linux/iomap.h should only be used when CONFIG_BLOCK is set (if
you follow the Kconfig trail).  So maybe this header should only be
compile tested if CONFIG_BLOCK is set.

--=20
Cheers,
Stephen Rothwell

--Sig_/z1=xYY.a9cTfhHO35FJ79pe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0xCWUACgkQAVBC80lX
0GwSMAf/XraSYDqoBJY5K/r9UdR05YjdlfrPEbwsEwGFHCpL0u2m6jiwq9ciOo1R
E9MgT5vqxAOBTcm8hc4XK0msKMDUWwYso0O6/1BGjRARdUz3c8QHYjIYZ4oHV1nG
6R4vWHLBKs9YIusRCl7ZFYy364DGmvVAb9dwTc1L3ZF3Tu9vPlIn2ntsrc+Je/zA
A3OoztV9DKmXWmzL+XZHScEx391GX3pGo3zSL26w4rDpSwSjfFctL5EWo2p9mH2Z
KFkH0pYUxh2O50GS1XGWfVfmpo7mck6rfHRTuMyKkB2Oq67xFZg+Uh81axMR2hlZ
M2SCpbYCyCvX+2ZB9uTWpdB31FaytA==
=Zdp9
-----END PGP SIGNATURE-----

--Sig_/z1=xYY.a9cTfhHO35FJ79pe--
