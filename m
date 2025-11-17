Return-Path: <linux-kbuild+bounces-9653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D81C65C07
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 19:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 1D62428DAA
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 18:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21722319606;
	Mon, 17 Nov 2025 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JhmaQYtS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB6312803;
	Mon, 17 Nov 2025 18:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404923; cv=none; b=NN6R9v0zOwEFSA2iSI7SQjPn/w4wd0I5vtepeVglMPRIX4R3G9GIgkGdd5JZ/hSMmAWbqPupQAuICvNWMSF7P0EZTKgLa+6Dv0zAJexh3KTMBVw5Vn7B8jbMFwgYVMR0E4p0jzsEQPK4DpJv9tm+tAea2MCxDzGorzb7lF19wkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404923; c=relaxed/simple;
	bh=ffADgsIwWOKcJFuGkwnMUFSNfOZmE0SiWXqhXKcbJcw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SYKyvPxTHLo7B7qrmhrm4JrV34fiyRIg2evcnhDeSkwJMISk76Iq7T6F4f/NS5kcMHhmZoHJGPWeJiSWM29La6Fx8Iu1R7zsUxuhvP1yqRrS7EhhkhkREAhaX6Vr/wQvT+e/pAjHxi6M6Wijeo6drShO1rkO7BhriKaXjFogXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JhmaQYtS; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763404903; x=1763664103;
	bh=drgz0EubZvWbKD4XfDQItOg+MBM3cOXzoADsisa0KIg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JhmaQYtSykcyb/YbPWw44tSyjxwvQu5qj9ANFfDbmQQdN+t4wYrSeoPU5wr8awv7w
	 Nv4+HeHNbI3AYKkBPALDXGd5ua+5005HNaPxAJX8zjyFtD4Bx8B3sNgDDBKPYZWuNR
	 FgB1Gsw62xTc05ImjhbBcT4QlABgPkgxdGDAvgUqxcsa9ajoSzvQkkJViTm7A06PKT
	 dz01/x1F8V82geoUmNU9B033ePiTpKpoT+jMsYrUhpoMOl6yknZtWVEU53UOHxjmLk
	 eDRaMMJ3onhXZSMX+uzVZ2fETutWrQC2UQnuYO5bJ7DY+KapcpkkD/6AI0HVHWxo6q
	 5jsrnA85HeUWQ==
Date: Mon, 17 Nov 2025 18:41:35 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 06/18] x86/kasan: Add arch specific kasan functions
Message-ID: <6nifmxti2xfbnrdtxbosojfw52sofc7zkyjcbcyeawz5lt372f@h6ksdfqddk4z>
In-Reply-To: <CAG_fn=XFXFAvKS2+bc66FR+gw7rfSybETAOBUR_vneaVdF5F9A@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <5be986faa12ed1176889c3ba25852c42674305f4.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=XFXFAvKS2+bc66FR+gw7rfSybETAOBUR_vneaVdF5F9A@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 24219ab0aedf934d23c98a54e0e420cc21587fb9
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-11 at 10:31:13 +0100, Alexander Potapenko wrote:
>> +#ifdef CONFIG_64BIT
>> +static inline void *__tag_set(const void *__addr, u8 tag)
>> +{
>> +       u64 addr =3D (u64)__addr;
>> +
>> +       addr &=3D ~__tag_shifted(KASAN_TAG_MASK);
>
>KASAN_TAG_MASK is only defined in Patch 07, does this patch compile?

Seems I forgot to remove it from patch 7. It's originally defined
in the mmzone.h file and looked cleaner there according to Andrey.

Thanks for noticing it's still in patch 7, I'll get rid of it.


