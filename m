Return-Path: <linux-kbuild+bounces-434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA3781EE78
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Dec 2023 12:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D5911F21627
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Dec 2023 11:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB3E44378;
	Wed, 27 Dec 2023 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="i3GT7Yk3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1278B446A7
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Dec 2023 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1703675191;
	bh=hzoqkGXMJoG4W/65dYdEwFFiktQvIVhMBsE8Rkg8xEg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i3GT7Yk3dgV9Nz2/kA81h4kHlT2mfgtjaSUO7h1ZATAAh020KofBEcryzzxgGkNPu
	 0luMa0zMoatAzO/OecmH9RVIsBVk+JGazHusDgQDR5bsOn42KSo2oG+L+iacdpKWwn
	 HVny7NdNTLoBEjEldmaw3MkynMMQQKxGwgx6acQU=
Received: from [192.168.124.20] (unknown [113.200.174.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 644556698A;
	Wed, 27 Dec 2023 06:06:29 -0500 (EST)
Message-ID: <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
Subject: Re: [PATCH] modpost: Ignore relaxation and alignment marker relocs
 on LoongArch
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, linux-kbuild@vger.kernel.org
Cc: WANG Xuerui <git@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor
	 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Youling Tang
	 <tangyouling@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev
Date: Wed, 27 Dec 2023 19:06:26 +0800
In-Reply-To: <20231227070317.1936234-1-kernel@xen0n.name>
References: <20231227070317.1936234-1-kernel@xen0n.name>
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

On Wed, 2023-12-27 at 15:03 +0800, WANG Xuerui wrote:
> And even though the kernel is built with relaxation disabled, so
> far a small number of R_LARCH_RELAX marker relocs are still emitted as
> part of la.* pseudo instructions in assembly.

I'd consider it a toolchain bug...  Is there a reproducer?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

