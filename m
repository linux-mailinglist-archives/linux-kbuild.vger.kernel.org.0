Return-Path: <linux-kbuild+bounces-12317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HVwMpuMxmlELgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12317-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 14:56:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9A345A8F
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 14:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17324301963D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 13:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3773EB7F8;
	Fri, 27 Mar 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WXmgYcfo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IHVVfnyL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA225A2B5;
	Fri, 27 Mar 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618948; cv=none; b=M4c2J+8z0Qat4m+SSwvI3kqKezjrVQoYghwgSrhqe9tSzfIII/nOEBuoj3uWR8oIo/IuQsglBjTSs67bkCFQWHq0LjUjSZlkTrpLS3GgyWF/zW282/41T0tyTdJt2iDHEZK9q0omTXS6+XaPNwD9+5vy5Y/dWXracdKP7VmwWq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618948; c=relaxed/simple;
	bh=frSGxxmPjWh6IoWttfH/PUHq0x6wot1GxUuiDrqWzYQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=O2UUIqsd4IDvkYkfET1OB3X41igg1uk1xk+qN/NNczPxG9/8Ycrpw8sn+qFpEWioS2TyD7tM/+0n601yMcJqDj6THlSeDhaGpL09PR2bhlMzZGt2/CyeM8u0VhkONHnbPvvGicSBUoFEMom0a7By0+ofUvjFWMFZCKRkWspQc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WXmgYcfo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IHVVfnyL; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id EE82B130002C;
	Fri, 27 Mar 2026 09:42:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Mar 2026 09:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774618943;
	 x=1774626143; bh=r8kqb/PmSoN6Ni50HiBp9vabWKni4KIgQFght4+Tts0=; b=
	WXmgYcfoU7DXqp4nVD4iHGiZnjmZ/oBiySyxKd7rz8vp9kcZDKnYLEMGgCJQIjL7
	V2ImP+GLWMVeAo9BapSvgkg6sZA8FAlX89F/EJgDZjHchNHND2dlQNt4pc3epoh3
	OJ9ax8G8Ti4nTeaIYae/vg9E4znqy0UmoGNsm5mT/JIT7wWxREblo3ydqTVYtkHP
	UlmWf1KNBzT+e6MgE7LIPG67LgydS+QGPzIPPt6kxSxTjBes6xazxKTqstswJBaF
	FpIaPM3zI7B8Hpd+MXNo6jjXH4XrRQbGwe29451a2OxlVNv+QJ8HI+vwtzjFwRfv
	pS+0qtzZIeVwB5SBu2Lzrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774618943; x=
	1774626143; bh=r8kqb/PmSoN6Ni50HiBp9vabWKni4KIgQFght4+Tts0=; b=I
	HVVfnyLZcN35pRyg32jICZM0qVLXsONawFPdb+heGxPgSM+izITH8vBPCEA/bJ9E
	UN6H6aMcYUgpH7jg7wSGLvSMIlKgI7lRJLiAnw1ZuUsNQGzkiUxHOU3GYu5q66XA
	Jtq76kjAyjkWoLV5eiPhBRC7IduTmfV52rSHitiA33ESsKYRWwKnZbkkIzoB5A80
	UuVbB2VtJaN78K11CULHWhyiLFlTrPunOhraGsziiJpg80dksixydziqGGZRWk+1
	rmY6b5kCR5m6oncjYZkweCTkFj8Kmi58gdgjDLPH5eRzHI0CFMQYY1btUypTC9F3
	EVQl22V83017juQKIQ6Eg==
X-ME-Sender: <xms:PYnGaTFjNv-2kjwzDO96mcm0J53r3iq9GAQxohg1QK5UaJwCiRIPvA>
    <xme:PYnGabIVAVLiZp2iZ7XOB_zppj6xtVcQUdS2evGHJbBxfLdaZ5WI6ibLO15radjvz
    L2ZUekfulSqpSJwxkEQ-5xkmAa_hhYZUOHObcnX-PTAuMVzrh-xqU8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjrghmihgvrdgtuhhnlhhifhhfvgesrghrmhdrtghomhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    mhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhes
    tggrmhgsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepuggrvhhiugesuggrvh
    hiughgohifrdhnvghtpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptg
    hhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:PonGac941VeA2oTCcTkWfzRB1nZw0mSSQHJ5Pqk3p0ZS0l9NehXMHQ>
    <xmx:PonGaQa4Rabao1kTTsgiRbWyc3rxCyCd3mcww27MNaGYm9rsSBoKMA>
    <xmx:PonGaVpcyAK2snd2rS9lHbXXYlQwTHW_7ACWd1UNjoDP3Fnvn14ONw>
    <xmx:PonGacv8QU40CC2nyaF90d74nBjZSBShHRTwrc0LnYslN6WX6eF_Ng>
    <xmx:P4nGabYMQKNNUJ-KtgTpLrS-vE-2hZR7lr1g9qxy0N1Vgj0xHOpyYnfa>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D382B700065; Fri, 27 Mar 2026 09:42:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUJnWW6OA6Vc
Date: Fri, 27 Mar 2026 14:41:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, acourbot@nvidia.com,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Gow" <david@davidgow.net>,
 "Gary Guo" <gary@garyguo.net>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-um@lists.infradead.org, llvm@lists.linux.dev,
 "Benno Lossin" <lossin@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, mmaurer@google.com,
 "Bill Wendling" <morbo@google.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Nicolas Schier" <nicolas.schier@linux.dev>,
 "Nicolas Schier" <nsc@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Richard Weinberger" <richard@nod.at>, rust-for-linux@vger.kernel.org,
 "Trevor Gross" <tmgross@umich.edu>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Message-Id: <1990bf45-050a-445d-bcea-16d225207531@app.fastmail.com>
In-Reply-To: <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
 <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-12317-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu,physik.fu-berlin.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,arndb.de:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,app.fastmail.com:mid]
X-Rspamd-Queue-Id: CBE9A345A8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026, at 10:02, Arnd Bergmann wrote:
> On Fri, Mar 27, 2026, at 08:56, Geert Uytterhoeven wrote:
> but that only allowed bitfields to be marked as __attribute__((packed))
> in order to get tightly packed fields and return '4' on all architectures,
> while m68k-linux-gcc apparently has all bitfields implicitly packed unless they
> are explicitly marked __attribute__((aligned(x))). This behavior is
> independent of the -malign-int flag.

I had another look and found that this has been in gcc since ELF
support was originally added for m68k:

gcc/config/m68k/linux.h:#undef PCC_BITFIELD_TYPE_MATTERS

All other current Linux/ELF targets get the default from gcc/config/elfos.h

      Arnd

