Return-Path: <linux-kbuild+bounces-2696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959F93E45B
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 11:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C061C20C89
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 09:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAA41BDDB;
	Sun, 28 Jul 2024 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="rhAwMFsS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7E1B86E5;
	Sun, 28 Jul 2024 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722160393; cv=none; b=jg5l1IkwTFfjv7FYvbT7p75pVkXe7lfCEd7np3jHOV60R/xddRdRYjaptPf4a9aNVzso76Aje+E9qe+oi8d0B1NasrmZ3q7ZV1f7zpbMSRS6iyabePne7RP4d72es7+MXIIGsL9oQLNVp5j+lN8bO3dvyZ3mScvEgNG3wqE/qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722160393; c=relaxed/simple;
	bh=3AcKYeHStSY26BRXBtN8D7kEzi8OVJl4q/LQdH9NRvw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=D3us6IshAsLbCot68iHWTMo894K1KRO3+xy6E5N/bczCrSIwAIOS3RfE53lGT0hBzmz1MBD09bgSFWAhiltT52J+bmF1a34mhyke7JW9zraKwKEqDrE0Gu5dsOZCkAB84r7o5Tk3EMSEfbjpJ6CP6VP3eUJiePV21ExueM64fow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=rhAwMFsS; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722160389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F44zS9z0DG/3T7ddI7rng0IKCHRFy5Lk6PukoVKvy20=;
	b=rhAwMFsSRfy4z9PdzOJGA+HV0QRy9hyYbDhbkF9IRZti/4LLrm0CUlPZ1teiFIT5GV+7Cc
	HAH6Xf77uuFjOyGvJjUuvqqUapNFV45WFiSn9rEe4lwebWRns58Gsv2Ozs8DAmf98yElQc
	3nLAqmiOeSHYdC5FQpbr6+A3SYZGs6IIOndb+H0Napf0KTijttu9LU5KHXz+vhHhZYAksq
	7xa6yrWwxyW5Wkw6T2S7esA7Jt7nDWFQItuYXCsNv54nybwQajL37zymSQ+MeGkxfvR4nR
	GYsN69l3J9UBySJS6Y19Mpbf4NeV5q53JUvw4Zfu3B1OK38aIr52joZSQ76RlA==
Date: Sun, 28 Jul 2024 11:53:08 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, andrew@lunn.ch,
 UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
 f.fainelli@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, lucas.demarchi@intel.com, mcgrof@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
In-Reply-To: <CAK7LNARg-xxm3FecQ654OnxcMGtc8BjsXmZsymaNKnr_6sM=zw@mail.gmail.com>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <CAK7LNARg-xxm3FecQ654OnxcMGtc8BjsXmZsymaNKnr_6sM=zw@mail.gmail.com>
Message-ID: <fa9fa543c4c8ca4e8ec54744e2e07efb@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Masahiro,

On 2024-07-28 09:37, Masahiro Yamada wrote:
> On Fri, Jul 26, 2024 at 9:15 PM Jose Ignacio Tornos Martinez
> <jtornosm@redhat.com> wrote:
>> > What this does appear to do is differentiate between 'pre' which will
>> > load the kernel module before it is requested. Since there is no 'pre'
>> > for this, it seems pointless whacking this mole.
>> Precisely, we need to fix the lan78xx case with micrel phy (and other
>> possible phy modules) too, due to the commented issue generating 
>> initramfs
>> in order to include the phy module.
>> 
>> > What to me make more sense it to look at all the existing 'pre'
>> > drivers and determine if they can be converted to use this macro.
>> Of course, now that we have the possibility we can do this with other 
>> cases
>> that have been already detected (and fixed with a softdep pre) and 
>> others
>> still not detected (if anyone apart from lan78xx).
> 
> I am not familiar with MAC/PHY interface, but perhaps the
> situation might be different on internal/external PHYs?
> 
> I do not know if "micrel" is an internal or an external PHY, though.
> 
> [1] internal PHY
> 
> Commit e57cf3639c323eeed05d3725fd82f91b349adca8 moved the
> internal PHY code from drivers/net/usb/lan78xx.c
> to drivers/net/phy/microchip.c
> 
> So, lan78xx.ko is likely to use microchip.ko
> 
> Perhaps, is the following useful?
> 
>   MODULE_WEAKDEP("microchip");    /* internal PHY */
> 
> Or, is this the case for MODULE_SOFTDEP()?
> 
> [2] external PHY
> 
> When an external PHY device is connected, the MAC/PHY combination is
> pretty much board-specific. We may end up with
> a bunch of MODULE_WEAKDEP().
> 
> The second question is, is it so important to enable network
> at the initramfs time? Personally, I am fine with having network
> drivers in the root file system.
> 
> Is this useful when the root file system is nfs or something?

The troubles happen when the driver is probed during the initial
ramdisk stage, e.g. when a machine is rebooted with a USB adapter
plugged in.  If the required dependent PHY driver module isn't also
found in the initial ramdisk, probing the main driver may actually
fail or (hopefully not) end up in some strange state.

If you have time, I'd suggest that you go through the following
related discussions, which should provide further clarification
and additional examples of such issues with initial ramdisks and
additional driver modules:

- 
https://lore.kernel.org/linux-modules/04e0676b0e77c5eb69df6972f41d77cdf061265a.1721906745.git.dsimic@manjaro.org/
- 
https://lore.kernel.org/dri-devel/4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org/T/#u
- 
https://lore.kernel.org/dri-devel/fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org/T/#u

