Return-Path: <linux-kbuild+bounces-8585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D3EB34BA1
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B981B20B51
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2659D285069;
	Mon, 25 Aug 2025 20:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzFUEJLx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22DE2367B3;
	Mon, 25 Aug 2025 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153242; cv=none; b=i53dJ7kS9W7vVP8LeYHyyuH8Eg5e0RrsOu8oWOrZ6PwaUKm3w2w9qQRSnNt0muf2moo8I9R4id8h+M/Q5HHVVd8H40UWhEO9NSdXI0CkuLpusxrijXyAQBbRzHRxhkdmJwHsHWG5tzgmUfH8pNTa2BRdmKbrHFHmeUJ+m1pUzpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153242; c=relaxed/simple;
	bh=pLzmSkU2N6kdiHTKVy/LxO6tuao1DyXVwvxK6YJeMss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhZ0B5U+Taz8q+U4G9JZynxsMpntX4Yd3CPC9xen/e0FkxdJAzQGbr+LbdAzrj5UeVEta/BEWETxa3v2sRl3F6D9fmbnugRXcTkUzv1yNiROpD9ZBHb6PcWd/YgrWX8N4SgjYvRr4FtZAvqk2smqBCLu7f9WSK6CXAvht60ACZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzFUEJLx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20130C4CEED;
	Mon, 25 Aug 2025 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756153241;
	bh=pLzmSkU2N6kdiHTKVy/LxO6tuao1DyXVwvxK6YJeMss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzFUEJLxAHutIHQHziiEdc74+VYd2asXBGezzAm4VOZyAg6KRpdnB+tpCkMXNtxp6
	 xW0wRMWA4/vcsauGC+V7VZpzeunCSFcX+ubh9u4QDe36bI9VCsl86OY3n6yH/HHr/c
	 PwYD/4PACUnQ5ERfou7BknIhhN29QVLXF7iZ9uhiTDY9RSokyL6YcA1F3vlY4C9oEL
	 UENmBu7qIJJk2Lun07ZlwtYBCFAWOUmULJMRNr0DjzZboJkynO5INTsuaoLXGbuuvF
	 0vvWORTYNjdeSGTbUL4AEOaDY9NnX1Zyxi1m9qGhohmPeG3SYRH4sUoXFzb1MBtVjd
	 29MSOvEy7MgCw==
Date: Mon, 25 Aug 2025 22:20:13 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts/misc-check: update export checks for
 EXPORT_SYMBOL_FOR_MODULES()
Message-ID: <aKzFfToXptoHnrxI@levanger>
References: <20250825-export_modules_fix-v1-1-5c331e949538@suse.cz>
 <20250825170710.GC2719297@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CHypDR+6IYo16V8/"
Content-Disposition: inline
In-Reply-To: <20250825170710.GC2719297@ax162>


--CHypDR+6IYo16V8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:07:10AM -0700, Nathan Chancellor wrote:
> On Mon, Aug 25, 2025 at 05:00:37PM +0200, Vlastimil Babka wrote:
> > The module export checks are looking for EXPORT_SYMBOL_GPL_FOR_MODULES()
> > which was renamed to EXPORT_SYMBOL_FOR_MODULES(). Update the checks.
> >=20
> > Fixes: 6d3c3ca4c77e ("module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to E=
XPORT_SYMBOL_FOR_MODULES")
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> > I've missed these new checks when renaming the export macro due to my
> > git grep being too narrow. My commit went through Christian's vfs tree
> > but seems the script is part of kbuild (which is currently Odd fixes).
>=20
> If this needs to reach Linus's tree to avoid warnings, it could go via
> another vfs fixes pull request with our ack or we could ask him to pick
> it up directly (as I am not sure we will have a fixes pull request this
> cycle). If it is not urgent, I can pick it up via kbuild-next for 6.18.
> I have no strong preference.

Hm, you're right, the check will issue false warnings (and misses to
warn when it should) without this update.  Therefore I think it would be
good to get the patch merged soon - even though the warnings are only
issued with W=3D2.

So, I second asking for the patch to go via vfs fixes or directly via
Linus.  If it helps:

Acked-by: Nicolas Schier <nsc@kernel.org>

Kind regards,
Nicolas

--CHypDR+6IYo16V8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmisxXEACgkQB1IKcBYm
Emme/hAAjCm0NHBPa3ayDeqMNqmqVzxut7huter/Q5H42PaTpZXPB2FxTaMOlcUM
c2/mthQR8SEKhH4w8/+Gwm2tyoWi12Ezx0C0FVCVS5DvVk7v5JRPnlxIml0eQL/n
ZtyVUeF6kMeiE3PSe4Hd1MhJnePim5qXTw+0+jDZk2hMdPBQRKArEnaMO3OzMPSn
7Iyg1fUtpAB//iVA0VGGsdAf9gj5oEdQUmo52GONsTWTGvAbQt7ZQ1bKzBRD08Dq
Y2vf5Nfg2/72eOv9VztyOX//cYTjqx+lFt0nd0Ll+cdt/od3c8B/tA/oD6CylAII
AS1z6PupU0JD64WEgflkQLU341mwCr54r1SXQPCFTLehQyzZU8JeeR+J8/tNyFbO
d4M3eGmDKPI3qoF8GPp6jzL2HExGUoxo0rty5aQsBqAsEs3JT88JQYLLZjyvKBmy
EE58SttIVGPvAm1kxUqHU8K0NzaZn19nc2YmPb9+M7F9Yk7ZoyNJCPdfeM903Ibc
guQbldPqE2RIEIbXHOT8ammKKbOnBKguUzOR8xDa2/0nvOvbMZbBAIStO9bnipMD
XcuX2B5LhzF7DGcdQTKBqU/Fa8PrEuuVsjBdJaCGnS47KosGefn9mtioIMJpkXDf
LhrRDQCkALNGRoXUddLN+vCLW8IIudIDODD7pZ799T7ocdO3Y5I=
=hgNE
-----END PGP SIGNATURE-----

--CHypDR+6IYo16V8/--

