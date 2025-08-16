Return-Path: <linux-kbuild+bounces-8488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC13B29024
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Aug 2025 20:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 496671BC45C6
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Aug 2025 18:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987551FCFEF;
	Sat, 16 Aug 2025 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvdQkNMY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703476FC5;
	Sat, 16 Aug 2025 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755370288; cv=none; b=Xob1v63WvH27e5U8+W75/hUK4i74WJIFkibepG394bO+fFcYY6Pc5105aEINwyffbcDgJPKG6iCDeDrdymRC87Luu+f1xxBnmmn1BTxnRPNjcn1L//mfAjrtRH0++A7MsUQUhD/fyIbQq7Qp/YPke0UgdA+ERf1+UhLHiL/SRP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755370288; c=relaxed/simple;
	bh=ho+NIdCoi3HQIUYaUfYnsaGAjFkbEHYJmojE1QWnQK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnT3xEEUsdGLIDK1BmAmalILtPSXZQorM/NqQ2zbcF2SA7Usl+HW4GPgtrj9V6RNL/wfhtBkv3le8AfAme+rqS4rSfXL8vO1G3Ygd5JgmVBVSoAa0jPYfqGBkAnDzYk0Xp+mxa5jqlGMtgeh22XhXAu2OPpxukGA0WMc21AtRbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvdQkNMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7036CC4CEEF;
	Sat, 16 Aug 2025 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755370287;
	bh=ho+NIdCoi3HQIUYaUfYnsaGAjFkbEHYJmojE1QWnQK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvdQkNMYMqxEnGcv7bSpu4m3S3aFljA3RtAoONluLGOOY7l5DEMuomW4yaPagswdh
	 IM3N6yDIcQK2IR12v7VfFzZol9XFkVWjNntbmROTa9i3tVRBeP8LN7RSxfqGzrZvXb
	 LjQxMjD9B2/ub0vvIVOoMKuuYtcmWclaw0nb9Nn++Pk0zhBePj8NsJA5pfYtgUFaLh
	 ZLNYhFDDCn7M5JQf91xRWCkm1vUDMpyIJkUjLYPXD6ww7qvIUfti1HaGbWmh+LcmMs
	 HGgMoqnIFsvCGUXX8g8UBm3r5XU8AwDhkkEnCT27H9Tj/4iU+mhRsQwnlWeWk/9Ycp
	 7fPb8oCYyNCpQ==
Date: Sat, 16 Aug 2025 20:49:59 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] kconfig: qconf/xconfig: show the OptionsMode radio
 button setting at startup
Message-ID: <aKDS1w_2yHd3Om26@levanger>
References: <20250812223502.1356426-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BYhwT2aeQ4UXjlIv"
Content-Disposition: inline
In-Reply-To: <20250812223502.1356426-1-rdunlap@infradead.org>


--BYhwT2aeQ4UXjlIv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 03:35:02PM -0700, Randy Dunlap wrote:
> When qconf (xconfig) exits, it saves the current Option settings
> for Show Name, Show Debug Info, and Show {Normal|All|Prompt} Options.
> When it is next run, it loads these Option settings from its
> config file. It correctly shows the flag settings for Show Name
> and Show Debug Info, but it does not show which of the 3 Show...Options
> is set. This can lead to confusing output, e.g., if the user thinks
> that xconfig is in Show All Options mode but kconfig options which
> have an unmet dependency are still being listed.
>=20
> Add code to show the radio button for the current Show...Options
> mode during startup so that it will reflect the current config
> setting.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Nathan, Nicolas: do you want me to ask someone else to merge this?
>   I don't mind doing that;
>   or throw it into your tree and see what breaks.
>=20
> I know next to nothing about the Qt toolkit, so any comments or
> testing are appreciated. There could easily be a better fix for this.
> Thanks.

Thanks for the fix!  I cannot review this properly but reasoning is
straightforward and testing reveals that its really useful.

Tested-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nicolas Schier <nsc@kernel.org>


Nathan,  can you take this into kbuild-next?

Kind regards,
Nicolas

--BYhwT2aeQ4UXjlIv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmig0tIACgkQB1IKcBYm
EmnncQ//Xt9SsOW2Q015oq5Z1MuwxS9v8IDa61j71qrKxECNECRs52hYFHWFV+WV
jHEsQWLgRcIhde10Kny1nWrCJjLhwnu9s1J4aKBz7kNeF6HSOBbRxe87FDNaxTCt
C+LfDeUxSueGdIiBnnYt9eK0gJdbJXvFDsGFpO5gd4W2AEDjB9qwyniCXj7BbdDY
exD4UnTYkcq5vH3QReUKq1il1/pe5Ua/gvQ4PXSEJzGTChOAjCfDLLlI2O/m1U3v
3M8nRJjDE49EpGXMmp++AzGnDFrSmIz+PyZHugjNG6qXu0qyxOxjKH3igveIK674
xg+54hbHwVcdtIKLsjXvTpi6t/ZWryeilXqMItgJx/ZGhxMo7sL8WlWDfDiChJ8U
TD8RFGB6510u+JqphnnZO71ZMyPwNJpoQG5urK9feb9uQs1gKmsJEU6D+bCE0vfF
DAjfntCgwCrE35IGrrGAXDB6fBjErf0N9mkv7Zhk2a2MCaNNmKDQ9uyPjnCDppM5
+dyJpViAML1lqXQOJirfemdtb33kLbHkok3KXEW77yzCZ9xjdVQoZsWH4qx58QGz
6DSLt2tsCdxhKszPt+anCeO8cq97K/8JeGUF8nIOHXnbTnMuhXfEaVOuF451EXOb
e/dvnGvuu740H4jtu3Hm+kp5ANO4RF0fZ1Ki6pmUNzzcdC82R2M=
=kDze
-----END PGP SIGNATURE-----

--BYhwT2aeQ4UXjlIv--

