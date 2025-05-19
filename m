Return-Path: <linux-kbuild+bounces-7150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1599ABC7EB
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 May 2025 21:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FBB616EF4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 May 2025 19:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D171EB18A;
	Mon, 19 May 2025 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pxkBk1IV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50791E0E00
	for <linux-kbuild@vger.kernel.org>; Mon, 19 May 2025 19:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683337; cv=none; b=hnNHhlr/S4uSBNHcLY4dpunkE7mLqcAxBTk04BXK6ojy0PFhlqoNenZJhN7FxZo6LpywGJxay8ZbDj8NvWLBtVgR5xpRVGUieXKi0g1BmPf+a6c0wV/zG1e1UqvJrMufYAIjsTaEAsGmX7RXULjsJSuVfcjpqfXsX4yv0UPLT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683337; c=relaxed/simple;
	bh=dNKjosJLueeqCShW3qsGQWVuvaNE5ktvOIjXBgJjtaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvdbfPpCHpeS5NxsIIzbeBqQTzHLt7CSvRBhcrX23YHu0+tTx7aeARcNJ6uk2CCHpIgDeaeFdDxVMGN1YKVj8jstfQI0rih6JScxysv8xIfP5VjjvKcnXUKEjop1nHngaualv3L95JGMFI/eonfgrmfI5rfya1Ec7zAzHnrj3S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pxkBk1IV; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 19 May 2025 21:35:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747683322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n+wW+OjTf7KzE0AEC1/HTE1v3dpfIn3575ctYuyIKZg=;
	b=pxkBk1IVqhFPQ8DCK4cE32LRKaCYMrdxTzbtiXA9K4Zt9LzNRCLKTEY1P2DrFS6NxkuQMW
	5hR8Szekm9tutnhrOqoKcf/d91wa9OKJyDmM2J/PSPaQcGsrDs8S5VJybNtUUOTQMjSWxl
	rjqNP6Gn+T5olB5JE3jdiX6gQG4CZ4s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH] kbuild: move kbuild syntax processing to
 scripts/Makefile.build
Message-ID: <20250519-impartial-puzzling-limpet-73dff9@bergen>
References: <20250514054635.93577-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UpJDNWE8uQy8XWDr"
Content-Disposition: inline
In-Reply-To: <20250514054635.93577-1-masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT


--UpJDNWE8uQy8XWDr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 02:46:33PM +0900, Masahiro Yamada wrote:
> scripts/Makefile.lib is included by the following Makefiles:
>=20
>   scripts/Makefile.build
>   scripts/Makefile.modfinal
>   scripts/Makefile.package
>   scripts/Makefile.vmlinux
>   scripts/Makefile.vmlinux_o
>=20
> However, the last four do not need to process Kbuild syntax such as
> obj-*, lib-*, subdir-*, etc.
>=20
> Move the relevant code to scripts/Makefile.build.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/Makefile.build | 84 ++++++++++++++++++++++++++++++++++++++++++
>  scripts/Makefile.lib   | 84 ------------------------------------------
>  2 files changed, 84 insertions(+), 84 deletions(-)
>=20

Reviewed-by: Nicolas Schier <nicolas.schier@linux.dev>

--UpJDNWE8uQy8XWDr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmgrh/cACgkQB1IKcBYm
Emm2Og/9FUHs3iPOJkjwrIajPAj063lJ1K4mc/+wqOS0NAaUYolZusOiLv5zf2Y5
Q0C9JQlGbq1k5GK9wiXQSLaTjrWWA52ZATbviFMomozkvCwNF3nCyirFl3PVaEHB
IW/WAI7w6gg54px9whJlnZMf4P6cgfuqJXByO1QuGgyeHgagzkAzwtkIwjPa6otI
3Xw9qyC7h2xxIWuGCCIbqIuVpB49cETOHAwpvctoDNDKfVM3O7tijTyFD8MZ5yRU
QhX/1Uxi9xH+gzHXBLWjWt7OZherF22rFJcABbfiLTg6+FVMKNTfyhBqvk2gnUSI
KANpixAJnVw2HsGJLC3i+QatSNvnEFOZd/w53uJi11qWDwZPU3RzLEBAMYq+5vhi
pQjVfM5C2xwK6MC+zgM8k5xxbpHsqn+E5rLONpmZEdlC2B4gNT7maCaYsv19pDTq
Wpk+3LLhYPnQ8MG3qFNaupiQGTYzahpCmrUna4IUTQXh/8fvepUYBPxMte1WyNTT
jo7oei6NU2/qI4VUVh2zUwnfs3iDApHonpf3ORO91XDVfhj4kCFFgqKcFDArXMrD
eYT6FKkCqrgsNHamWAQtlKjWRp6KSQULW5Esh/mWS5j4RVFKEC8pQdxDf5vGik5O
noPeP6nWZOTEp9rcSWWNuurNyEmsWtmA2nA7g5Obpk1gf3u4W+s=
=/0lX
-----END PGP SIGNATURE-----

--UpJDNWE8uQy8XWDr--

