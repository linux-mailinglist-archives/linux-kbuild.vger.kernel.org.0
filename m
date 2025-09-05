Return-Path: <linux-kbuild+bounces-8747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E5B4601B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 19:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE855C56DD
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 17:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002D83191A3;
	Fri,  5 Sep 2025 17:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pbarker.dev header.i=@pbarker.dev header.b="aqTr82rD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fh4Rxy15"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F533191CB;
	Fri,  5 Sep 2025 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093201; cv=none; b=LJ1iDpJomyqzlAyYZOVRh43elpYIZITpSU3m21T0G0vL31Ix4c5XWFZS6k/ZOx+TZbAYwOJgxY4iLba6nn5IKyy3RjJYIsCQy2uQvmusUg3AM/xJ4UyHyncZu0A9ikIi30GDb90vFulvbnhY6ljC87e39iEAaW5aHhpabIpBZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093201; c=relaxed/simple;
	bh=8Ozdwo8cNdLgIlNBEqmBlNbbardsLRA/mZAHMa/7lcQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mLlUakGRijD7MwUc0tBLbYM7laDmviqEA0dUOHyxTeQqXEyyPNhI9C+yyvURqgbmhBASxIAYr8uSbkg2AXiPyolZFQhKWbFfSXAA4mILAvmd+gZYO1wJSKj3Zx7EacGYwA6JhAzx+ncq6Agcf5EXUscz2fXl8mZYDDGC4LUrap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=pass smtp.mailfrom=pbarker.dev; dkim=pass (2048-bit key) header.d=pbarker.dev header.i=@pbarker.dev header.b=aqTr82rD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fh4Rxy15; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pbarker.dev
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id DCE081D002A9;
	Fri,  5 Sep 2025 13:26:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Sep 2025 13:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1757093198; x=1757179598; bh=OQ4+PUHv1I
	J1jMavfrkvi3AliHyN67JBHr/CZd2HFfo=; b=aqTr82rDReKxdvabI38ED7to/j
	1SoVfoUrn7V4LYkW8I4aK4NzXuz4X1rqTgU11rjdJocNrOMCVwLBhB4n83FU6lYJ
	4aZwa5BiTZmjBrjKbDMUm4mTOHV1Nv26+9bmAbolqZeT0CK+z+J36mkrKNqPk3OS
	RTmAPljmRFsxTi8Sxw7346LKHGkYz8clSaXdNTh+i7vv9Or4cPPbQr1vLRzdkbQ5
	krnKdSVP4fyyGMKvPRjkKc7z8I6aQiodrk2D6YuLjZ203rUhCesq/3yp2bMAkfIU
	FGpgMmKYu1D0r9w0dNDUylGiAUqEgouDQk5cQ82My2z5XN2L5tTtyZcltOvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757093198; x=1757179598; bh=OQ4+PUHv1IJ1jMavfrkvi3AliHyN67JBHr/
	CZd2HFfo=; b=fh4Rxy15FoVyjaxCFC2CKbhyAFUR5of5LO8h9r0HZhDi0K/UDb1
	Yfa0HOkzU53ybuR5V6OMtVcjIYijB7Obcjg32qNuh1sgY0g5xSlnFYDAuqziOT5J
	dvTveZ/kUbzq51x/2juwww+HFo4SxQZAePadL077rKaG257Zh+2YJFMOFsKoA0JV
	MhNnINzM1aGLBlCwC3p1gMPlmWdRr2pG57FeOlhlJ4nwe1IYPIcJ6sV4nLwt0bK0
	vbodElpPTehh0FgsJhuVOgctXc/693O9PdYrad91iK2ARhVigY0NZlFINrGkScfJ
	sdoPFODEDGVdyV6ZZikrcBkLcYzcBR1yOlw==
X-ME-Sender: <xms:Th27aP51Wxk8byY52Yz8KcsyRurHMtgiDeKdWFkbdCB3YMyjPxSwcA>
    <xme:Th27aLrB3oQKaURk0TXlVQQlq2LQnm_mGku4cUEtc2U5SHHB954HirNlZwrQfrOan
    k2EmCaz-4cO36Ky3qM>
