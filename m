Return-Path: <linux-kbuild+bounces-9655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA8C65DB6
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 20:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8688361A8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 19:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6E532ED4A;
	Mon, 17 Nov 2025 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aSMS2vsg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A032E756;
	Mon, 17 Nov 2025 18:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405917; cv=none; b=Isto43x3vG/mj6460lDasaKVfYslz0PJFg3+5DiXdR6NsVW/ESueAbFTSRWX5vYYTfyLj5N8DHB3btWBFAAfklDP1EOTv9MC/0x0AjCgZQuNslcQfdVd7M1UNWUDbgvMW3NJiELFroh8uWzCTI7v5PK2LGrqQyrvikr2JeEh1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405917; c=relaxed/simple;
	bh=bA/G9mt1u4rsjAb46FDifK77cEAdgWvY/zjnEtGtv7U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f168BO/xmMci9Wy8WM5n7wkv5S6hhOYIcNyh63SveOIqi9KFgJd+rzKBnkSgLzLatVcrXuMNleOc6+wij3w6yirJU85dGtO+Ym0WMV3rePelP6NBfEbYO7/m0LbaNMzY8RLPmLs8GO1mxns9o8BrmkLTDi64+GD8jWk/2yTM9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aSMS2vsg; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763405903; x=1763665103;
	bh=fhxihtRxC0rWih6zRhIQ0MI/4P4VUJvqw2WCiJpsAFs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aSMS2vsgjqhABOKKmX+n7L/nYKJ4HsmbQTEgXiTOoY3Cd2FK585onBnDDSJ+D1ZmH
	 dj6ZPber0hjFh12DL2S+g5C29ScBlcj2WoRImmKPbgy4i8WhVJyy1lvNs9oM4w0oU/
	 CdnnnUK2oTosOTZImq1kqIdX65kFrGdsMX9ZnjZQ6L7F4kO+aqbkZ1DTfWbTj6eQdK
	 rjx8bj6r7nJy22ERnAhd4ghyneoMQLaymChmrZsLvuFej+A7MHrbAXuLjU92A95Q/f
	 87n5KZbG4GiCTECbznvPERG1bGaG3N+iGeAnP03gABCYzQCdmLEbvi1S4rUGkQhQr2
	 v1Q7mLEQN4nTw==
Date: Mon, 17 Nov 2025 18:58:12 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 10/18] x86/mm: Physical address comparisons in fill_p*d/pte
Message-ID: <j6s4vcbtgjas2ktnpx7etguc2nccxa3o5hz3vabes7fn7gfb5e@xxbiwnnps64e>
In-Reply-To: <CAG_fn=Ut9JUpStLiO+GsoBpn3d_EyyttcuBby=EKzuxkKdcKcw@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <da6cee1f1e596da12ef6e57202c26ec802f7528a.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=Ut9JUpStLiO+GsoBpn3d_EyyttcuBby=EKzuxkKdcKcw@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 5443841a22fdb0cd19c2ceb9e40b8cdbb4f4e884
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-10 at 17:24:38 +0100, Alexander Potapenko wrote:
>On Wed, Oct 29, 2025 at 9:07=E2=80=AFPM Maciej Wieczor-Retman
><m.wieczorretman@pm.me> wrote:
>>
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> Calculating page offset returns a pointer without a tag. When comparing
>> the calculated offset to a tagged page pointer an error is raised
>> because they are not equal.
>>
>> Change pointer comparisons to physical address comparisons as to avoid
>> issues with tagged pointers that pointer arithmetic would create. Open
>> code pte_offset_kernel(), pmd_offset(), pud_offset() and p4d_offset().
>> Because one parameter is always zero and the rest of the function
>> insides are enclosed inside __va(), removing that layer lowers the
>> complexity of final assembly.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v2:
>> - Open code *_offset() to avoid it's internal __va().
>>
>>  arch/x86/mm/init_64.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
>> index 0e4270e20fad..2d79fc0cf391 100644
>> --- a/arch/x86/mm/init_64.c
>> +++ b/arch/x86/mm/init_64.c
>> @@ -269,7 +269,10 @@ static p4d_t *fill_p4d(pgd_t *pgd, unsigned long va=
ddr)
>>         if (pgd_none(*pgd)) {
>>                 p4d_t *p4d =3D (p4d_t *)spp_getpage();
>>                 pgd_populate(&init_mm, pgd, p4d);
>> -               if (p4d !=3D p4d_offset(pgd, 0))
>> +
>> +               if (__pa(p4d) !=3D (pgtable_l5_enabled() ?
>> +                                 __pa(pgd) :
>> +                                 (unsigned long)pgd_val(*pgd) & PTE_PFN=
_MASK))
>
>Did you test with both 4- and 5-level paging?
>If I understand correctly, p4d and pgd are supposed to be the same
>under !pgtable_l5_enabled().

Yes, I do test on both paging modes. Looking at p4d_offset() I think I
got the cases reversed somehow. Weird that it didn't raise any issues
afterwards. Thanks for pointing it out :)


