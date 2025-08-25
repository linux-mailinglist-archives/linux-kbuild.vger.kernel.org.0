Return-Path: <linux-kbuild+bounces-8606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5115B34D28
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 23:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D1C1A8485B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 21:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDFB1E89C;
	Mon, 25 Aug 2025 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bJGokT29"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630422128B
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Aug 2025 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756155596; cv=none; b=S6/HpaF3kwsOL2GW4P1JnYoVYxQDxmfP0/Y1uJpexyLRaGIPR1GX63Gg71b0B7D9Z8V/u19mzaPsX6208m1jfIvDBm/Yt8XPnl9attOtr/Zk+mGWGKQlyuuNm1g/bLiUHwpaMKOsZNfKG3vGazx+NU7ZAZ3MDifrzxOUEaj/AeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756155596; c=relaxed/simple;
	bh=YBVOrpCcsqXAW5sCYr3wMwOJTycBQN3ZspPZEFbfxg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgo3IPoPGyrYpiYJZ/svPO6yO6B41h94vpj16k7ASbQG0ZtAzSu+e5xiyBsiUjSxzcHduB17tL7Ytaa/I7t7Io7qRaf8bDWR2VS0xmVTWcXKhv18OaAjvE4QfeksHXIYTk3PYODXR3Zo2iQZHbIBHRtzsgkYtuXcmqzqQgMDHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=bJGokT29; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ea8b3a64a7so13259005ab.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Aug 2025 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756155594; x=1756760394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcPPbu+aYl9Xu1jLxey4/WhZ40S4z542awI5r/G6Sno=;
        b=bJGokT29qpsdlwr4E1Wfj7G8lf2T2DysfjWNN9Ywqm8/zxLfDQB3FUpANVmwO4q01J
         j7MuZKvZxCzeVzfLFFxI8pibOchKxVwMTq2Mp+tcbZrCbRbE3yxKepqrIKlXNlr4BfnP
         fPzCEjAOCy0k54k5KFDRPtzxo/C7PzdK8QOKnvqN3YMcqS5Ckxc6qhSpwl5IOr4QTK5U
         YxDW0Dap1liX+0TnkwS6THbTvt0dk1OxgujHn4mn4NvS7tDX/8ye3/S+NSQMXbIr5Qnn
         ZP6LVdaPLcP/mOIiOeqi/ZV5wDqOfQnyLqmS8gB2GaLo5VPLD6KNg0eqziLbDPlJTHQc
         cMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756155594; x=1756760394;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcPPbu+aYl9Xu1jLxey4/WhZ40S4z542awI5r/G6Sno=;
        b=TmM86U6vQY/9jpWxHnGd8M7Y0NVh+x3U1knFEtFq8DDkGWphPJsVw6qnHse+whl2Fo
         kXg95jPuVix0doihUpC3xzSFneYS0ipLbXUOECJvNXvvrIZqC1VyYNFEVl4g0Mlnb2i5
         KSoGYBxkkEIcvrz0AQC8saNIEgCJ/8cDfhbcNIGMORZkFbdyHWg2lXf8SSS8oyAaKtiu
         rwi1VLEN21QkXXijb1Nxy0TJtq5s67UlFqLdMHPS75N1T0AFWUrj9gKvKOUaXxki2Qz6
         +/JlvpvnKNKq0CiZ8/Mx7HnBnXXxqDII2e56quefH0oxVJAGfRPI7iwQRzmDHgw3kueN
         U/eA==
X-Forwarded-Encrypted: i=1; AJvYcCXrvXTu9peFMf61jRxbg2QXMTh1gXJ/57gWEvNrYg9HnVwqsNmvRx0GJQnMrsMnL80+kHTzU3kt+Khz4zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/lm/bK9e9BJysO9xXz1sfV0zH34izkGsRPt/0z9TH0jQD3X5
	Zsf6/He5M551HCAFpaY7biVycFhoC/rxZEI4/VPeeGRO5mLxVuQJtIV5a/dyI9MZM2I=
