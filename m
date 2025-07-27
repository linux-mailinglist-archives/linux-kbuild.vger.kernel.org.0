Return-Path: <linux-kbuild+bounces-8212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC8B1305D
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 18:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD8F03B9D45
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 16:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C4021CC61;
	Sun, 27 Jul 2025 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ok23YiIS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC8221CA1D
	for <linux-kbuild@vger.kernel.org>; Sun, 27 Jul 2025 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633177; cv=none; b=mKw0qWVA5riS4U2vqSr1Q6tKo+GTx/GAImu2zr7yE8vkknm0goYn6arrOYNC3XfQSfdlFqH0OMwlZZRmtwQecflZqbHfHSYsIIEWMez0VUBVff5+xPE8dxujY7MRrC3bnLgFIw68xk3dfmN7Rd+lTC+uBGgMudEaIu+7C9fzKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633177; c=relaxed/simple;
	bh=s9uQMK1Laab7639F3WTkJCqJPlOAZeptFCmbykf/7H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtUpkS+PtqIjfcyH3X+SO71qsPaFucsg9X4tdUmb2P1MBSdstDjGhSy+4AWRZ4WSVaJPxMmDAKnDgAiS3wbqRXdW6Xd+ZVkn6UgZDXcKjyrZ4R71WR7GxXXdO0dIopuRdG7p2raL8WnY7a67HBnklrIwjXPjf5HuyVTdjMQDOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ok23YiIS; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 27 Jul 2025 18:19:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753633162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHtI54miqvpx+GmBVS8akWO3rxYdH4MNb3xtJUA70Gw=;
	b=Ok23YiISoyrUWalu7GsTzAAS5b1JZBZdyrdI9xIqpgYuE6nzJHQf013piv+lrTYord1RaA
	/4tQwAQ+Z2aA750OLyo78lTngkJv3cuh74EKISzGlBOLJ8tEX4CAQUcRXrhO9rhsw3l+Hu
	Gv1c4RFgkPv7td/9P4DeBWUDFsXgPIE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kconfig/lxdialog: replace strcpy() with strlcpy() in
 inputbox.c
Message-ID: <20250727-fortunate-jackrabbit-of-dew-4efe3a@lindesnes>
References: <20250726175524.146459-1-suchitkarunakaran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QBmryBK/OfqutvY7"
Content-Disposition: inline
In-Reply-To: <20250726175524.146459-1-suchitkarunakaran@gmail.com>
X-Operating-System: Debian GNU/Linux 13.0
X-Migadu-Flow: FLOW_OUT


--QBmryBK/OfqutvY7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 11:25:24PM +0530, Suchit Karunakaran wrote:
> strcpy() performs no bounds checking and can lead to buffer overflows if
> the input string exceeds the destination buffer size. This patch replaces
> it with strlcpy(), which ensures the input is always NULL-terminated,
> prevents overflows, following kernel coding guidelines.
>=20
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>=20
> Changes since v1:
> - Replace strscpy with strlcpy
>=20
> ---
>  scripts/kconfig/lxdialog/inputbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdial=
og/inputbox.c
> index 3c6e24b20f5b..ca778e270346 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prom=
pt, int height, int width
>  	if (!init)
>  		instr[0] =3D '\0';
>  	else
> -		strcpy(instr, init);
> +		strlcpy(instr, init, MAX_LEN + 1);

oh, I am sorry for the bad recommendation.  On my Debian bookworm arm64=20
machine (w/o libbsd0), this does not compile as strlcpy() is not=20
available (same as reported by kernel test robot [1]).  As libbsd0 it=20
not a documented dependency, strlcpy() should then probably not be used=20
either (and Documentation/process/deprecated.rst also argues against=20
it).

So, keeping close to Masahiros mail [2] a few weeks ago, what about=20
this?

	else {
		strncpy(instr, init, sizeof(dialog_input_result)-1);
		instr[sizeof(dialog_input_result)-1) =3D '\0';
	}

Kind regards,
Nicolas


[1]: https://lore.kernel.org/linux-kbuild/202507270411.j9vfofzH-lkp@intel.c=
om/
[2]: https://lore.kernel.org/linux-kbuild/CAK7LNASH7HyQZtPjerws7K8Smn1OXeDA=
XODdB9VaULXiYOitQg@mail.gmail.com/

--QBmryBK/OfqutvY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmiGUYQACgkQB1IKcBYm
Emli+w//SUVsN+chXVlcEjE3Lw3iMsN+2Msp/4UlF55CFhKksmyv/zWjeoijX3SG
B9gPTKx1iRw8wyL/uOigbrlXfB4hW/65rj0YbKSlLHTLCL1N6WGh2kRiAfAceJnx
lzbtXrTUU4Z+DUn/mJ2frrd/mdw511wX8nsIlK3wG5AIDeN54/SNeoaOHTd5e9WB
2dMbFiZKYJ+gD8rslOzjl++BortpogU7IXQ/uw9SnrhzcEa538J0C/Iout0gKvOD
feTMYNRq50J+uCx8TK5VUp/iIFyJh4rNnWFaYA922ufHRvcCMUF3kgFAAYgpIJya
EpbvW27jiQLQN8umCyQ9+FqH9gUeSrNizbZFyAy604Evif/GiM5x7ImEvK75B4sk
tL+mgNlmwlxOCme+5yckUOjoJwXh3puWOeHs1GALS4MBGypX5BCJUB1o/eQKUR3r
BeuEvVYL3Eor8QQALITcByXbDAHUktzOSfnz/IrnSVmf+1Kpk/P+3ofxNrOCak6Q
JGK6TjGmw02xDRALmiYg2t/sgfR5EEjf3PVM+Y+JBUm6F0NNeXbP7Fe1fikRYZAG
WKiu8uNj3Cgyh817WQQBeeBIQTfZL7qm22M5YtDVWI0fYFei2i1Rnp9owCmZ7toe
NgTHabpQcSzxzZxP/OZwwo1vbtWAiCiiDDTAJ9N/zyDpse6Y3BA=
=hYYp
-----END PGP SIGNATURE-----

--QBmryBK/OfqutvY7--

