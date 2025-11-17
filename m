Return-Path: <linux-kbuild+bounces-9650-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D531FC65B5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 19:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D8A9028B97
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 18:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FEA2877C3;
	Mon, 17 Nov 2025 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BmWBhb8y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67846268C42;
	Mon, 17 Nov 2025 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404001; cv=none; b=kI6iTMcgLeWozjktPCUj/Sa7gisfXzVvNz7zipnMbRWww9y83Vc9UuPDOm/kXU4qdZFU1SMCY11sAEbywDBB2t0gTIw7l1dSO1a7Lp5xMzdjek9JAL6mf//8hEa6vFLD3EAuEOxM97SjPWGAFgrGaYgCxHPMk+uotLLp7MYzRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404001; c=relaxed/simple;
	bh=x2rhRWyTYOz39r1YkReuklq3bLWbVIozglXtChCm0Kc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJfu+urgIR+vtBM/UXwOt5bo/JfBDixnKywGdz3nR0vXVQqKpo7l9g8um6y7aH6HqmOG2x1to0jIeSHWRkEK61OEuwd/TELbxa7CN6BTxEOxetyfUdB36BWSQuq8IytO8yCYyKaZnLfBTAHNH+vxaPuODVwz9B5g6xu6NIS+JnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BmWBhb8y; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763403989; x=1763663189;
	bh=jouESHi5Un7Q4FQfUgenF4mt4d6TLFLTX4D6FWFBOHM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BmWBhb8y1FXM46T3k5IgDeJH5cCnNwdX38PAg9lzWMGxrVMiyp8NjPRQTcbbizj/g
	 69t7L4LA6qkWLHLkecbAmKQQGuetVTM/wd/mam+8EdCUhEFIF/ePa2kL3qNFLs/oKf
	 Ibp3gCduBQaHDuUnc5YuBREn1r1alTqghFjCtT61nSKBlVrreJAxM5AOENEeWn/NKY
	 LtzDBqcziU0aSFhb4e+z6Qfc0iX6ZA/HOIiaTniVoNWx5qAsltTOCdg18CfUaVsDSw
	 YXNcI8U1iKzDsIAqfLAmKnuavaj/0s3FKw+fpYq6N5HkiIujW6erJDxznrFLNqHCZZ
	 ubSe2mMF0zVjw==
Date: Mon, 17 Nov 2025 18:26:19 +0000
To: Marco Elver <elver@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 17/18] x86/kasan: Logical bit shift for kasan_mem_to_shadow
Message-ID: <jbmfvznqtzmeyejegflmznwfj7lzlshpmek7jgy7drjfla2btb@bqjufhxforw2>
In-Reply-To: <CANpmjNM+ot5A-pRLhV6Esn=QvCeCStd9fG_pgwrVA=6pxD8aqw@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <81848c9df2dc22e9d9104c8276879e6e849a5087.1761763681.git.m.wieczorretman@pm.me> <CANpmjNM+ot5A-pRLhV6Esn=QvCeCStd9fG_pgwrVA=6pxD8aqw@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 8d14ced91bdd2f91cd367e805c79e65e22e0506e
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-10 at 15:49:22 +0100, Marco Elver wrote:
>On Wed, 29 Oct 2025 at 21:11, Maciej Wieczor-Retman
><m.wieczorretman@pm.me> wrote:
>>
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> While generally tag-based KASAN adopts an arithemitc bit shift to
>> convert a memory address to a shadow memory address, it doesn't work for
>> all cases on x86. Testing different shadow memory offsets proved that
>> either 4 or 5 level paging didn't work correctly or inline mode ran into
>> issues. Thus the best working scheme is the logical bit shift and
>> non-canonical shadow offset that x86 uses for generic KASAN, of course
>> adjusted for the increased granularity from 8 to 16 bytes.
>>
>> Add an arch specific implementation of kasan_mem_to_shadow() that uses
>> the logical bit shift.
>>
>> The non-canonical hook tries to calculate whether an address came from
>> kasan_mem_to_shadow(). First it checks whether this address fits into
>> the legal set of values possible to output from the mem to shadow
>> function.
>>
>> Tie both generic and tag-based x86 KASAN modes to the address range
>> check associated with generic KASAN.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v4:
>> - Add this patch to the series.
>>
>>  arch/x86/include/asm/kasan.h | 7 +++++++
>>  mm/kasan/report.c            | 5 +++--
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
>> index 375651d9b114..2372397bc3e5 100644
>> --- a/arch/x86/include/asm/kasan.h
>> +++ b/arch/x86/include/asm/kasan.h
>> @@ -49,6 +49,13 @@
>>  #include <linux/bits.h>
>>
>>  #ifdef CONFIG_KASAN_SW_TAGS
>> +static inline void *__kasan_mem_to_shadow(const void *addr)
>> +{
>> +       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
>> +               + KASAN_SHADOW_OFFSET;
>> +}
>
>You're effectively undoing "kasan: sw_tags: Use arithmetic shift for
>shadow computation" for x86 - why?
>This function needs a comment explaining this.

Sure, I'll add a comment here.

While the signed approach seems to work well for arm64 and risc-v it
doesn't play well with x86 which wants to keep the top bit for
canonicality checks.

Trying to keep signed mem to shadow scheme for all corner cases on all
configs always turned into ugly workarounds for something. There is a
mechanism, when there is a fault, to guess if the address came from a
KASAN check - some address format always didn't work when I tried
validating 4 and 5 paging levels. One approach to getting the signed mem
to shadow was also using a non-canonial kasan shadow offset. It worked
great for paging as far as I remember (some 5 lvl fixup code could be
removed) but it made the inline mode either hard to implement or much
slower due to extended checks.

>Also, the commit message just says "it doesn't work for all cases" - why?

Fair enough, this was a little not verbose. I'll update the patch
message with an explanation.


