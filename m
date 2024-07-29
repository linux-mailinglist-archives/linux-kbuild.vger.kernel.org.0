Return-Path: <linux-kbuild+bounces-2731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C219E93FDDE
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 20:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A0A82837AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 18:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CD0187350;
	Mon, 29 Jul 2024 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mgp53MpS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF73186E46;
	Mon, 29 Jul 2024 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279432; cv=none; b=O4/lDX31FhmnPIfn1uVKzyMVPzQ2TEPMyHphP9KsXToMfIE4yTJzs3Pmyhehcmgig3JUyxnKzY1OtRGF/6xgjDknH8B9Hwil2mAtCNtMx3KSKcLbBLvIIOM9Nf8W6fqyHraQ2h4LeZl/Gq4pMVd1z2Ipbh1lOfC3qrpHM9CaPO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279432; c=relaxed/simple;
	bh=HWIvfvSUieybTAxquZnSLcEhcp0h1rSyfWOqkQZYreI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF9KXxSpli8KZpQ+IRX5UB+cSyEpXIk2cgX6Ca6qdyKylQeUqXassTEWLZ65MGE/ob3YcTU6b5fr1qY7fKlP7kr9kCuYkTNOihZVexcAz3azkkU8NmwopJ7AB3I1tJ9k8NwKf/thY0nGaik0YdGe2XyZF0B44KYGEplci8+/GNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mgp53MpS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8iZu0JR+FvD990OvDQ81lMQOOGXDWYLftm87w+xQ4QU=; b=mgp53MpSarEZ+YrDWgslFw8QuL
	UICQportZ0T1jTc3L3ACBK7Y1ftXwHvcfzt8/sRaEtO3IJljYkqyN5+JOLKAuilZ/LNydakfjVKqM
	m2pOd60yrzHkH86dfdRnT+zcidossRJzt20jE8dp4jjYJjjTnwRjtMumEpAx8feNGK+U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sYVYC-003Uqo-BB; Mon, 29 Jul 2024 20:56:52 +0200
Date: Mon, 29 Jul 2024 20:56:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: dsimic@manjaro.org, UNGLinuxDriver@microchip.com, davem@davemloft.net,
	edumazet@google.com, f.fainelli@gmail.com,
	gregkh@linuxfoundation.org, kuba@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, lucas.demarchi@intel.com,
	masahiroy@kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
Message-ID: <c8450f9c-a7f8-4775-8d26-7a070aa68e4d@lunn.ch>
References: <4db38805936d28fe1578c525a18f7849@manjaro.org>
 <20240729123244.18780-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729123244.18780-1-jtornosm@redhat.com>

> Including in the initramfs all the phy modules is an option but I think it
> would be better to include only the necessary stuff (this is the default
> behavior for the tools that are used to build the initramfs). This is valid
> for embedded and not-embedded systems.

So are you saying current initramfs are broken, because they don't
include the needed PHY modules? You can fix one example of the lan78xx
USB dongle, but are going to leave everything else broken?

	Andrew

