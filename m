Return-Path: <linux-kbuild+bounces-9654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720DC65C2E
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 19:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5853035CF83
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 18:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA84324B24;
	Mon, 17 Nov 2025 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="h6XWinzQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-244124.protonmail.ch (mail-244124.protonmail.ch [109.224.244.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC77328617;
	Mon, 17 Nov 2025 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405000; cv=none; b=LWDqPsepXbZ05itQQ4KSlQx9gBbtaAm5H+iG4uZf6Bbx/B6A4BOVnOeTpqYXGgEXaiwzIsKpsbtk0nQtpAW+T7aX1eArxzbOBrBQxTTZIa3i6BoqGEsbqUZyesRNC4r7Vok1gIGNpsGRlebwYNJoSAE5URSl44xkmVlJt4QfEIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405000; c=relaxed/simple;
	bh=6pKTzcMGLfqwUQVmfHQOkKnu6jwKpE1aNNYysBG8ve8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvk29Xar3S1DtOgCavwC9ThX+nQlU+LZ2jVhwFZBOtOaGhvQWYkC61Fdl45uWAdOyfelZzIa00GNsB23yg7UdUJzfkbnfoKo2ooBwoEi+ksLQPDd5oCwHbbzVVvdpVQsULzFqxWRHpiyGXS/zaStizcShJvLa52Wedu7igYnhiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=h6XWinzQ; arc=none smtp.client-ip=109.224.244.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763404993; x=1763664193;
	bh=+lJV/EDhYGKx5mOX0qR2rU2PR81YfrrZnkEYQ//hRhU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h6XWinzQKp8D5CNY87Oa4RWY/kKWJKZBE6qNvqcw1rbJHPtnOUbihBOimh98MWfLV
	 2NN4ZeZ3TnoxsssymM+T8mK6KuXihwDQF3RmO7k/DBoOpCU6VI4fCVbqnfG/xF9Btx
	 sc8wYjQMFnII0JJmBK7yg/fI2XpG5HXFbHFTnnLuBLgIbNB4v7ahSkExGxDO1YwXHV
	 MqNYX+gthKlwCPgEne66RZEjKBvlPBgVqlk7zMPCy6U7hbZlGzEozZB3FDWBuJdMgK
	 l7vfSfDaAUCHBN/aQrFSRnN6Qtgy/aKM3G8OihotTxcLieiPrjGVsucbVvybrnrQl3
	 fkzFLFPT1YyiQ==
Date: Mon, 17 Nov 2025 18:43:09 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 09/18] mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
Message-ID: <5ty6jsrleekmymktmyayidc5jdvqvzz622vsh4fqk3rjtgyalu@argn7tfm3efv>
In-Reply-To: <CAG_fn=V4jVyS41MDxJeN-A2zk6WhTnxp7m3FRWmkXMpy5f+haA@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d6443aca65c3d36903eb9715d37811eed1931cc1.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=V4jVyS41MDxJeN-A2zk6WhTnxp7m3FRWmkXMpy5f+haA@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 267961a08d80088fa15811f1ce81d028c93e6629
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-11 at 10:13:57 +0100, Alexander Potapenko wrote:
>On Wed, Oct 29, 2025 at 8:08=E2=80=AFPM Maciej Wieczor-Retman
><m.wieczorretman@pm.me> wrote:
>>
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
>> vm_reset_perms() calculates range's start and end addresses using min()
>> and max() functions. To do that it compares pointers but, with KASAN
>> software tags mode enabled, some are tagged - addr variable is, while
>> start and end variables aren't. This can cause the wrong address to be
>> chosen and result in various errors in different places.
>>
>> Reset tags in the address used as function argument in min(), max().
>>
>> execmem_cache_add() adds tagged pointers to a maple tree structure,
>> which then are incorrectly compared when walking the tree. That results
>> in different pointers being returned later and page permission violation
>> errors panicking the kernel.
>>
>> Reset tag of the address range inserted into the maple tree inside
>> execmem_vmalloc() which then gets propagated to execmem_cache_add().
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>Acked-by: Alexander Potapenko <glider@google.com>
>
>> diff --git a/mm/execmem.c b/mm/execmem.c
>> index 810a4ba9c924..fd11409a6217 100644
>> --- a/mm/execmem.c
>> +++ b/mm/execmem.c
>> @@ -59,7 +59,7 @@ static void *execmem_vmalloc(struct execmem_range *ran=
ge, size_t size,
>>                 return NULL;
>>         }
>>
>> -       return p;
>> +       return kasan_reset_tag(p);
>
>I think a comment would be nice here.
>
>
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -3328,7 +3328,7 @@ static void vm_reset_perms(struct vm_struct *area)
>>          * the vm_unmap_aliases() flush includes the direct map.
>>          */
>>         for (i =3D 0; i < area->nr_pages; i +=3D 1U << page_order) {
>> -               unsigned long addr =3D (unsigned long)page_address(area-=
>pages[i]);
>> +               unsigned long addr =3D (unsigned long)kasan_reset_tag(pa=
ge_address(area->pages[i]));
>
>Ditto

Thanks, will add some comments on why these are needed.


