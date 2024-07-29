Return-Path: <linux-kbuild+bounces-2712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A06B93ECA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 06:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BA11F216E1
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 04:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F2881AC6;
	Mon, 29 Jul 2024 04:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="aDaXiQjn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8FE1B86D6;
	Mon, 29 Jul 2024 04:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722228227; cv=none; b=P5cobVN4rtHDhs5ZQ6IlmpC1bGhzfcMpqXTDORej33Z6kb+waah1yIQRRkCrTEcCTm4FJ0CRzy7QAEwWZQL1n2N92Pu/sOqnKR7bLFOSPOooICBeUm4Bm/zEe+2H0RVS+x0Hp4F0oyZXp312WctU6M01s788QGv4KN4k73H9Jkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722228227; c=relaxed/simple;
	bh=Q5e8Uzrp5dxS8GorkeTBvz/wu5JObFOkFhTXsqePR7k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pP0zJx1wmJySOBSCc6rkc0WiaZP22XJwSzbfofg5y3p8MeNvBORHTLtIpeI0SZhmR9tZcqeyX2muwDo5JqrEWYNu5fNCLstZsMwiRznmf7dt76PaZr9NUnlDLeAQaj6JFqdKPMKuXmTbfMcYzBMTs6camLlVIAOqOWnCsfDDC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=aDaXiQjn; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722228221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGVbLMPx8Stje83aOheuLD1Nwba68LXvsDOLLEVn4dU=;
	b=aDaXiQjnBSeYxvGTLqWjbY+QeXjp35finEMH57ZT7KqNkdvmgn4YrPnR/V+U6OLQ1EIu7z
	DK/PWIw1zNEQnzgonIjQc2BNDU+JxX3BxkTzRd6lw1WcfspetjC/1fFS7rlS3k88olYWzC
	yPh/hl0zi2gM/jhogfkSxNsn+5q41doi/or2xvOFXOaMwp1mycBjlQGMV75L4oKsz+nZ33
	bjVdAwg85uxoBlbmH0K3v6jPDhlL7PBcuuRJ0Jhi4weivs2sGqt2/Pe/KECu56c0jhTA1n
	2LmqRo/i42JugTDOhTSk4eZ1Xh1S72ipRkH9K6xBIyhHReRDbRgzpho8RiV4/Q==
Date: Mon, 29 Jul 2024 06:43:40 +0200
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
In-Reply-To: <3a6ef66a-e98f-44df-9fef-3b26bede4c07@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
 <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
 <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
 <98d200777d62dc9b447557b2758613e5@manjaro.org>
 <3a6ef66a-e98f-44df-9fef-3b26bede4c07@lunn.ch>
Message-ID: <36bfb8da08b90fb14108e99853f49d0f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-07-28 22:57, Andrew Lunn wrote:
>> In other words, this patch doesn't subtract anything.  Instead, it 
>> just
>> adds a weakdep link between the lan78xx and micrel modules, so the 
>> kernel
>> itself can report that dependency, which may actually result in one 
>> more
>> PHY driver added to a generated initial ramdisk.
> 
> So at the moment, does the initramfs contain all PHY modules? I guess
> it does, because you have no knowledge which are actually needed. And
> this does not help you in any way, as you said, it does not subtract
> anything.

Basically, an initial ramdisk shouldn't contain any PHY modules that
aren't automatically detected as needed on a particular system, for
which the initial ramdisk is built.  That's how selecting modules
while building the initial ramdisks works.  On the other hand, if it's
some initial ramdisk built by a Linux distribution and intended to
support multiple systems or boards, it may contain whatever the
distribution sees fit.

Having weakdeps defined actually does help here.  For example, a Linux
distribution mentioned above no longer needs to hand-craft the rules
for initial ramdisk generation for the PHY modules that should be put
into an initial ramdisk together with the lan78xx driver, if the Linux
distribution chooses to include the lax78xx driver.  Having weakdep(s)
defined makes the kernel do that instead.  Also, there's no point in
including every single PHY driver module, because not all of them are
needed for a particular selection of MAC drivers, which comes from the
intended purpose of the initial ramdisk built by a Linux distribution,
i.e. the target architecture, supported board category, etc.

Let's also keep in mind that including all PHY modules into an initial
ramdisk inevitably makes it larger, which often isn't an option for
resource-constrained embedded systems.