X-ME-Received: <xmr:Th27aIN4EcuGAX6Jo4_gRztEA59MQv8UVxbvCvotZuND8PvbuUMNelw_fHsCxXUuscR-rmJjQWwft6HlDGLffJwjeSAX_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghr
    khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepfe
    ffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsg
    grrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdr
    shgthhhivghrsehlihhnuhigrdguvghvpdhrtghpthhtohepnhhitghkrdguvghsrghulh
    hnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehmohhrsghosehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:Th27aL3Wl2I_zZp7Rx91Do8IDS_RsjhONA-OzeF9MAd4uygcvHv60A>
    <xmx:Th27aPDxXE_fANTT2lZK27IaiN7j_6x01h7NW_rpXy0XXIJbC07s-g>
    <xmx:Th27aALTsPbj8DD3pdp9ipGI5hDuI7-Pwbo1IKip4UfKt0EbKHTxDw>
    <xmx:Th27aAlaVzqoCyfVwLVzgKr3RYwI6-TqeMDIHuj42oWB_8TUj_vsiw>
    <xmx:Th27aOr08IyS282yrzCMqEhQ_4mIbaGdIADrqI5cgItqWPhB2WegWG2G>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 13:26:37 -0400 (EDT)
Message-ID: <e09dce93d521a89e3820a91e7c319d680cae203f.camel@pbarker.dev>
Subject: Re: [PATCH] gen_compile_commands: Look in KBUILD_OUTPUT if set
From: Paul Barker <paul@pbarker.dev>
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier	
 <nicolas.schier@linux.dev>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 05 Sep 2025 18:26:32 +0100
In-Reply-To: <3fya5rij6amcwt36jthyezkzov44m6rdvlacymqfpbkcmzrnw4@fymsxhcqq6tj>
References: <20250905-gen_compile_commands-v1-1-9f5194542d4d@pbarker.dev>
	 <3fya5rij6amcwt36jthyezkzov44m6rdvlacymqfpbkcmzrnw4@fymsxhcqq6tj>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BzYIG7QNSw7BczKYMxa7"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-BzYIG7QNSw7BczKYMxa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-09-05 at 09:34 -0700, Justin Stitt wrote:
> Hi,
>=20
> On Fri, Sep 05, 2025 at 11:17:43AM +0100, Paul Barker wrote:
> > If someone is already using the KBUILD_OUTPUT environment variable to
> > specify the directory where object files are placed, they shouldn't nee=
d
> > to repeat the same information to gen_compile_commands.py.
> >=20
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  scripts/clang-tools/gen_compile_commands.py | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clan=
g-tools/gen_compile_commands.py
> > index 96e6e46ad1a702cb0fad5d524a9a02d222b236ec..7b94a2ffba0b4d5f1290b51=
bd602fb3f33acce6a 100755
> > --- a/scripts/clang-tools/gen_compile_commands.py
> > +++ b/scripts/clang-tools/gen_compile_commands.py
> > @@ -39,8 +39,9 @@ def parse_arguments():
> >      parser =3D argparse.ArgumentParser(description=3Dusage)
> > =20
> >      directory_help =3D ('specify the output directory used for the ker=
nel build '
> > -                      '(defaults to the working directory)')
> > -    parser.add_argument('-d', '--directory', type=3Dstr, default=3D'.'=
,
> > +                      '(defaults to $KBUILD_OUTPUT (if set) or the wor=
king directory)')
> > +    parser.add_argument('-d', '--directory', type=3Dstr,
> > +                        default=3Dos.environ.get('KBUILD_OUTPUT', '.')=
,
> >                          help=3Ddirectory_help)
> > =20
> >      output_help =3D ('path to the output command database (defaults to=
 ' +
> >=20
>=20
> Thinking out loud: It might make sense to also change the default output
> path in some cases but not in all cases. For my clangd setup in vim, it
> does some discovery for a compile_commands.json and I have some
> different ones in various build-* directories -- I guess it'd be cool if
> they were automatically placed in their appropriate spot. With all that
> being said probably YAGNI.

I think it makes sense to place the output file in the current directory by
default if you run gen_compile_commands.py directly.

The `make compile_commands.json` target places it in the output directory, =
and
`make rust-analyzer` does the same for the rust-project.json file. I did th=
ink
about whether we should change these, since clangd and rust-analyzer look f=
or
the relevant files in the source tree or its parent directories. But people=
 may
be using multiple output directories for different configs or archs, so wri=
ting
the files to the source tree isn't a good default for everyone.

For my case I'm just symlinking the relevant files back in to the source tr=
ee
after building so that clangd and rust-analyzer can find them.

Thanks for testing!

--=20
Paul Barker

--=-BzYIG7QNSw7BczKYMxa7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaLsdSBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bp9OAQCou2ek/qai30pe7wVkfOLSJni3AlisDE2H
VfbXKGAaFQD+KqXbYwkqICgPcG+c2dsI7kXENFhNiQPGieT5ypE5lg8=
=Muqt
-----END PGP SIGNATURE-----

--=-BzYIG7QNSw7BczKYMxa7--

