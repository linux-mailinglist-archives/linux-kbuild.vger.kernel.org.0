Return-Path: <linux-kbuild+bounces-6520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2BA81359
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 19:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD1328A1869
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 17:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32196235BF8;
	Tue,  8 Apr 2025 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kAKER9WG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kxASuWul"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D3234979;
	Tue,  8 Apr 2025 17:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132593; cv=none; b=MjYBv+ugPVFMWcr257dOl8baMPpdxBZ9M1P0D2a/Podb2X9GoF480u3V0GUoEjc83dK4cYKOvVQXeFflHkA802TJsZjy4f3vIhNQrs2mUngVFfONJNlAFMdQMKdaU9HFYhMW7ucNtVefeaI0txuKCJIgK5Yim3MJow8iEhlcsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132593; c=relaxed/simple;
	bh=5sVm7Ccq5DFzle8yTbs1g/hLQHzfJVombqZ3QUUwX+Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pCcwJa2akv2wmtCd0ACoCc6CdVNsrBmOzFEhNpSnyLU2MA13DNaNPy/Xz7mDJCuHdJksHRYu8Pcr/MNmcw1BmAoyTPK5vqXFKcVIuG4R0IZ/gOdakYspLA3LgLom1aNC8xE3NuwOXc4YCf/Xm4Bn8L1IzUbSDhyG/C3JZBnB+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kAKER9WG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kxASuWul; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 301A611400B6;
	Tue,  8 Apr 2025 13:16:28 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 13:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744132588;
	 x=1744218988; bh=ZusC4j88iZDe7cKmTzZPwEEcBckZyU9z5JAnaD7npYo=; b=
	kAKER9WG8clrJgdPv5KjhGSlW0MTMk5KT4ZUk7Kw0BFGACZ5jol0penH71/1gQAN
	5qjpXbVzNbMs9sqso3a55c0mhxatEOgnBlPFswaXbqQVXVuL2b5qa602yQCMJ9Tg
	C/VVYD9yetDD4NvMjEZRNne8hAFU+Dl7BqDOCFuyobL44dg6iyb60EKsZnC+fm7A
	u0Ik2rTGasA0fSEjYMnN8h5f0Tbt9X/0Ikpuy4r+fJd3WolKh736R69sUkxgNcQv
	GvCPiGiFWVaxQXUnxdnQNxTA90CCMynLszA2i7jkuVjgDkgGEtVAEq+b/vqBMwZ0
	LzXKhjxzgHF6qODoQUzlQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744132588; x=
	1744218988; bh=ZusC4j88iZDe7cKmTzZPwEEcBckZyU9z5JAnaD7npYo=; b=k
	xASuWulBPJTSShQgUfSKwnoLD8ec+A277BzKDuxEnJzp8ZzNq4MdXk/KoUVv6jvB
	GMb+Llj/jrPu2WhV16RwgIFBSTChgTX14A3Y/Y7dEVGL6qoCYjUlDpPA0851RWje
	gw0idm5agye/vmHe/LSXchEkPiyoHcCSsDWA7lyl6hN6U76nBVxIM9HcNaXQqPPR
	2e3y+Rtwa4q+qm50bpWXvaxipmdCC2wcTQgdy1aLlSpt23iaDnPdo+CI4IdUfHLb
	ZR5w/enAAEe1T96W8TFXkKb+rzLSz16dQr29S287m9i7ftHNci8O3roNlTk9gL3T
	TOZPxW5NWjLteT6xc52ww==
X-ME-Sender: <xms:6Vn1ZzgSipKPFrG6IuVoqX5aC0B3zsJ03TwguC7t67ub6IzI064pWg>
    <xme:6Vn1ZwAuvhR3fDsZ5YZ1Y1k607MrfdkQysMrhL0JsIj5HLd9Ng1ogrHZkwqRYKAbs
    llOE7mlyo4sQ9Q2Jgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepteeutddtheffkedttdduiefgffefkefhgfeu
    ieetjeehteeludefleffieevffdtnecuffhomhgrihhnpeduiedrnhhonecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhn
    rghssegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrd
    gtohhmpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthho
    pegsrhhgvghrshhtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuhgsihiijhgrkhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghn
    rgdrohhrghdrrghupdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6Vn1ZzHurRHuHgzee5gnc6zzuDyC99eqxxcG0Rd-a83_k91ZjMjq6g>
    <xmx:6Vn1ZwTdHSNtQ4IwxNAhwiTCO_unZ12OFl0sjgDX-1QoynU850u4GQ>
    <xmx:6Vn1Zwx3PDyMl3hQZQb01ThSkhjNY3lKUTI6KycfntiEaYR15s-G7A>
    <xmx:6Vn1Z24UqqDehkMC3wjyPDDqgGzgMI5XFgUZNLhnHBQDEILM7AC05Q>
    <xmx:7Fn1Z3TC_xAheqDni-VD8_gghQnO4lzwgRrKNmcct4VKq6wG0MRxZT47>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A5352220073; Tue,  8 Apr 2025 13:16:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T46c1ceb211c7c949
Date: Tue, 08 Apr 2025 19:16:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Rutland" <mark.rutland@arm.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Brian Gerst" <brgerst@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Ingo Molnar" <mingo@redhat.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Marc Zyngier" <maz@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Takashi Iwai" <tiwai@suse.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Uros Bizjak" <ubizjak@gmail.com>,
 "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, x86@kernel.org
Message-Id: <37ac1bd5-580c-4980-98fa-653dfe3eb768@app.fastmail.com>
In-Reply-To: <Z_Uwxe46_o5nYkMB@J2N7QTR9R3.cambridge.arm.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <Z_Uwxe46_o5nYkMB@J2N7QTR9R3.cambridge.arm.com>
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 8, 2025, at 16:20, Mark Rutland wrote:
> On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
>> actually go through all  version checks and make this is the minimum
>> for all architectures.
>
> I am very much in favour of this, so for the series:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> Is the aim to get this in for v6.15?
>
> I believe this will permit a number of further cleanups for arm64, and
> if it's possible to get this in for v6.15, it'd be a bit easier to start
> preparing those for v6.16. No big problem if that's not the case.

I wasn't planning to push it for 6.15, as we've discussed this change
for a long time already, I don't think there is any rush now, though
I agree it would have helped to have it earlier.

I already found another follow-up, removing support for the sancov
gcc plugin that is no longer needed, I'm sure there is more.

     Arnd

