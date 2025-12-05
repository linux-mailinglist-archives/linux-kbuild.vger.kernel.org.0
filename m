Return-Path: <linux-kbuild+bounces-10005-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5372CA6F8A
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 10:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6643A38DF9F5
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 08:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E826A343D64;
	Fri,  5 Dec 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TpyMa6Aw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y0VmEbwi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A833BBCB;
	Fri,  5 Dec 2025 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764921768; cv=none; b=Dt3zDe70i27jEL50+z6XYDOByGYKKWTd+KXqmZn0j9/0328xpoCu0M6oExvEe+3Wz1uxuQtxqezvvDA3QUM9TWZpmu1d3MOq7P/ORTQNCbKj4XTqytyaf9vCnYqpuDmh04ZSJVzKiKgG+aeKM/VTd7ri9GHxLAitvXBl9Dwdq9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764921768; c=relaxed/simple;
	bh=wQy7pjlMMKrlcINBeEtVZtTYRTH5aPNKCG61AFfn+jE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UTJUFWGhfbay19edYGTFe71ChLN6+bKNB3A4BSkjyXQWWfG21H+oBc+NLVPct50vbgda4IyYSVSXy/RpO3Tp1ihwQZPXPQnCK90FdA8mb9Q+Htsf5AKXnBqEJf6EhvFt2CnzykGR7RD6xZDqiUXlKbhrHB2QHBKNde+lTQWrsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TpyMa6Aw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=y0VmEbwi; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id BD24FEC039D;
	Fri,  5 Dec 2025 03:02:27 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 03:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764921747;
	 x=1765008147; bh=zPLccfD4LpqylvRSEN3Qp07Vy9qi2513Tch1zjgJB0g=; b=
	TpyMa6AwHDBPqNSC0EpTPVyQfAyhFGJ7eUMsYfc0Fa3LXjE/wcQQiXr9FueqXpIJ
	LFw8N2/jKfBBN9bFxa8UfuWOm0Ubxin6rdlVk+48ex/ixbfjFHAbRQidBKQaG3o5
	Got/ts9GVOeHDzAyg2HsHn21UT89rMuVOL7dZtLBiI0R5ae4dPH8GcJxZx2q7DOx
	kk20G0HNKtf19jIQ4DWDnRoWaHhbpFqbwuORKBZfqPrUMM5Csj/8y/rGHV081zy+
	FOdXqDDhIbVzOVzRzq+tHc9gGw352sCLwOmTZYUl17XyAlDwOtCTBXU4bMhre8rg
	b/V3UDE+2OceeZCsdrc1rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764921747; x=
	1765008147; bh=zPLccfD4LpqylvRSEN3Qp07Vy9qi2513Tch1zjgJB0g=; b=y
	0VmEbwinAK6+LSh9RcBOVOM8t5g6a5owbb7cMGE06Uf8Q5juDwNN2FEUwfxWyGoN
	9QTn0NAZMN/Pp3eEmXTsIjM1RRtdCzppyKFYGV/Kh3yloKngDgbQvOpRAWL1/OKu
	wXobd/dYNmCsPK3fbeg4WKyg1HL65M/1kB/ILd9D1dG9HTGSoV5uWyNEfaHAeVhD
	SQOy/rH+TXZR+y57j7rN4jaQk/V4zjh0LTB3aqnY8kJr5Ag5nYBUhzWAzXbJ7KQa
	tFq+rWogSiHz9cJGK7hZWF++4ji7nfDZpn8DTPFJopIjlFNlVn8hPJeu1u68UULg
	dh5Tk3BNT88hgXTdTCgJA==
