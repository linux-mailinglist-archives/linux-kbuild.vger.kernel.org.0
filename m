Return-Path: <linux-kbuild+bounces-2720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D139E93F112
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 11:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 871491F22A98
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0E8140378;
	Mon, 29 Jul 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="G4/koggL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65513E3F6;
	Mon, 29 Jul 2024 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245333; cv=none; b=Ify9uXcmpt5wzLZPcUzloKT5Vcg0vL+yr6NwBIzZ8QMDpXrOt6ai7wNmpqh1ztdnkHM3Em6jcZU02+wC7y+NVj+GUz6dTxerOKjvxM18U5BzCPcRxFo3qdgnVQ0OEJ7kaEpsuDVHkjuf3K9KyGWRRcSEupy7y2NKhtryaIJQMoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245333; c=relaxed/simple;
	bh=bzHWl0dFMQRjC2s+J0lIeqP9IZPIqb+8YpOOF6CAJyw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=kqGUAk/x3YYCEpLhTvp3mWI/Lnx9+f/mxfC+JGp8Rci+lUNxHvCf+cmvOtzU/rnR/V2hc+C8slf7yEAk+abWTcYGXppp3lhyytywml9lekYLjJJ0JYANSDF1/pCFkDGnchuvTMxc68MayH2tRac8jIjCkBJOv+E3FyqGI2jjIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=G4/koggL; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1722245329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pG2BKZE44Z2kXW9fB7jx3sBrZA1cIRr01G83L4BMw4=;
	b=G4/koggLmvifN4FOnkrrpbV4w8G3jcE4RB/DvDX1C9nSIAY5oXca5M7hZ+Sc8hg3khqITZ
	oA6XYAh0wUhDqUE/fwuJRdWuNPI6UonkAYniyN+Nd7669WROSvBCdIfzRPYU+PgHujuIKj
	A0adPylklGN6EmTlRja0e8aAW2GefbETdddmpWnzBy9yZ84kEJjtYyy9u+wvSyVFC7qqjg
	9QSdju2LYum3O0K4Lam1R6Ec/2JZfczFIp1fi6zqIDYSp/hCBzH1qoTnK/GLEBI683ucwh
	FiKKSiffJOZ9YFK/cBXe55/0w4Moo1cp4oAlOlb6CxM6jOpQ62QcBd/tLRKsEw==
Date: Mon, 29 Jul 2024 11:28:48 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, f.fainelli@gmail.com, gregkh@linuxfoundation.org,
 kuba@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, lucas.demarchi@intel.com, masahiroy@kernel.org,
 mcgrof@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
In-Reply-To: <20240729083421.11203-1-jtornosm@redhat.com>
References: <b8a2831c4f2d49469d5af04c03bb1a5b@manjaro.org>
 <20240729083421.11203-1-jtornosm@redhat.com>
Message-ID: <4db38805936d28fe1578c525a18f7849@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Jose,

On 2024-07-29 10:34, Jose Ignacio Tornos Martinez wrote:
>> Quite frankly, all this makes me wonder why weakdeps were merged into
>> the mainline kernel [1] with no real consumers?  Perhaps this is good
>> time for Jose and Luis to chime in.
> 
> Well, I requested this commenting as an example the case of lan78xx and
> the possible phy modules,  becasue it is clearly failing when initramfs
> is generated due to the dynamic phy module loading process.
> In my opinion this example was enough good because I found it difficult 
> get
> an automatic way to get this information in advance for all the cases 
> and
> becasue I need to fix this initramfs issue.

I see and agree, but please note that other people highly disagree about
that being an issue at all.  Thus, I'd suggest that you provide a 
detailed
explanation of why and how that presents an issue that weakdeps solve.

> But with a first glance, I also found several examples (not phy 
> related),
> in which it seems the suitable softdep was added to solve the initramfs
> missing module issue:
> 80f4e62730a9 drm/panfrost: Mark simple_ondemand governor as softdep
> 0c94f58cef31 drm/lima: Mark simple_ondemand governor as softdep
> 2ebe16155dc8 scsi: ufs: core: Add soft dependency on 
> governor_simpleondemand
> dfe085d8dcd0 crypto: xts - Add softdep on ecb

Regarding Lima and Panfrost, I agree that weakdeps are a better solution
than softdeps, but please see also harddeps. [1]  I'd appreciate if 
you'd
provide your opinion about the proposed harddeps.

[1] 
https://lore.kernel.org/linux-modules/04e0676b0e77c5eb69df6972f41d77cdf061265a.1721906745.git.dsimic@manjaro.org/T/#u

> Therefore, I requested to provide this  kind of new dependency 
> (weakdep)
> first in general, becasue I thought it could be useful for a lot of 
> cases
> not only for the unkown (for initramfs) phy modules (i.e. lan78xx).
> That is, in spite of the initial usage has been rejected, I think it 
> can
> still be considered by the other commented examples (or new ones).
> I would like to confirm some example(s) to have some usage, but this 
> will
> need to be from September after my holidays.

Maybe we can have Lima and Panfrost as the first consumers, but I'd 
prefer
to have them use harddeps, as "earmarks" for the future (please see the
discussion linked above, and the two additional discussions linked from
the patch description in that thread).

