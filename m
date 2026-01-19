Return-Path: <linux-kbuild+bounces-10690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62729D3B066
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 17:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7FE93005599
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 16:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3555B2DCBF2;
	Mon, 19 Jan 2026 16:21:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A0288CA6
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Jan 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839663; cv=none; b=JAUQ6SePqRw5gO/WBQ/aC0xT5qUJd34sh7YwnRefVukkhXBtVlEBEJXM5hdeZMHNzOEuHnEFP10re/2OKBNZx6+XmhB52FEB+05MU5VczyV3+pXrUlVT3LUgGzBJ/bd4J3QRXnsgfovgukifJ/FDZJu6wrnXYkBCFCa8uG/IVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839663; c=relaxed/simple;
	bh=ghmq4HfGsqxJi58RdqCXUiIndoD/h3ZdPXFlmzG4vuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgZa7n34zApfaOHq3Akja1ta6/3Xnl2bE09bvLQRJU3F+ZKd1nbiEMDthPKhOxK7BCaSwRVlNqc05PaW6AjTSQ2NDcpeN5o1UOu2m0WakOf/+vpC+UjLvJU8KvItG5CJfQGSUFK3/utiXfS4j1+NI61SauiEJoeIxH6RRMT9bPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhrzu-0005Rt-JI; Mon, 19 Jan 2026 17:20:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhrzu-001Rdx-2x;
	Mon, 19 Jan 2026 17:20:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhrzu-003Qo8-0S;
	Mon, 19 Jan 2026 17:20:58 +0100
Date: Mon, 19 Jan 2026 17:20:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20260119162058.yar4igdkaj2zqzsl@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
 <20260118172208.h7yts2yuf2lkhd4n@pengutronix.de>
 <20260118172946.zsqokjhp76trijq3@pengutronix.de>
 <aW5VzffP2UNAvy51@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5VzffP2UNAvy51@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

On 26-01-19, Frank Li wrote:
> On Sun, Jan 18, 2026 at 06:29:46PM +0100, Marco Felsch wrote:
> > On 26-01-18, Marco Felsch wrote:
> > > On 26-01-17, Frank Li wrote:
> > > > From: Li Jun <jun.li@nxp.com>
> > > >
> > > > USB phy can be wakeup source to support wakeup system from USB.
> > >
> > > Was USB wakeup tested? That beeing said, marking the device as
> > > wakeup-src is fine.
> > >
> > > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > >
> > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> >
> > Just noticed that this targets the base soc.dtsi. IMHO this is board
> > desicion to make and therefore belongs to the real board.dts(i) or dtso.
> >
> > Therefore please drop my r-b.
> 
> wakeup-source is captiblity of hardware. The user need use echo 1 > wakeup
> to enable it. it is SOC's feature.

I know that but still if the your system doesn't want to have the usb
exposed as wakeup-source in the first place, the board.dts(i) files are
now forced to delete this property. Therefore IMHO it's still a board
decision to make.

Regards,
  Marco


> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> >
> > --
> > #gernperDu
> > #CallMeByMyFirstName
> >
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

