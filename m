Return-Path: <linux-kbuild+bounces-10007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E020DCA8616
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 17:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDFA430EDE81
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAA330E826;
	Fri,  5 Dec 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="An6Q8AKa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gw13+jli"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD52FF16C;
	Fri,  5 Dec 2025 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764951286; cv=none; b=ddCyZ5Bf8ipGDM2yKj4mmNxVzKto2zd6LJLyaOySf5DulUKUs9U1OlW12Kmq9KnxbVBW/JhCh2wkw6C+GkTUMXilkagNPfbmElYJoXze/yx/Fwagj/ZHfGm5twTK9GJz4L8kdKub7i7UEi4hixY5X4SK3vMexn3E9/k2w+1CO7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764951286; c=relaxed/simple;
	bh=7Zo+B8tCET+fdTwnbnDx9vCho+J+rtMV5OCZ+Kylbys=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rxWA+n4Ekaxl11IUWuAj+/7TLeb6Bt7e8BfK3sBP/QdPmDb60ijTWDWwy2hQa028aLGocBEYvqhMXQAtkX6o/gtW0ggzHkwWAFragJ1qv4kczx0THk3yj+MTZ2CIvW7hreV1RLIRcvO2ckocN2qUGuAGN8cQHs+aNf3gKhZR4Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=An6Q8AKa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gw13+jli; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1B8617A01E4;
	Fri,  5 Dec 2025 11:14:36 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-07.internal (MEProxy); Fri, 05 Dec 2025 11:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764951275; x=1765037675; bh=4wqfC08czy
	uhD5atohtJJLcnUaFRLDORejnOX/G4miQ=; b=An6Q8AKadmcG1kNac5EVIIouqQ
	/kE8P/8qKD+W80i7K56I8RwY/CShBpWLPisWr8r+ilrBxtTgsrvl9sMsTkz7pKv4
	8iFuFI2gVRALXAUHB+5agb5djeTBaLyoID/0Y03D09aqIu0HJAAYY9Ey6TDPAZpq
	ZEVE1Gs2Zivptt75hfWKSpI7g3Qf+Ax6OqJtItG6SlNe6g1LQH3yaylVcyWSfVb8
	7ZptOQ1zjSbSYerAI0R2WfrSwGgKnyRA3YcqOfx7jp9aN7Qa3oCiPLrFaoZTd3y1
	NKiyJ9zmNktxyuzCJsi8mg6XT4QnXwASEho/D/wopyhgF4mVzk7FTcD2pC/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764951275; x=1765037675; bh=4wqfC08czyuhD5atohtJJLcnUaFRLDORejn
	OX/G4miQ=; b=gw13+jli76Ne6yDq8OMaYPJ5qWv7+l/ju8u/XeobJEiBGGZi/qq
	4E7r7aLyc4vZtKqc3h+wpvc5+ml/2TychZGTMsyqBDhSB7ReqvcSTLOWKx07oRPY
	PC/CmCzPY+zbDTcMXPvA0PY+8hDoi0QklX+4y81vXXEerzWquIiuLStIUnP31z1l
	F2FULbOSMZ5vdLJ3t9w1XmbbRpmxNZVFnu0QMSzmNwDcKeoB8BXCJ2jG3H/9yDOI
	CuHR6Q6gw+yhk6t1GKz5+p+XQcbMowHLeDHkiVJZlj+TF2P1ZNUY5RqcvL191Qo9
	Kzp2Aap5jbqQhUbDVByDRu/2efUcm1I2+zg==
X-ME-Sender: <xms:6wQzafowa3rdrGEv4Wka2MeXxMYkMox00qVGAYkyApkSSoY186t7lg>
    <xme:6wQzacNW0JKb-D2fx-kkA6-3xZ9Vfl36jNgyhvnZ-O2Kzm8mkaG1rDgpws2ih9SXP
    ahHW6soxDKJzOEZmiqcB6YsIdQiEbqPMZp2FQCRnkpaxoLivfegeVM>
