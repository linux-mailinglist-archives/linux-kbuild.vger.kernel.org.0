Return-Path: <linux-kbuild+bounces-3301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033E9675C8
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 11:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC03B282327
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C2A14B975;
	Sun,  1 Sep 2024 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LkhUq2Qv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VR6v3+of"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203E14A636;
	Sun,  1 Sep 2024 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725183141; cv=none; b=iayhkn1WO+KUgcREh+T1WNViL9ZE5XJWU98Kp6ZIxZK0KIg4D4AMQ1qGlJVrUJ9eAkx1n5mR8S+IvdTGwyxUf2PDXnBgGLbCOHg3ELbbl8rYE9z4R/D9OszlNMPkl6Rs5fhwZLCGSUVk462aUXBvbmyVpTHlfUF0/HV6QcsxMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725183141; c=relaxed/simple;
	bh=sFf8auY5LRGN4Zlj/hVBT3H5PeFq+CnUQMXPIctp5IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCt2WqyWmXySTleJ5dfwG+Y2UYa+mARLq1KF+u8gMMoYJcS46PjBwN0pfLDf0RkIsMfEbL8NBMoPsSgMSrjtkboBaJrmkKIttYPqMYyyOqxMRJSiJGNOmc7aAkHxz4ydhVFVjThjErKxHQZZBpYmcHLLVbtsuXzLYPMsBrAwJJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LkhUq2Qv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VR6v3+of; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6CB9711402A1;
	Sun,  1 Sep 2024 05:32:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 01 Sep 2024 05:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725183135;
	 x=1725269535; bh=6X0o+gHrvCiTX4Wlqa4eC5NcplPWPJn6R8OF0rvPGsA=; b=
	LkhUq2Qv4UY5vJ4wja2v8bq1aerKPPC/w/opzo4IkWCH00Gh7sUcFfwWtlpbW9vg
	tdj8sMxUJwexERR2SboXyYIscup+AksrpPhZuRHFjPdhSyih2CV2jxvTP+7NJRAd
	qsWrlkHVnrkLlaILLIj0KOZi83jHQXNO2JHQja2x7rGJPCd5fXuST8FrCV3cAMpO
	6MhYoXkRax01Rza7zKUXpxzg9HujHIZJNs1MBFkohvcQC3UM6Obo74uDt8CHCRaU
	DSMJazizuy7olTwTMk9+NQZtyWpYhqWYHPUd0gWwB1h69ME1bNBT6+MRCrSUoHYU
	5VDlJ5/KGvqoZM/12og4XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725183135; x=
	1725269535; bh=6X0o+gHrvCiTX4Wlqa4eC5NcplPWPJn6R8OF0rvPGsA=; b=V
	R6v3+ofoMf/n+KGBVqfdF9gHiE8/8+WPBS2kUsc7QF4wGh6MQ35E8AnD69tEDt4m
	iRxSet0xmghSpaaVnKcR3qGRD0J6vtwcvrGFzR0hzMM/8sI9lT+OSyM8+qV+JmH8
	C3YHBOMvuZLvhLCUNSg26qEW31kVtUZRMBWg/wBFjmUlVfuhx+NmIKnxsFm2X9uY
	e5mZL2iVUaPNpJ4dUAn8n84EJpAjrJYo/0YNk8N1/6jSwgLnBMxQZN9SuiyevDX5
	kbsTgfAL7UfGYbyx8Crxw+Ev+j32mCl7pf6GQxSC8Sj88BqudJAKxFFH5Z9GuHMJ
	XwLfoYNy0uXDZ6gdoAZ0w==
X-ME-Sender: <xms:nzTUZvOoC5lkU2ENzpxwXrRFTTT3eq5M6RpPABT6iNDOao0RmrrAzQ>
    <xme:nzTUZp9du2XjcN170djAEMX0rLSyxNyl1EnioXMrvJmD4mZTslt3yz54ZjQtfXEmr
    6mQ1VsNhBYb1FUdEAY>
