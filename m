Return-Path: <linux-kbuild+bounces-6542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C3A82A4E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 17:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43259189378C
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DA22676C1;
	Wed,  9 Apr 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrLAR2j2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0001DFFD;
	Wed,  9 Apr 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212260; cv=none; b=SFpiWzav0eP1Mk+sZm2e3EyOuvf8h4R9btf84S/HR96UQEkujbmK+fA02eaguWux8RT4nwW/C3lk5YNuMWBrwELyfF6D6jipq6XYXTDq/2SgSM9O2OzdEHeMLnieeYO0QnHx+vWm52HT1wu0DkzWi09q3uhoW24izgkQCiitHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212260; c=relaxed/simple;
	bh=sIIpfXuBk1MC8hc55Mz681lzegKE5XjPEjM6JSmS6wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfN1OQuydfD80QcVk3C6ev7heqYIKUwducHThOsj7U5fpBK6lih8bDKFBmKfJs6a+0ltpYnWXVre062XSvvMIy2HSP3zquHnuQBCjwGK/mIg0eabLf/2Fnr4nTfSvf8oBIWoQ+G+x3qoX7bsE7twXFHIhJLGMsZBtdiReRw0ynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrLAR2j2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744212259; x=1775748259;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sIIpfXuBk1MC8hc55Mz681lzegKE5XjPEjM6JSmS6wg=;
  b=MrLAR2j24AjvLMoCbuOzshguSBehqJc2buNJ61eGwkCCEXwy9Dy1W+pK
   zKnCM0VXcybKDaZnrcl6Z0jfs7Y0fjORRvY19iyRUDrU59wjHh4IX71jl
   Dso+Gk15CBifGkn9rRTrVjiF4jKz3IbGNrwdxWFqd4h5TtNUQvBrRHp2e
   BL5pXKo0bc5ZRr2siPAmbplgJZZgziV2I34Llo3zxGHYuRYSI1/VxN2zY
   1DZFemSEjeyMHbBTQBhu2oD4VtUyBwb68SIZAInw8hnutVPGC+woBPdDY
   gpeaL5cWfRpe/+oao496GrvY05Cwm+miq4gMAAvDLQ7vmah62lCTuH0fW
   g==;
X-CSE-ConnectionGUID: TgvWkDpJRr2MdRR7QYZ6gQ==
X-CSE-MsgGUID: rEqQ1yTAQ1SVtdkDXJp5CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71071412"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="71071412"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:24:16 -0700
X-CSE-ConnectionGUID: djvQwLdiSIOUrXyaz6HO3w==
X-CSE-MsgGUID: GE/MdNfoTNa8pIrfVyB5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="151793818"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO [10.124.220.195]) ([10.124.220.195])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:24:14 -0700
Message-ID: <0770a3d4-c8ff-4172-9eda-c9debfee6d03@intel.com>
Date: Wed, 9 Apr 2025 08:24:11 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] x86: Minimal SLAB alignment
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: hpa@zytor.com, hch@infradead.org, nick.desaulniers+lkml@gmail.com,
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
 will@kernel.org, brgerst@gmail.com, llvm@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, x86@kernel.org
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <173d99afea37321e76e9380b49bd5966be8db849.1743772053.git.maciej.wieczor-retman@intel.com>
 <ceade208-c585-48e7-aafe-4599b1a06b81@intel.com>
 <czzcsmwaf42v47arvmwgrh4p7h3misoarremtc7r2cme2ceuud@yya5jfuqhuye>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <czzcsmwaf42v47arvmwgrh4p7h3misoarremtc7r2cme2ceuud@yya5jfuqhuye>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/25 05:49, Maciej Wieczor-Retman wrote:
> The differences looked mostly like noise, sometimes the higher alignment would
> use up a little bit less memory, sometimes a little bit more. I looked at all
> values in "cat /proc/meminfo".
> 
> Is there some slab/slub benchmark for the kernel that would make sense to
> checkout here?

You don't need to benchmark anything. Just mention that it will waste
memory and also give *some* ballpark estimate on how much. Just looking
at your laptop's /proc/slabinfo would be a good start.

Oh, and it wouldn't hurt to find out when and why the minimal slab
alignment got dropped down to 8 bytes. I _thought_ it was higher at some
point. Presumably there was a good reason for it and you're now undoing
part of it.

