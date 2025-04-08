Return-Path: <linux-kbuild+bounces-6516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF9A80BDF
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 15:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08EC64A8057
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B903219A7C;
	Tue,  8 Apr 2025 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z3dIpbMw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a1r82MnE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135EE21C19E;
	Tue,  8 Apr 2025 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117905; cv=none; b=RcchwFvjvtvRezep+RyeWV1nwV7T01zg2xAzve7DHuyrLBDfa+/molZB1Nyo+7fE2Rl1mAktlGkCbN5hzg6mXHH+FyLgXGbrwQd+u29beP1n0qw7itEToAokk0vjMDLbhrOafaUj8wIRKgjWrBMJxTnG5UdlcAJCGB2EylJIKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117905; c=relaxed/simple;
	bh=AXRPJVEifQdI3nJtPPjUXe4XCTpR/NRXJNNggWTFEIQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XS5QufIro+9CMMxEnvdk1p6vb+R0tdQoQPb05GEoHBHz4nAYZXkSxq3ucuOGR3KmIDg8zEQO7zJPo0XCWf0CW/73ykaQuA8OUraxLZk9QYuhBaKOW7S90P1B9bDNpxi7glvvqhTqMmz6nAFM0K++pF9B7C+e5owsDyx5/ZJaZOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z3dIpbMw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a1r82MnE; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id DE5841380120;
	Tue,  8 Apr 2025 09:11:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 09:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744117902;
	 x=1744204302; bh=pe/pDEo2guyYHlVB8bG9VreJJk3m2ca7soHvKl38b0Q=; b=
	Z3dIpbMw0Y/mYAqGZZg05ku4GQKx2KTKYEH+2+8z3sSbrcLlfVEtTdhD7ThHC5hr
	n6WvlMqOjQxfQ8vEu27QZ1w8K/8cQXFvB2H9fTBRHzOPKvPOS9o/r45TQMgLBieW
	+0Tmf4+M2RxlY2KMXR6rt64U8DrrP/BPhZIZTkhmeXWVELHlxLLMuikurXX3Oj1Y
	K/6Iun73MgWvnl8Hx6+/PKGOV5EQm/n37JuUCIO1SvsM91mGX5dkSkKQVmYe92+2
	bzQjr5WFwkPnA3kgbw8CqIXbujYBH9ZhJhTwUW38S0rER5B+KWy323CwOetKjKro
	N+y5tQIZmKhTH3hiDyrTtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744117902; x=
	1744204302; bh=pe/pDEo2guyYHlVB8bG9VreJJk3m2ca7soHvKl38b0Q=; b=a
	1r82MnE8x+eDKresOkBHjcK51fL8yVo1GCSCWhEwT2CdvJLFiE6SPd2AvIYieZXa
	1HJn4+7d5qKGumBkabqXEpaCi+OZMP1RavQleKRG4TDt5wI5r1613Ibq4olhHKTh
	GPLx+eruJJmqaO4oe0O3K4lQROsFt5JfzlC8ZAMYstihPzIrC+8RDUI+N9VSI6/e
	x/vfyHPDxGhCw84MEcelcHeG44WV5dWY1d4w8MpSqgP/e3M7IbVd8EEDa2+aKsHn
	zR9j/QJMkE1E5J5pnPXhmLhP3DF5jHGTnMs8AEdobasdGhX+jNN9AaLFe7RNW7Nv
	uBOq+bMDtmje3YHkAM7/g==
X-ME-Sender: <xms:jCD1Z-ExvXpqn2sg3rEx2-Xnn59sSmhsFiJC3LsFX7vbjn4km22C-Q>
    <xme:jCD1Z_V-wJ4DLOAf-imCZH-rbHo0Y04LDw-xzERZwbKCvVVO4yBEAYzgAZ8RF2KWp
    DzVpPKu-QzTbUbMp9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepnhhitg
    holhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthhopegsrhhgvghrshhtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepuhgsihiijhgrkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthht
    oheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:jCD1Z4KEQgHpqujUSvewbhMIDiixonJu826h9tZNwMUiyZgDMq_WMw>
    <xmx:jCD1Z4GjGnW5AE22FtLVCLpmg_JvW1BHs5ij00Qs-qdTfr1LjDpbxQ>
    <xmx:jCD1Z0VIbaBHoETv9OiwIZLLgkFGTbTNTMXnd426SIg3ym1g_H1v-A>
    <xmx:jCD1Z7Nf-HMFDpE0ig6ondYGRraX5O8AcRjLgNdSlsz3K6nvqCqwDA>
    <xmx:jiD1Z5GqzXRg4-GbhYQiQ6WCz_wTcyXhm5aT6gXidLvryV-wq-Q5lQff>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 06B8E2220073; Tue,  8 Apr 2025 09:11:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T0f9b5cbc403118ed
Date: Tue, 08 Apr 2025 15:10:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, x86@kernel.org
Message-Id: <f79695b7-f0c0-442f-963d-6ecae246ebf5@app.fastmail.com>
In-Reply-To: <20250408084642.GA1768@willie-the-truck>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
 <20250408084642.GA1768@willie-the-truck>
Subject: Re: [PATCH 4/4] arm64: drop binutils version checks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 8, 2025, at 10:46, Will Deacon wrote:
> Hi Arnd,
>
> On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
>> the individual feature checks can go away for simplification.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  arch/arm64/Kconfig              | 37 ++-------------------------------
>>  arch/arm64/Makefile             | 21 ++-----------------
>>  arch/arm64/include/asm/rwonce.h |  4 ----
>>  arch/arm64/kvm/Kconfig          |  1 -
>>  arch/arm64/lib/xor-neon.c       |  2 +-
>>  5 files changed, 5 insertions(+), 60 deletions(-)
>
> Since some of these checks are dynamic (i.e. they try passing various
> options to the tools to see if they barf), have you checked that the
> minimum supported version of clang implements them all?

I did some randconfig build testing with clang-13/lld-13, since that
is the oldest supported version, and checked that the options are
all supported. I'm pretty sure it's been there for a long time before
that already.

      Arnd

