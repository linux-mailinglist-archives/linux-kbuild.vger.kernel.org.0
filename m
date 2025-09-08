Return-Path: <linux-kbuild+bounces-8771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A59B493E8
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 17:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 677781729EB
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 15:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585F6310629;
	Mon,  8 Sep 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GBi0aSjX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA430FC22;
	Mon,  8 Sep 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346068; cv=none; b=Q/oxIFPow8D/vXH08xq2MNxqeMoftRK+GNQYcIf9/5Qp4MciFg+p65pUp5XAnzOCSV478P+ystUaNkdeueVKcfWBmCnJrGV9Y5aWiM8f5Cvp4SqwOzrksJ/iTvQUIVlgfWe/vCY0GZXhTRcr3xqfAn1mpfvyTk96E0Dv47aB7vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346068; c=relaxed/simple;
	bh=Z6jrl4mLAXX6r9DE8sEMl+1MLl0DAZ0bEBGDAozfhTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFA8Ofq9WWvLvMwHtjbZM84M3UTXljOcg4evZQrfvODa0LCyfsieZDsQOyak0wWGrmuwKm1ILfQw9DHHyzIaIDrk2nVIe1nhGVma7Eh05X32qJgja2ZdvbZmSpz4GZ5tKDakpnPj+3GgADaABDKIFDcYTxJ0cwWAlPzx6DfyJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GBi0aSjX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i/NTHz2QW7PrsPI9dqlnUBz3BBd0hMA6KRgZuxingf0=; b=GBi0aSjXvmeOh74/NWSi3Netvt
	umXLRbKELo8BXdYxPT9vJ2FKLymdmCKs9+em8KbrcqX5x00auk1qmfwCy56dH7bfo+4jsjIbkXiNF
	Py8LhDHqpag7Y3M0CkWiEKvdMIcgJ5JAp5LybORafLtsFTB5aXzU+ehZDwT0JwzbDJVRGHTX2c2Zj
	UYIaPgOuNqdZRD4w4j4SgdGitxRIMxyjAv/mhet+Oc06/B0dKLFB3Ah9dtlIlwAW3lFr+MQiYUx0I
	FkKCVk8NQSLmu0KmpPeagx0WYy54sRY9J1MQNXqs8UmccEueofDmvgnKJ2Ycx8lDiQBosX0/IswBx
	uzwXl7dw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdzB-000000055Nt-1QWl;
	Mon, 08 Sep 2025 15:40:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D2D5E300230; Mon, 08 Sep 2025 17:40:52 +0200 (CEST)
Date: Mon, 8 Sep 2025 17:40:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: nathan@kernel.org, arnd@arndb.de, broonie@kernel.org,
	Liam.Howlett@oracle.com, urezki@gmail.com, will@kernel.org,
	kaleshsingh@google.com, rppt@kernel.org, leitao@debian.org,
	coxu@redhat.com, surenb@google.com, akpm@linux-foundation.org,
	luto@kernel.org, jpoimboe@kernel.org, changyuanl@google.com,
	hpa@zytor.com, dvyukov@google.com, kas@kernel.org, corbet@lwn.net,
	vincenzo.frascino@arm.com, smostafa@google.com,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	andreyknvl@gmail.com, alexander.shishkin@linux.intel.com,
	thiago.bauermann@linaro.org, catalin.marinas@arm.com,
	ryabinin.a.a@gmail.com, jan.kiszka@siemens.com, jbohac@suse.cz,
	dan.j.williams@intel.com, joel.granados@kernel.org,
	baohua@kernel.org, kevin.brodsky@arm.com, nicolas.schier@linux.dev,
	pcc@google.com, andriy.shevchenko@linux.intel.com,
	wei.liu@kernel.org, bp@alien8.de, ada.coupriediaz@arm.com,
	xin@zytor.com, pankaj.gupta@amd.com, vbabka@suse.cz,
	glider@google.com, jgross@suse.com, kees@kernel.org,
	jhubbard@nvidia.com, joey.gouly@arm.com, ardb@kernel.org,
	thuth@redhat.com, pasha.tatashin@soleen.com,
	kristina.martsenko@arm.com, bigeasy@linutronix.de,
	lorenzo.stoakes@oracle.com, jason.andryuk@amd.com, david@redhat.com,
	graf@amazon.com, wangkefeng.wang@huawei.com, ziy@nvidia.com,
	mark.rutland@arm.com, dave.hansen@linux.intel.com,
	samuel.holland@sifive.com, kbingham@kernel.org,
	trintaeoitogc@gmail.com, scott@os.amperecomputing.com,
	justinstitt@google.com, kuan-ying.lee@canonical.com, maz@kernel.org,
	tglx@linutronix.de, samitolvanen@google.com, mhocko@suse.com,
	nunodasneves@linux.microsoft.com, brgerst@gmail.com,
	willy@infradead.org, ubizjak@gmail.com, mingo@redhat.com,
	sohil.mehta@intel.com, linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, llvm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/18] kasan: arm64: x86: Handle int3 for inline KASAN
 reports
Message-ID: <20250908154052.GG4067720@noisy.programming.kicks-ass.net>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <9030d5a35eb5a3831319881cb8cb040aad65b7b6.1755004923.git.maciej.wieczor-retman@intel.com>
 <20250813151702.GO4067720@noisy.programming.kicks-ass.net>
 <nuzda7g3l2e4qeqdh6m4bmhlux6ywnrrh4ktivldljm2od7vou@z4wtuggklxei>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nuzda7g3l2e4qeqdh6m4bmhlux6ywnrrh4ktivldljm2od7vou@z4wtuggklxei>

On Mon, Aug 18, 2025 at 08:26:11AM +0200, Maciej Wieczor-Retman wrote:
> On 2025-08-13 at 17:17:02 +0200, Peter Zijlstra wrote:
> >On Tue, Aug 12, 2025 at 03:23:49PM +0200, Maciej Wieczor-Retman wrote:
> >> Inline KASAN on x86 does tag mismatch reports by passing the faulty
> >> address and metadata through the INT3 instruction - scheme that's setup
> >> in the LLVM's compiler code (specifically HWAddressSanitizer.cpp).
> >> 
> >> Add a kasan hook to the INT3 handling function.
> >> 
> >> Disable KASAN in an INT3 core kernel selftest function since it can raise
> >> a false tag mismatch report and potentially panic the kernel.
> >> 
> >> Make part of that hook - which decides whether to die or recover from a
> >> tag mismatch - arch independent to avoid duplicating a long comment on
> >> both x86 and arm64 architectures.
> >> 
> >> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> >
> >Can we please split this into an arm64 and x86 patch. Also, why use int3
> >here rather than a #UD trap, which we use for all other such cases?
> 
> Sure, two patches seem okay. I'll first add all the new functions and modify the
> x86 code, then add the arm64 patch which will replace its die() + comment with
> kasan_inline_recover().
> 
> About INT3 I'm not sure, it's just how it's written in the LLVM code. I didn't
> see any justification why it's not #UD. My guess is SMD describes INT3 as an
> interrupt for debugger purposes while #UD is described as "for software
> testing". So from the documentation point INT3 seems to have a stronger case.
> 
> Does INT3 interfere with something? Or is #UD better just because of
> consistency?

INT3 from kernel space is already really tricky, since it is used for
self-modifying code.

I suppose we *can* do this, but #UD is already set up to effectively
forward to WARN and friends, and has UBSAN integration. Its just really
weird to have KASAN do something else again.

