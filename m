Return-Path: <linux-kbuild+bounces-9651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D12C65B6B
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 19:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 1BA5328BB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 18:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF4C268C42;
	Mon, 17 Nov 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DweFroUb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8754625B305;
	Mon, 17 Nov 2025 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404061; cv=none; b=Md5Klg4g1ywxmlqfvd9tTPOs+iFfYpKfOjM1SxyJ6/YRLmdbsuEMGqjP79F79JpztZ4NR+obwtBS5VwNcq6KgL77IoOxja7x50Rl3Dg0kRptCdJXqwl/A8DYdHQmZmQZdn+gO7rT4fE+HdyfGf4SU/XIGw9MrnElxpz6ZG8r6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404061; c=relaxed/simple;
	bh=46c5OQcX8viseysoKVZBgapBG/ROaBDi72ELVHZuRY8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEGMfF/XZYhCFopW2o73sUxYNAs4AszNExCrJEgogIAfAzjNGJXvxr6BxHjsGIhJZu2sEJrCIjknmbg36Jv3wUS3AiJ6uQlaiZHYf2i3cXhgprC1SRU+ptIS86CrB1z7KeeQoZdmHg8X+WFRTW2RctO4SMxP1TK5lfOZ8tpJhig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DweFroUb; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763404056; x=1763663256;
	bh=GhZV33r+RQPxcvac5lYHFWgWQCGcX9mvWrodK8gvvLc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DweFroUb8uo4PK06n5Wl5fGwhojNY7QszNM7iXFG7EjKvb9GqP59Kp/IQVSd6dPIJ
	 R7xxMHHCAwnSFusvt8q2csjYAnTNj7gxTwpSolPMogoyXE1bKL5u59danvmqUqUSsW
	 ToI+LrL+YK42ZNbLleg0ht45BloqOHxM4ZxDO28CNG8x1K77NqVV+E0+CSz1W7GJ+E
	 G9cevD3xQv7zY3CPjIyxwGsAor1t4RqqX8yW0KcAQ8ltvE2rkXrE4mpVgKNS9IWwkW
	 fCiVglPffu/+YMy7EF5QrRXfFB1LgpMKvFSBFDcfQzPr+6ef7H8a06OPSOjaENJcHG
	 sBL89XwygkdmQ==
Date: Mon, 17 Nov 2025 18:27:30 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 03/18] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <zxn3unp5foytltq6xpzqmsuijaargjuigcu47fdvlhpgyvwfj4@zwcnws34hjfw>
In-Reply-To: <CAG_fn=XyQ5Mc_ZvsibN4K0r70xfDAkhPqUJgtojVRcgTt-q0WQ@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=XyQ5Mc_ZvsibN4K0r70xfDAkhPqUJgtojVRcgTt-q0WQ@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 6ca281a9780caa8602cb87e0c0e4e958f247dc5c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-11 at 10:39:12 +0100, Alexander Potapenko wrote:
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index b00849ea8ffd..952ade776e51 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -61,8 +61,14 @@ int kasan_populate_early_shadow(const void *shadow_st=
art,
>>  #ifndef kasan_mem_to_shadow
>>  static inline void *kasan_mem_to_shadow(const void *addr)
>>  {
>> -       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
>> -               + KASAN_SHADOW_OFFSET;
>> +       void *scaled;
>> +
>> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
>> +               scaled =3D (void *)((unsigned long)addr >> KASAN_SHADOW_=
SCALE_SHIFT);
>> +       else
>> +               scaled =3D (void *)((long)addr >> KASAN_SHADOW_SCALE_SHI=
FT);
>> +
>> +       return KASAN_SHADOW_OFFSET + scaled;
>>  }
>>  #endif
>
>As Marco pointed out, this part is reverted in Patch 17. Any reason to do =
that?

I hope I was able to answer that in my reply to Marco