X-Gm-Gg: ASbGncvI7pUhAdC3dTBEp44XYya+6cUkGjMyvWPjUh3lywxkIVgNuZk1goK/GJ0GVP3
	vQLtHvVPw9KqZXs5Hk2DNtJt0yKBqfRr/ClnFYiAQDW+V6o/3OoSniylAU1qWc9CxnZZpZglb/8
	y+dSUTL6YYXnjTDfQc2AwQ1Snx/PLOEKgKjdtx4+iEwl1O+5TRIn8eNP5FuHWMo0KaCEkFgMX6E
	rakuSO36f6cM4pJ896rKwod4YGkic3GD3cu9B9u1BMSCOIp4hKsXdyaGKlLGzSbAZhqBE0z9P04
	5MHisxOyWXuQWdi8ThBVt+RG9UAZ4RESy487LSvaqKJ5kGPj4y19IKP57DLtabp8eMpmJ4NkbgJ
	KCmwynkFxDghtxjLiQguaGY7U5WYu29FyF0senhTsVTo=
X-Google-Smtp-Source: AGHT+IGl5YyJO5cNchW3hMpUrsJFnsYaH0jFB/UnFZkvzedPO9loSjPBh1OzNXyW8MzaaJOPsbW11Q==
X-Received: by 2002:a92:cdad:0:b0:3e9:eec4:9b5a with SMTP id e9e14a558f8ab-3e9eec49d85mr152368845ab.25.1756155593789;
        Mon, 25 Aug 2025 13:59:53 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.102.202])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4ec1fa3dsm54724275ab.45.2025.08.25.13.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 13:59:53 -0700 (PDT)
Message-ID: <9ae927d3-0a66-4354-910f-155ff9ba3e0f@sifive.com>
Date: Mon, 25 Aug 2025 15:59:46 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sohil.mehta@intel.com,
 baohua@kernel.org, david@redhat.com, kbingham@kernel.org,
 weixugc@google.com, Liam.Howlett@oracle.com, alexandre.chartre@oracle.com,
 kas@kernel.org, mark.rutland@arm.com, trintaeoitogc@gmail.com,
 axelrasmussen@google.com, yuanchu@google.com, joey.gouly@arm.com,
 samitolvanen@google.com, joel.granados@kernel.org, graf@amazon.com,
 vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org,
 thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com,
 kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
 nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com,
 justinstitt@google.com, catalin.marinas@arm.com,
 alexander.shishkin@linux.intel.com, dave.hansen@linux.intel.com,
 corbet@lwn.net, xin@zytor.com, dvyukov@google.com, tglx@linutronix.de,
 scott@os.amperecomputing.com, jason.andryuk@amd.com, morbo@google.com,
 nathan@kernel.org, lorenzo.stoakes@oracle.com, mingo@redhat.com,
 brgerst@gmail.com, kristina.martsenko@arm.com, bigeasy@linutronix.de,
 luto@kernel.org, jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com,
 mhocko@suse.com, ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
 peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
 ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com,
 ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org,
 akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org,
 pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev,
 will@kernel.org, andreyknvl@gmail.com, jhubbard@nvidia.com, bp@alien8.de
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 2025-08-25 3:24 PM, Maciej Wieczor-Retman wrote:
> For an address to be canonical it has to have its top bits equal to each
> other. The number of bits depends on the paging level and whether
> they're supposed to be ones or zeroes depends on whether the address
> points to kernel or user space.
> 
> With Linear Address Masking (LAM) enabled, the definition of linear
> address canonicality is modified. Not all of the previously required
> bits need to be equal, only the first and last from the previously equal
> bitmask. So for example a 5-level paging kernel address needs to have
> bits [63] and [56] set.
> 
> Add separate __canonical_address() implementation for
> CONFIG_KASAN_SW_TAGS since it's the only thing right now that enables
> LAM for kernel addresses (LAM_SUP bit in CR4).
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add patch to the series.
> 
>  arch/x86/include/asm/page.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
> index bcf5cad3da36..a83f23a71f35 100644
> --- a/arch/x86/include/asm/page.h
> +++ b/arch/x86/include/asm/page.h
> @@ -82,10 +82,20 @@ static __always_inline void *pfn_to_kaddr(unsigned long pfn)
>  	return __va(pfn << PAGE_SHIFT);
>  }
>  
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

These two implementations have different semantics. The new function works only
on kernel addresses, whereas the existing one works on user addresses as well.
It looks like at least KVM's use of __is_canonical_address() expects the
function to work with user addresses.

Regards,
Samuel

>  
>  static __always_inline u64 __is_canonical_address(u64 vaddr, u8 vaddr_bits)
>  {


