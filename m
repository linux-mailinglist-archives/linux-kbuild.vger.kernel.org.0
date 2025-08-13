Return-Path: <linux-kbuild+bounces-8438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9AB24D19
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 17:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF4CF7B8A74
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 15:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C33211A19;
	Wed, 13 Aug 2025 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WxLyCH8i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A341F4CB2;
	Wed, 13 Aug 2025 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098233; cv=none; b=Y+BCzHWOOIhq1jLUM9boEUXcsY2vopCsrhJvGEUxqFvjlM7BA/BBRld7/tjGDFkE/hKnivOaGord6DySweF9zpT9yfOZUp1vWSOl+jRQXr5YTQk66jHzpZu0unxBOcT6FcMHlWev/bZjgur6TQ3y0zDsmDvuX0ltV1vAdyZcuPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098233; c=relaxed/simple;
	bh=0UvE3D33DbMuFPY6dxrR8vwFv0Cc+jwGirlm+m7m8h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGzfbyrMMlG2ZM7qJBnK1XHvYaZZLgrWa7evifDTRCjQtAN88a5sKbUONGbLIYbf6YkneEGQk5Vm2jqyAnBviPvDfIAo+sMo5Pd4DwVGrdQLMsiKkZeX+i7flwus1whf6NWbw2yPOAZVvG+m/DUiWjFDbBhmhg/8wpzRAL5ZGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WxLyCH8i; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pNSPGI3nahSLz3vSSHU/GM73uUfkJwp5wjG48WP8eNs=; b=WxLyCH8iH69E9BH7UtMzH7H17H
	t6Ml0vI1fI2OOdNxOGP+5iq+poupLQ2GZTl8Qbg+GLZRMfJhbheIFXwQRw1fAo5vR3jjnVWGALbDA
	GF76KZXk/18EMG+E2DoKUem8UcWsq4kimbAVigd1E9VJbGvY6eMOx/aSv7+4PZZXOjQZExeGyi9kM
	hKX2INP+qOiw68z+tMFED9Du70a0VZMniilClGrYQN98aaHcaPJwhLCTFus3IDJnpPe0eJIJBCBdh
	hGIx2Rn6domoKnDI7gda9nml2xVHmkJ45p9qHFrGca4GFufzKdq8T/KWcgwMoXA06x8qBnyuwj/3g
	Q99O5ANA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDDr-00000009rE6-0f1W;
	Wed, 13 Aug 2025 15:17:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C17623001D6; Wed, 13 Aug 2025 17:17:02 +0200 (CEST)
Date: Wed, 13 Aug 2025 17:17:02 +0200
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
Message-ID: <20250813151702.GO4067720@noisy.programming.kicks-ass.net>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <9030d5a35eb5a3831319881cb8cb040aad65b7b6.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9030d5a35eb5a3831319881cb8cb040aad65b7b6.1755004923.git.maciej.wieczor-retman@intel.com>

On Tue, Aug 12, 2025 at 03:23:49PM +0200, Maciej Wieczor-Retman wrote:
> Inline KASAN on x86 does tag mismatch reports by passing the faulty
> address and metadata through the INT3 instruction - scheme that's setup
> in the LLVM's compiler code (specifically HWAddressSanitizer.cpp).
> 
> Add a kasan hook to the INT3 handling function.
> 
> Disable KASAN in an INT3 core kernel selftest function since it can raise
> a false tag mismatch report and potentially panic the kernel.
> 
> Make part of that hook - which decides whether to die or recover from a
> tag mismatch - arch independent to avoid duplicating a long comment on
> both x86 and arm64 architectures.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Can we please split this into an arm64 and x86 patch. Also, why use int3
here rather than a #UD trap, which we use for all other such cases?

