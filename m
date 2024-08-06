Return-Path: <linux-kbuild+bounces-2834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3EA948BF7
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 11:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310F0283716
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64C51BD006;
	Tue,  6 Aug 2024 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="x8dCRW0e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D6146A6F
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722935251; cv=none; b=mYnJ1L7VGPq9bJBQeBNywnx6W8fKbbMEMJ4aD3ryagiDIdsXxLeOGkRAFig9YKvLNSjEJfHeADypoFgovbjLJMg8QnjePP6OQFbJBTZCZUB5gh35bAWSLIyxi0zNr3tXMLqnNzMY1rrRVLQVvAtzdFkiowxjAQQTHzXFW55Na3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722935251; c=relaxed/simple;
	bh=PfWsEmLKOpdKXwuDC/uLZWg/6OkGpAlyvgjVJG3QxC0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MSA0qN/RlvtIMHiSHuQ1DtwrPvA6cvMr9TkqmBV/Sba3WUNJ9UPODk+oskTYYBsW3fKcVHag+ZnQ9rGfShhqlGThnf9AYQVsJyQuw0hy/Z4XtgPF7GwW9XE+kFV+KuGzoIPArR5ks/XAczNQZypqnoUWk2WCcQ3Aho3htDbJRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=x8dCRW0e; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WdSB54DY2z9sjp;
	Tue,  6 Aug 2024 11:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1722935245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iA431zNuBaQbacreh6spQ7cm9AU6DAf56VuwMkAXcjk=;
	b=x8dCRW0eGqOpXdzBJi/84VsnckR8aC16Db0x9uW0CVvDggdupOboCwhVr4YnD0HvLXIt9s
	F4mfV8SbCilg1tbWQhdy010+9sAIO8WaYkB0C6c9Qqv6qf7UYkBDZprWps2HK70YEeWPl1
	VedyMilKmmVaQ5na5noF46Y0YSC7v5QfFi2KIK1T7sgQBtXFHIIuB5P4GGWO3wnLd7ol3B
	zoyKqh1znNbzHbFbBB0whG30GjYg8xOIvWxh928wvlAnuQgOo7SZ+T95BhyCH+DOjkoKpc
	YbqQCZcf1lAKhU0OUuJoYMhD4DkXNNM69w6I6X9GMtih7EsbucI5CuKZSudViw==
Date: Tue, 6 Aug 2024 11:07:24 +0200 (CEST)
From: torvic9@mailbox.org
To: Masahiro Yamada <masahiroy@kernel.org>,
	Maximilian Bosch <maximilian@mbosch.me>
Cc: linux-kbuild@vger.kernel.org, Piotr Gorski <lucjan.lucjanov@gmail.com>
Message-ID: <2079018606.231736.1722935244746@office.mailbox.org>
In-Reply-To: <CAK7LNASLi6s8AZ1R+Ab08zLBpfpN0qaFcR5ANCoXtx9NqQk8mQ@mail.gmail.com>
References: <20240530210342.1540045-1-maximilian@mbosch.me>
 <CAK7LNASLi6s8AZ1R+Ab08zLBpfpN0qaFcR5ANCoXtx9NqQk8mQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow setting zstd compression level for
 modules
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: 44235258a74b91380f7
X-MBO-RS-META: ii35sh311fxg5eymunbwwtbj9toxx8qn


> Masahiro Yamada <masahiroy@kernel.org> hat am 06.08.2024 05:29 GMT geschr=
ieben:
>=20
> =20
> On Fri, May 31, 2024 at 6:13=E2=80=AFAM Maximilian Bosch <maximilian@mbos=
ch.me> wrote:
> >
> > From: "torvic9@mailbox.org" <torvic9@mailbox.org>
> >
> > Zstd offers a very fine-grained control of compression ratios.
> > Add a Kconfig option that allows setting the desired compression
> > level for module compression.
> >
> > Signed-off-by: Tor Vic <torvic9@mailbox.org>
> > Tested-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> > Tested-by: Maximilian Bosch <maximilian@mbosch.me>

On a sidenote: I do not use this patch anymore since ages, instead I simply=
 set the preset to "-7" which IMO is a good compromise of speed and compres=
sion.

That said, I think we can drop the "-T0" parallel compression, as has recen=
tly been done with XZ.

Tor

>=20
>=20
>=20
> Please use:
>=20
> $ ZSTD_CLEVEL=3DN  make modules_install
>=20
>=20
> I hope this is available widely enough.
> https://github.com/facebook/zstd/commit/6e9512a70cfe099ac6fdf4dda58b61c2e=
79bbfd9
>=20
>=20
>=20
>=20
> > ---
> >  kernel/module/Kconfig    | 8 ++++++++
> >  scripts/Makefile.modinst | 2 +-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> > index 33a2e991f608..076b18dd3941 100644
> > --- a/kernel/module/Kconfig
> > +++ b/kernel/module/Kconfig
> > @@ -317,6 +317,14 @@ config MODULE_COMPRESS_ZSTD
> >
> >  endchoice
> >
> > +config MODULE_COMPRESS_ZSTD_LEVEL
> > +       int "Compression level (1-19)"
> > +       depends on MODULE_COMPRESS_ZSTD
> > +       range 1 19
> > +       default 3
> > +       help
> > +         Compression level used by zstd for compressing modules.
> > +
> >  config MODULE_DECOMPRESS
> >         bool "Support in-kernel module decompression"
> >         depends on MODULE_COMPRESS_GZIP || MODULE_COMPRESS_XZ || MODULE=
_COMPRESS_ZSTD
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index ab0c5bd1a60f..480d47eca36a 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -101,7 +101,7 @@ quiet_cmd_gzip =3D GZIP    $@
> >  quiet_cmd_xz =3D XZ      $@
> >        cmd_xz =3D $(XZ) --lzma2=3Ddict=3D2MiB -f $<
> >  quiet_cmd_zstd =3D ZSTD    $@
> > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > +      cmd_zstd =3D $(ZSTD) -$(CONFIG_MODULE_COMPRESS_ZSTD_LEVEL) -T0 -=
-rm -f -q $<
> >
> >  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> >         $(call cmd,gzip)
> > --
> > 2.42.0
> >
> >
>=20
>=20
> --=20
> Best Regards
> Masahiro Yamada

