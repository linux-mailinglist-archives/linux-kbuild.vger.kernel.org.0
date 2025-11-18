Return-Path: <linux-kbuild+bounces-9667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EEC6A661
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 16:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1157F2B3F5
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319DF368273;
	Tue, 18 Nov 2025 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VU/bLwEu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAAF34DB67;
	Tue, 18 Nov 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480993; cv=none; b=FncQu56DWgn73sjlgI7h0CUeSi+AyDj7ofYu6MT9Mvb9ISzVnTaIf2U182yoVUfSt1NqIfejpR/bOZT8Vs6dgSwvIodwBmOJi8cAJ+VkBHc17vEi1PJxyOtcN2KBJFf7/P8bXXRnFR5k4dDcTB6Up1v4tE3Hqpte+8bsGAXoj50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480993; c=relaxed/simple;
	bh=MfLbaN0dJ19hVIu6xn27SwSPpBPbATDQqKhaL7vSpK0=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sepvZHnyRbFN4zgFyLOf2JFpyu826fX0eeP9hHKoi9C1RNAL7/qJEHJoCbMEVuWmZQyZij0BZ9xH7pFy2m9TxDk++G9jupQ/tN/wv2RUy1ID+ry3ZeaYZu2KkrGcWIqtaauQkOKYomKbNKTB/2vY3IssRbaYZS7ZOarwSP2QcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VU/bLwEu; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763480981; x=1763740181;
	bh=a9ZfR2miDizST+NAQHBsA4FP50QJXQbD9wrCS0aDhy8=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VU/bLwEuIA8h9TCyJ9L4mIWEDwhoUAZ5oktm+sibJB8c9aTCHAxh4iEjZUrUcj6WK
	 DdWYM7vyaQOmZlh5HL5Rop5CGc1TZipkU5l3spES7VnHm/wUUlnVytrI8uH5q7ufRi
	 fJw0DGDWl+PDb+suCmmvDLbYmrbGD/oONn1SpgQgOMNsVeLROqr98iWpCJYovuu/sN
	 41PWpyT55lKaZwMubphsuvZFYg/YtTETtW1C8gMcytVRWd8U1Gal8gOTSiTCz1xJ+K
	 7NTB37EXbP+Q7djtplgrpcbD/6KUccafGQHCQks1468PHcx+U+AH4aBTr4zCMgXQ4E
	 UAncnjv3o9aLg==
Date: Tue, 18 Nov 2025 15:49:28 +0000
To: Alexander Potapenko <glider@google.com>, xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de,
	surenb@google.com, ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Subject: Re: [PATCH v6 06/18] x86/kasan: Add arch specific kasan functions
Message-ID: <tide3xvqthah7m7ji6bfzb5i3ofabgwf45bn3qvvzsurnswh6z@wjxzriavwlp5>
In-Reply-To: <6nifmxti2xfbnrdtxbosojfw52sofc7zkyjcbcyeawz5lt372f@h6ksdfqddk4z>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <5be986faa12ed1176889c3ba25852c42674305f4.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=XFXFAvKS2+bc66FR+gw7rfSybETAOBUR_vneaVdF5F9A@mail.gmail.com> <6nifmxti2xfbnrdtxbosojfw52sofc7zkyjcbcyeawz5lt372f@h6ksdfqddk4z>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 2d31863a5f203112dd7296a62db9ab5faf481d58
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-17 at 18:41:35 +0000, Maciej Wiecz=C3=B3r-Retman wrote:
>On 2025-11-11 at 10:31:13 +0100, Alexander Potapenko wrote:
>>> +#ifdef CONFIG_64BIT
>>> +static inline void *__tag_set(const void *__addr, u8 tag)
>>> +{
>>> +       u64 addr =3D (u64)__addr;
>>> +
>>> +       addr &=3D ~__tag_shifted(KASAN_TAG_MASK);
>>
>>KASAN_TAG_MASK is only defined in Patch 07, does this patch compile?
>
>Seems I forgot to remove it from patch 7. It's originally defined
>in the mmzone.h file and looked cleaner there according to Andrey.
>
>Thanks for noticing it's still in patch 7, I'll get rid of it.

You were right before, after removing that define in patch 7 it doesn't
compile. I think I'll just open code this definition here:

>>> +       addr &=3D ~__tag_shifted((1UL << KASAN_TAG_WIDTH) - 1);

I don't see a nicer solution here if taking things from mmzone.h is out
of the question. I suppose a #ifndef KASAN_TAG_MASK placed here that
would just shadow the one in mmzone.h could work too?


