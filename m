Return-Path: <linux-kbuild+bounces-6432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5ABA7C145
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 18:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CDC0188510D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAE8207A22;
	Fri,  4 Apr 2025 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7OT17KM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC4207A07;
	Fri,  4 Apr 2025 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782819; cv=none; b=q6DezYM2ugFddDIJRv3h9WzhJt2BXzJPxPcAV2Tlj/Q5CyFmVIhK0D7wKkCi0YAGTHHe+zH1qRd6YFbQwNCEb9pnJK0+bDFIh3RcICE9JDuA/GyKe0w6RhoyQYJeTVqfCmEN22e1eu298ONRCxUjniBB5tFvUJfI6Bn89YTU4F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782819; c=relaxed/simple;
	bh=iXVoP3wKEH70qKx98Hhc6Wogu3HSHe/ZVCwkUx8UtjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vlo1hvTxPC8BHRBLkXIlTfsYYbZis6U6pZEEBSP8bbNQ4JokpF0tYveWqDwnWoBT7C3bW9NCwhm+abPf0RhR3/wDOIkW0mO/uvkVW1/sUAGGfJN3VxdNiniRAmDx81pNJ40dzzs56sYVEAbJSPS0V0KI117qiIfnELlVahMwp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7OT17KM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743782818; x=1775318818;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iXVoP3wKEH70qKx98Hhc6Wogu3HSHe/ZVCwkUx8UtjI=;
  b=E7OT17KMCacw7nK9NnU+dHudIPOHltMbLEaGJxiuSFdYxw07MPTRja8A
   KHUZFOXAs98V0CR4zrLux8oX6IDzuTB1CU0uvYcsyACC41gGMBaMwRmrF
   zKlAJurRTsGbCwCnOfo1LKIsEWgkjrYnOK4FlZQjyNG1tD8r9lMmz0NtQ
   DGVm0u1md23CbUAWPZvWJjSHZfFHXybkwgl6z+7z9CexxKgD+LTluRNYu
   SE8A37+vgagqCGGzgyXZ5iUcDszWXJmTcgQ4tVlzlq0p0R1J8GA6QA36O
   5E233rgl+4JGKkQ0vMfcn5mgtiKb8RryyPt3ICcC5dzAADex0FBvUieoQ
   g==;
X-CSE-ConnectionGUID: FOCoGt6BTnewDSG3rh80bw==
X-CSE-MsgGUID: WA4HGncaTZuAboHpsCdtIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49022881"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49022881"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:06:57 -0700
X-CSE-ConnectionGUID: cO+Z9NzfR/u/1zgGGwdspw==
X-CSE-MsgGUID: 96Ikxg4US7+bKvi55n+CVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="164554384"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.124.223.29]) ([10.124.223.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:06:54 -0700
Message-ID: <3fd46452-fc96-4d50-9c40-a8a453d58f40@intel.com>
Date: Fri, 4 Apr 2025 09:06:51 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] x86: Add arch specific kasan functions
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, hpa@zytor.com,
 hch@infradead.org, nick.desaulniers+lkml@gmail.com,
 kuan-ying.lee@canonical.com, masahiroy@kernel.org,
 samuel.holland@sifive.com, mingo@redhat.com, corbet@lwn.net,
 ryabinin.a.a@gmail.com, guoweikang.kernel@gmail.com, jpoimboe@kernel.org,
 ardb@kernel.org, vincenzo.frascino@arm.com, glider@google.com,
 kirill.shutemov@linux.intel.com, apopple@nvidia.com,
 samitolvanen@google.com, kaleshsingh@google.com, jgross@suse.com,
 andreyknvl@gmail.com, scott@os.amperecomputing.com, tony.luck@intel.com,
 dvyukov@google.com, pasha.tatashin@soleen.com, ziy@nvidia.com,
 broonie@kernel.org, gatlin.newhouse@gmail.com, jackmanb@google.com,
 wangkefeng.wang@huawei.com, thiago.bauermann@linaro.org, tglx@linutronix.de,
 kees@kernel.org, akpm@linux-foundation.org, jason.andryuk@amd.com,
 snovitoll@gmail.com, xin@zytor.com, jan.kiszka@siemens.com, bp@alien8.de,
 rppt@kernel.org, peterz@infradead.org, pankaj.gupta@amd.com,
 thuth@redhat.com, andriy.shevchenko@linux.intel.com,
 joel.granados@kernel.org, kbingham@kernel.org, nicolas@fjasle.eu,
 mark.rutland@arm.com, surenb@google.com, catalin.marinas@arm.com,
 morbo@google.com, justinstitt@google.com, ubizjak@gmail.com,
 jhubbard@nvidia.com, urezki@gmail.com, dave.hansen@linux.intel.com,
 bhe@redhat.com, luto@kernel.org, baohua@kernel.org, nathan@kernel.org,
 will@kernel.org, brgerst@gmail.com
Cc: llvm@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, x86@kernel.org
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <e06c7c0fdbad7044f150891d827393665c5742fd.1743772053.git.maciej.wieczor-retman@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <e06c7c0fdbad7044f150891d827393665c5742fd.1743772053.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
> +static inline const void *__tag_set(const void *addr, u8 tag)
> +{
> +	u64 __addr = (u64)addr & ~__tag_shifted(KASAN_TAG_KERNEL);
> +	return (const void *)(__addr | __tag_shifted(tag));
> +}

This becomes a lot clearer to read if you separate out the casting from
the logical bit manipulation. For instance:

static inline const void *__tag_set(const void *__addr, u8 tag)
{
	u64 addr = (u64)__addr;

	addr &= ~__tag_shifted(KASAN_TAG_KERNEL);
	addr |= __tag_shifted(tag);

	return (const void *)addr;
}

Also, unless there's a good reason for it, you might as well limit the
places you need to use "__".

Now that we can read this, I think it's potentially buggy. If someone
went and changed:

#define KASAN_TAG_KERNEL	0xFF

to, say:

#define KASAN_TAG_KERNEL	0xAB

the '&' would miss clearing bits. It works fine in the arm64 implementation:

	u64 __addr = (u64)addr & ~__tag_shifted(0xff);

because they've hard-coded 0xff. I _think_ that's what you actually want
here. You don't want to mask out KASAN_TAG_KERNEL, you actually want to
mask out *ANYTHING* in those bits.

So the best thing is probably to define a KASAN_TAG_MASK that makes it
clear which are the tag bits.

