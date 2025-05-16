Return-Path: <linux-kbuild+bounces-7127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E78AB9739
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 May 2025 10:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D29CB1B6773B
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 May 2025 08:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0141F866B;
	Fri, 16 May 2025 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="052ekoYV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="drdAYO9a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976BA22C32D;
	Fri, 16 May 2025 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383276; cv=none; b=HpZlzM2gfW1PzC+UzTnmAS8QVNFZJmluXAbF4Ck8Dh1dNZWcpMPlCpT2FdDWVTWxtC0TU/WdF+t9oRDDoaQPqD76qYGb5lLwYIHkU5fHdG564WjDukLpLAoslt/57OCBWih43SMAv3vHh1MpVvjrBiTbRBQOQ3Wu50oYM9LOiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383276; c=relaxed/simple;
	bh=5o8u9UI3qSzHKBb8msf+BmnRXu2vA5xfWjWzupRBzf0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dsJOAuSFgpFb+jGW4cIKJKUesyR6An0gICyBUuKLmbBeiB85oMWASighWyd3ZcAvA8N/ZbAayNrhCyQAuZlzoeXVhZ/PnqzmUHIcxgvTJguy4U/tPhiUvtW1rkK0AKHIWHJ4vE4eV2TfD0prNf166FDdkPhCAyYXpwell78zT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=052ekoYV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=drdAYO9a; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 42FFD11400EF;
	Fri, 16 May 2025 04:14:31 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 16 May 2025 04:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747383271;
	 x=1747469671; bh=TNQAy/3v/9QLSLFFH92xpmcRe2YVjxYAjNqCMFTN3Ec=; b=
	052ekoYV6RayiTa2DxfUFA6HabKwskEGS2Tqtj0/bs7nkYANgSbIAuf727TX1cQ6
	P928iyqi3au10lYINrEVu3QH8QD6qV5f+sR+dtRqm7ky+fs/1y28AEXystFF8z34
	7GNVCn45I+AHO7nT7mOlBSsSw8hKr+TV0vwS8hRljWxrQuAnMGvyDCspzMD9faTH
	auoWsAyhNzl9qkXt/ko3JnNS0tz8h+uC8uu+PerXcTS95OUE3pBq2T2dKW0LMsZt
	/YPA85CGUUla92Kg0hFUlZlR5wJi6iu3B7EtntsGwjmqAAdr3rPANPOca9KV8hZk
	zMj3RTNXU4PWdF5phr1aAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747383271; x=
	1747469671; bh=TNQAy/3v/9QLSLFFH92xpmcRe2YVjxYAjNqCMFTN3Ec=; b=d
	rdAYO9ahRidVZ+oA9KDWOKxoWfMZjU4euDQQmdqiwe/fw/2l5reWmiMlPUKgtORN
	A4ac3uesbCs66B392kXrrhNbF2KvTqNfLTGldWKeKj9WmMhlNUOzqIAMnm7+DFcN
	pB9TnP0ndwgdv+haN5uzaTa7bHFuVDkoJW7iuq8/uiLYh8aXsyapHn10xVIW2a70
	1GyiHByZWdegATwuB1qbTcErcui7fNZo/twFLnBOlF7M27RPE1Z7RptkyCAGJUpi
	lCGkdshhXWZVTLSLkDcrVi19M6UE1Ltk/YFfeBWR+zrHoy4zEy/eEV0Tqpw8pWp6
	242ywdHunbRspJTC7Hg+Q==
X-ME-Sender: <xms:5vMmaGaxVnX6-ZGYTswN4aSmYLmQ-lMxCwBc4hvycnecD5YvZAXPQA>
    <xme:5vMmaJZISR81F_TkRhU9DLiwVhxx6qkv0nlzj8Ofn59spVch-MXn_aa35eRjIm_eb
    Vtp7G-9t3ZhPBb7OXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepnhhitg
    holhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthhopegsrhhgvghrshhtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepuhgsihiijhgrkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthht
    oheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:5vMmaA8EEx-OxskfKuRjr9KqwyscGaSynjNvYYLiCrwTmbWD-bToJw>
    <xmx:5vMmaIqgdVU4_r5WTwAPfvdbHYn3RYDW3ij-ah7orJFBFDb_ec2hGQ>
    <xmx:5vMmaBobzfhKEgME9i6MR7L-msBVA1kr6N4cGHyO6v-shXK68N8ERA>
    <xmx:5vMmaGSCjD70OA_GBpm2DaKQJhs2uNV6k2rokbq8YEFk3LnNyAWwuQ>
    <xmx:5_MmaH_50-jHxQd0krYUtVXnXcC7JhRQ2lGKO5MUdnKqV1cmrQSgd23Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0AD69106005E; Fri, 16 May 2025 04:14:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T1c7885e3064aa147
Date: Fri, 16 May 2025 10:14:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric Biggers" <ebiggers@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Brian Gerst" <brgerst@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Ingo Molnar" <mingo@redhat.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Marc Zyngier" <maz@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Takashi Iwai" <tiwai@suse.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Uros Bizjak" <ubizjak@gmail.com>,
 "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, x86@kernel.org
Message-Id: <77dca5eb-74d6-4363-9d8b-e7b0d449dcb7@app.fastmail.com>
In-Reply-To: <20250515182806.GD1411@quark>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-2-arnd@kernel.org> <20250515182806.GD1411@quark>
Subject: Re: [PATCH 1/4] kbuild: require gcc-8 and binutils-2.30
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 15, 2025, at 20:28, Eric Biggers wrote:
> On Mon, Apr 07, 2025 at 11:41:13AM +0200, Arnd Bergmann wrote:
>
> Later in this file, there's another mention of the binutils version that needs
> to be updated.  (Or maybe removed since it's redundant with the table?)
>
>     Binutils 2.25 or newer is needed to build the kernel.

Thanks for noticing, I've fixed both the English and Italian documentation
files now.

     Arnd

