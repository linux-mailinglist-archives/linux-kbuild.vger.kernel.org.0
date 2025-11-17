Return-Path: <linux-kbuild+bounces-9652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59733C65BCB
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 19:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0485135317E
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 18:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC54312803;
	Mon, 17 Nov 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Ow9517Gl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF09313260
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Nov 2025 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404547; cv=none; b=bep6kNgC/QtRlNxilq0Q1Uigcml+zdw6HKtxlcSLJ2R/wCYd1DScSNGG9yIuiQ6UApk6viViPWfLRuoRl6s6GX90qq6DiwwsQOGY6lHtmAISBlkG/VV4AnHNrH5uGciB9XGSJe8IslvbstgXoTQohegItSF0DxMUfEaD7dV4cOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404547; c=relaxed/simple;
	bh=cjOZijZfv+gCL+Wryb9wI/c0+cE3KEtDjZPAz76nomk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e3yKNHOIrXiDu0HhFT1I+4+FIdWGnQTXhTrHxfA2bAqjz7Xyt+2EzbYnYHCbrFsY+mnByvsi3cC5ONc8GyhxFNvgawfwghNa+GHlKT4W9XU3vy8uKNfmNSYZmin3FwTnii2f7HpnZgwoBhq7Ntss4g5i5+xyqYgW6pKG9f31MH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Ow9517Gl; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763404543; x=1763663743;
	bh=zH5WVIO3cxOwoV7JqKcP1ToXH/X437vo+cbBXaQZW1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ow9517GlVkdXb0QK4zjYxuQOHLNlXBQV1cDfbfieA47R/oZppYFaXLUldJ1Tsq5ih
	 cSQWOVBUEIXNRzU9Z0PwoISODUhBmTaVt175wXQkO+pXpKxbHzlR9FcwRIpzz9Tqw+
	 IR2AUVjxkUQt58ykh1SuYyNEC2vg9WKSs0zAWb2vchX/qb4b2aj56AuCLDjILSWJKR
	 y7thVVzmNLOKb57GussgLz8hjrzaxtGyskBAQgEksXSAQcDYFI0X/MRtnGpRX/UsQ8
	 0/Q9NgRR+AM3VtjauiR5MqSjMmNx7MddjrniFxSo0IFFpcXYNxvJBOr2L2aXvHBWr7
	 wsuBdyxI2rtlA==
Date: Mon, 17 Nov 2025 18:35:38 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 04/18] kasan: sw_tags: Support tag widths less than 8 bits
Message-ID: <6rh6ynwrmh7afqkfyfphiy6rv2xjpdpcotzooqfye6lg7rddhe@betrc4geghsk>
In-Reply-To: <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 89bdc726c809a41792e2e4dd98d31d2c2e8b87c5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-10 at 18:37:59 +0100, Alexander Potapenko wrote:
>> +++ b/include/linux/kasan-tags.h
>> @@ -2,13 +2,16 @@
>>  #ifndef _LINUX_KASAN_TAGS_H
>>  #define _LINUX_KASAN_TAGS_H
>>
>> +#include <asm/kasan.h>
>
>In Patch 07, this is changed to `#include <asm/kasan-tags.h>` what is
>the point of doing that?
>Wouldn't it be better to move the addition of kasan-tags.h for
>different arches to this patch from Patch 07?

I wanted to keep the split between adding the generalized definitions
that Samuel did here, and my arch specific changes. Thought it'd be
easier to review for people if it was kept this way. But maybe it's a
good idea to just move the asm/kasan-tags changes here too, I'll
rearange the code a bit between these two patches.