X-ME-Received: <xmr:nzTUZuQO2M43Ik7XIvvfhjzsmwKwthCx8QZ3TKbYS794xvi1rvHUve77RyUchTX1Hw5q7s1oLAhc3xN-CRxiph-iwOLBfh9reA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeggedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrghrvgigseguvghngidruggv
X-ME-Proxy: <xmx:nzTUZjubcuYvV6dHeCowVahPcInIuy1sJMUqLR494soiFSBXnsrDoQ>
    <xmx:nzTUZnfe6pYme1kiH6YSdJqVr1POj0tf5S9IOs8O-qGWZHpGm9eHFA>
    <xmx:nzTUZv0-eg6dCBycm7Fmo0y91MsBgy3J9EqFP5r1RQDOZv0efmd7Pg>
    <xmx:nzTUZj-xfeghjZJdzaT11R3NxjcyLPufOIe50CcLZ-HVEwHdOybR6Q>
    <xmx:nzTUZu6IVh1pUYvT_Y-uhf_IPKC9eaNkNJ3wkkZiH-ws7jD4lES3M2f9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 05:32:14 -0400 (EDT)
Date: Sun, 1 Sep 2024 11:32:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 02/12] kconfig: refactor choice value calculation
Message-ID: <20240901093212.GC3708622@ragnatech.se>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
 <20240618103541.3508486-3-masahiroy@kernel.org>
 <20240831173053.GA27734@ragnatech.se>
 <CAK7LNASfpKz+PG+tphZHaSssUHirUBxRB13MdBs3TG3HZ6qrQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASfpKz+PG+tphZHaSssUHirUBxRB13MdBs3TG3HZ6qrQg@mail.gmail.com>

On 2024-09-01 18:10:56 +0900, Masahiro Yamada wrote:
> On Sun, Sep 1, 2024 at 2:31 AM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hello Yamada-san,
> >
> > Thanks for your work.
> >
> > I bisected a kconfig issue to this change, but I'm not sure how to
> > resolve it and would appreciate your help.
> >
> > Before this changes if I run menuconfig,
> >
> >     $ ARCH=arm64 make menuconfig
> >
> > The menu option for by SOC_RENESAS is visible at
> >
> >     Device Drivers ->
> >         SOC (System On Chip) specific Drivers ->
> >             Renesas SoC driver support
> >
> > However after this patch it is not.
> >
> > Furthermore searching (/) for any config option protected by SOC_RENESAS
> > in drivers/soc/renesas/Kconfig (e.g. ARCH_R8A77965) results in a search
> > hit, but if I try to jump to it by pressing 1 all I get is a blank
> > screen.
> >
> > I'm not sure if a fix to the for mention Kconfig file is needed or if
> > something else is wrong. This is still true for today's linux-next [1].
> >
> > 1. 985bf40edf43 ("Add linux-next specific files for 20240830")
> 
> 
> 
> 
> 
> 
> The prompt of SOC_RENESAS depends on
> COMPILE_TEST && !ARCH_RENESAS.
> Hence, it is hidden by default.
> 
> Pressing (1) navigated to the nearest parent menu.
> 
> Setting COMPILE_TEST=y and ARCH_RENESAS=n made it visible.

It might be that the Kconfig file needs an update, but the behavior 
changed with this commit.

Before this commit the entry was visible and symbols hidden under the 
SOC_RENESAS where selectable and I could for example select/deselect 
ARCH_R8A77965 in menuconfig. After this change I can't navigate to 
ARCH_R8A77965 at all.

But you are correct that both before and after the commit the 
SOC_RENESAS symbol is set to only be visible if 'COMPILE_TEST && 
!ARCH_RENESAS' so this might have been an issue that was fixed and that 
the Kconfig file needs to be updated.

Thanks for your help!

> 
> All look quite normal to me.
> 
> 
> 
>  Symbol: SOC_RENESAS [=y]
>  Type  : bool
>  Defined at drivers/soc/renesas/Kconfig:2
>    Prompt: Renesas SoC driver support
>    Visible if: COMPILE_TEST [=n] && !ARCH_RENESAS [=y]
>    Location:
>      -> Device Drivers
>  (1)   -> SOC (System On Chip) specific Drivers
>          -> Renesas SoC driver support (SOC_RENESAS [=y])
>  Selects: GPIOLIB [=y] && PINCTRL [=y] && SOC_BUS [=y]
> 
> 
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Kind Regards,
Niklas Söderlund

