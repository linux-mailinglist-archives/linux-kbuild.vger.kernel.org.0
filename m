Return-Path: <linux-kbuild+bounces-5778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F94A37C8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 08:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F52216F0E0
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 07:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA09192D80;
	Mon, 17 Feb 2025 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HY16XWVp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GCzHjQBv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C6015382E;
	Mon, 17 Feb 2025 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739778735; cv=none; b=NpwIAQMXnwx+RSIisyY4sbqY4octetMOrLWOgFTp99CM5evYRiDO8rTq7h6EO2/X4b07SP/RFgxBgHiLzJUOKyVlKFh5ykMQBoGdabzSjTd1U4FWeTsqbYuornw72drXIH4l1H0TIdV+nKqSz8YSdLAGVirOF1K2fJABpFaN0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739778735; c=relaxed/simple;
	bh=2bqkKJuQYrXDncYh8bA+cxdRKWIaL5fo1RzMSv2km24=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Xd1q9uKuKQlQ8ndmNrpsG7v8viFa2SAExgHdxVeR2QZ1nckBwiQUaL1ZEaLiA/+VPO/TzTK7lxGWzFk/0KBud+mrzGf8Nav1kyC5ROVJtEes6l0jncnDX+NUxfivswcD1kXfwOnynzgvxzJSgDSx31vejKZGHZ517LBSc42b0DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HY16XWVp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GCzHjQBv; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id BF97E1380267;
	Mon, 17 Feb 2025 02:52:10 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Mon, 17 Feb 2025 02:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739778730;
	 x=1739865130; bh=T2KHexYfmjD4XCcJqSK9a9i2fLMa/FWpq6BX9aeCb4M=; b=
	HY16XWVpte/vv3Mm0S1dgDPzOrN/Zj4/8OYMVnXua1S3PTemPR9FJvaiG8j5z/p1
	Hux8ETGkpjx5rFVSVpW1ISjgFqTSF+3L1Q3K+r1EKeqGhqrQYvPZ34vVRh0mNR2z
	FGrrAPFoE/8nJtIC1Q0xwZZhWySFB05Z/n6WZS1i0dDru63jxZphwdQThVYAIr3b
	dYoJWKq9+82CsfM8VUpAMvTauGkH+u3NKb9UDPOXivnd9TX/FaJVvUE1NjP+3+vD
	3RTU1gPJu8fQhyAOKasabOOs6L8wmj9a/q93gJvK3Y4g8ZpeR3M0ly7J0ASMBHVp
	4P68/dtRftXqqgNdwFJ81Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739778730; x=1739865130; bh=T
	2KHexYfmjD4XCcJqSK9a9i2fLMa/FWpq6BX9aeCb4M=; b=GCzHjQBvV3Abwf5ZK
	h5aEd1wHWslEIinkwpB8EyuM/IcqbeVS+FD/A6SojFP163uwsrVqGvFcegakLK9a
	NYG/20HtsLqDwvo1xYhYb3K5ujMQfIpu1Nz9SB0w2WZBCyqZ5A6gu3fc+xL5t7v+
	KL3xv5qGXEgDT4ez3jGLBBZE+ymswPmx+sdzQZFZNz64dxY6lNbY9GawRly1DR3K
	LZltyP4MwfSunWpRQ0ZGS0SPW35xHntavNrjymhF4AKQ0V2AYVrOWE7VpBIzb9Gt
	N/Ym0gNkEqLzCyPmbvbQ5/BPCTZIjHOMt/jnHJaJCgk2DZdDszPLyJvuSGOMHuUJ
	5xFOw==
X-ME-Sender: <xms:quqyZzr9ELyujPyjrysTvCuBkmfVTq6BKs_pLByRXzvIfQJKj7Z6Fw>
    <xme:quqyZ9oJLFxTQJB--gmea_ZCsVz0kUejgjrbLrlAlECxFkPEN1nDJRGCd-qT7nTv7
    DZXjts4cc8kbLK1zUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehjeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrd
    gvuhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiith
    hofhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghorhgs
    vghtsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:quqyZwNm8ue67guSiweZM5KGbf4wr90FmHsiPr7w13tnwdFtBKnZVA>
    <xmx:quqyZ26Ng3PwPVjVD3l-OZxAXUOSyzUzy--OhBNLJjsb1yBj_3iKwQ>
    <xmx:quqyZy7Qv2EfGzlpYsNNmSDDZMmxMYvofOPtQyaM32aazOr8yT-3YQ>
    <xmx:quqyZ-iTA0PnHwXGeLLFYXQNy49HxTaqI26d865ppbDU3SWBsEMB6Q>
    <xmx:quqyZ5a-c-hWR7XOGOlOQFXS4VaetMSLZAs0N3ZbfL1gRPIpPOmA8-aE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 18C5F2220072; Mon, 17 Feb 2025 02:52:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 08:51:39 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Jonathan Corbet" <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <eda7d555-d34d-4418-8fc4-a874dcca91fa@app.fastmail.com>
In-Reply-To: <20250215131739.220629-1-krzysztof.kozlowski@linaro.org>
References: <20250215131739.220629-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] docs: kconfig: Mention IS_REACHABLE as way for optional
 dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Feb 15, 2025, at 14:17, Krzysztof Kozlowski wrote:
> Several drivers express optional Kconfig dependency with FOO || !FOO,
> but for many choices this is neither suitable (lack of stubs for !FOO
> like in HWMON) nor really needed and driver can be built in even if FOO
> is the module.  This is achieved with IS_REACHABLE, so move earlier
> section from "imply" chapter to "Optional dependencies" and grow the
> description.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think this needs to be more strongly worded to heavy discourage
the use of IS_REACHABLE(). In most cases, anyone trying this has
just given up on writing correct dependencies and works around
it in a user-hostile way.

> +1. If pre-processor can discard entire optional code or module BAR does not
> +   provide !BAR stubs then call can be guarded with IS_REACHABLE()::
> +
> +	foo_init()
> +	{
> +		if (IS_REACHABLE(CONFIG_BAR))
> +			bar_register(&foo);
> +		...
> +	}
> +
> +   Drawback: this might lead to run-time debugging, when looking why
> +   bar_register() was not called.

From this description, I wouldn't expect most readers to understand
what you mean with "run-time debugging". The behavior that users
are going to see is just a bug -- they turned on CONFIG_BAR=m because
they wanted to use BAR, but then it doesn't work.

      Arnd

