Return-Path: <linux-kbuild+bounces-4727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D42AE9D2076
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 07:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 628AAB20E25
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 06:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC197149DFA;
	Tue, 19 Nov 2024 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="rCahgoJO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cAQ+X7/z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9348D13B780;
	Tue, 19 Nov 2024 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999243; cv=none; b=g5zzPndrSPivgcxAjWq/b8apVqZb5tbTb1Ati7MdihM68Z162TLjFv9/vibUCQDVf6oYUIo3KG4ebqbPUzBbKkFMwXY7FMcOnM8Kn5UgKsAEZIs/80ILmMXuZZUFijJ6gpeNhdyvAWIj9vN44BFRUt/thcuQdVx8lIIlGqLIAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999243; c=relaxed/simple;
	bh=Ni+Pop2lAy1JPXseeKbnhaoF8e/0VK6ECF0WV43IJtc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Q67AmY7K0dDETlGz1tYyQ4P55XpSc+bN2pg5fwsWgBKTyBtAudfQRVPjuTWhbf6Xeic7Cwk1Z4t7rRSpdg25lHfA3mVoc/NJcXkNEvacPr/wZVBJ7YjQCJfIRe867uDJk4bhLMA62VxT3AasVj5oNIAKDSovSpYs0t62WAjg1Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=rCahgoJO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cAQ+X7/z; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 8470213801DA;
	Tue, 19 Nov 2024 01:53:59 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 19 Nov 2024 01:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731999239;
	 x=1732085639; bh=9SUiF7P24dSvxygXMVuK6YdUrxNIl/AgdNtfan71nA8=; b=
	rCahgoJOYGZ77ZKq5Xtr4cRWWiLFlQ9zefzqUORYso7UzlaaP8or505Z0RlpuHCA
	PBiiaqN9fIOTiLRO2p9GK+n+G/FJfa2QqWpf+9VP8nQQlGSZOSzPGWTzQVZiGUhI
	M3VvXiNvNeFE7QFHeZ5TffMaiv/XvaA8hLeEvhMuiJYjB/otLw08B5685tWr4XVT
	q1UWBD+ttkQsHAxxZPKYX0+3kbNwHn8iTQOkdBv57xft+DSYDofMZwgsFHXkoeFC
	qzjkhwCyaI6VYagO+NOJz9lEif6H8iBAmgO1AmtGlPr7anQBz32xaP7iOuSg4by9
	PiyMbJjCff+U8vlaC6SUog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731999239; x=
	1732085639; bh=9SUiF7P24dSvxygXMVuK6YdUrxNIl/AgdNtfan71nA8=; b=c
	AQ+X7/zUSaBmiTT2/3oGiX14a7mPIJUpw9S2TN/V8KqH8Np6sS9A7H+4lk8Jrdmb
	QhffuGNYcPag0kaeJujdT+RbTNUK2Tsh7dt63+pWiPurL/vY8zT6sHcAYm4dD3zb
	p21ergLvEBetKTgbSjd1NwYYDK1XlShjtX77rg7jWydiz562jXPpjf0m1fvxQEAh
	2unZln71u+x7Y+KK+g4nMtKkLcFAtL2Ns0vMk9uuMK+2Gk9T7ncebtdXg4KmjBPx
	CJSmYyHgV22XUr9PvHIuDiMZj/rXAjMHW3/0CNN2ZGV62CVTbLNIIfZ73DO9Pqaf
	2NpLOufwfwyZNU5KyJidA==
X-ME-Sender: <xms:BzY8Z31nHZEoRDqP6M5OA0ezM_5ndNxRDh9CXtZfkh0NChT2vG_eqQ>
    <xme:BzY8Z2F6sUkPCiX-GQfv7cYbujVEQ_uibluI9Pm7XSY6eNA9ebKbYT__y-oslt2q9
    4DGLj_MWRtcFLdmjoM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedugddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpd
    hrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhs
    thgrughinhhshhhishhhmhgrnhhovhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BzY8Z36ZULsLBS7gvgyzAacTA-38-lupqN2j8KAUSiVLEsQsEtjTng>
    <xmx:BzY8Z836QzQSVRVozuM1NTQOXUD_ntVkIPF2WmYBba8rFkhtc6j6YA>
    <xmx:BzY8Z6G7hYsCuJ4rrLWcAdranEBWbxrCWIdQeIwsIkAejX5CfGtcTg>
    <xmx:BzY8Z98l1qUzw8LDPB7ZMvp7D29r6edQ79NkUVWXR0pA_bGa1Upgmw>
    <xmx:BzY8Z2gwtlLsJ2Kf8XQuSmRWCTOEQw9PYoLKCWrkj6gzVYGrhUCSm32q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B4982220071; Tue, 19 Nov 2024 01:53:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 07:53:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, "Sam James" <sam@gentoo.org>
Cc: "Kostadin Shishmanov" <kostadinshishmanov@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-kbuild@vger.kernel.org
Message-Id: <10db3077-9409-446d-8e50-1a2a803db767@app.fastmail.com>
In-Reply-To: <20241119041550.GA573925@thelio-3990X>
References: 
 <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X> <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X>
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 19, 2024, at 05:15, Nathan Chancellor wrote:
> On Tue, Nov 19, 2024 at 02:57:28AM +0000, Sam James wrote:
>> 
>> -std=gnu11 certainly isn't there.
>
> Ugh, this is because drivers/firmware/efi/libstub does not use
> KBUILD_CFLAGS from the rest of the kernel when targeting x86:
>
> $ sed -n '9,21p' drivers/firmware/efi/libstub/Makefile
> # non-x86 reuses KBUILD_CFLAGS, x86 does not
> cflags-y                        := $(KBUILD_CFLAGS)
>
> cflags-$(CONFIG_X86_32)         := -march=i386
> cflags-$(CONFIG_X86_64)         := -mcmodel=small
> cflags-$(CONFIG_X86)            += -m$(BITS) -D__KERNEL__ \
>                                    -fPIC -fno-strict-aliasing 
> -mno-red-zone \
>                                    -mno-mmx -mno-sse -fshort-wchar \
>                                    -Wno-pointer-sign \
>                                    $(call cc-disable-warning, 
> address-of-packed-member) \
>                                    $(call cc-disable-warning, gnu) \
>                                    -fno-asynchronous-unwind-tables \
>                                    $(CLANG_FLAGS)
>
> This isn't the first time this peculiarity has bitten us :/ sticking
> '-std=gnu11' in there should resolve that issue.

Could we revisit the decision to make x86 special here and
change it to use a modified KBUILD_CFLAGS like the other ones?

> arch/x86/boot/compressed/Makefile might need the same treatment. It
> might make sense to introduce something like 'CSTD_FLAG := -std=gnu11'
> then use that in the various places within the kernel that need it so it
> can be consistently updated in the future whenever needed. I see that
> flag in Makefile, arch/arm64/kernel/vdso32/Makefile, and
> arch/x86/Makefile.

I actually have a patch to make the entire kernel use -std=gnu2x,
but I never sent that because that requires gcc-9 or higher, and
has no real upsides: the main difference is the handling of 'bool'
types, and the std=gnu1x variant is simpler here because it avoids
using the compiler-provided "stdbool.h".

       Arnd

