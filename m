Return-Path: <linux-kbuild+bounces-468-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B16528246A1
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jan 2024 17:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ABCE1F25934
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jan 2024 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DB725568;
	Thu,  4 Jan 2024 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="lF1x2/22"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9B25570
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jan 2024 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1704387029;
	bh=lx1sv/Hf7Jvwh8a/MZxt322JBJeavHDWn+T/C4EEc+I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lF1x2/22ReqRBJi0589Ew08DzlypAwX7Rlp6wGF8WvKuYM08oXi/UY/X+sHEpvWaP
	 p74vTYLNBlX/3f/beBf721ozyvpqVESNXNneR3jpv91FwrQovAWpL0jmgdr52KPpG9
	 ymKi0g0nvLnK5Nbiv5XK6u8IiaP8pdi6sIiaqrlo=
Received: from [IPv6:240e:358:110e:bb00:dc73:854d:832e:4] (unknown [IPv6:240e:358:110e:bb00:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3AD6667043;
	Thu,  4 Jan 2024 11:50:23 -0500 (EST)
Message-ID: <d4dcb7842583ecbf1e3d39d44f7aadff81277920.camel@xry111.site>
Subject: Re: [PATCH] modpost: Ignore relaxation and alignment marker relocs
 on LoongArch
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-kbuild@vger.kernel.org, WANG Xuerui <git@xen0n.name>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Youling Tang
 <youling.tang@outlook.com>,  loongarch@lists.linux.dev
Date: Fri, 05 Jan 2024 00:50:18 +0800
In-Reply-To: <2f1877ed39563b42d41f03ad6d6fdd7ce4137bbb.camel@xry111.site>
References: <20231227070317.1936234-1-kernel@xen0n.name>
	 <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
	 <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
	 <2f1877ed39563b42d41f03ad6d6fdd7ce4137bbb.camel@xry111.site>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-01-05 at 00:26 +0800, Xi Ruoyao wrote:
> On Thu, 2024-01-04 at 16:57 +0800, Huacai Chen wrote:
> > On Wed, Dec 27, 2023 at 7:06=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> =
wrote:
> > >=20
> > > On Wed, 2023-12-27 at 15:03 +0800, WANG Xuerui wrote:
> > > > And even though the kernel is built with relaxation disabled, so
> > > > far a small number of R_LARCH_RELAX marker relocs are still emitted=
 as
> > > > part of la.* pseudo instructions in assembly.
> > >=20
> > > I'd consider it a toolchain bug...=C2=A0 Is there a reproducer?
> > Any updates? Should I apply this patch for loongarch-next?
>=20
> Tiezhu told me this should be reproducible with GCC 14 and Binutils-2.42
> development snapshots and defconfig.=C2=A0 I'm trying...

Unfortunately I still cannot reproduce the issue (with GCC 14.0.0
20231208, binutils 2.41.50.20240104, and defconfig).  One possibility is
this was already fixed somehow, another is the issue was triggered with
a GCC snapshot > 20231208 but I think this very unlikely.

Xuerui: can you find the guilty .o file containing R_LARCH_RELAX and/or
R_LARCH_ALIGN?  Then you can just run "make path/to/something.s"
(replace ".o" with ".s") to produce the assembly file and send it to me
for further investigation.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

