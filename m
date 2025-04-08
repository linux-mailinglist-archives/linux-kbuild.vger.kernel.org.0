Return-Path: <linux-kbuild+bounces-6506-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC8A7F709
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 09:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62074231DF
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 07:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E722638BD;
	Tue,  8 Apr 2025 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BnAb3b5P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yw4K4gV0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8501FECDF;
	Tue,  8 Apr 2025 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098236; cv=none; b=uk6M7TTG4Z1e7fRyQLOlzf1bn4Kywi8vUtWYCBLJl87MVvYeVPVsL+3CgqVgZlI56gmmjdQvtw6+IbK8APQvri3eW/HpioHXm6irJmCHcrQnr5htZnYUEZEocJxGMznKGuppEm+VGoedt0tn5Qs1SyF0AuIEGJLlm5mOb4NFWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098236; c=relaxed/simple;
	bh=6bh0qyU+r+JuXFXJKhwKfbhcKQy6IuZgXqrPKNG5G/A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bvhyGK+mI66vMnRO6AFDpkGvyXg9iABqrWhzgLZ7qde8+9qHqWjrr5spug4qETkin7lcxvIYbIVmvzdzVv81zAcNyfR0meWIXmpfGE6x3C2ihE1LK8GNhCTpvPdIFjzo7qZOr64dVW7KhqTniFMi7XWj1LY3duqYkfkvlKlqUO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BnAb3b5P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yw4K4gV0; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6C5C41140146;
	Tue,  8 Apr 2025 03:43:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 03:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744098232;
	 x=1744184632; bh=ewx83j9qElYFHGyCDMW6mla9eXeOChmIosrMTe0/WBs=; b=
	BnAb3b5PIUXSgS0G5av5ieSA92df8uJv1AQC8Wex2ZKSql0hMzUhSD3bKsLw3/Lz
	Tkzaldn1CIIm/GUZxxFsO6Hi/YYI0OjTYBDuZQU3zblAPsH2060iYU01zl50so4U
	tK2IQ0UFSc4iYBd1c1GzsdMwEz1BRkZ1czwbZgfPY3xE1nQPIXNOTPyaDYtpd3Dy
	wM/PsRlzglvRNMMVwHQiIxDOdBvml9vIkF+NUeX5S2dJHesq3W8S/FjBwgJYwBV5
	/wK67ZZNz7tR6vin4xqwgQgM31DVHVebh/vh1Pv2VhQOFbHWL5QgPtFCQoIkaBk+
	llv8o7ihgpvX833cgLTXlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744098232; x=
	1744184632; bh=ewx83j9qElYFHGyCDMW6mla9eXeOChmIosrMTe0/WBs=; b=Y
	w4K4gV0Mh+I8g3s9TfAoNlJ80Xbr/keyzEPnpZdjTgOiODKlOoXcM3SmHGSFf13c
	E/VR345nVDXCC9dTm3vxF6KmmXEevx4RVz+qg7cscxqBsZc7QsYnphbZWrdxyE/l
	SOjGsVFY1hxPk9ZV067C+0lZVS7h7JSDZaaCyPZy8wcJIWl572xpZF1Xn64fqZkO
	D1m/pyE+2u2almsE5VBDNr8bZJytO+Qtn49yBHIVZNG9psjoyR/yXf6tJD2MwJth
	ldGnFN80ogvzUerKLJq/mw0tgMf2s3c++2TNUNizb2VbIDfeMQqS6eSzdipc2UDH
	VxWXFVUricWQzD7rIcqvw==
X-ME-Sender: <xms:t9P0Z2FFd6HeiNkUYIqhP0IIvt6RrqTsYoyhdfuVxRsgBUsVXSpa8Q>
    <xme:t9P0Z3XMf0PVXL1OwRmQ6BrtpFwAJefsD1XPE73J32Uczij87YmouPt6sQ8UV7qlf
    YEwJJuHBIbKVz-zsFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfeffleeludehheeljedthfehgedtffehtdff
    ieelheekteffvedtgeehudfhiedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpgh
    hithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdejpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepmh
    grrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepnhhitgholhgrshes
    fhhjrghslhgvrdgvuhdprhgtphhtthhopegsrhhgvghrshhtsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepuhgsihiijhgrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhvghr
    sggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtoheprghrug
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:t9P0ZwKEV3h0A9U4abhdgosqJR81_XlNNlrBOoMMv90RDY_A0HxFAQ>
    <xmx:t9P0ZwFtmJBtAwUERosEmNCeDPYn_gPoNBoNxaIonqBE9WNn3Tv96g>
    <xmx:t9P0Z8UTBRpwm3xoL__t3pweGd4k75DJPhLsM22xTtb5m_RaAsJkMA>
    <xmx:t9P0ZzMFbzQ9KVEEOAgweQRtkE-SF-hm6e1ingTAWEwE9sAou3S_gQ>
    <xmx:uNP0Z4rFIQyEeeeBln6uug9CpMZmT-HDuAUYTmQqmy6JF1T7gKshVYlF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E50952220073; Tue,  8 Apr 2025 03:43:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T46c1ceb211c7c949
Date: Tue, 08 Apr 2025 09:43:10 +0200
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
Message-Id: <0d087503-88d5-4d66-aa52-161ca6e0df06@app.fastmail.com>
In-Reply-To: <20250407164151.GB2536@sol.localdomain>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407164151.GB2536@sol.localdomain>
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 7, 2025, at 18:41, Eric Biggers wrote:
> On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
>
> This is intended to supersede the patches from Uros that removed checks for
> binutils < 2.25, right?  See:
>
> * 
> https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> * 
> https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> * 
> https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/

I missed these, but it does sounds we easy to work out, either
by rebasing my patch or dropping Uros' version.

> If we can indeed bump up the requirement to 2.30, that would be great.
>
> Just a note though: I recently added VAES and VPCLMULQDQ instructions to
> BoringSSL, which increased the binutils requirement of building BoringSSL to
> 2.30, and this caused issues in a downstream project; e.g. see
> https://github.com/briansmith/ring/issues/2463.  Specifically people complained
> about being unable to build on Amazon Linux 2 and CentOS/RHEL/Oracle Linux 7.
>
> So I just thought I'd mention that, based on past experience with this sort of
> thing, those are the specific cases where it seems people are most likely to be
> trying to use binutils < 2.30.
>
> But if those distros are not going to be supported any longer (without
> installing newer tools on them), or even are already unsupported due to the gcc
> requirement, bumping up the binutils requirement to 2.30 sounds good to me.

RHEL7 comes wit gcc-4.8.5, which is already too old to build the kernel,
so I'm not worried about it at all. RHEL8 and Debian 10 have gcc-8,
which is why that makes sense as a new minimum version.

SLES-15 (gcc-7), Debian 9 (gcc-6), and Ubuntu 18.05 (gcc-7) are the
ones that can currently build mainline kernels but are broken by this
change. SLES-15 is the only one of those that are still supported, but
they do ship with add-on compilers.

     Arnd

