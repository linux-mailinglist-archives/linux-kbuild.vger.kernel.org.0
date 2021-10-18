Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CC243296C
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 23:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhJRWAc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 18:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhJRWAc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 18:00:32 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5504EC061745;
        Mon, 18 Oct 2021 14:58:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HY9jd1DZZz4xbL;
        Tue, 19 Oct 2021 08:58:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634594296;
        bh=vwxbPZIo9t4LKu/5HT2oMX12qi6fCT6+gyPMD2K7pjQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cJWK3DkHuYmzyuokBL3shUNZ+/x2VoyMZtqLmNpg5xBGMESSWZkP5+7WDkpn5crmK
         jcyQRrQq9TjlxHSMXqhLgmzJeAuksbwM2e6fw+/A8DZN84e85DyE/fEZNJE5BaKnM5
         vIA5aVnhoHxhJqaTuqtVOHHIxzYQKsg7FJ5jARX40ySvT4OH4sHCB0qUCnoVPQP79X
         dTzemr6SnHraWz4+j2I4OOEMoCU/Rg6LPFB/qgpcemdF+TuM4tUIPklRZDZRBIsxXm
         x83pYX0v+AFfYhEIDnNc7rQ2K9CaN298GHnNr9cUyk8Hslx70wJLZ/9bw+OBDs32SD
         BFvIeQ1rWBkJA==
Date:   Tue, 19 Oct 2021 08:58:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Message-ID: <20211019085811.362b4304@canb.auug.org.au>
In-Reply-To: <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
References: <20211018203023.036d8362@canb.auug.org.au>
        <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fM5toOcPkNFI__oUNn4DYU6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/fM5toOcPkNFI__oUNn4DYU6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Oct 2021 14:14:59 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 10/18/21 2:30 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20211015:
> >  =20
>=20
> UML (arch=3Dum) with SUBARCH of i386 or x86_64,
> using gcc, not clang:
>=20
> make[1]: Entering directory '/work/lnx/next/linux-next-20211018/UM64'
> ../scripts/Makefile.clang:19: *** Specify CROSS_COMPILE or add '--target=
=3D' option to scripts/Makefile.clang.  Stop.
> make[1]: Leaving directory '/work/lnx/next/linux-next-20211018/UM64'
> make: *** [Makefile:226: __sub-make] Error 2
>=20
>=20
> Just use a make target of defconfig:
>=20
> make ARCH=3Dum SUBARCH=3Dx86_64 O=3DUM64 defconfig

OK, I missed that.

In commit

  c862c7fee526 ("Kbuild: add Rust support")

from the rust tree, these bits should probably not be there:

Makefile:
@@ -586,13 +628,11 @@ endif
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT =3D $(subst $(pound),,$(shell LC_ALL=3DC $(CC) --version 2=
>/dev/null | head -n 1))
=20
-ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
-endif
=20
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
 ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler

in scripts/Makefile.clang the

ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
endif

pair near the end become unnecessary.

So I will apply the following to the merge of the rust tree today:

diff --git a/Makefile b/Makefile
index b4482fd3a0cc..3d7c777d831f 100644
--- a/Makefile
+++ b/Makefile
@@ -630,7 +630,9 @@ endif
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT =3D $(subst $(pound),,$(shell LC_ALL=3DC $(CC) --version 2=
>/dev/null | head -n 1))
=20
+ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
+endif
=20
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 38f555d0cb0d..b8e331f98471 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -40,9 +40,7 @@ TENTATIVE_CLANG_FLAGS	+=3D -Werror=3Dignored-optimization=
-argument
=20
 export TENTATIVE_CLANG_FLAGS
=20
-ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 CLANG_FLAGS	+=3D $(TENTATIVE_CLANG_FLAGS)
 KBUILD_CFLAGS	+=3D $(CLANG_FLAGS)
 KBUILD_AFLAGS	+=3D $(CLANG_FLAGS)
 export CLANG_FLAGS
-endif


Miguel, does that seem reasonable?

--=20
Cheers,
Stephen Rothwell

--Sig_/fM5toOcPkNFI__oUNn4DYU6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFt7fMACgkQAVBC80lX
0GwBdQf9H+gB+Zj1Hl1xzpasMggxd4A/XDlphqZKR5nWT0i1QV6gJSOKHhS5z/hu
ELHdqPZ+Ug0rRlQ55MhZCTFem+QfJnCQI8frP4Mv9o+cYa9B1FXnSr/3A+Uhfnko
ca5yfq6rh8v7b0ay7l3nLle+OwcY5/eEsIOKejvE4CU30cCrSnM2y/5iHdDmaRn9
i4HCvsDvQfTXWna2Vu/XGXfJfK5qF1mo+CUjCsxJYNiar7cA+lsh7pI/yxtsXKPU
XRSX30VxHq8sEwrZaCK2upa3m22BayR3EdDJRhJpM484tMus4/KS8GXVSaA/MnA0
yXhP3qCueN6G4aOhIgF7Ea0xxor2UQ==
=3kMV
-----END PGP SIGNATURE-----

--Sig_/fM5toOcPkNFI__oUNn4DYU6--
