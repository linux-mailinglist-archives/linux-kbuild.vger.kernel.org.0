Return-Path: <linux-kbuild+bounces-6162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4ADA62BDE
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 12:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C888189A409
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 11:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76571F5859;
	Sat, 15 Mar 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NFTaNFnX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3701E7C0A;
	Sat, 15 Mar 2025 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742038466; cv=none; b=phewRNmoT/51aOT77qo7IGd/xdfG3swCXLhnbOo64gbjw0L2lzIEu5Cb389gZrNdPc0XDXLF6p6Iv5gCQrJpaR08H6uABFIoamenLDCmFFOJxtOB2k4wuXEttRmdjALm1W1iFXnV4xy0rZZt/IeJAEawx7WFmYo5BTFdyGfOqvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742038466; c=relaxed/simple;
	bh=rAr/1XOPL6FtqBP7vv5nuWJT+lCTu+U480Yk0OYPEbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZSeFXjECuyuTYviJrfBq93aJkjPeD/xOOLAbj/5exootU/LatWhux57nnOHpJQGHhxuDxx4E+rEwqkkJdLjX9Equc701F+ekQCkfYYpSlJ6s8yNRsYscutXqoBBr+mTt4YbwxDysAsdRpaNW0KxLhEE5M8gPfhXJSKP/MpFq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NFTaNFnX reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4432D40E0196;
	Sat, 15 Mar 2025 11:34:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8hxDFu0D7Fcd; Sat, 15 Mar 2025 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1742038456; bh=gSgNTrF/QbgbsMwtMJwfKMFZleoPJK4pQUmP758rID4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFTaNFnXZu8gdd3lmhmwHKKY80bmsVlFIKp8X4xobVPQp/fskNrr3xVJLi4/MIGKF
	 vpxvmjvjuYWPKBZtAEksOP71kOwnBEHE8OIqKNLuFRhY4h2nOuFcL22EK024MoZjAu
	 agG66/ZLG30Z3KDAXezZvQkjpsGXEgAvikFdbxxmAH2vU+uiBHHu1hGiwNP/e0lT1y
	 Yfqw75n6mgteMJEAh/vdElQ1MqeKFiCL4OaokG5FHYRd1JHlrhuuRqSfasatXZz1T+
	 /vftDQWftmtC38r8FsMA2cuuXUeE9GQdQ9h49O0jpMCPpb4rRGBur+wspujvlBOW3E
	 kd/DAnnOP8fOtGI4bvv4thxHAH6UqJTYQjdTJ4QVFaF2hz8oUuHvdn0ynzofnnXwAW
	 hxXrM/9LcYmnuJcjZTpGFKso3CS3RAriU9g2VF0+LgXG2Qh0CFpksqRhseGEQDn4o7
	 HgRxEnwu/sGKMLAYXmTvLyRFITGXcXNsxV5wg7AUrOhxrJn7kV014tgLovY4pZotpJ
	 sBMVrXobTawJywQ4NbUVKdkzMRPcSLbKuGlpeVZN8ZXO7piLLnhmqTqfJNwof5ldel
	 GXGWsgKWw5KaQrwHDl7rCQ2hCUKven6PRsP83BZk8lfJr2wWGvLjoUHsLQURFKBwmp
	 P4y4JU8BvXlVW3yE9daJKp38=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E3AC540E0216;
	Sat, 15 Mar 2025 11:34:01 +0000 (UTC)
Date: Sat, 15 Mar 2025 12:34:00 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] kbuild: make all file references relative to source
 root
Message-ID: <20250315113400.GBZ9VlqIBVsVdzlRAb@fat_crate.local>
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 04:59:08PM +0100, Thomas Wei=C3=9Fschuh wrote:
> -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> Other references, for example in debug information, is not affected.
> This makes handling of file references in the compiler output harder to
> use and creates problems for reproducible builds.
>=20
> Switch to -ffile-prefix map which affects all references.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (4):
>       kbuild: make all file references relative to source root
>       kbuild: doc: reproducible-builds: drop section "Absolute filename=
s"
>       x86/boot: Switch to -ffile-prefix-map
>       x86/boot/compressed: Switch to -ffile-prefix-map

Btw, I don't see why those are 4 patches - it is a single logical change =
that
converts to this new compiler switch.

So why are they 4?

Masahiro, might as well merge them into one...

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

