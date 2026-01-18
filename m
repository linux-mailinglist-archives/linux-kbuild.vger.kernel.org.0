Return-Path: <linux-kbuild+bounces-10649-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EACD39877
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 18:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98231300659D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F44B247DE1;
	Sun, 18 Jan 2026 17:26:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B52204C36
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757183; cv=none; b=ZTH9tgrJiJe49D0INQtrhWFA+PGurloIobMFfg04pwvWVKRQbtCa/xD//RL1iS53acwlZ/s9kH5URPCmO4uf6r4MSPGIquMFNxx3t3NjEOGWsTH1/cvsEzcu829WJoYzfwf4rgACzwM83iY8DHOpps3YKMSIMqVMW7TQDAFrfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757183; c=relaxed/simple;
	bh=lNuKw/HP+8hoVJpr2jF7Jp0fHjWJbgwXUawdrfR0jUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXMnX569bFZCMtKYqFsLcn+ELtORruz66aig7gff1JkKoA7feRHnyesdectevDJsgTrZilMSRNiyE22+DRWZfGJFYkGRbn32RZLEUoDl2kBgOaCxukDFQ9omKXh9uqLjKfC5GW1jOHc/PTJMTgrRCpMb/tYt1tWXrxBevjVrlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWXU-0007I5-GN; Sun, 18 Jan 2026 18:26:12 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWXU-001HJE-2q;
	Sun, 18 Jan 2026 18:26:12 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWXU-001bCl-0J;
	Sun, 18 Jan 2026 18:26:12 +0100
Date: Sun, 18 Jan 2026 18:26:12 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sherry Sun <sherry.sun@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: imx8mn-evk: add bluetooth dts node
Message-ID: <20260118172612.qytxt6oogyu3k6px@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-6-0f319c7e9b55@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-misc_dts-v2-6-0f319c7e9b55@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

On 26-01-17, Frank Li wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> Add bluetooth dts node.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

