Return-Path: <linux-kbuild+bounces-2584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D6934268
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 20:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1315FB21769
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419AD180A94;
	Wed, 17 Jul 2024 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SxUfQ2Yl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n3tSdhxx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F214111A8;
	Wed, 17 Jul 2024 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721242249; cv=none; b=hi6x8NacUWZoDT+3iKIyaAYac0eY7ii2qFqO1Ew4GTU2mW/dDYia7FUHVNG2zhiG2pVRwwj6qjMoziAMsEnp4v2QKJ+za5LAJ3lltrVDpXd7V92G3UBub6N8SFTNyiJAX4XfqdUHgu5N1A+TI1lFAlVmvf6Lb/49ECj6N5ccwj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721242249; c=relaxed/simple;
	bh=p8BKi9MK4pVK6XcJbLkD15DVQexepHg+1Z5MR6HL/v0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=CpGre2QNc+tp+SOT+ZBu6cQ1Bc7rsgHjb9Q9pUaN+hkGImS65hcTptK41XZltZApgAXbWpbW4bXVjRKkhc5cW8EVv2Lx98OooWltpRZum1lhzFCZE+peJOJLz26GxoczAGUPr7dqCFkMI1/AQelgOFIFK01RBnow8vT6O6orT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SxUfQ2Yl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n3tSdhxx; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id F26B31380168;
	Wed, 17 Jul 2024 14:50:45 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute6.internal (MEProxy); Wed, 17 Jul 2024 14:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721242245; x=1721328645; bh=AzseRhg3oY
	5ZoMZm5Po3PzY6yAhH4Rr1NJAfu0noB0c=; b=SxUfQ2YlbrV4aa3qzIo5uq7wOI
	i2ewdF/BCYLKEDCFYH1sGTfKQ/qkRL01ZxBCmw1YQDTBhMSmb4oeLnxXSDQIbsQy
	HaU5jo9Sab1Im1yT3nA0DtPb+1xPIw3Fz5XO/nxqI5gBpcTWLV35jeX85V6b2wAs
	9CsXf0MRWaMocAV88WQciMwQS4ZCWdIFap9DRXaWKODSjc3K6eOxM6+pNEoAXk/h
	/m73lEUj8vCtvDlTTQ0LQeeb6lKi87MaRL82yOyDTy7wSwbL44jNpHstVumK5S25
	CVQOI/wGUu7xwpWuIZrV5zvqMna484RqnwoGz2suCsI4jTabkJGG9SNEgriQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721242245; x=1721328645; bh=AzseRhg3oY5ZoMZm5Po3PzY6yAhH
	4Rr1NJAfu0noB0c=; b=n3tSdhxxbeHgX3Y6iNeZK0g7/ccN3E4apJQkNDcZHFVr
	K0v82ytODUhABQXNJCPuTPMv4kgwfn+xeKmMUOd//bdwOnAtEiJpAnkunNFJb6ij
	ok9MywwWln8pPySK4lq3fHofihcBjrE4cYMs50JwXG+VAaNBupe+BgvcKDbbGuUT
	EQ4aH9vztoZEC2Eu4mX/bnIiMgqbYUyDerVfUR7DbeiqsEhIaCY+6xyxY77/Rx6U
	GfZ6NIwX3PGyQN3paJFQ9HQXJTH/VoL80feiYC/4UX57sAXnBQMpcWo44UZwgR6G
	cBrxK/jzAeCAjcc97JozaYMAWgGXvbhuLdNknidSSg==
X-ME-Sender: <xms:hBKYZl8HfR9KbthYZWTL6ip_2RGDUivub8AIYtjeQKNDcuqB5oPvWA>
    <xme:hBKYZpuZZTJxIxRlVOrEykc6jjSu4bBnBz-2i5c21xPu1hNB3xQ--EITfb0y0dqez
    Cd51QgfwLo9Rx4JaJo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeejgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:hBKYZjABiLmiRsfMfLhJmA0mGgPXjTQEOax3VnfILZcsmkO3fTaptQ>
    <xmx:hBKYZpcNHS3NHrHPNYHDIPZec_LwBhnYlL9_6MOFJS4BuaJNO14Mbg>
    <xmx:hBKYZqM3DAXIaDv5MZUsJ9IbflHXGAklHVXLbZ8cLQWU9cdFgkv7Dw>
    <xmx:hBKYZrm-WkV6NXmB_0IDPKvDZJuLdVZltN3l62Hr-IOCd1OEhXiy_w>
    <xmx:hRKYZmACR5sWgSnFsqd-VjxNDUijdcL9EV9u3cw6MnDopGGBER9ZKf5u>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6852E19C0063; Wed, 17 Jul 2024 14:50:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <41f36e68-ff7e-468d-a110-46895ac3a5c7@app.fastmail.com>
In-Reply-To: 
 <CAK7LNASYnPNsJraL1qv+MFviTnPxjmc2Dmd7EcvJRCNLtHfZ6Q@mail.gmail.com>
References: <20240717124253.2275084-1-arnd@kernel.org>
 <CAK7LNASOtyqJMET7YuuFzTCkwg02p850PnqCC57-BZNJhyKT7Q@mail.gmail.com>
 <8333c062-a773-45d3-88d3-ba78e8abbd47@app.fastmail.com>
 <CAK7LNASYnPNsJraL1qv+MFviTnPxjmc2Dmd7EcvJRCNLtHfZ6Q@mail.gmail.com>
Date: Wed, 17 Jul 2024 20:50:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: mark "FORCE" target as secondary
Content-Type: text/plain

On Wed, Jul 17, 2024, at 18:45, Masahiro Yamada wrote:
>> On Wed, Jul 17, 2024, at 17:18, Masahiro Yamada wrote:
>>
>> Should we maybe revert ff96f5c6971c..3db80c999deb then
>> and find a better way to do it in 6.12?
>
> I do not think so.
>
> I pretty much like 4fe53bf2ba0a45cd708dcd4c3e8e1950731b3d4d,
> and I believe generating all syscall headers from a table
> is the right thing to do.
> So, it must happen.

Right, I meant to leave that part here and just revert
the Makefile changes until we have something that has
seen enough testing.

> Currently, the new syscall-y syntax can be used only for
> architectures using the generic syscall table.
> I wonder what we should do for the other legacy architectures.

I have patches for all architectures at

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/log/?h=syscall-tbl-6.11&id=92499ba526eac435

but I stopped after the ones using the generic syscall
table since I had spent more time making sure the actual
table contents are unchanged.

> For the rebuild problem, I think this should work:
> https://lore.kernel.org/all/20240717162421.1402773-1-masahiroy@kernel.org/T/#u
>
> (I only compile-tested arch64 and riscv, but the other architectires
> should be the same pattern.)

Right, I completely missed the "existing-targets" bit, and
without that I couldn't figure out the rest correctly.

I have checked this on the other architectures now and
tried out the bit with the changed command line I got
wrong.

Sorry for causing these problems and thanks a lot for
the fix!

     Arnd

