Return-Path: <linux-kbuild+bounces-8620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064BB3733D
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 21:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5DF1BA73EF
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 19:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CD037429A;
	Tue, 26 Aug 2025 19:35:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04DE2F0C7A;
	Tue, 26 Aug 2025 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756236910; cv=none; b=Jo5wR5lRqZ5BNzmszpkd2BDL6LXU5j8aYo6Vwe/GOvtCWDDvxUCLFdPLtkXtLvjS9fjepjQ1kn5+0KRvtt3A0cy4kuw1wWw5lkF69FdawPGoQNd2EQxdbeEmqPjToNJwjdf0AevdXhbhmKw08V9zpzD/qUpxGkgYQdnZt9Uz1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756236910; c=relaxed/simple;
	bh=6/7n+g1zNexOTdHB4lKVMKI6ZVYvq/hB0xWd+VSmFKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfFpOnm86gn3smO0L8dQGhJmVHvMi0JH5SuoYrfwKndwRrzC2WcxEAC9fHTRO8pjmIe28Q/+IBId27LX8jnmIjtz8V1NmNspdIgV5fidQz2eCAcO+AsccE2ptMMzhRRN8oIJnmhftDktRCa4HyNKSvc9wgYf34RgXXoYrODXm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D065C4CEF1;
	Tue, 26 Aug 2025 19:34:57 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:35:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com,
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com,
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
	trintaeoitogc@gmail.com, axelrasmussen@google.com,
	yuanchu@google.com, joey.gouly@arm.com, samitolvanen@google.com,
	joel.granados@kernel.org, graf@amazon.com,
	vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org,
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com,
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz,
	kaleshsingh@google.com, justinstitt@google.com,
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com,
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com,
	dvyukov@google.com, tglx@linutronix.de,
	scott@os.amperecomputing.com, jason.andryuk@amd.com,
	morbo@google.com, nathan@kernel.org, lorenzo.stoakes@oracle.com,
	mingo@redhat.com, brgerst@gmail.com, kristina.martsenko@arm.com,
	bigeasy@linutronix.de, luto@kernel.org, jgross@suse.com,
	jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com,
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com,
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org,
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com,
	rppt@kernel.org, pcc@google.com, jan.kiszka@siemens.com,
	nicolas.schier@linux.dev, will@kernel.org, andreyknvl@gmail.com,
	jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 14/19] arm64: Unify software tag-based KASAN inline
 recovery path
Message-ID: <aK4MZGzTvJ8bBQvn@arm.com>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <eb073b008b547cf87722390cc94fe6e9d21c514e.1756151769.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb073b008b547cf87722390cc94fe6e9d21c514e.1756151769.git.maciej.wieczor-retman@intel.com>

On Mon, Aug 25, 2025 at 10:24:39PM +0200, Maciej Wieczor-Retman wrote:
> To avoid having a copy of a long comment explaining the intricacies of
> the inline KASAN recovery system and issues for every architecture that
> uses the software tag-based mode, a unified kasan_inline_recover()
> function was added.
> 
> Use kasan_inline_recover() in the kasan brk handler to cleanup the long
> comment, that's kept in the non-arch KASAN code.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

