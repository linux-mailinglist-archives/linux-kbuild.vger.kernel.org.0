Return-Path: <linux-kbuild+bounces-1451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDCB8963E2
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Apr 2024 07:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95DA81F24371
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Apr 2024 05:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FDC45BE8;
	Wed,  3 Apr 2024 05:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="ePzR1yDU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB99A6AD7;
	Wed,  3 Apr 2024 05:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712121312; cv=none; b=hfDBEOukDXBohIoVJE02iMdjUQZIZSmcgNfKC9jS4zUOq59rb/0JMmrEuxvcmu4JiQGJKl3BPIwsR9JySwT760YGl61JGd+l70n8y7RD7XNFI+fOQzSttGvsIMqtdvGRpplWMYpKM5xEocTXYWeoGJ3FYbz3z1s0HeQQCsX3Meg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712121312; c=relaxed/simple;
	bh=JKf1Lfs7ylEsEEOL0uKm/nUWXlj1T7i7XJwXyVCXK9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VpHzET+c91W3TbBsh3m5P87Ef2oLHIiVFYQKLDI62syIztB1A+vtc1SZwjRnLAuFkFamvaYQ0zowalGOrkyLljlUmHvhAIy2uhH1JKLyTLBYI5JXffoDZOvgk+BE1Bjo8nsqW88VUFh7TewQxzxbyLRJHRW9sJMNdsh8SEs7tO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=ePzR1yDU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712121305;
	bh=5J/vLQrpGhgqQsZ80PIigutoMIakBJ7aJJ3MmitBdiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ePzR1yDUO9Ongm+ac85mPhRRna7nfIhqLmj6fcYtsfm/+VsT2swGklamXED769K86
	 +O2uDG2SxnIrqf1h3rKHWnvKUeGaljSokCgXKVkSE2sRjr5pDFQnYuri0p2Nr5NANy
	 KHQdBzAVt+06DJ5eCBlUMps59rQQIiGKnixdoUelOTpLyE0DaSnpC1tYMsta+zbqpF
	 f+ZPITtVqkgllb04gGzxYatpkuyG0At88rpzIhcFPR2XYLp2vu188YGM2ZI9vT6hCC
	 WH+jNN8xeMetg9wYgTknycTmi/+w6/KwqvIXQwIYERRlFdwZjr2+vFm3pq1RV7O964
	 ymrcVWrFO11rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V8Xxg6QZqz4wcg;
	Wed,  3 Apr 2024 16:15:03 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Dawei Li
 <set_pte_at@outlook.com>, Damien Le Moal
 <damien.lemoal@opensource.wdc.com>, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 linux-kbuild@vger.kernel.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Subject: Re: [PATCH] serial: pmac_zilog: Drop usage of platform_driver_probe()
In-Reply-To: <5ea3174616abc9fa256f115b4fb175d289ac1754.1711748999.git.u.kleine-koenig@pengutronix.de>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <5ea3174616abc9fa256f115b4fb175d289ac1754.1711748999.git.u.kleine-koenig@pengutronix.de>
Date: Wed, 03 Apr 2024 16:15:01 +1100
Message-ID: <877chf81t6.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> There are considerations to drop platform_driver_probe() as a concept
> that isn't relevant any more today. It comes with an added complexity
> that makes many users hold it wrong. (E.g. this driver should have
> marked the driver struct with __refdata to prevent the below mentioned
> false positive section mismatch warning.)
>
> This fixes a W=3D1 build warning:
>
> 	WARNING: modpost: drivers/tty/serial/pmac_zilog: section mismatch in ref=
erence: pmz_driver+0x8 (section: .data) -> pmz_detach (section: .exit.text)
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/serial/pmac_zilog.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

I gave it a quick spin in qemu, no issues.

Tested-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zi=
log.c
> index 05d97e89511e..e44621218248 100644
> --- a/drivers/tty/serial/pmac_zilog.c
> +++ b/drivers/tty/serial/pmac_zilog.c
> @@ -1695,7 +1695,7 @@ static void pmz_dispose_port(struct uart_pmac_port =
*uap)
>  	memset(uap, 0, sizeof(struct uart_pmac_port));
>  }
>=20=20
> -static int __init pmz_attach(struct platform_device *pdev)
> +static int pmz_attach(struct platform_device *pdev)
>  {
>  	struct uart_pmac_port *uap;
>  	int i;
> @@ -1714,7 +1714,7 @@ static int __init pmz_attach(struct platform_device=
 *pdev)
>  	return uart_add_one_port(&pmz_uart_reg, &uap->port);
>  }
>=20=20
> -static void __exit pmz_detach(struct platform_device *pdev)
> +static void pmz_detach(struct platform_device *pdev)
>  {
>  	struct uart_pmac_port *uap =3D platform_get_drvdata(pdev);
>=20=20
> @@ -1789,7 +1789,8 @@ static struct macio_driver pmz_driver =3D {
>  #else
>=20=20
>  static struct platform_driver pmz_driver =3D {
> -	.remove_new	=3D __exit_p(pmz_detach),
> +	.probe		=3D pmz_attach,
> +	.remove_new	=3D pmz_detach,
>  	.driver		=3D {
>  		.name		=3D "scc",
>  	},
> @@ -1837,7 +1838,7 @@ static int __init init_pmz(void)
>  #ifdef CONFIG_PPC_PMAC
>  	return macio_register_driver(&pmz_driver);
>  #else
> -	return platform_driver_probe(&pmz_driver, pmz_attach);
> +	return platform_driver_register(&pmz_driver);
>  #endif
>  }
>=20=20
> base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
> --=20
> 2.43.0

