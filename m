Return-Path: <linux-kbuild+bounces-10613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F93D31F6E
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 14:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F0173027D88
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 13:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063C826CE0A;
	Fri, 16 Jan 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVGvnlZq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F720DD51
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570462; cv=none; b=hAB/DRPjaFVaguTHhB8+Dbg1+W1uu9ZI2poQAm7OfRDCkUTwa+f73e0x5SJckh/k6Me7Kk/OW5GNkD7n4ure03emiR6VhgAhahlnLZCTYd9V3QV7h82adv6Do3XFZ4XXo6UKcBknOv/6wbvd0L0UceiXqAYs1IiW0h83QgMoBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570462; c=relaxed/simple;
	bh=lhWftONTvT8mo5Rk/TohDUhgTti9Iwnng/XSd0I81G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8un6PZ184RziIfChBwZs9suITWPY19CgIAZxaxSpZWVfjeUwxz0U3ROkrekQxoC4n2JsSJ4s/o+ppH4pcc3l6Y46r57hivyewYVSHD3aWd/gOVBU+ea20V0wCBNzP+VUdLABlFwzxduxC1Iv207F85CcUyebtxeK+3xH1O4MG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVGvnlZq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382f6ca9fbcso926751fa.3
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768570460; x=1769175260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bev0/5BsocMDQdsWbP6nwDXNzQ2lVeqE+NGh6GYspu8=;
        b=TVGvnlZqsYbG/SmGXZ6/f3KOIwill0l5E16LW30NX+oicyP4i45SrA+I4IpzTPz5Br
         n0OH8TepVmKGl5vNH5VZyIobDxgf8nMfa6yebnO2iJ0rEBss02voc3cV9eEc14BRZMKO
         zrOc/uMv2f8YWK3E+lhc3pOIuj1kD63yN5quv4bdKxJiEHrecnBIPf3qo4cmKXDOx56p
         sFHbOf0in6+jV+GcnMQcy+swFkWsfOaORiGVwuW10fczMzDLm3qcMeR/ONEO+pze11sL
         CMpdsf5blQbp5yUFoVjO5iCacLoXHzXU/PAvT0KvCRXbc6v19EyZE21Dsu31IJ3c/36U
         F3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570460; x=1769175260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bev0/5BsocMDQdsWbP6nwDXNzQ2lVeqE+NGh6GYspu8=;
        b=txhjMfsnR38fN6UYDUH6wD60DbS4cXsW9+2QiolfXdVvxXkIgpz+49Nl0wf8cY5vHv
         boElU7JjvNQrvqVAfMpLhds3uJATmjqZag2bMyIZoZDHN/XYddt5Xg8YYoso8zstAFp7
         RWdaqayiTXwlahJN8C/O4zRKy61x78M5r0q3UfWFKSi6lHOrAMZn70ufFGeshdzUithh
         SzucU843FV5wd/HyXgWM/Ua4Z9SHdHHvCFW/UXh2a2jbV0a66dWaoPq7+4EaT4QIx5Po
         U/E1thg2YQN5bHZ/Gm1oQOOLJ9FbCKT6Z1mvOE5XJdigX+/DOsmZbgftZwgDP5otYozb
         Lk6w==
X-Forwarded-Encrypted: i=1; AJvYcCVAVk1ajGAy3+fsglwhBjva4RHaAjFQpngkhvMHMo7snVCDmeaG6AyBHBPotgwv93yyO7o4IgwGnNewnww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0YutM/kG3rSN9iMUBtwEhIYBRBEP5mSgdUUvURtj82gWyaQSE
	yHNb1t5FQf26u/Tkm/X1e4zNJ2JU2Ainmx1FqaojGzQi9L+eiwuWb0pO
X-Gm-Gg: AY/fxX49Esc55PlAwiezPWkWZz3M1f7F1RWZRawEl/Ry8Ihpkl9AqckKrhKmXWqLfId
	uOkdEgMS1DvzM4LSHbdUlkx6MqaHw4JURZJ+V7LB9ZzYBMVEXKYOC9dXrPYCFwYaRpd81+31deK
	RNF5Ukk8TseUBgxjMjRjxppVl4oR/FxlRrysmB50nrX2ErVDPmyT0PxrzIq8te+QlP+EWc4cvtC
	0pweF2u5eKA9NnhqnZbNVN5gF2pMvM9fn5PycQbk0rNS5pEQmltYlnAGyv6cyZbkgkfUAe2OLox
	E+nG487mnpIlrn/SR/VYG8CA2jURAMaUYxFanBaqdlFBDjlUkqCWOtxAGNBVkQpZ3nEIjyeTzLm
	4cGY2XDVV2I4Ub6Q3s8Bo1f5ULag7+1EwPSAtFBu/qF7swO1cmFTmxFbr8vCMfUfXQFItimqiDN
	cAb/buE5w3N+llgOdQ8w==
X-Received: by 2002:a05:651c:31dc:b0:37f:c5ca:7428 with SMTP id 38308e7fff4ca-38383fe052dmr6437051fa.0.1768570459458;
        Fri, 16 Jan 2026 05:34:19 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8ff0sm7244461fa.45.2026.01.16.05.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:34:18 -0800 (PST)
Message-ID: <1f821f5a-403b-4dad-b9d8-239c9b039000@gmail.com>
Date: Fri, 16 Jan 2026 14:33:33 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/14] kasan: Fix inline mode for x86 tag-based mode
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <1598e2bb7d45902fb0dc4d0d8e218f61b0c1a0f6.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <1598e2bb7d45902fb0dc4d0d8e218f61b0c1a0f6.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
> inline or outline mode in tag-based KASAN. If zeroed, it means the
> instrumentation implementation will be pasted into each relevant
> location along with KASAN related constants during compilation. If set
> to one all function instrumentation will be done with function calls
> instead.
> 
> The default hwasan-instrument-with-calls value for the x86 architecture
> in the compiler is "1", which is not true for other architectures.
> Because of this, enabling inline mode in software tag-based KASAN
> doesn't work on x86 as the kernel script doesn't zero out the parameter
> and always sets up the outline mode.
> 
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Reviewed-by: Alexander Potapenko <glider@google.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

