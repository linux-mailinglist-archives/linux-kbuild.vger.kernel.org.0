Return-Path: <linux-kbuild+bounces-2687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F693E171
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 01:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C1B2281D45
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 23:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998D645026;
	Sat, 27 Jul 2024 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KV+ZTvIq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F839FD8;
	Sat, 27 Jul 2024 23:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722122977; cv=none; b=O7IO6pOcRBiM1Bz4OfR/CvR2I8lViXIC1SBBGLw4LNObr/02HScwBFIHFAvqAJX1o0JkKzJFsBLE+9JNVNYuqFwuzcnND8cI7HfvF57ibA2HGToU3Rj7N582JyI4UZ7NzFsP2ugqWPZzzwOD0zV4CJbfEEqXiO1GfRSS3S8f3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722122977; c=relaxed/simple;
	bh=dKHmD9TzO61V8LsScNepDdSQuLuFO3Ew+vfL4iPD3xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f48TV4Nd1r9073cyo9ytSp6hjP7y/R/1PjaFYSpkqN2VFlQh5Rb1vll679g7EG+hLaJot7yTUld3a+rAN6VbfsqiP7QWgLmCTzvJLaopPj3oQ/9kYvSHneKffLZ5rj4iz57jNerA7VoE3AQLJTW3fTPPHbWako1Oq5wTeJCmdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KV+ZTvIq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HaaAkZs/uXoGFjtpoKrvzxVCk50c7iJVjvXXtxRnZvg=; b=KV+ZTvIqOVoY7I4As9tQv8L1tn
	819kw6gNFnL7wsEIITH63adMEz5Z+lDzxlnMIqs+OMJZ0ssoDi1PVNt6d0iSKQvwT3mMB/ZBKAbBo
	OQRDYRZr5Lv23dV/Ztz5kkRkJcn1ubbuIaDHXsWznbC89pTb6oRhnDqKx4FlUoykyPIc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sXqqc-003Mmx-74; Sun, 28 Jul 2024 01:29:10 +0200
Date: Sun, 28 Jul 2024 01:29:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	UNGLinuxDriver@microchip.com, davem@davemloft.net,
	edumazet@google.com, f.fainelli@gmail.com,
	gregkh@linuxfoundation.org, kuba@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, lucas.demarchi@intel.com,
	masahiroy@kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
Message-ID: <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <931b582808f237aa3746c5b0a96b3665@manjaro.org>

> Before going into explaining my viewpoint, could someone, please, clarify
> which LAN78xx USB-to-Ethernet bridge does this apply to?  I already had
> a look at a few LAN78xx datasheets, and I'm not sure how the external PHY
> becomes exposed over the USB interface, so it needs a driver.

https://elixir.bootlin.com/linux/v6.10/source/drivers/net/usb/lan78xx.c#L2049

This is creating an MDIO bus device. The MDIO bus will be scanned and
PHYs on the bus found. There are then a few calls to phy_find_first()
which will get the PHY.

The code itself looks pretty broken, it is directly accessing PHY
registers, which a MAC driver should not do. That is a layering
violation.

	Andrew

