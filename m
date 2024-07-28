Return-Path: <linux-kbuild+bounces-2710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5F93E97A
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 22:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7901F215A5
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 20:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A6B768E7;
	Sun, 28 Jul 2024 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wYAS98tY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0A4AED1;
	Sun, 28 Jul 2024 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722200290; cv=none; b=PM/qnkTPeoSblXttTx9SsXS7+MeRWkBj+IHIwHASS6S0gLfxqC04rLIfs8rL62HuTUFNPBUjggrZB1rMXqErVgXIe78AT/Z0uD0H2LHMdwJ8Ovx/zCHij0EmXgR24NEqAas2SJb6XadKNgPT7hnbu2n8yUQxUWqMLiPQX5gZgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722200290; c=relaxed/simple;
	bh=ZD8HK/9QISpSosRmduEahB8I4TxDVO6c8N+zsQ5fN7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUMF5VZGPrMtEHUUN/09KjO3t/XgQvoiRq+rJqYxF1OTIRZk/6XwP0zCqO36Gh1SuJxV/62AI357jsu0F8hhHh9v9FdHp53npRqlsQcUNQsJ8gpmqpenIKxcvV6fH98E17j4qnT24zN5ntCTB+dr7w7X+XXZqmkCSbrHVvShwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=wYAS98tY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9u9snN5EkPNEO5OsIZgqACEztkvPLKPsDbbMmHPqzo0=; b=wYAS98tY6w2jYjeeQsTlpPBqfM
	Dyc25M+Tz1IqgiisIxbYtWidGGUQL5JpnM6XZhmbbFeu+E+/0pbsYgPkK3BBgkFVJ2uZ+mbPmdBo8
	aNgUt3XzsAgu3jpLGiwqKGqVK3S0hgrryW87f8ce7EDO/Ywx12i5nsJbdEe0T/7ShoZY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sYAxo-003PKI-4A; Sun, 28 Jul 2024 22:57:56 +0200
Date: Sun, 28 Jul 2024 22:57:56 +0200
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
Message-ID: <3a6ef66a-e98f-44df-9fef-3b26bede4c07@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
 <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
 <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
 <98d200777d62dc9b447557b2758613e5@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d200777d62dc9b447557b2758613e5@manjaro.org>

> In other words, this patch doesn't subtract anything.  Instead, it just
> adds a weakdep link between the lan78xx and micrel modules, so the kernel
> itself can report that dependency, which may actually result in one more
> PHY driver added to a generated initial ramdisk.

So at the moment, does the initramfs contain all PHY modules? I guess
it does, because you have no knowledge which are actually needed. And
this does not help you in any way, as you said, it does not subtract
anything.

So to me, this is pointless.

	Andrew


