Return-Path: <linux-kbuild+bounces-8608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5905B34E22
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 23:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B64111A8670A
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 21:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620F123ABA7;
	Mon, 25 Aug 2025 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+ICMpvC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB5513C695;
	Mon, 25 Aug 2025 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157801; cv=none; b=eRbY/679MtrXHazMI9S7cm4PiqVYPjJ0qETlVel5GYqXyxaiygJBKeEvBv29mgbZUd75FO9o5wJJ4+J3h9QOY9iA7Njvgxe5NWia2aTJCLx5HNN8a/XUWhyJpMvWTZlypB5hLD8Tq1QltloXt9DZhTrPiBY51UuiKktltYxngUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157801; c=relaxed/simple;
	bh=ENwpBGMnKJzD+vNESnlh2d9HHAvolBxZL2qadPLLmJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/zs0GtZFNll7VvDn5L0ca5nNnPOsQiBv4+fR4oqNvL7xFMuYRixo+bVUqZvrJZI1BU3cdK8T1tqZ7cz8yhPx6CmPv+w/ttqIOb+Gq/FZpQqDfqS9tYZfaXCFc5mlysS47Q2FivTBGkbpKy2Crk75ic0MhBlgJP3cuAs0toNtYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+ICMpvC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756157800; x=1787693800;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ENwpBGMnKJzD+vNESnlh2d9HHAvolBxZL2qadPLLmJI=;
  b=k+ICMpvCX5sNkB0bdIAtjcMzxbJZZm36rPPqQ5taWPa3MIQ0bhtwWKpZ
   XoYwcE38QNj8Ed5IABgbLbD0d21JEbJACY6o/50BG0iNVvHaviPGvb69A
   U/p0myUmmRbxAwELNiE91z7jrfJsK2s3vjfDzMtqJFtBMElXIYL+6cL2o
   1dP+6SxHizG6SesUtIJRZ1qCdQF7RAbC55Zy3t/wpCieAR1GjBtPosLe8
   l00Lxm8tzaTkIeGgLjujnHTyReb9s/pl0hZlOQ4Migq5Ha3+LQmabBGx1
   UaY+B4MPs6ciKzdCXF0W23c9SYuQBoHpr16hmNGU9cbPfHLyiOtBKmFHv
   w==;
X-CSE-ConnectionGUID: kbK+pNnHQaifD0cVNejygw==
X-CSE-MsgGUID: ovs2v+PxSaa4yOtY2PLIZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69754704"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69754704"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 14:36:37 -0700
X-CSE-ConnectionGUID: /uyCc6NjR9KW4BMqoy2VlQ==
X-CSE-MsgGUID: 9k1EwDU6QcGQHDVezqm8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173575364"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [10.125.108.229]) ([10.125.108.229])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 14:36:35 -0700
Message-ID: <c68330de-c076-45be-beac-147286f2b628@intel.com>
Date: Mon, 25 Aug 2025 14:36:35 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com,
 kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com,
 alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
 trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com,
 joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org,
 graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org,
 ardb@kernel.org, thiago.bauermann@linaro.org, glider@google.com,
 thuth@redhat.com, kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
 nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com,
 justinstitt@google.com, catalin.marinas@arm.com,
 alexander.shishkin@linux.intel.com, samuel.holland@sifive.com,
 dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com,
 dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com,
 jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org,
 lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com,
 kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org,
 jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com,
 ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
 peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
 ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com,
 ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org,
 akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org,
 pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev,
 will@kernel.org, andreyknvl@gmail.com, jhubbard@nvidia.com, bp@alien8.de
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
> +/*
> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
> + */
> +#ifdef CONFIG_KASAN_SW_TAGS
> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
> +{
> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
> +}
> +#else
>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>  {
>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>  }
> +#endif

This is the kind of thing that's bound to break. Could we distill it
down to something simpler, perhaps?

In the end, the canonical enforcement mask is the thing that's changing.
So perhaps it should be all common code except for the mask definition:

#ifdef CONFIG_KASAN_SW_TAGS
#define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
#else
#define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
#endif

(modulo off-by-one bugs ;)

Then the canonical check itself becomes something like:

	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
	return (vaddr & mask) == mask;

That, to me, is the most straightforward way to do it.

I don't see it addressed in the cover letter, but what happens when a
CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?

