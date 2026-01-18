Return-Path: <linux-kbuild+bounces-10648-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8766FD39874
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 18:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CEA2300AFCD
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A3E7260A;
	Sun, 18 Jan 2026 17:25:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71B255E43
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757155; cv=none; b=REsOB9YcPwmEKpYRpqYz64lC56F6j60sFSaVV8qMR4VWtLTUBZpGJaY759nuEs8J7Bu7WPGR6uzf97XuhzwgKRPlHID/gad2sp+cIKw+irWs/VqwBuQ6cPu1da10vFEksFtcKiVpufIooUhb9PwskIlTmJQV3C7/rZ9rLVXd2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757155; c=relaxed/simple;
	bh=d1IvpdbIcX1/iRdM2LeXcfEiCIWjO5kopbkDxI12ef8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYG5vhcf0hvIE6c/F8F9hDBwWIA4mE1VdFACuZdCzIcwIRrq1d6MstoMCl0EN1JQ+DV4uZrG8yipZ3lSSrWdbdqmvLTIzJ3A/kpjax9yky+aorSSZF+qk7YtgvbbmxMkURoDHdXV9AzIDT6ry7zksVyv7eOxys5UwUdL+elipBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWX1-0007Bl-QV; Sun, 18 Jan 2026 18:25:43 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWX1-001HJA-39;
	Sun, 18 Jan 2026 18:25:43 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWX1-001bCU-0Z;
	Sun, 18 Jan 2026 18:25:43 +0100
Date: Sun, 18 Jan 2026 18:25:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	Fugang Duan <fugang.duan@nxp.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/9] arm64: dts: imx8mm-evk: add uart3 port
Message-ID: <20260118172543.gmx6p7ae43nge7vq@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-5-0f319c7e9b55@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-misc_dts-v2-5-0f319c7e9b55@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

On 26-01-17, Frank Li wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> Add uart3 port.

Would be nice to know why the port is needed? If it's just a UART on the
pin header I would rather keep it un-muxed to keep it easy to adapt the
EVK to dev needs.

Regards,
  Marco


> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 30b13b4d630f8b8b0531fad531081d4ee32849f9..8be44eaf4e1e0adc2921db8cc5f2dc69586b68cf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -627,6 +627,15 @@ &uart2 { /* console */
>  	status = "okay";
>  };
>  
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	assigned-clocks = <&clk IMX8MM_CLK_UART3>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
>  &usbphynop1 {
>  	wakeup-source;
>  };
> @@ -819,6 +828,15 @@ MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
>  		>;
>  	};
>  
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x140
> +			MX8MM_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX		0x140
> +			MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x140
> +			MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x140
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
> 
> -- 
> 2.34.1
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

