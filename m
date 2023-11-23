Return-Path: <linux-kbuild+bounces-135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884117F5BA1
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 10:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77068B20E5F
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A962111A;
	Thu, 23 Nov 2023 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JR3wNOy4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935F4D41;
	Thu, 23 Nov 2023 01:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700732869; x=1732268869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1PBhagH7/vOdhd9ZeQlcwBuZIBpOl+fh5UyFzBiP084=;
  b=JR3wNOy4r+Xp6kQzKuVPFIA9GgHJpgNgMOUaoiyjJwLvkBgkMB+KGAqa
   //+6/bGD2/738d/BPpBCJ4mnRAHfb1UfPfjWR4hY5z+qCBnV9RDv5OXFZ
   /IISL9GTzTKuMZE3mziawSINy99kSlFPyVJwO+sxOnCTb3P+EPSCaOMhQ
   3a5TdhxX369BTIbQIHF3jqWEFHNTIXFFf03tq08Eisfm4Yr07pcXrxNBn
   FZ72alEoprS56LOpn83ChhzAWT16HnHsUE0y5BXsr+UMOf6vf4y0HvRzx
   nae/ROlnZnSzoQDNEGsb7Au/IgjswS3AX1rhlv6tetyoRj3Mx9f73a6Zs
   A==;
X-CSE-ConnectionGUID: bmtvjieoQui/t8rcBiXjvg==
X-CSE-MsgGUID: VvY/zu3aQaWWYzr2ptuE+A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12184225"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 02:47:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 02:47:34 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 02:47:31 -0700
Date: Thu, 23 Nov 2023 09:47:03 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas
 Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor@kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
Message-ID: <20231123-sugar-aviator-337b290f899b@wendy>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TlOjZ7bCqwxiOxdz"
Content-Disposition: inline
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>

--TlOjZ7bCqwxiOxdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 03:12:31PM -0700, Rob Herring wrote:
> This series adds support to set the dtc extra warning level on a per=20
> arch or per platform (directory really) basis.
>=20
> The first version of this was just a simple per directory override for=20
> Samsung platforms, but Conor asked to be able to do this for all of=20
> riscv.
>=20
> For merging, either I can take the whole thing or the riscv and samsung=
=20
> patches can go via their normal trees. The added variable will have no=20
> effect until merged with patch 2.

IMO, you should take the lot.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--TlOjZ7bCqwxiOxdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV8flwAKCRB4tDGHoIJi
0gy+AP42cyrUTh4NL4eY8kIwsVmx5LejeoA0QZDYa85yy0PBgQD9EGKZIEXssWsj
vX2Y6dIUhPn8qia5tz+YByAjUriTEAE=
=2rQT
-----END PGP SIGNATURE-----

--TlOjZ7bCqwxiOxdz--

