Return-Path: <linux-kbuild+bounces-2698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8589293E598
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 16:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357131F21303
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 14:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F11641C72;
	Sun, 28 Jul 2024 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="PA5jSMxN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8C734545;
	Sun, 28 Jul 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722175863; cv=none; b=P5Nb2znSEX+OfS6GWe/AY9H3VxqDPjdWPYPqGGxIB/TgNa+qInH1nmtQcclstNxrFyPUp9IFIe0+7y2defbd/sNIaSsjBo+HkGgD6XQ6TIK+oP6d9MSoCKWtFzKwTpCFw4jshqp/bBb9Bdsaz1PAhjDW1ksYT0DVSkfZm5SwqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722175863; c=relaxed/simple;
	bh=DqcVSN0XsTJA0Oi0MNZ0teOOtzntOY8OrbnnB6o8vjY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=rnS+eOhLLN23TthwhE7zL8J7MFc4iy+wNWt9oAZd3I17zR63GW/xV7NDQiNwH199GsdMb2kXxsZuGpkJ1yRBUU74tOdQj+mEpQ3n4hIcwNyVHT7jmT86JlUQsq8WEWsHlcEgy02vICbU3z/WED2nAQXfTJFSeG6ACUMPfDDmEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=PA5jSMxN; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722175858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=No/YIbGtEUuTgLlMt3RFQBfM5H9ZzhC0++FkOyap0EU=;
	b=PA5jSMxNXzlUDrvvooYdg3ajy2QWXNbiQtvs2kbu8TaOVaPOPCW5LrOdkUpJvTUfBkP9t1
	62F9H1t8ClWX/UoPfJ/cozJPlg/zOREkOb01dLfQxL1oTUzZSm4VopwOw1ne2hhtwdu0Vw
	jOeweUtx03M9PukL4T6FiXuqKcqhd7ZuExd1e0sOGBEm2uA8B9KSVeZEdk4h76zboHY7Sh
	52+y17P6PfluZSB9eBM3CGpJ6od0d/CwMVXqjfpDEo5L0LZSKwdV+bhVudao3MWS5CKy1/
	heNUb4eNW5yfb437rCAIFpl2u5MS6dkT8BiAy9RkyhP46+YnAhFEVomR1iK5uA==
Date: Sun, 28 Jul 2024 16:10:57 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
 UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
 f.fainelli@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, lucas.demarchi@intel.com, masahiroy@kernel.org,
 mcgrof@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
In-Reply-To: <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
Message-ID: <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Andrew,

On 2024-07-28 01:29, Andrew Lunn wrote:
>> Before going into explaining my viewpoint, could someone, please, 
>> clarify
>> which LAN78xx USB-to-Ethernet bridge does this apply to?  I already 
>> had
>> a look at a few LAN78xx datasheets, and I'm not sure how the external 
>> PHY
>> becomes exposed over the USB interface, so it needs a driver.
> 
> https://elixir.bootlin.com/linux/v6.10/source/drivers/net/usb/lan78xx.c#L2049
> 
> This is creating an MDIO bus device. The MDIO bus will be scanned and
> PHYs on the bus found. There are then a few calls to phy_find_first()
> which will get the PHY.
> 
> The code itself looks pretty broken, it is directly accessing PHY
> registers, which a MAC driver should not do. That is a layering
> violation.

Thanks for the clarification.

Basically, the way I see it, weakdeps are the right solution for the
problem at hand, i.e. for the generation of the initial ramdisk with
all the possible PHY driver modules.  However, I don't think that some
automagical generation of the associated MODULE_WEAKDEP() statements
is the way to go.  Instead, all those statements should be added by
hand to the lan78xx driver, making sure that each PHY is tested and
validated beforehand.

