Return-Path: <linux-kbuild+bounces-9332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A259C1E6C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 06:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEA293AA1DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 05:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DCE228CA9;
	Thu, 30 Oct 2025 05:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Dmkbwjuj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30131E766E;
	Thu, 30 Oct 2025 05:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761802296; cv=none; b=dMx8xtrezXJMV76/xV8XQfI869vOPl3ZZ7jQjJJRHblSETxh8OPkBp4fFszB6mKFyfUFrCWVQ/lkv4URm0sBiscLjRx/oAYpoe4WOkBHGOWN0dwW1B8oXmxkLIExfCZLgil5/4ax08xXA2WQYPFM2krk7MhShQwPNZNQeDDtesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761802296; c=relaxed/simple;
	bh=KYqFCycNKEk2Oa2mCaZ1+xdf5d/aCrQV5Ee68Oi/m8c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gtu2jEi/HvEdC628Cc1tCgiRvzwYu+QMuwju0Nj0q43m4ug1ofrGG6pn/95j5F6QyASQbk5dMXKmhS6ge4ui+B9P9J9l9OvEclrtgKDtPMopIySyrNZ7rTFWPf6PsxW+ONVthrBuxIc3JL8+y7fyehkb2Levb7tSi4mk1yC2vbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Dmkbwjuj; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761802290; x=1762061490;
	bh=SqB029SpVmJqfLswaEolkge/L1HE0Gdq54LxorgJlpY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DmkbwjujvK+EMhhVlhE633gtvTYp7stPsK2BPbKyUdMoaxnIplgzHAexjILc1xVuH
	 gLXrpW1HyJwWmsjmp/lmf4wpRSDyWnYtEMKML6wW8rgghV+GnHSCpMrfmQbgODjtub
	 tGyuGNNdhb/LVgZmJXqsvlvCEbLjmO+I8ggYJKeqgf3/xZCnBJg2qmYKYktt/n3rp4
	 fpr+OFnZKCJlPrSvs9lPwCnKwXx5Pf/+vCoIGRyfV6DxVWk6i5QRjssG2k73Nt40UY
	 eOQ6qpOuIco0pPKWj+Ilc/4BN3PBQx8nKwI+YZfggQVUW38eqxOLLul3nZsVeP7f6K
	 Q7ALpWrEdqhMA==
Date: Thu, 30 Oct 2025 05:31:22 +0000
To: Andrew Morton <akpm@linux-foundation.org>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org, Liam.Howlett@oracle.com,
	nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/18] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <ngwfbor66uhrgfe2g4nvziwqp3gtsbndlpnhnov7ew7535dysv@ieypsfjfmnlo>
In-Reply-To: <20251029150806.e001a669d9dad6ff9167c1f0@linux-foundation.org>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <20251029150806.e001a669d9dad6ff9167c1f0@linux-foundation.org>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 22e7e1e747884a326f20da03a155c805b55537aa
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for taking a look at the series!

On 2025-10-29 at 15:08:06 -0700, Andrew Morton wrote:
>On Wed, 29 Oct 2025 19:05:27 +0000 Maciej Wieczor-Retman <m.wieczorretman@=
pm.me> wrote:
>
>> The patchset aims to add a KASAN tag-based mode for the x86 architecture
>> with the help of the new CPU feature called Linear Address Masking
>> (LAM). Main improvement introduced by the series is 2x lower memory
>> usage compared to KASAN's generic mode, the only currently available
>> mode on x86. The tag based mode may also find errors that the generic
>> mode couldn't because of differences in how these modes operate.
>
>Thanks.  Quite a lot of these patches aren't showing signs of review at
>this time, so I'll skip v6 for now.
>
>However patches 1&2 are fixes that have cc:stable.  It's best to
>separate these out from the overall add-a-feature series please - their
>path-to-mainline will be quite different.

Okay, I'll send them separately

>I grabbed just those two patches for some testing, however their
>changelogging isn't fully appropriate.  Can I ask that you resend these
>as a two-patch series after updating the changelogs to clearly describe
>the userspace-visible effects of the flaws which the patches fix?
>
>This is to help -stable maintainers understand why we're proposing the
>backports and it is to help people to predict whether these fixes might
>address an issue which they or their customers are experiencing.

Sure, I'll also fixup that undefined symbol error that you mentioned in
the second email.

kind regards
Maciej Wiecz=C3=B3r-Retman


