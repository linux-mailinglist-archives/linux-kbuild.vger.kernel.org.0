Return-Path: <linux-kbuild+bounces-2685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D093E04F
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 19:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B905A1F21AD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CF81822F8;
	Sat, 27 Jul 2024 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="ygPgmHO6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0B4A1B;
	Sat, 27 Jul 2024 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722100535; cv=none; b=l7wrADCR2qmxmHbssIeDhLS48px1FqzwXt+FoXKyST+sJPohhSXwVBPZB/K/easfBf3MX8JTXufLN13xufeWGliezZTOLnk2Jz+I+HCb4ce1L0N2MQKiKtT/mxR1/3976aIJU0w0BZYButk2wjNsop/EdJgprP+CvnKgF2CEyws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722100535; c=relaxed/simple;
	bh=c0cp8+no8R2fxsi1kFc86ZhbYk7L7ozY44Bsr1zriRg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=MmADCj4K0IuayGTFvJ87rLNBKPcGso8j0tQI/Ugqjh+paZnPtyxZitZCa6AB6daJOcJaXRo05wW2heBAVXDg/+MHTHdqePtdvccHrfQwcWPCzx7caaQWm6G1/WXRofEh/7d66IApujcJH5pggMxHm2KQzmjQyym/dTkhc+lk3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=ygPgmHO6; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722100528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mDND/bi51l3wLBoIF5cG/+5oJdyBca1reUQ4UemnSYM=;
	b=ygPgmHO6Vp4Rhom2yr0owx9+puRC1tx9Ccs/JtGGbs6e9U5IafwOqwuiwg4gB5PZrCSD+y
	HhYEHHTszc65R/RMwfq7evBnOToJxFdiOVIw/ZlNtzCVH5MTQ3viNLDN4b4R8fNaOckUkM
	FXl3jC5ehXmO20WPoZLyoNtX2jwz8F5k8A4gKc0xgrj5PbsTqUpW1IlcqpHsqi2JXs4g43
	/9tn2cvDaAvbVJyQ4hzfkOIfLui7CA2j4C5Lqx+Sonj9RJbbKAIkkF1KKGLYBHgxfa89/T
	1FnBMhzOxu3yFgZd9eQ84Zl3NGWeKbwbkl0lQPsiHdwmeftsNqgsgkO7BEHo+w==
Date: Sat, 27 Jul 2024 19:15:26 +0200
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
In-Reply-To: <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
Message-ID: <931b582808f237aa3746c5b0a96b3665@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello,

On 2024-07-26 22:59, Andrew Lunn wrote:
> On Fri, Jul 26, 2024 at 02:15:26PM +0200, Jose Ignacio Tornos Martinez 
> wrote:
>> Hello Andrew,
>> 
>> > What this does appear to do is differentiate between 'pre' which will
>> > load the kernel module before it is requested. Since there is no 'pre'
>> > for this, it seems pointless whacking this mole.
>> 
>> Precisely, we need to fix the lan78xx case with micrel phy (and other
>> possible phy modules) too, due to the commented issue generating 
>> initramfs
>> in order to include the phy module.
> 
> I still don't see how this solves any issues with generating the
> initramfs.
> 
> There are more than 200 Ethernet drivers, and around 75 PHY
> drivers. If this patch is merged, you have one MAC driver indicating
> it needs one PHY driver. There is nothing much you can do with that
> information. You need to wait until 99% of the MAC drivers indicate
> which PHY drivers are needed. Then you can use this information leave
> out any PHY which is not needed, and hope you only break a small
> number of devices. But even if you wait 20 years i doubt you will get
> 99% of the MAC drivers indicating what PHY drivers you need.  Because
> nothing really uses this information today.
> 
> So as far as i see, this has nothing to do with building the
> initramfs.

Before going into explaining my viewpoint, could someone, please, 
clarify
which LAN78xx USB-to-Ethernet bridge does this apply to?  I already had
a look at a few LAN78xx datasheets, and I'm not sure how the external 
PHY
becomes exposed over the USB interface, so it needs a driver.

