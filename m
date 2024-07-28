Return-Path: <linux-kbuild+bounces-2701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CF93E919
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 21:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FE31F21561
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 19:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1458E18EB0;
	Sun, 28 Jul 2024 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KJAo/OxH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB911FB5;
	Sun, 28 Jul 2024 19:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722195959; cv=none; b=u3KSR3w2VbTBQzWZ9w+Gj94nPACDrtA3q3+aAcwS6kA1ztuJ4XAHMWKm5c+o6QPXyNC7KynvJEax3mfQFF4CV7xeAUp9kZLUeIS9IBUjRii7HeHTNHFa2x3YFWtWs1L9gwnWoO4/Sc3vHgK5+3CmveCHXXJOsVCbmPBUrXzKtuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722195959; c=relaxed/simple;
	bh=Hc99SEPp4bXPVJrCLa7vU2xFazG1kj6OYKnlcEeTmV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeVKR2VP+81Wm6t8Q2zHpTtP68pImhfGE+qMwasxbYQ8Z5ze618ynqKbXMnapJY7PjvPsysMdd0sj03yRNySX6FEUXagcQWJZ9CQZVHy8bkPX6i1sU5VCKiZ0Pc8aEFLxQGYDbC/n+TbJMepNVXK6V4KU3q0GCSAz27043eZIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KJAo/OxH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6f/X4Ep8VJBAxPd04fq3EkGY9O7GlIIEmWVVeK98dt8=; b=KJAo/OxHeFLm2/bM8V4AuZeFPD
	bq1lvvQsQWZt3v0t3WPaH077+xLZhmI86aVGIZvUgoXoVQyHFL9jPwFYg+tqLnEoVdkeylVWo/wE2
	y009IFVef6Z9s0av3XuBcRArguVlGXPyPv8T0e1FE5XuA/tHx396hlSrupEJ5xiA65HU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sY9pk-003PDN-VX; Sun, 28 Jul 2024 21:45:32 +0200
Date: Sun, 28 Jul 2024 21:45:32 +0200
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
Message-ID: <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
 <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>

> Basically, the way I see it, weakdeps are the right solution for the
> problem at hand, i.e. for the generation of the initial ramdisk with
> all the possible PHY driver modules.

Sorry, but i still don't see how this works.

Say you get this one patch merged. What then? You throw all other PHY
drivers which don't have a weakdep out of the initramfs? That
potentially breaks around 200 MAC drivers who need those PHYs you have
discarded.

	Andrew

