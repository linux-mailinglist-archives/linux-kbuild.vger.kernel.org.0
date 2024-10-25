Return-Path: <linux-kbuild+bounces-4321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EBD9B00EF
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 13:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B07FB21E09
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3181FC7E0;
	Fri, 25 Oct 2024 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="JDdCwYU+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F21DDC00;
	Fri, 25 Oct 2024 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729854861; cv=none; b=PssrMVHmQJg4+mGg26qkNynFkTvqXZAqCz6s1FUXUw+j/6a12yiJz9QupEZweyoSnVnp91l3wDq+of+zYZeWSQfMbIyvBY+eg5eacmEGf11D+XG2BSJHSDpTs9J/m2HS0ooMEJjuK02u45R9dSBQxQgCMWtjfsyW6rmDRgLcacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729854861; c=relaxed/simple;
	bh=B+747j0aK3+n7BqEZqoY3Ww/63/pDMcDKJ6GtZEvXpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HCrenhkJ1Cz5o9+QUQ8TsKsjJildNNJpOF41tlbaf8oUk+yfcc6+3Qcu+UtmAmcdnoDKQmxGd/y3KvbjUviH8D0bazAZdon644yYXrm7a/vylUDNCf0y8+UQP11puHgXdo3JwwF/llqm4kVDV+qZuSFA9M0QSCXv1bgl1mCyuOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=JDdCwYU+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729854853;
	bh=3dTjQaZVR+uUWkKmz4Z6BTzpk5RdKUpw1NUIL1bkTsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JDdCwYU+pIh2r5q1s2zMIl8JJAxp4Mc5pqUoV9hEImpLMfsAta+MtHEBioXUeqUeu
	 sE4DWPV30C1FRZ0w0APFbcKUStTjXflEHCuCkgB9yDjDwemgMpnydJPcmcakilNH68
	 4aR2rNapZ5I26DJZI9TrRMzleYLvjtMTwpMZwS5Sfd6k+OjxQIOeNwX7z0xuaP/AEC
	 8VB66kRdGmfbjwiDL02t9nUyx8FVgmsMJnCiUXRn4hynxDe26ZP2DNG0FdMFQL+pm2
	 gS9la62LQcFMsLA1Eiz7y1VSCuefBNTzhPLxEpbIjkN7yVYHFiz14Wbv2ECd35b5Vd
	 wa5ZKCXQXlv5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZgCN5Rwbz4w2N;
	Fri, 25 Oct 2024 22:14:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, Daniel
 Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
In-Reply-To: <20241023-extended-modversions-v7-1-339787b43373@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com>
Date: Fri, 25 Oct 2024 22:14:06 +1100
Message-ID: <874j50juyp.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Maurer <mmaurer@google.com> writes:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
>
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
>  kernel/module/internal.h        | 11 +++++
>  kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
>  kernel/module/version.c         | 45 ++++++++++++++++++++
>  4 files changed, 162 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index e9bab599d0c2745e4d2b5cae04f2c56395c24654..02ada0b057cef6b2f29fa7519a5d52acac740ee5 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -355,6 +355,24 @@ static void dedotify_versions(struct modversion_info *vers,
>  		}
>  }
>  
> +/* Same as normal versions, remove a leading dot if present. */
> +static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> +{
> +	unsigned long out = 0;
> +	unsigned long in;
> +	char last = '\0';
> +
> +	for (in = 0; in < size; in++) {
> +		/* Skip one leading dot */
> +		if (last == '\0' && str_seq[in] == '.')
> +			in++;
> +		last = str_seq[in];
> +		str_seq[out++] = last;
> +	}
> +	/* Zero the trailing portion of the names table for robustness */
> +	memset(&str_seq[out], 0, size - out);
> +}

Sorry I realise it's version 7, but although the above looks correct it's
kind of dense.

I think the below would also work and is (I think) easier to follow, and
is more obviously similar to the existing code. I'm sure your version is
faster, but I don't think it's that performance critical.

static void dedotify_ext_version_names(char *str_seq, unsigned long size)
{
	char *end = str_seq + size;
	char *p = str_seq;

	while (p < end) {
		if (*p == '.')
			memmove(p, p + 1, end - p - 1);

		p += strlen(p) + 1;
	}
}

The tail of str_seq will be filled with nulls as long as the last string
was null terminated.

cheers

