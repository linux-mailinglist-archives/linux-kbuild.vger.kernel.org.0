Return-Path: <linux-kbuild+bounces-2673-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3593D25D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 13:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5074B28202D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 11:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19CD17A5A5;
	Fri, 26 Jul 2024 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IvRSYAnp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7CC7F8;
	Fri, 26 Jul 2024 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993654; cv=none; b=BBDj8OruTcCou/BScJD44dbaiMb61sDvg2J+5fqZx7QImgz6XesRv4CbSSqGUK+9gRkxhQXPLAFamck/ZwmVJEhtz5z1DaQi+I8ki1HYiDQVCif1v0UywC0eFjbs1zTPUzttr5SqNUGek1kVnTCEtcZrbaLLTYlg8lcLEs/myng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993654; c=relaxed/simple;
	bh=1cRpYPxf85bkcRfqqP1AT7S2oZoufzjEuuHjzgV4GsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqEt0ZFp2KhttcKFbGLb17447muP88pbOKevWI0Z2NnfkmwcegQhSNM955jd6ByNcDL7hvG4V/kfOQ7CAFgmcCKIgmZjeW7ZS9GqMTIAoGH36OwOWeNEZxDP8GZ3LUlBdmKOcZ8FHe8tXfQnIUjX5KaDd/KL2PbDIYdL/TPUeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=IvRSYAnp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iezH6AS31tgQgsC5xLAziXWjf3bE7mEiNYrYCGpV9Kw=; b=IvRSYAnpdtILfbrnAPIsR4SC7o
	zJE9R5VU1ldWIuIBTQRxgGP1UYPWkyguwbWnPU2Ft+1IeZZ3yPA3+kI+zcgoZjjsPAt+jnPYMSwvt
	scuHNMS3O5drahcGL1zS9RUn3GnK7aEyu+DkK02rILb/7aK3o8mVXZqja7SYgvBZNu5M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sXJCq-003GxT-2m; Fri, 26 Jul 2024 13:33:52 +0200
Date: Fri, 26 Jul 2024 13:33:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	UNGLinuxDriver@microchip.com, davem@davemloft.net,
	edumazet@google.com, gregkh@linuxfoundation.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mcgrof@kernel.org, netdev@vger.kernel.org,
	woojung.huh@microchip.com, Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
Message-ID: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
References: <20240724145458.440023-1-jtornosm@redhat.com>
 <20240724161020.442958-1-jtornosm@redhat.com>
 <8a267e73-1acc-480f-a9b3-6c4517ba317a@lunn.ch>
 <v6uovbn7ld3vlym65twtcvximgudddgvvhsh6heicbprcs5ii3@nernzyc5vu3i>
 <32be761b-cebc-48e4-a36f-bbf90654df82@gmail.com>
 <ybluy4bqgow5qurzfame6kxx2sflsh5trmnlyaifrlurasid3e@73kpadpk5d3p>
 <d3d97260-f840-4ea8-b964-64e36448bf96@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d97260-f840-4ea8-b964-64e36448bf96@redhat.com>

On Thu, Jul 25, 2024 at 11:53:54AM +0200, Paolo Abeni wrote:
> On 7/25/24 08:50, Lucas De Marchi wrote:
> > if you are saying that the build system should automatically convert
> > this:
> > 
> > 	config USB_LAN78XX
> > 		tristate "Microchip LAN78XX Based USB Ethernet Adapters"
> > 		select MII
> > 		select PHYLIB
> > 		select MICROCHIP_PHY
> > 		select FIXED_PHY
> > 		select CRC32
> > 
> > into (for my config):
> > 
> > 	MODULE_WEAKDEP("mii");
> > 	MODULE_WEAKDEP("microchip");
> > 
> > then humn... why is CONFIG_MICREL (being added in this patch) not there?
> > It seems even if we automatically derive that information it wouldn't
> > fix the problem Jose is trying to solve.
> 
> I hoped that the 'weak dependency' towards mii and microchip could be
> inferred greping for 'request_module()' in the relevant code, but apparently
> it's not the case.

Nope. The module is not explicitly loaded by this driver. The PHY core
will look at ID registers in the PHY to determine what it is, and then
load a module which says it drives that ID.

There are also pin compatible PHYs, so it is possible a different
version of the LAN78xx USB dongle could need a different PHY
driver. So you might need multiple of these week dependencies.

And there are many boards using for example the FEC, with many
different PHYs in use, since Freescale was never really a PHY vendor,
its not really paired with a Freescale PHY.

As i said, whacker a mole.

So you cannot use this to determine what PHY driver goes into the
initramfs.

What this does appear to do is differentiate between 'pre' which will
load the kernel module before it is requested. Since there is no 'pre'
for this, it seems pointless whacking this mole.

What to me make more sense it to look at all the existing 'pre'
drivers and determine if they can be converted to use this macro.

	Andrew


