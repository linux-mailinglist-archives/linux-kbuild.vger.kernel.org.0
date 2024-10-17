Return-Path: <linux-kbuild+bounces-4172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D79A2E53
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 22:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C3CFB222C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 20:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3661DE2B2;
	Thu, 17 Oct 2024 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SYSRcHS5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="esjRwHfr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA1144D21;
	Thu, 17 Oct 2024 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729196423; cv=none; b=CkI7OX6uzWxQ9HVuEAkQLpZJ02VTf1Lfh953YCRMQfAyznIfzZ6HwzCmdxCWsP4n8yf9BJJC68Ygb/OISIv9gPUGjO2SbhLIgg271N2wy5/o+eXfkJmcA0DLHk1gMqHZGXUOZ4+V2Uv+F69jhnASnAVFtK7ix4MmvnujSGi6ufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729196423; c=relaxed/simple;
	bh=XVVHSpwPe5HZHIHmXyXLtKocHLxVUhDN4zyjgfNLGBc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=u6rQzmWJ4i1heuO7XMQXXft1euX6GTWzIRq1Ebss7Ya2n8AdoZ/uEq/LHuk92T0sj9foixBJPw4GVJmpeI7Oiv8KFe9//uB30Ng0UI3n05wvN0wSLVBvcyhIrVV999u4ooC1VeHyf9hvh86vrvgXOurN5hMwQZ1HY/5KfJGcXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SYSRcHS5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=esjRwHfr; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E3C2F114008E;
	Thu, 17 Oct 2024 16:20:15 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 17 Oct 2024 16:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729196415;
	 x=1729282815; bh=/elZsdY9jdfXA5CNoGnQjupWAHOxpp9CXjyZ+kdKV3U=; b=
	SYSRcHS536J51tTNmu7p25c8eCeTwmReNsfcMZiUUFX3HerJXw2PCihWwZHywWGm
	XtkRVqaf0bJUmpkEr0xel839tS3XZKe0Q7GrlVPy/KuOMsxVKWYaCXew3geWnrC/
	2AEFRgONyP55oSc0QSDD5A+rtP38y+mK2Fw6zWyJ83U5DM3dCA+7Q7RGJxT3V3qK
	PXJu6LX3+OCfkkQqFeAUqfiFuvsHdGemIYGzXF1Ja2J2o4FTrcpXI5uxtJpRMkIv
	XhFTs7AtGEAXYvpVaDtpGH4eJAuwb4/Q6FiFaEtvfeq236LL7BLQ38NPRLeiZOIE
	aanvzf71Rdt12wyTdJhEJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729196415; x=
	1729282815; bh=/elZsdY9jdfXA5CNoGnQjupWAHOxpp9CXjyZ+kdKV3U=; b=e
	sjRwHfrPQL/I7PGEXUrHIwKI9uBSCibtGL35CXJcreL1HM2WdOhwX9hJ+PDSM78Q
	Ig1UZIXJvzm35koI59fUZ9ZX2QSjEld4Iw1Od2PVIcfq/dWuMgFt7c/quxQ5ONwy
	eiUo4X7xzVfvb93XvPY9a56E4K9d3eXJq32kenGz7RhA3x71OpZR64CD6jMi3jwy
	pbtKPBJFESt9sUAlo5oOmyjeqXAud3nrjZUce/MZsBnnNXNHM1MrRoXCLNar4yLp
	Hk5naff+RPsXrx+1fOGHjUZ1mAi0FZUO49ifQRH75s31llKW4ZYfI3hJSZNt/3zX
	4L9Mcr5c8LLxYcCTkmyyA==
X-ME-Sender: <xms:f3ERZxp_Ga5mu0cJjb7aVzvymuknjw_5FzNpeIWT8fvF--o0ifQuMw>
    <xme:f3ERZzqW-gjkWsKt8u4-NBxKeY8aWgxHLMxbHivCu_csd1FzacTkIdfr58rFcHaV2
    Nhkk9DLtBu1303d_K4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehuddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtohepjhhushht
    ihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepnhguvghsrghulhhnihgvrhhssehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehvvhhvvhhvvhesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghn
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugi
    druggvvhdprhgtphhtthhopehprghttghhvghssehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:f3ERZ-NqgrYOAN4t_T3U9HhDYT3z9ZTa-_7sOybYYgyxU_LXhOoBug>
    <xmx:f3ERZ87gtondBc9e_O9u301RZAiPLrHRd91WUdkF9RmeEX3YDeqP4w>
    <xmx:f3ERZw6QAg_-99Hcc-GQ3pILjqgzkTd9-bUPX1s9_8yAJzNpAHiDTw>
    <xmx:f3ERZ0iGUiPXLHw2MWllSX_rnjgWR--yQS_mLHBrM3SVOzC6qJyv4Q>
    <xmx:f3ERZwi7NrQID7mZR1fAGrsOfdwTOygTsFkxqm8wvhiJUsxLKdp3gMSz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 161932220072; Thu, 17 Oct 2024 16:20:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Oct 2024 20:19:54 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Nicolas Schier" <nicolas@fjasle.eu>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Aleksei Vetrov" <vvvvvv@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 stable@vger.kernel.org
Message-Id: <079876f3-19c6-41bf-8e70-8764fd4c62e4@app.fastmail.com>
In-Reply-To: 
 <20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org>
References: 
 <20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org>
Subject: Re: [PATCH v2] kbuild: Move -Wenum-enum-conversion to W=2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 17, 2024, at 17:09, Nathan Chancellor wrote:
> -Wenum-enum-conversion was strengthened in clang-19 to warn for C, which
> caused the kernel to move it to W=1 in commit 75b5ab134bb5 ("kbuild:
> Move -Wenum-{compare-conditional,enum-conversion} into W=1") because
> there were numerous instances that would break builds with -Werror.
> Unfortunately, this is not a full solution, as more and more developers,
> subsystems, and distributors are building with W=1 as well, so they
> continue to see the numerous instances of this warning.
>
> Since the move to W=1, there have not been many new instances that have
> appeared through various build reports and the ones that have appeared
> seem to be following similar existing patterns, suggesting that most
> instances of this warning will not be real issues. The only alternatives
> for silencing this warning are adding casts (which is generally seen as
> an ugly practice) or refactoring the enums to macro defines or a unified
> enum (which may be undesirable because of type safety in other parts of
> the code).
>
> Move the warning to W=2, where warnings that occur frequently but may be
> relevant should reside.
>
> Cc: stable@vger.kernel.org
> Fixes: 75b5ab134bb5 ("kbuild: Move 
> -Wenum-{compare-conditional,enum-conversion} into W=1")
> Link: https://lore.kernel.org/ZwRA9SOcOjjLJcpi@google.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

