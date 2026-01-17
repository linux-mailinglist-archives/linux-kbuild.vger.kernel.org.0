Return-Path: <linux-kbuild+bounces-10620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 790B3D38BBB
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 03:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EBEF300C36B
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 02:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AC3301004;
	Sat, 17 Jan 2026 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOdeCkWM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF41FC7;
	Sat, 17 Jan 2026 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768617808; cv=none; b=etKvFQZMOaiIuugFjzZWtQtycoYe+lyFwuvZDQsjlVEPK3EzDYNAEhNh7leTFI1dqKoWzJ/GE8W8nZa66xzu+eIktv1B+wGNd3y5WuAw6N48Tx26gwhLeMqInEns94Vkt/0niGnsc8GvBzSkCtp6b2AIs3VG+dqSvuUEDE5ksjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768617808; c=relaxed/simple;
	bh=M8I0P+6+kQfZVYRfMsIkrT3kwJeTYt5m5hoJ5qwOuIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYl6G3uJcBmv69kz4R76xqSdLlsBws7zVIgYUdbxZcfufiyx7FahUr5s+rXL5iYNFua/5ZLrQzmU5bRqECAPhy65sZv3q8K1ml37/kBBlJAzrlgPUATtHvoAnxWHjEnq/IZUPZWcosM5Jb6K2pB5PFY8Ay3hup0qY/pzuhBgTLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOdeCkWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4B3C116C6;
	Sat, 17 Jan 2026 02:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768617807;
	bh=M8I0P+6+kQfZVYRfMsIkrT3kwJeTYt5m5hoJ5qwOuIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOdeCkWMhN9WnWZxErtm5Hm2SO6e1OYgFzVOxSN5IwSyO5pmzbdapo5Ot+4c+GrEQ
	 Gmz0C5eQ9AhCq/BwZUiQuR9rDqfDU+c3GXVEzbaF8ZfEIMSK2bu1t4jknRu9w8WEzs
	 QRt8BGWgiSvF7JAlWXRxe74aEhVWlPuaMVOi0w/9jdqrg9+/2goye6UcPfFrhMZb/z
	 K60GAcMWsyJyMSuKTSMZUiSg1pG65aOBDHLM5z7lbPHsq6mx8xTFigMuJo5RYSugYR
	 UFlV7ePveLsp1zwHmtlj/WxSl9XTi22n6BKfTEuhkE6KHE4p/9TKrTLgBL+Lbv14Jh
	 WHq6jtURQ5ckA==
Date: Sat, 17 Jan 2026 10:43:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>, Li Jun <jun.li@nxp.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: Re: [PATCH 0/9] arm64: dts: imx8m*: misc update
Message-ID: <aWr3R-phzjSS9GL-@dragon>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
 <aVwWnAMqVqE7jtCy@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVwWnAMqVqE7jtCy@lizhi-Precision-Tower-5810>

On Mon, Jan 05, 2026 at 02:53:00PM -0500, Frank Li wrote:
> On Mon, Nov 10, 2025 at 03:54:40PM -0500, Frank Li wrote:
> > Some misc update for imx8m* dts
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Frank Li (2):
> >       arm64: dts: imx8mm-evk: replace space with tab
> >       arm64: dts: imx8mp-evk: replace space with tab
> >
> > Fugang Duan (1):
> >       arm64: dts: imx8mm-evk: add uart3 port
> >
> > Li Jun (2):
> >       arm64: dts: imx8mm-evk: add wakeup-source for usb phy
> >       arm64: dts: imx8mn: add wakeup-source for usb phy
> >
> > Shengjiu Wang (1):
> >       arm64: dts: imx8mm-evk: correct the spdif compatible string
> >
> > Sherry Sun (3):
> >       arm64: dts: imx8mm-evk: add uart1 and bluetooth node
> >       arm64: dts: imx8mn-evk: add bluetooth dts node
> >       arm64: dts: imx8mp-evk: add bluetooth dts node
> >
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 78 ++++++++++++++++++++-------
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  4 +-
> >  arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi |  4 ++
> >  arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  1 +
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 32 ++++++-----
> >  5 files changed, 85 insertions(+), 34 deletions(-)
> > ---
> 
> Shawn:
> 
> 	Can you help check these patches?  only patch 4 need remove "evk"
> at subject, do you need me respin it?

It doesn't apply to my tree.

  Patch failed at 0008 arm64: dts: imx8mp-evk: replace space with tab

Shawn

