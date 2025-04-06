Return-Path: <linux-kbuild+bounces-6465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68CA7D080
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 22:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C261C188C6AA
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 20:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDBC186E20;
	Sun,  6 Apr 2025 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PjKVqqDL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180F7E0E4;
	Sun,  6 Apr 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972491; cv=none; b=nxt4+fhNI1Y9eloTIxD7dkrZq9da7t3DLfGaUne8/9LQYsoqWnLVY31Qq4yvTu5hEVl32WVsD8G0ROtFTUKcITnbUbGQeHCtGofJlMZzdmdlc0X4sWSs34C+2XMVeFdZCqUtqGKhOe2SFWcNOtVleFwBVZQ9Gv0Ibu4UIul1Mo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972491; c=relaxed/simple;
	bh=GdqMTgVunw0G91gOpHFux9zh+YXHkcPVNJEbqwyRp3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MP9YjzHAbq/hIkLMRgonHgAGh6LxoO41aiMWhoiwAUb5Ho3utqWqiP3f7BLZHuXs6FHRbjdnQqtrEg0Gz6mtgajMltrkQam5p+xU5O1hNXf1W9X9YW07lM6t6AMXwtDPXQ2BvlCCVtOKfiJMxclIvzLO4OdJ2FIofbP0WcITOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PjKVqqDL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743972087;
	bh=a3OoJp9teMIqGbKZWXOaRPl1wcCIcIOyOl73XiC36Tk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PjKVqqDLbSjm4dWQWMqaMjAhDeTuDRo/zv1shSYZ/MYlJG8GV1iWYjRIXQQl17gI2
	 jeOXI/sXCVCCS8G7nLd+w5rVnCAwRMvFXvZFHUVIxmUVg32lmq4zCRb2zk+6XCKBZX
	 GvJ1wu9FsTeGgyM8Sh0d6rUhqxw3VPYdTdR/HbyJyeFn9xUw5UThFHnfgoXQZ/Q32i
	 16t+YPcDetUwn2ASyfInjYL0y3a3yPehARI7XufXq+y3NGc55+Rq+p8FqVz7E/p5hb
	 Zf++W85Lamj9HnfZTsIG2/i8ywKl/KiXP4y1EpzYLR4ipXiptv8jB9cWJn7jPbtgvu
	 Tu8+eJ9NlUoSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZW44l1rdhz4xFb;
	Mon,  7 Apr 2025 06:41:27 +1000 (AEST)
Date: Mon, 7 Apr 2025 06:41:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Damian Tometzki <damian@riscv-rocks.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.15-rc1
Message-ID: <20250407064109.5b441f5e@canb.auug.org.au>
In-Reply-To: <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
References: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
	<01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
	<CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7uBCrq//tkCcj0GB.RJ9tL=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7uBCrq//tkCcj0GB.RJ9tL=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, 6 Apr 2025 09:50:05 -0700 Linus Torvalds <torvalds@linux-foundation=
.org> wrote:
>
> On Sat, 5 Apr 2025 at 22:43, Damian Tometzki <damian@riscv-rocks.de> wrot=
e:
> >
> > i got the following error after this pull request.
> >
> >  MODPOST Module.symvers
> > ERROR: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
> > make[3]: *** [/home/damian/kernel/linux/scripts/Makefile.modpost:147: M=
odule.symvers] Error 1
> > make[2]: *** [/home/damian/kernel/linux/Makefile:1956: modpost] Error 2
> > make[1]: *** [/home/damian/kernel/linux/Makefile:248: __sub-make] Error=
 2
> > make[1]: Leaving directory '/home/damian/kernel/build'
> > make: *** [Makefile:248: __sub-make] Error 2 =20
>=20
> Bah. And the reason it doesn't show up in my normal build tests is
> that my 'allmodconfig' tests end up picking up SLUB_TINY - which
> disables a lot of slub cases, including this test.
>=20
> And my normal non-allmodconfig tests don't enable SLUB_KUNIT_TEST.
>=20
> That said, I'm not sure if making it a hard error was a good idea in
> the first place. It *used* to be just a warning, and it used to be
> enabled only with 'extra_warn'.
>=20
> So switching it on to always warn was probably a good idea, but then
> also making it a hard error may have been a bit excessive.
>=20
> In related news - I also wonder whether SLUB_TINY should just be
> turned off for COMPILE_TEST. It's not a very interesting config option
> to test for, and it disables much more code than it enables [*].
>=20
> Testing this without SLUB_TINY, I see that it *also* triggers this one:
>=20
>     ERROR: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
>=20
> so the claim in commit 6c6c1fc09de3 ("modpost: require a
> MODULE_DESCRIPTION()") that "all known instances of this issue have
> been fixed" is clearly wrong.
>=20
> For all we know, there are lots of other cases like this that just
> never got tested with W=3D1 at all.
>=20
> I think I'll downgrade the error() to a warn() again, and make
> SLUB_TINY depend on !COMPILE_TEST.
>=20
> And I'm not even convinced we should require module descriptions for
> silly test modules, but whatever.
>=20
> We'll see if something else pops up, but making the lack of a module
> description a fatal error was clearly not right as-is.

https://lore.kernel.org/lkml/20250324103048.3d8230f9@canb.auug.org.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/7uBCrq//tkCcj0GB.RJ9tL=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfy5uUACgkQAVBC80lX
0GwR4Af+Kwyqoil1SkAJPiMIYRqXXSBhUDdC/JULZFmUcLHat7cQLafBFMd37CPJ
HtC1SUar1I4j4ZXoAOJp/ksJHNyb6G12TPIPj9MJeKQpoiH+xJUrshgiZQl+L37E
nvQh9MJl3/BpSW2CUL2jgoMkx8+fPQedTF9qE9Uv2/rrDsOr+39j5CjhtPA+w7gN
UGxVhzRWs4sgUw9kErFvH1caYOTViAXE0BgV32Pc2Oxgli/nU4XY6rCO6qoUip3s
aeJxsHO97uZMJznzf3FElYh9Nye6prHiZemKrZTx2L7OzQF8ajv/xOsO3IDFNDXe
I9xeZZiVe/azZDMiJQo44NbyKVAZ8w==
=8yE/
-----END PGP SIGNATURE-----

--Sig_/7uBCrq//tkCcj0GB.RJ9tL=--