X-ME-Received: <xmr:6wQzaf33iU2yeZ0Lg4CM0jCIy7TQeJOJoWMn_17sp93TlQxUskMsWRTinZyYF2FqFkudrHM7TFthf2HtU59y-ZBHg_hjrQEDDoU93V0B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefpihgtohhlrghsucfr
    ihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fgvedvhfefueejgefggfefhfelffeiieduvdehffduheduffekkefhgeffhfefveenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihgtohesfh
    hluhignhhitgdrnhgvthdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehnrghthhgrnh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepghhrrghhrghmrh
    esqhhtihdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlug
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6wQzaTCaVAnLk7x1wQoy371BcL1idv_5DZsEEc9cCRfUKabTJXf3cQ>
    <xmx:6wQzaUL2TEEVjItgLyyJOK-irbhdDkGYHtG8rd1920jHtYWorlqUfg>
    <xmx:6wQzaUncfUVE43mTEBcIEIkLmLCImS0MZZCaUD5Sep3JYtIqz9Ifng>
    <xmx:6wQzaVZd09QKKE25W76LXKic6bRY6956S1udOZdSGRWgNs8oIKo01Q>
    <xmx:6wQzacyXgAizPZG-sctR-NdNN4JreuB5DD5ZXvLrCeN8AnGuKO7uMUke>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 11:14:35 -0500 (EST)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 8B8E51484195;
	Fri, 05 Dec 2025 11:14:34 -0500 (EST)
Date: Fri, 5 Dec 2025 11:14:34 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Arnd Bergmann <arnd@arndb.de>
cc: Nathan Chancellor <nathan@kernel.org>, 
    Graham Roff <grahamr@qti.qualcomm.com>, Nicolas Schier <nsc@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
In-Reply-To: <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>
Message-ID: <q490r0s5-q431-0335-n367-qrr05oos17s5@syhkavp.arg>
References: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com> <20251205015352.GA2060615@ax162> <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Dec 2025, Arnd Bergmann wrote:

> On Fri, Dec 5, 2025, at 02:53, Nathan Chancellor wrote:
> > On Tue, Nov 18, 2025 at 10:46:51AM -0800, Graham Roff wrote:
> >>
> >> arch/arm64/Kconfig:
> >>   depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52 -->
> >>   depends on ARM64_64K_PAGES if ARM64_VA_BITS_52
> >> arch/mips/Kconfig:
> >>   depends on SYS_SUPPORTS_HOTPLUG_CPU || !SMP -->
> >>   depends on SYS_SUPPORTS_HOTPLUG_CPU if SMP
> >> arch/riscv/Kconfig:
> >>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C -->
> >>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT if RISCV_ISA_C
> >> arch/x86/Kconfig:
> >>   depends on X86_64 || !SPARSEMEM -->
> >>   depends on X86_64 if SPARSEMEM
> >> drivers/acpi/Kconfig:
> >>   depends on ACPI_WMI || !X86 -->
> >>   depends on ACPI_WMI if X86
> >> drivers/bluetooth/Kconfig:
> >>   depends on USB || !BT_HCIBTUSB_MTK
> >>   depends on USB if BT_HCIBTUSB_MTK
> >> mm/Kconfig:
> >>   depends on !ARM || CPU_CACHE_VIPT -->
> >>   depends on CPU_CACHE_VIPT if ARM
> >> kernel/Kconfig.locks:
> >>   depends on !PREEMPTION || ARCH_INLINE_READ_UNLOCK -->
> >>   depends on ARCH_INLINE_READ_UNLOCK if PREEMPTION
> >
> > On the surface, the vast majority these become more readable using the
> > 'if' syntax.
> 
> Agreed, the question is whether a small improvement in
> readability is worth the complexity of having multiple
> ways of expressing the same thing.

It is a tradeoff. Sometimes it is advantageous to increase the 
complexity in one place so other areas with more exposure to more people 
are simplified.


Nicolas

