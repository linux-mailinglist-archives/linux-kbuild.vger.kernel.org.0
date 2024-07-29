Return-Path: <linux-kbuild+bounces-2715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BC93ED77
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 08:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14CD51F21DE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 06:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E05384A2F;
	Mon, 29 Jul 2024 06:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="E6FW32CY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD704328B6;
	Mon, 29 Jul 2024 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722234560; cv=none; b=jqv6LphloLPE+/H5uRDx2Hsx/2DXJ3j2Wxv47fDd8dkMzjnBjWZjjAw+bcPUbpjsFkXUbnpZV3vuWHIJ44JbytgA2wR7L4lvQc9W5KPx9oIvz7PnOBe+OXk/pdY8qDMq9AYU6veAm3warT67fJ9ZHd/x6t1elk+AF6lc9j45MqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722234560; c=relaxed/simple;
	bh=rKtXm5j9uGr85ju3QPUS0Y0jZZMtc/lRWL71qwrZ+aQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=bHga/UNdyYWiRsTwHPUA2mdvDlC+h7EzWrCoIUhZ7Fqls0aWFLtKzA/6cBnyFt23aUIEHJ8NFsuAkzmkbWVRPzyA8H0CcTtEsOsfWWpYvI8tHxIbX/KHE8RF2GR7pFe9Tzn6+isFr1cjH/2MOc5uRaHTJ9jFlQKBR1s5r3ZU7fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=E6FW32CY; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722234554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuLO0Hu9JrNxFAuTuQzFrX0yn6O99topF2F+vT4EkqA=;
	b=E6FW32CYSeBOTn4pufFUmDh2PV0zA8RkoOvsbBbpPsmVaumq8tXY/hb0xRD6TcDxESw8n/
	vvi3ixqcsX5ogQs7WNylIFZZXnA2kKCGRkOd+b2I30MdOTHK1CNYKXpCy+RTBAuMGSr9Bn
	+gg8IJnwvKC+w0jU6ho30COFfqwzh2DXX4hv5czsU5cVXokx0BctpZRfNYyBNd40ht45if
	/9HzH4QuhrZfxZ/IIkmDcLWir1EQY0cadPkFZUaazJSVjeU1Yv5JsvDnmjAmLwycLguBxF
	zveA/w6JTDVwYcyhp68VZtyd4RBX6x+wiSFHvbqPjQhYFhoHy0DkvznIhehynw==
Date: Mon, 29 Jul 2024 08:29:13 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Greg KH <gregkh@linuxfoundation.org>, mcgrof@kernel.org,
 jtornosm@redhat.com
Cc: Andrew Lunn <andrew@lunn.ch>, UNGLinuxDriver@microchip.com,
 davem@davemloft.net, edumazet@google.com, f.fainelli@gmail.com,
 kuba@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, lucas.demarchi@intel.com, masahiroy@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
In-Reply-To: <2024072923-galleria-gumdrop-5c56@gregkh>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
 <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
 <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
 <98d200777d62dc9b447557b2758613e5@manjaro.org>
 <3a6ef66a-e98f-44df-9fef-3b26bede4c07@lunn.ch>
 <36bfb8da08b90fb14108e99853f49d0f@manjaro.org>
 <2024072923-galleria-gumdrop-5c56@gregkh>
Message-ID: <b8a2831c4f2d49469d5af04c03bb1a5b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Greg, Jose and Luis,

On 2024-07-29 08:13, Greg KH wrote:
> On Mon, Jul 29, 2024 at 06:43:40AM +0200, Dragan Simic wrote:
>> On 2024-07-28 22:57, Andrew Lunn wrote:
>> > > In other words, this patch doesn't subtract anything.  Instead, it
>> > > just
>> > > adds a weakdep link between the lan78xx and micrel modules, so the
>> > > kernel
>> > > itself can report that dependency, which may actually result in one
>> > > more
>> > > PHY driver added to a generated initial ramdisk.
>> >
>> > So at the moment, does the initramfs contain all PHY modules? I guess
>> > it does, because you have no knowledge which are actually needed. And
>> > this does not help you in any way, as you said, it does not subtract
>> > anything.
>> 
>> Basically, an initial ramdisk shouldn't contain any PHY modules that
>> aren't automatically detected as needed on a particular system, for
>> which the initial ramdisk is built.  That's how selecting modules
>> while building the initial ramdisks works.  On the other hand, if it's
>> some initial ramdisk built by a Linux distribution and intended to
>> support multiple systems or boards, it may contain whatever the
>> distribution sees fit.
>> 
>> Having weakdeps defined actually does help here.  For example, a Linux
>> distribution mentioned above no longer needs to hand-craft the rules
>> for initial ramdisk generation for the PHY modules that should be put
>> into an initial ramdisk together with the lan78xx driver, if the Linux
>> distribution chooses to include the lax78xx driver.  Having weakdep(s)
>> defined makes the kernel do that instead.  Also, there's no point in
>> including every single PHY driver module, because not all of them are
>> needed for a particular selection of MAC drivers, which comes from the
>> intended purpose of the initial ramdisk built by a Linux distribution,
>> i.e. the target architecture, supported board category, etc.
>> 
>> Let's also keep in mind that including all PHY modules into an initial
>> ramdisk inevitably makes it larger, which often isn't an option for
>> resource-constrained embedded systems.
> 
> resource-constrained embedded systems know their dependancies and their
> hardware configurations, so I don't see how the weak-deps help at all
> here.
> 
> You are arguing two different things it seems, neither of which this
> change helps out at all with, so I will provide a:
> 
>   Nacked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> here until it gets straightened out.

Quite frankly, all this makes me wonder why weakdeps were merged into
the mainline kernel [1] with no real consumers?  Perhaps this is good
time for Jose and Luis to chime in.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/module.h?id=61842868de13aa7fd7391c626e889f4d6f1450bf

