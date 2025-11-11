Return-Path: <linux-kbuild+bounces-9560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3DC4D04D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 11:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FBF427CD1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439F3338F5B;
	Tue, 11 Nov 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="p+vIozFq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx-relay106-hz1.antispameurope.com (mx-relay106-hz1.antispameurope.com [94.100.133.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E120F338F26
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856048; cv=pass; b=cIwgPamVZCptzF3psUxWmrqOoyLumYUmSvsfCO7Zk/UmGe2/S3HQ0ldxv+JJHBurSU/2zxmDQECQebc0P+hSJ61AAbbbkU6lChCWAYbdPdvkTHypPE5rvGG0/a+QdA065h72pA1l9TfEQ+DKfK3o2Vfq5o4C+QzxlPT0QSgWYfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856048; c=relaxed/simple;
	bh=qffjGVKHGKbLT2g/i1slYDW6JONYYo+k1+ICy3WTD/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXwlXl0Z79s7lmg6pwYi/VWIhJpzewjdEasZE9rLBV+odpYKHvf4aMiS3bm9Hw74Ib3STYk5fjeJvsJ83/mv9t3sAcgHbzcbxtWTE2dOhmWfZR2XHqgZpRyXbHLtYF7ap2r/Mj6IdI+Kc7DCFrfS2E+hPe4i7wKBKgzRlVAu74A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=p+vIozFq; arc=pass smtp.client-ip=94.100.133.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate106-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762856023;
 b=LATsIJpjkXo9Bq6OTgN891Vd5yBiaU3YiHEZeK3jsv1lXHlr+OzRJRKIvZ6rI8CNMXXyAVgx
 HtaYGQBerfwDB84UD5wXw2eYtgHcfCvbgm/RNUOr1b8b5hx+6/sw8th3HphaqxQD32JRxOlsgRI
 2YvYPzHCl0MlIY6KxAjqLAJot8ObtoqhevymN5d8qVz5Jawgnky39z1FY3TYtCHOHhllTBABkHN
 RjbzdMD3BdPUn5UlNOL5XDLT0mWG7rJctrJbLc2QTgaRdlGpcZe5Vp5xg0etIfxXVAxvI47vvnt
 zHpkXhNxS+FY9H3csdM+cSZV6fDsdLzU97rp1VR5HeQBQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762856023;
 b=GSCDJ+ujA9cwn1/Y3bZyGyzj0r+7WvkEGDnFIfcvvnkKZTh2N677R1rX7cSQC2rOHIkQqT2T
 XlOimC+TH2iS0BHkGQmsLOuVF/iJHNmAaH8T7ZtGgfZISz0qNC4MKjSUbOGLv3Eon6cAR5Ji5kO
 WN+OfOjNC+wEIaRqbxtwsu+rprcd4wdw4Ux8n/80Drt2iyqP8cRuv7u0IkyPb+XJKg34Nr+5Piv
 SoegcMhCVSjRqE5Uk2z+isZqGZTpaRikPDmzJC4CgpjHeT8qxo7tDJtQf/hjKYMwwI+j1gSkijt
 GjXUdwDmGmdMaDPn4F4DI7s4YFHuoRg3T2X/3W92nxBEw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay106-hz1.antispameurope.com;
 Tue, 11 Nov 2025 11:13:42 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3B9AC220C9E;
	Tue, 11 Nov 2025 11:13:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] arm64: dts: imx8mm-evk: add wakeup-source for usb phy
Date: Tue, 11 Nov 2025 11:13:25 +0100
Message-ID: <2809731.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
References:
 <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
 <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-kbuild@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay106-hz1.antispameurope.com with 108FA11C9E97
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:98cd9670ad177dc9a441365add1c322b
X-cloud-security:scantime:1.834
DKIM-Signature: a=rsa-sha256;
 bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762856022; v=1;
 b=p+vIozFqwZj4iqUews4mwtDjiLWiisZToz2Mum1MxMm3yI7hM4hnlczbWxYp16V23Zt86/1P
 GezA4aThhubrNV2Jz8K+b7J8UXRuq3zNWI/i1r95sDla+tO6kOs/vWwZWO7eoc2ZnTLlwxDbXeF
 iduZsnybPuSyaCf2/kBtPwcPX63Xa8jzQGVPVJtwQpYF3rrfKdWPS0cCm7CmjGPcPYI5FCNIZ24
 KfxKY+sWEftZpOgxh8Bp7Uj40zpGNyZXkdv/nn8mFSoL3jAW70RT7TUajBUam8Y9THZQc5HHSMv
 aul//HWLH2aeAHOekFNJMEh2f+I4OAUZuZJ2xhWjqM9dg==

Am Montag, 10. November 2025, 21:54:44 CET schrieb Frank Li:
> From: Li Jun <jun.li@nxp.com>
>=20
> USB phy can be wakeup source to support wakeup system from USB.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Typo in subject: Just imx8mm. Remove the '-evk'

Best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mm.dtsi
> index ed8b4843acb4804379ba025e83a63fe962c2937e..dfff164db827e80ef8822ae33=
0fa604d1642f6f9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -274,6 +274,7 @@ usbphynop1: usbphynop1 {
>  		assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_100M>;
>  		clock-names =3D "main_clk";
>  		power-domains =3D <&pgc_otg1>;
> +		wakeup-source;
>  	};
> =20
>  	usbphynop2: usbphynop2 {
> @@ -284,6 +285,7 @@ usbphynop2: usbphynop2 {
>  		assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_100M>;
>  		clock-names =3D "main_clk";
>  		power-domains =3D <&pgc_otg2>;
> +		wakeup-source;
>  	};
> =20
>  	soc: soc@0 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



