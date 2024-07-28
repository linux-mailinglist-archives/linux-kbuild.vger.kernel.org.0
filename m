Return-Path: <linux-kbuild+bounces-2709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F393E973
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 22:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A00E281845
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 20:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF437441F;
	Sun, 28 Jul 2024 20:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="FqyamZCR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146BD210FF;
	Sun, 28 Jul 2024 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722199600; cv=none; b=BhFqgYekofZetrHRMS4rCo3DqGahM0FFuDVEfvmno7HCgGHCXigl2ZA9sQtIShg74xle7XKy/kj16Hjxjl/cH1ZqcvVIkHpZzXFWRQ9+HEHBPcB80dhDA6EbimakUr8pftlxIbgk9s7l6+CbF37p7ddQKcE6YDJB4zkBNRH5MXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722199600; c=relaxed/simple;
	bh=6KdzE9scZcbxit6etjhxkkmcTAnClSfn5D06NYNfgjw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HQ8L2p++Bz6mi7TpqzjJkyjKBtP8kUif2gfdORvRMqHRDzvyGjQcjQksziVtktVD4ODHkoTXTcZ5yEm0DwIxd/idc4WsefUVAuB3AsYjJPv7BY539bCoR3wSzpNIw8PqI81DDuZ3WJufDgw2UkTLExZfjUUmdoYL/p5Kwt3k31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=FqyamZCR; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722199588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+u7V2sgAjgrmdpRQ/6Wh4ELxMrn1qNMzPn25V2N94s=;
	b=FqyamZCRHo0EDI4Zd2rkfoWEl10Vb4OEB8a4CMtv1KgAqyw4gjk5b7eTLUbEBbins1RO5T
	U7Uzq8VayFtiDO81PtA7zDr9K9qtE5SdfmjKGq1oW4TzjnpzrBEUYZrCD63jULEHIqqX92
	E+W6rDM21AhwCBiZWh6QCl7TGzVUhMAQVl9u6u7tz+Xmxanpf2fXFA3x8lgvk16SHSxXzz
	5xDhXBicEC7t6xb51fnPdagHy3jfo5K2EuTBk+n+58Y5r8hJbcrx/h7o6Qt2CpdioteaZH
	h/ZPRo/rdXqj7wcgG5VjlKuWYP8VdsUiTg1V3qEqLhUFhQSWuWuFe+2c5LbJLA==
Date: Sun, 28 Jul 2024 22:46:28 +0200
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
In-Reply-To: <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
 <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
 <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
Message-ID: <98d200777d62dc9b447557b2758613e5@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-07-28 21:45, Andrew Lunn wrote:
>> Basically, the way I see it, weakdeps are the right solution for the
>> problem at hand, i.e. for the generation of the initial ramdisk with
>> all the possible PHY driver modules.
> 
> Sorry, but i still don't see how this works.
> 
> Say you get this one patch merged. What then? You throw all other PHY
> drivers which don't have a weakdep out of the initramfs? That
> potentially breaks around 200 MAC drivers who need those PHYs you have
> discarded.

Actually, no PHY drivers can be thrown out of an initial ramdisk by this
patch, [1] simply because no PHY drivers not needed for a specific 
system
shouldn't be included there before, unless they were added specifically
by the utilities that created the initial ramdisk, but that's beyond the
dependencies that the kernel provides in /lib/modules, and beyond what
can be obtained by automatic detection using /sys/devices on a 
particular
system.  That's all a result of this specific module dependency being
unknown before, at the kernel level.

In other words, this patch doesn't subtract anything.  Instead, it just
adds a weakdep link between the lan78xx and micrel modules, so the 
kernel
itself can report that dependency, which may actually result in one more
PHY driver added to a generated initial ramdisk.

[1] 
https://lore.kernel.org/netdev/20240724102349.430078-1-jtornosm@redhat.com/

