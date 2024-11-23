Return-Path: <linux-kbuild+bounces-4830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2C9D697F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 15:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8CEE281A82
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 14:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62BE1E89C;
	Sat, 23 Nov 2024 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="BMlztdYO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20FA134AC;
	Sat, 23 Nov 2024 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732373846; cv=none; b=bNwuml3sMBc3UI6+LF/1/X44xr4Oe+cAujNpCUqP60BEyfo2xxzVTwkpD0FH64cOYaGVZW63MsaeBpEuJS2BDvbuDEsICRE9MQZMQeZPfrYznrwPEMMt4ba+TVC49qG6gjiyYSikLgpntfIm/KYerh3tv1aRmQYLyoo2lVc6hK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732373846; c=relaxed/simple;
	bh=y+p2vfpAsDbdRXjWSxrNGSKpYiCle7orKliitpCbmcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeL6XYECcHE116l3zpaec7o9Gxf+b4FGmxrrVHYux+m5PSTvxtmIvjT5x/bC2SQQ9O+SXWTrPfHHINS2a5v3ZoXade6567PzZY+1nwCkxUQY9wS3+bo0O0G0sQEUJ5wbnv3/ot2U0Sn579m34oFtxWpRfgK5ZGw6OAGH5sEv1eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=BMlztdYO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1732373841; bh=y+p2vfpAsDbdRXjWSxrNGSKpYiCle7orKliitpCbmcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMlztdYO+WXtEIdUpDEt/ZO2l1mjjP1BLZS6b2pFtt6WM3SGoLT1t1D1F41jbAWvT
	 C2f1+Z1w3txxsgUbw7/498uf69PDlinQSw8arJN6SHcVnyacDA1WP3z5L1rb72sm0c
	 5st0GwKDLojuFmqMYlYUAFr/NZl2RW+0hln/sW4k=
Date: Sat, 23 Nov 2024 15:57:20 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PROBLEM] make bindeb-pkg: When just one source line in a single
 driver is changed, all driver are rebuilt?
Message-ID: <b21160de-8f12-4796-8df1-2188b5fc93e0@t-8ch.de>
References: <f96d57c9-efda-4781-a395-a7c5fec7f2ad@gmail.com>
 <9748bda4-0db8-4c70-a321-c7189d575cbc@t-8ch.de>
 <f50cd6ae-0d99-4836-b268-c9c86da448d8@alu.unizg.hr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f50cd6ae-0d99-4836-b268-c9c86da448d8@alu.unizg.hr>

Hi Mirsad,

On 2024-11-23 02:53:09+0100, Mirsad Todorovac wrote:
> Hi, Mr. Weißschuh,

Call me Thomas, please :-)

> On 11/21/24 22:43, Thomas Weißschuh wrote:
> 
> > On 2024-11-21 22:18:58+0100, Mirsad Todorovac wrote:
> >> I am perplexed now at 6.12 stable vanilla tree, and I've noticed that after changing just one
> >> line in ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11, all unrelated drivers are being BTF'd, SIGNED,
> >> and INSTALL-ed:
> >>
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aht10.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/adt7475.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/as370-hwmon.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aquacomputer_d5next.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/applesmc.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asus_rog_ryujin.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asc7621.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9055-hwmon.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
> >>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
> >>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
> >>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/dell-smm-hwmon.ko
> > This happens when the vermagic is changed. The vermagic is linked into
> > each module. And after relinking all the other steps also need to be
> > done.
> > Building the Debian package increases the build number which ends up in
> > the vermagic and therefore all modules.
> > Also there is CONFIG_LOCALVERSION_AUTO which may be involved.
> 
> Yes, I use CONFIG_LOCALVERSION_AUTO because it saves a lot of trouble in bisecting.
> 
> This vermagic manipulation is beyond my grasp. I understand that
> modules must match kernel version, for internal ABI often changes. But
> not between builds of the same source? Am I thinking right?

The ABI doesn't change between builds of the same source tree which is
why there are no actual rebuilds ("CC") of all modules.

But your usage of bindeb-pkg bumps the version string
(also without CONFIG_LOCALVERSION_AUTO) and this needs to end up in each
module file which explains the LD/BTF/SIGN/INSTALL steps.

[..]

