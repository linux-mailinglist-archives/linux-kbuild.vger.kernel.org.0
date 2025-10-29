Return-Path: <linux-kbuild+bounces-9326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2346C1D905
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 23:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EAB83B54F2
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 22:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D820831691D;
	Wed, 29 Oct 2025 22:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lhbf5xPG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E3314D2F;
	Wed, 29 Oct 2025 22:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775690; cv=none; b=nOJuZWevX3nyaFrkds2IsaJ3+zt2bTAeoR6jdpc568Z9jyEl4iYRKkhbXta+p556kOmc3SBMEO5+0r2zCXGk3Je/QIKjvvFhuWm64hH16tBXEdITAN0DN5XUVWf4ZEwfha7tr6R+USWyrmr4bCC4tdWzKWL4pQs4KSVc3eYuaZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775690; c=relaxed/simple;
	bh=PCMUQE0BW2QoEo1rc9q0qVRgJ7LwUgidps/XqX0NgMs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=o20ETxqvzB7K4wc4//MRwYZ0iCDAr520AEZOcSWrEpY5+EMLfNDSvVoInEsh1cBmXGoC6ezOG+mKHl4r4hcnl7OBxLIuMPVRsmJYJ+TddENo2qdNe3nmr1B2tTOGzjgIfJ4hk9Isv1N8ren/gwOrG+wwo2oVmO8LWbFA/v5jXrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lhbf5xPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3B9C4CEF7;
	Wed, 29 Oct 2025 22:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761775690;
	bh=PCMUQE0BW2QoEo1rc9q0qVRgJ7LwUgidps/XqX0NgMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lhbf5xPG+TbHCIl7DykXGj8gTac6GbCqNpXa1cRwVKEwgahz2Xm/rL9q7pwxoGeN2
	 1+wl3Z2jRhboHibxncTbneKp8ycFKVUwsFckuGoRJXy20OgJHVd2/6hhEFlSIa5KAz
	 7Pt61sgYPDT+ud4PyWxwBjwCBaxoEAqXXSB8nXj0=
Date: Wed, 29 Oct 2025 15:08:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com,
 kbingham@kernel.org, nathan@kernel.org, ryabinin.a.a@gmail.com,
 dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com,
 jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org,
 baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com,
 wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com,
 fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com,
 ubizjak@gmail.com, ada.coupriediaz@arm.com,
 nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com,
 elver@google.com, pankaj.gupta@amd.com, glider@google.com,
 mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org,
 thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com,
 jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com,
 mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com,
 vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
 ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev,
 ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com,
 maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org,
 rppt@kernel.org, will@kernel.org, luto@kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/18] kasan: x86: arm64: KASAN tag-based mode for
 x86
Message-Id: <20251029150806.e001a669d9dad6ff9167c1f0@linux-foundation.org>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Oct 2025 19:05:27 +0000 Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:

> The patchset aims to add a KASAN tag-based mode for the x86 architecture
> with the help of the new CPU feature called Linear Address Masking
> (LAM). Main improvement introduced by the series is 2x lower memory
> usage compared to KASAN's generic mode, the only currently available
> mode on x86. The tag based mode may also find errors that the generic
> mode couldn't because of differences in how these modes operate.

Thanks.  Quite a lot of these patches aren't showing signs of review at
this time, so I'll skip v6 for now.

However patches 1&2 are fixes that have cc:stable.  It's best to
separate these out from the overall add-a-feature series please - their
path-to-mainline will be quite different.

I grabbed just those two patches for some testing, however their
changelogging isn't fully appropriate.  Can I ask that you resend these
as a two-patch series after updating the changelogs to clearly describe
the userspace-visible effects of the flaws which the patches fix?

This is to help -stable maintainers understand why we're proposing the
backports and it is to help people to predict whether these fixes might
address an issue which they or their customers are experiencing.

