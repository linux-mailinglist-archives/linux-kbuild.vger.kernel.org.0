Return-Path: <linux-kbuild+bounces-6557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1707A8308B
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 21:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B2F1B802FF
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 19:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24CF1E5201;
	Wed,  9 Apr 2025 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SZVS2X+S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MGt2wZC/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7E165F1A;
	Wed,  9 Apr 2025 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226974; cv=none; b=hXWPSlxBOvygZmx7zTvoiOS6sljet0ZFkkF3hMbkaXxl/BG+hc1P+VnvtWtwiWoMGU/ip/9aOICMKw80Zz/qMOoQV55mAX36KYm/O2+QzPbBJiojYNgX+9lt1kB6GibIVHBvZ5EdwKJbJFDkJqS8qNebR88EW/lrw9+U2j3YpT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226974; c=relaxed/simple;
	bh=/33JDmW+PxsRyF3vd7Wh4tmmtBi36TC/ft8P/UrztgY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SYXH4jG4yxkoF6EGSZmoOSXqCuwWCxTqnEUaIbjF2r9eEtd8h1dJomHZ0q6pwSEoqaeiqBlSO32TX09FpjNMHpKZTvi/vYWcYX4tFXmdLvVbejc0aVRGgJieb9bF1l/U6SSOR8INF3Lkvo5hpPnVMljnpdPfnLKdjGpY/53Gd2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SZVS2X+S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MGt2wZC/; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 54F9D11401DF;
	Wed,  9 Apr 2025 15:29:32 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 15:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744226972;
	 x=1744313372; bh=7LeM8fTejAmZLunIFrf51zCFnY/PxkuNIPidaV8t9E8=; b=
	SZVS2X+SXF/xI6ETW3YUrp1+nOPW3P3YCOXZsI99XSr4Oq0Bx+9o7wOiPyN9BUf5
	QTTHK6Q5a30QD2kDE1P5bPi7NwKIepgeEyVeIlW7EaXedIJtXBITlVxx/88PHYH1
	/pxoUji0xkGcF1viRLTQr3Wx7O8rRFgr7iup/SYaSgjn+8UWE6HpivjnTcbg57Bd
	309apBy/Tzg/R5lJ/dxRZikefqgcx13YFwERlPRWVu0F+sCxAHM3QlynzVpj3K3a
	UjCRcOD2FplJBSsDIVmz6RiTzqadQJcUf3XyqXWPSQjZZ0+sArIIflMj0+OqO10F
	bBG9mB82FLJx72sGPDKVcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744226972; x=
	1744313372; bh=7LeM8fTejAmZLunIFrf51zCFnY/PxkuNIPidaV8t9E8=; b=M
	Gt2wZC/Vedbg9H8OvDlh2J9HdQS9iF+dB5FYV520GjIY5bCcUKhBIejDGcL3YPwN
	g0cPxl8uOwJaQ9OXZj1dep4PSZ2TZIJRJfPsIlSwwK7J7PkIR0EsTfZggMJDLaVb
	5vvqLlchL5Mdqk1BNazl0+hXk25oyc8wtXkzFJ2lusR+jtKgryNfRyZiJL63q1Ah
	A5K461r4GiDKHIYmaeg0e86RTU8lpnbt4Pwjiri0xRIYkrzj2PcXp1Qeh2uCDhrq
	tIbYZsoCqrFLZV6zSZFU4OBx6muOKrCDkv9BeoLhIyJDFuggQtsXpQmj7PgvNLmr
	V4E7gVKSY5tXEd8K5wykQ==
X-ME-Sender: <xms:m8r2Z4IDKxBcEDfYGDYslx0jUkXueEdDQvXueMqzKLgGxpukJDjZLA>
    <xme:m8r2Z4JmRcd0bWpheClZBW7M-qrnMDGY_tTENCYN2lm3Ttlyo4W2PVq_dGT2jclFj
    M34ezDpy7nx5I609no>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeikeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnihgtohhlrghssehfjhgrsh
    hlvgdrvghupdhrtghpthhtoheprghnughrvgihkhhnvhhlsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepughvhihukhhovhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhush
    htihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepkhgrshgrnhdquggvvhesghhoohhglhgvghhroh
    huphhsrdgtohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthh
    grnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:m8r2Z4vJ3WXAHXrvKXd5B3xKv4UAtE2V-BrbJEZAyq1B4dzTfpijvA>
    <xmx:m8r2Z1YeiT1XCtilSnIsx6V2-MzbggW-b6mGOWfQy9AEZpRDFmlT5A>
    <xmx:m8r2Z_byLixda4QM1ei16kxOQ2Y7JUi5RRFxBC3Vzf0ThsHM5YccDg>
    <xmx:m8r2ZxAT9c3e6CGKtCSEv5jY1K8fvNyLiQKw-tehgk1U77NzNctBFg>
    <xmx:nMr2Z5lFihtWtcgwl8O9IIHMPAftIujBP4HeUpKPp9ywwLH-kGjpPnka>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7B78D2220073; Wed,  9 Apr 2025 15:29:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T654dc7563e4388c4
Date: Wed, 09 Apr 2025 21:28:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <kees@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <6f7e3436-8ae8-473d-be64-c962366ca5c8@app.fastmail.com>
In-Reply-To: <202504090919.6DE21CFA7A@keescook>
References: <20250409160251.work.914-kees@kernel.org>
 <32bb421a-1a9e-40eb-9318-d8ca1a0f407f@app.fastmail.com>
 <202504090919.6DE21CFA7A@keescook>
Subject: Re: [PATCH] gcc-plugins: Remove SANCOV plugin
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 9, 2025, at 18:19, Kees Cook wrote:
> On Wed, Apr 09, 2025 at 06:16:58PM +0200, Arnd Bergmann wrote:
>> On Wed, Apr 9, 2025, at 18:02, Kees Cook wrote:
>> 
>> >  config KCOV
>> >  	bool "Code coverage for fuzzing"
>> >  	depends on ARCH_HAS_KCOV
>> > -	depends on CC_HAS_SANCOV_TRACE_PC || GCC_PLUGINS
>> > +	depends on CC_HAS_SANCOV_TRACE_PC
>> 
>> So this dependency would also disappear. I think either way is fine.
>> 
>> The rest of the patch is again identical to my version.
>
> Ah! How about you keep the patch as part of your gcc-8.1 clean up, then?
> That seems more clear, etc.

Sure, I can probably keep that all in a branch of the asm-generic
tree, or alternatively send it through the kbuild tree.

Shall I include the patch to remove the structleak plugin as well?

       Arnd

