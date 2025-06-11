Return-Path: <linux-kbuild+bounces-7462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D0AD5898
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 16:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E1F47A377F
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 14:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA564276046;
	Wed, 11 Jun 2025 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="G/ZET1c7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SeD7Lcbb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF9A273D60;
	Wed, 11 Jun 2025 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651877; cv=none; b=eEaPn3C0rIru/tnkJo1aJEcOXJQAVPbWxHJGDb2/WwWmUvTsn43gQcNjAVSblpGSAMptJq8YzQhe/B5/GlZnFHJcN29mp/4hPhh5mmU91ATVgomC0w5ZLtdgsviAV/6jbLU/BBAsjhYKIKUUz3mXj3OfgPD5gc7ShCMSXKVEPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651877; c=relaxed/simple;
	bh=EUvKzRW3jKjXOja8nGHEwok4l8x6iNu/m9wRjoGqUnI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BlyOMHz/18YDutfdJPcEK330r+Ke+RURPOryTFfzhoTWMOgtFCmEgtv9+FyoTfeUxbD+3D69cStlJZsIFWp0Qwqf4OlWuhV7G6wzM/DgLZCg85QHpE4WEPpIIIpu7HN7v9v0CZ3dKpe9mEVwhzxxDA/bvQn7Xad5baMu13r8THw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=G/ZET1c7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SeD7Lcbb; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 15FD12540241;
	Wed, 11 Jun 2025 10:24:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 11 Jun 2025 10:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749651873;
	 x=1749738273; bh=+ODIXdffxI+NiC6rP3Lj0Q8ZCzaWxLNsTJAoOGA2ZdI=; b=
	G/ZET1c7ml8PM4cslNjpAZLiQn4RsbQXkvkBqWQiZSaDRo01dQmgyIwuDFEQjr0C
	crS+WWB/4bvZhihhfXoKHJE11aedJ2d3KLlK7Cq0Q81sqm50Mi5++PgaW1hVQD3g
	clX7gOz+YUFDY83i3r1S4MoiE9CgmZ78840TVTiSKgRbEeM/imPsPyyERONL/TiV
	weP0xBLPBiEFb0D0uqyy0xiFDnsFIOWXH3NsuSIuNn5e/kgDrz6vRldVbWx1b8sG
	ykvT2Xs/72lf8v1m/WLPLA2JOBZYvl/JCCuubRT0ZXo090kd01FWTnDtle19HfzU
	6dQFZ/Tc55WhNIaKxpvwZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749651873; x=
	1749738273; bh=+ODIXdffxI+NiC6rP3Lj0Q8ZCzaWxLNsTJAoOGA2ZdI=; b=S
	eD7LcbbTypHMh/Z7By6tRW7VQWRTwVsOKbdnMbTqsQRuYCVqH4SfLLXRUnm7q6JQ
	5c9OI4IbTzvmJjj3nyCz1zjTDSvLghnNr47AnpyRCn9rEa61ENBED6kp852GA8Ne
	k0+UEuV4Go+SW7RMkhyHVuysUDE6dZNM0fucQVOqadEbBuRBi9dXpvEGuVCuPuSL
	XySHYVFKN8WR2HROM1UbjQfovDh0FWYK4UPUVqYAEXC0NLmefOegJ9Uu15kuq/lD
	nHTMe2eANavL1waza4eQQHEGz2HrvlKgczjzW1qlf/5s7Ns8BG4loMYPLozzcGL/
	u6nmBebVLiLC7Y6gkh67w==
X-ME-Sender: <xms:oZFJaKbrv0d59G27HwIuQHfRfnjtdvU9g947UYljGpT2E6AwlgZong>
    <xme:oZFJaNaVbHOJLZE3VXrgY__h52rtRVQ8tnlt8sVMZKunhJGybscsUwJz_mSXM_H_M
    BeShoXKsTYmpMQVBt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtohephhgtrgeslhhinhhugidrihgsmhdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oZFJaE9ogmB_Szdpw6Diucr8KuJDL0h-qBAbWRqgkW8BDMlGR1SzOQ>
    <xmx:oZFJaMrP9DBo7zOvUkPub7pvqzf8h-O9VbQiBkAReILrLU-IrCkA8A>
    <xmx:oZFJaFq5Z8Eakl5lW2CNOQ3bZNN99crdLc66qxwIo4yex3qZoKDWrA>
    <xmx:oZFJaKRjj_VWwKLpXayCEf_B9wyiz3NCYOkEl2ktgCus_-xhCVqTpw>
    <xmx:oZFJaO7Au_QSTd5C3-ZXCgE0Fguraeva6H5vReFI_I0x4cUHXOXBTbrA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 91800700064; Wed, 11 Jun 2025 10:24:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T11a455a1e4054318
Date: Wed, 11 Jun 2025 16:24:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Heiko Carstens" <hca@linux.ibm.com>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Message-Id: <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com>
In-Reply-To: 
 <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
References: 
 <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com>
 <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025, at 15:32, Masahiro Yamada wrote:
> On Wed, Jun 11, 2025 at 4:55=E2=80=AFPM Heiko Carstens <hca@linux.ibm.=
com> wrote:
>>
>> Don't get me wrong, I can address all of this trivial churn for s390,=
 however
>> enforcing so many extra warnings to everyone with W=3D1 builds doesn'=
t look like
>> the right approach to me.
>
> This is what W=3D1 is for.
> 0day bot detects a new W=3D1 warning, so we can avoid new warnings com=
ing in.
>
> People do not know which headers should be included when.
> So, this warning must exist at least until we can get rid of
> #include <linux/export.h> from include/linux/module.h,
> include/linux/linkage.h etc.

I think this makes sense in general, but the output here is
excessive if it leads to users no longer wanting to enable W=3D1.

There are other warnings that I think should be enabled at the
W=3D1 level (e.g. -Wformat-security) and eventually by default,
but that are still too noisy at that level.

My own cutoff would be at a few hundred warnings in allmodconfig
builds if there is an effort to reduce it further, but it seems
that this one is still at a few thousand, which does not seem ok.

     Arnd

