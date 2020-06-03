Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC801ECE2E
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2020 13:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgFCLWw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 07:22:52 -0400
Received: from ozlabs.org ([203.11.71.1]:57759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCLWw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 07:22:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cRNB58fsz9sRK;
        Wed,  3 Jun 2020 21:22:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591183370;
        bh=8uSxzzWPus6eu0r5MlutBwAM2qOnvyL5C2jrEEV17FE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aWWyn6ihIIoGNhlmDd6H7sJc7d/GYg1rEGChg8XCBScHIb6jLhKf8UQcTc5SFPF8B
         Zc7hsbKrVH492dz7X+1ZYpaQqYLPCwhvEFhXn48Fof5TeuRjNLkD8DA8CsLCSKB3rF
         mR55z+DounleFCPRCraqBPK3k62VhTCpepPv12QPZcXb8dsVSyb90srYxKbFA0JyRt
         81COqvO8FtoWVhaahKMx1Lwb1tHph6MSbYLcX59lHR6qV5obU2+VcatCke1ZQBaOuc
         49AYwABTtwkKXAHXp33cW9Rwlbw2m5G5Vd8dt2erPhH5vnkdGflM+dJ9Nz574Hfk62
         lvwRE56Xsf6Ow==
Date:   Wed, 3 Jun 2020 21:22:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: ARCH=arm64 build breakage for Kbuild for-next branch
Message-ID: <20200603212250.69feb53b@canb.auug.org.au>
In-Reply-To: <20200603142404.33123d7d@canb.auug.org.au>
References: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
        <20200603142404.33123d7d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cBciKtCFp0OIoiyBGlNwe.K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/cBciKtCFp0OIoiyBGlNwe.K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jun 2020 14:24:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 3 Jun 2020 13:11:59 +0900 Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> >=20
> > If you pull the latest kbuild for-next branch,
> > ARCH=3Darm64 will fail to build.
> >=20
> > I will fix it soon.
> >=20
> > For today's linux-next, you can patch
> > as follows.
> > (or, you can use the old branch)
> >=20
> >=20
> > diff --git a/Makefile b/Makefile
> > index f80c4ff93ec9..fbb4b95ae648 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1074,7 +1074,7 @@ build-dirs        :=3D $(vmlinux-dirs)
> >  clean-dirs     :=3D $(vmlinux-alldirs)
> >=20
> >  # Externally visible symbols (used by link-vmlinux.sh)
> > -KBUILD_VMLINUX_OBJS :=3D $(head-y) $(addsuffix built-in.a, $(core-y))
> > +KBUILD_VMLINUX_OBJS :=3D $(head-y) $(patsubst %/,%/built-in.a, $(core-=
y))
> >  KBUILD_VMLINUX_OBJS +=3D $(addsuffix built-in.a, $(filter %/, $(libs-y=
)))
> >  ifdef CONFIG_MODULES
> >  KBUILD_VMLINUX_OBJS +=3D $(patsubst %/, %/lib.a, $(filter %/, $(libs-y=
))) =20
>=20
> OK, thanks, I will apply that at some point, since I have already
> merged your tree.

And then I forgot, sorry.  I assume it will be fixed tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/cBciKtCFp0OIoiyBGlNwe.K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XiAoACgkQAVBC80lX
0GzHtQgAkznUzjiD/EXRvERR3mezHb9xSY0/NtQ511uFdc7cNANutqCQqbnL8xCY
FRAzIvnbeQDCYieBjb8BWcNMj37j2KkBMbQMnsooDxa8iofFwRt2WWDFtSzFXCaD
XbY1MvCTBqUM26DsploHRAXWLeLXk6+rEJGgmEKSQjF6iiAAf83yRJQP5y2meOEw
eIGykNstUQJvsKJT+j6KvUyMuvcTCkGXjPgQSVnEH+PhWoK9M7VWvASlfpWncrR8
PQoQwRNiG0CIIXP0WKGkOc4A5yQGnjajdPQzXYzx5kDGDtAs14ciIpA+YXJyGRKQ
8PIvofk+LjavLWpp3cbo7a4A8/bzBg==
=JgD9
-----END PGP SIGNATURE-----

--Sig_/cBciKtCFp0OIoiyBGlNwe.K--
