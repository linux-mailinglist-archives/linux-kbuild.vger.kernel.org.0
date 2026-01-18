Return-Path: <linux-kbuild+bounces-10651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FAD3987D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 18:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 265923009AA5
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F243342A80;
	Sun, 18 Jan 2026 17:29:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5D27CCEE
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757390; cv=none; b=k2LZGakyqPQjrPxpFQlql+ly8HRztd2wFfPR/8iyB7Bn7Vr2niRdQCe8yFpGkzj+N1qk9c/GkBRREXu5qxjiJXWumw+32wX+q6YqIkzi+xD0Yred3T55tyDyPbnvlSylTrlm19szNEdEGyqzLJZ6V6NIU5FXyluUgotEQoT5cvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757390; c=relaxed/simple;
	bh=GouJXTBoMNve/sNEP/o0W06S9rrd+8dd4qk3Fx1rmYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpWmDgg3k3YSKjFB4yRG9EzwIfEiXZH3VpQqz/WISEx3l5lpEVdCgktsQVXy2V+Thkkxlcy/q6/ZO+XYaQo2uGgRZyRWhAzGWkikdCaCTo2SCjfcacuaUNNYM0TG/qs++KwbBvWgt0Daa87mpuNrChMuFWmaGa4wfh5MRnUrwFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWax-0007el-F1; Sun, 18 Jan 2026 18:29:47 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWax-001HJm-1U;
	Sun, 18 Jan 2026 18:29:46 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWaw-001bIa-27;
	Sun, 18 Jan 2026 18:29:46 +0100
Date: Sun, 18 Jan 2026 18:29:46 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Schier <nsc@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: imx8mm: add wakeup-source for usb phy
Message-ID: <20260118172946.zsqokjhp76trijq3@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
 <20260118172208.h7yts2yuf2lkhd4n@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118172208.h7yts2yuf2lkhd4n@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

On 26-01-18, Marco Felsch wrote:
> On 26-01-17, Frank Li wrote:
> > From: Li Jun <jun.li@nxp.com>
> > 
> > USB phy can be wakeup source to support wakeup system from USB.
> 
> Was USB wakeup tested? That beeing said, marking the device as
> wakeup-src is fine.
> 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Just noticed that this targets the base soc.dtsi. IMHO this is board
desicion to make and therefore belongs to the real board.dts(i) or dtso.

Therefore please drop my r-b.

Regards,
  Marco


-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

