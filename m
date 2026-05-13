Return-Path: <linux-kbuild+bounces-13142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JZxMuXSBGp3PgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13142-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 21:37:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B453A143
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 21:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A24E030157F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 19:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DD43B6BEB;
	Wed, 13 May 2026 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="aPcM25ay";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aPHxvsIV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32693B7773;
	Wed, 13 May 2026 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700960; cv=none; b=EPwDTY/A/dNwlccxwHcsNWsJH4IX7TISTk+zBDdfWICscMSwCEWZDewTLQ47MYmy9gJIq+ii/y2xW27BiZgNqiGF0kXMEjrBPc2MPVU69XD7Ymfl5u8/6ZO3nBCa7NbBIxj8LKyfnngbYVLWuGKT2D5fFxAGnspRj/WMnbRL97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700960; c=relaxed/simple;
	bh=Khx6itO4f6h2LJ2n1xbCjOUxSfRTCgdmu9E86Yug4S8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YrbKmAHikFNZ4POWJySHftLWwJjFkZH12EDsdVvm13EVWHs0uVpQZZJGxZyWVbWY6wvjKVGH3suymoNXdLR7RF1LUPB2DuultmuNmi3BN7soYl31PfXiHauTDfmsqb/WuPH8CYWcYLcLI4loGlxR3Y1cra3FpY9r9rW1jrbebEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=aPcM25ay; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aPHxvsIV; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id EBF79EC00DD;
	Wed, 13 May 2026 15:35:56 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Wed, 13 May 2026 15:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778700956;
	 x=1778787356; bh=OHAXGNS2uZNJvowLRr51yYDMzB+i8UXrJCrf7upji3U=; b=
	aPcM25ayM0XuFhS9n+688nxNsXjMY0r/BYzD7/ntFpJo9l4god2FFckBFiI98wiJ
	+eQNmb6SeUpYUp6eKcEp3KGsy+8o0XffMGucJF1E1A75q6hYNMZMlzV7RHCjQcHK
	ov9LOR3w/yu0L8aBXo541GRq3Kxy7kdGuD5KnVlUGDZZGQLyq9ClwItiejgpNNQA
	xilGHH83gmhqc3U6EvZ6lgRPg3r/AiZHEkwnFst8uRUC8RK/nbMYA8PETxcMoypg
	UC5W6xEMeQoChiMh3XqaE7rc3vg6SnoCl6iV7biaUMIPfFko4duAEow/IJR2Qvnd
	WOwMxbKrBBnElStCexxoQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778700956; x=
	1778787356; bh=OHAXGNS2uZNJvowLRr51yYDMzB+i8UXrJCrf7upji3U=; b=a
	PHxvsIVPJpW1HeGgtPyFE+l1MctbzfXIrE3LD9aWPy5QF/jqcoyz13Isdmq3YS9A
	41IROyONSKO9B1/TgIHB5TzaRDY/GJwEsZ1jrErc9vSn6ym1m+mLMIhIemP1hoeO
	kAAwKiGtDg8Z77NVFBZuwCJq3fdzk/EIzuMgtgKD2B3RVKzkrg4gRpUvdqsXLt6+
	cohvemK4xp1LCZE/q6omJ4bzcch5Doahmw1BifOIagrgfFpcjL5+hasjd5O3vAoD
	mnfiAkzQ+tSH32OA6ee0ptRFIh+rvxtTdc/EHKgqjeEB2NNvI6QYZCh1ivnfC7/q
	rC89B7wahFMIDCGmkyelg==
X-ME-Sender: <xms:nNIEajaoHW-4H7iyOe7hdtlJJORZYWQT2u6ot7DkYeMUD2HHSObnOw>
    <xme:nNIEatP2F7Yxl4qJltGnjdQceo6GA_21SNhvL0JEPtLtK9faPC5NzH4Od38VeQlIQ
    l55XxDA9i8ozoMFIidzhBRXpqYYhBdL3U0M7IN1QeGiZJHxL4dDGEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdehhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrtghpthhtoheprhhosg
    hinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhojhgv
    uggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nNIEaifciD9rlNDoMgz1_wJRSTbIq36gaKPXjDBn2aJ6sFaoPg6t2w>
    <xmx:nNIEahwmuHw5lD_K8siXNUGo0lWeKqc6wC8RKPjHx5IlKqkOvNneIA>
    <xmx:nNIEatHpxgrZk0qs60zbrhENfjgJyyd_h55p_eBsVDkLJoG_viYPlg>
    <xmx:nNIEag2S9fafatiAisPMi8fI6xWkARnTwePJu2XFhyy6ahDD2CfH1w>
    <xmx:nNIEai1yYh147Ht3nTYXXvFX6h0iyp5PvJ0HKdH0PVa0zSnSOVch68h0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F9921060065; Wed, 13 May 2026 15:35:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AR4HEWfQKB-F
Date: Wed, 13 May 2026 21:35:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, "Joerg Roedel" <joro@8bytes.org>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 linux-kbuild@vger.kernel.org, stable@vger.kernel.org,
 "Robin Murphy" <robin.murphy@arm.com>, "Kees Cook" <kees@kernel.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <be9cbaf0-b6dd-4a62-9da8-b42dcac907c8@app.fastmail.com>
In-Reply-To: 
 <CANiq72nbRw14wdZA4GH17K22Krh4ujB_wtuv9u5RQTGtidpq0g@mail.gmail.com>
References: <20260513145425.1579430-1-arnd@kernel.org>
 <CANiq72nbRw14wdZA4GH17K22Krh4ujB_wtuv9u5RQTGtidpq0g@mail.gmail.com>
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 046B453A143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13142-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:dkim,app.fastmail.com:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026, at 17:48, Miguel Ojeda wrote:
> On Wed, May 13, 2026 at 4:54=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>>
>> With some more experimenting, I found that marking these functions as
>> __attribute__((noipa)) is both logical and reliable.
>>
>> In order to keep the syntax readable, add a custom macro for this in
>> include/linux/compiler_attributes.h next to other related macros and
>> use it to annotate both files.
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

> If you don't mind, please add underscores (i.e. `((__noipa__))`) and
> place it after `__noinline__` to keep it sorted (the file is meant to
> be sorted by actual attribute name, though some entries were added
> that break that, but I will clean that and a couple other things up at
> some point).

Ok, changed now, will wait for other comments before resending.

       Arnd

