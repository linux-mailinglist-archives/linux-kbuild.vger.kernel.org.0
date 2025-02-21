Return-Path: <linux-kbuild+bounces-5861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F05A4022A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 22:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC7B425E71
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 21:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F492528E8;
	Fri, 21 Feb 2025 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="chhKv+9G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iR4XMekW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C31E9B29;
	Fri, 21 Feb 2025 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740174024; cv=none; b=W0Yig6x9k+wxb5YIsiXQhnhQ5HAQmCWCXWFJFbSBSp1sKML7j7+Egmy+S5hvxESJmgAqvoAbuAop5YjxJwHMZz4LSVTGVyJOVRrP11ZG2wtJLBUjUHI5OKpsKFY036KjQ+R6nFPJt6EYVAVLJMw+E+g9qwqE1xDpRdzZqMjSMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740174024; c=relaxed/simple;
	bh=aGUIFalwthnnlJdpMqYs1U7O+Uk6WG3t8O3Vxnm7kQw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QYCbDnCuSHQpAp8s2cI+EC1RNt1AAG+/RIs/eviqyWbyKVY3rWFseIW+fgISoYdO4ySeuslzcz9Y6eSg5G+6Oz7bGRebAknAFWM0E4Ybcb2G1TLyBx6Q6BstSGVu1VcBOh6VccbXvjtxHOpJ/G3AE5iEfxcsxqDV0n5evLjWgBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=chhKv+9G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iR4XMekW; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 770CE25401A0;
	Fri, 21 Feb 2025 16:40:21 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Fri, 21 Feb 2025 16:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740174021;
	 x=1740260421; bh=H/UUOthfQinux8BMnpfbWu8T1PvGNs7p7CNTyG/xg+Y=; b=
	chhKv+9GhGg9DG/QpWCLX1JT+lGGtTCvsWRSi20skPTKwQEFm/NSO31JD6bB/Z3a
	JME+QDAgvIupS2kNhxuPxAGNY+eMCWT1L7LR0CoYF5x+c/8iyKnbEkD543NNGa+l
	W67uqAmJbwPiOF0IDjrOoGUJ2SnXQ/wlXoZ2z6W9JEWENAvmU1i8WBKVzFQlV2cq
	hVptQ4kvH4UMcOZwH2e0+qrwzE6+/4wVm9ceW1yT/Ur3mvSG3Kn8pt1JOzMScpBM
	xWHWMeat8lGdC0UkfidDjU4kBT+rSPzBgHvHOJsxkGD5aw7Liuu83DZg03e5fQqe
	LSh/4HFzqSeCtR1gPbHfow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740174021; x=
	1740260421; bh=H/UUOthfQinux8BMnpfbWu8T1PvGNs7p7CNTyG/xg+Y=; b=i
	R4XMekWbhDAm6/cCx+EwddG1/n+YOZFFTcN80kXJwh87Q58WFrH9hFI6JU1ng9x8
	MwsDdrCJQjQaMQPr7Jv66b5frtPUTL42iD3NCJNASiZFWEWRW8EqbSw3KwSZB7oA
	78tr/HpobLnkGDT6vdQTWk5tVW2peKDj/fLJXrN/td5NXKIuCDnHjKBJJxEenM8f
	yo4gWKI6irMyKtpmJtJnAuAhnLEBboStC1CRTE8JP16jAoHqj0uuUxrqowl0HRUq
	6ULUkWgg3UlfhH1cxpJH3nqTc/Sy2j7rsKzoRLwQZb7/pF/gTY48NO0ZIFWzhN4q
	xnEuCgroFlY2kpFxciTkg==
X-ME-Sender: <xms:xPK4Z8eVNHw2Ph_0ob4HZuUH-Hlcl5KDT_MeHA60I6t9jRi9HDq4rA>
    <xme:xPK4Z-OrXg6W81Rhbv3NsGc7qlltnF_2lPC9aSmDIT2K2CYchehoRbXjntmDOI0WW
    hRYdS3r6-bxqKBy5Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslh
    gvrdgvuhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilh
    drtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhnug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehllhhvmheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:xPK4Z9h5YXP_HfDuJA2OhTULx_MSUdaHxRYtZKq95_ak-9g5ct7JUg>
    <xmx:xPK4Zx9d_JuJFmhJlncQl5nq6Dem5SfFSW2SboWzrY-dxI6TgdfzYw>
    <xmx:xPK4Z4tE9RxyY0FmRd2csGvhOwtz7lj5kY_Bi1d9mBxTAkVS6qEJtw>
    <xmx:xPK4Z4GtDeu5jZwEhYqGwGoQO-hKalumBDj0Nmeiu3evPcQ0hqUhCQ>
    <xmx:xfK4Z5kPMgRkBq0MtD7nr_JMsPqR3g_6PS-cIFVuxz5Gh9LkEjKm2Fm1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0F3F72220072; Fri, 21 Feb 2025 16:40:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 21 Feb 2025 22:39:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <4045e93b-3352-428e-91c6-a86dc8f9c8bd@app.fastmail.com>
In-Reply-To: <20250221212603.GA3561672@ax162>
References: <20250221212017.809382-1-arnd@kernel.org>
 <20250221212603.GA3561672@ax162>
Subject: Re: [PATCH] kbuild: hdrcheck: fix cross build with clang
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2025, at 22:26, Nathan Chancellor wrote:
> On Fri, Feb 21, 2025 at 10:20:07PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The headercheck tries to call clang with a mix of compiler arguments
>> that don't include the target architecture. When building e.g. x86
>> headers on arm64, this produces a warning like
>> 
>>    clang: warning: unknown platform, assuming -mfloat-abi=soft
>> 
>> Add in the CLANG_FLAGS, which contain the target, in order to make it
>> build properly.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This looks like a similar problem as the one fixed by
> commit 1b71c2fb04e7 ("kbuild: userprogs: fix bitsize and target
> detection on clang"), should it be addressed in the same manner
> (especially since I think the Fixes commit would be the same)? Given
> that the filter expression is the same, maybe it would be possible to
> unify them but that could happen as a follow up.

My bad, I actually had an old patch that addressed both issues
and then dropped it when the Thomas' patch made it into linux-next
but ended up picking my old change for usr/include/Makefile instead
of trying to understand the difference.

I'll send a v2 after some more build testing.

     Arnd