X-ME-Sender: <xms:k5EyaR_kmi5l-KmiygJav-OkJcNLsVJ-IX1OdRxkK9vfO93tKMCnaw>
    <xme:k5EyaQjPCQvLlnHQBZ531UKgv5F5nNrmB7pwHneAytGn2rozDhdtBzKQUFyykE1w6
    l2hYNn3jaWrfKZ9r1vd2kae8k1JLgSVSZnwjAuCT7RKgy1MCNIgSN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepnhhitghosehflhhugihnihgtrdhnvghtpdhrtghpthhtohepnhgrthhhrg
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehgrhgrhhgrmh
    hrsehqthhirdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgt
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilh
    gusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:k5EyadYFYGAWFctgthYNVqtpCftWKrZ9gnglnzPxga5Zfohg_YhNwQ>
    <xmx:k5EyaZV19VAkcAqPH9ijJur9-zrceBKX63WYpAby8l5DsxC1fOkhmA>
    <xmx:k5EyaUMeAx0_AbGOKikoKGRXFZrizaGiXho_ZZ8_q_aFx_Debja1xQ>
    <xmx:k5EyabbK6TiXs4-A0pH4gxcIwZ_JPWLgnPBJGFRN6ChlPg9JB_6aXQ>
    <xmx:k5EyaR7x1L5P3JKsK85Xt0s0da5jcq583MO-SkouC5-OyR3kPRcZUWl->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62573C40072; Fri,  5 Dec 2025 03:02:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 09:01:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Graham Roff" <grahamr@qti.qualcomm.com>
Cc: "Nicolas Schier" <nsc@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Nicolas Pitre" <nico@fluxnic.net>
Message-Id: <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>
In-Reply-To: <20251205015352.GA2060615@ax162>
References: 
 <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
 <20251205015352.GA2060615@ax162>
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 5, 2025, at 02:53, Nathan Chancellor wrote:
> On Tue, Nov 18, 2025 at 10:46:51AM -0800, Graham Roff wrote:
>>
>> arch/arm64/Kconfig:
>>   depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52 -->
>>   depends on ARM64_64K_PAGES if ARM64_VA_BITS_52
>> arch/mips/Kconfig:
>>   depends on SYS_SUPPORTS_HOTPLUG_CPU || !SMP -->
>>   depends on SYS_SUPPORTS_HOTPLUG_CPU if SMP
>> arch/riscv/Kconfig:
>>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C -->
>>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT if RISCV_ISA_C
>> arch/x86/Kconfig:
>>   depends on X86_64 || !SPARSEMEM -->
>>   depends on X86_64 if SPARSEMEM
>> drivers/acpi/Kconfig:
>>   depends on ACPI_WMI || !X86 -->
>>   depends on ACPI_WMI if X86
>> drivers/bluetooth/Kconfig:
>>   depends on USB || !BT_HCIBTUSB_MTK
>>   depends on USB if BT_HCIBTUSB_MTK
>> mm/Kconfig:
>>   depends on !ARM || CPU_CACHE_VIPT -->
>>   depends on CPU_CACHE_VIPT if ARM
>> kernel/Kconfig.locks:
>>   depends on !PREEMPTION || ARCH_INLINE_READ_UNLOCK -->
>>   depends on ARCH_INLINE_READ_UNLOCK if PREEMPTION
>
> On the surface, the vast majority these become more readable using the
> 'if' syntax.

Agreed, the question is whether a small improvement in
readability is worth the complexity of having multiple
ways of expressing the same thing.

I don't see anything that the new syntax would allow
that we were currently missing.

>> @@ -602,8 +612,14 @@ Some drivers are able to optionally use a feature from another module
>>  or build cleanly with that module disabled, but cause a link failure
>>  when trying to use that loadable module from a built-in driver.
>>  
>> -The most common way to express this optional dependency in Kconfig logic
>> -uses the slightly counterintuitive::
>> +The recommended way to express this optional dependency in Kconfig logic
>> +uses the conditional form::
>> +
>> +  config FOO
>> +	tristate "Support for foo hardware"
>> +	depends on BAR if BAR
>> +
>> +This slightly counterintuitive style is also widely used::
>>  

This is the bit that frequently confuses developers with the
current syntax, and I agree it would be nice to have a better
way,  but I'm not sure the proposal actually helps enough to
warrant a mass-conversion of existing Kconfig files.

>> +config TEST_COMPLEX
>> +    bool "Test complex conditional dependency"
>> +    depends on (FOO && BAR) if (FOO || BAR)
>> +    default y

With the existing syntax, this could be expressed as

      depends on FOO = BAR

or

      depends on (FOO && BAR) || (!FOO && !BAR)

and I don't see how the new syntax is an improvement
over these.

Overall, I'm not convinced by this patch. I have no strong
objection to anything in here, but I'm worried that extending
the syntax adds more problems than this one solves.

    Arnd

