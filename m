Return-Path: <linux-kbuild+bounces-6598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC6A88554
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 16:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D86D17A8425
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 14:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6755025394E;
	Mon, 14 Apr 2025 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UPj5d4iD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5592472B3
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640619; cv=none; b=LzGuwMPEmG5oDTcwORaQuhwGJ65epUWhsJpDQ9ePs4V7nLOt7/PGmzQBTH1+aeQPVGXnunUtRz/L/He2ouSJKoMD+cpz/jSqIH6gpTkbgAZ/2QX3pC9pcLGqzfCJemuhFdPWur1esaziRapEIwvJqpEGsufJlv9BchXlL7Mq/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640619; c=relaxed/simple;
	bh=K9G0q37TrNlcPjquPSmr/+t2PTZHQOzDgLf1kGmag2A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Z95To7wtNaLl+fbuwHwpeFkCO9feq7c3B+6QBfHhWX/a6/jk4w61za4UOWRNvWPLxNY7CtQCPMZn+6d1Sa8sUz5YuRDAT60hbGRbZ/tJAVkJ6IHKJyQj58PIVN6Oey9UkDaGH8n7VkPW93yQ3DuqNSM4NgEdO96Gw8W+Ph0wcmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UPj5d4iD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edb40f357so37299665e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2025 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744640615; x=1745245415; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2F3dZ3hLtdrOuYWIrvH0DOfPMALIT7wBtRZFKoHIv64=;
        b=UPj5d4iDS8EvvGbqlsKf4muTHc7b2k5g2ep09HnBMdKaWBXZD7r2OS0Aip6VCXzU1W
         zv+vRxjYVk+6RCl13jZF2C495NJfHbAV95OqBC4O6E/LkmBn7OGehRpnin4YFaHSr1lX
         ArOx9+dZPd9SrxQc19PEp5+n9JhOddxkTWBWsNT4BFeiGeDFCiEMBAqqfTFSAMS/buy+
         heSycF+vmPUr2O2MWzGYXgOvhPrXBIlnFpZWXeALQ5JanwARSJiaWeO7Rk5lHWS3CiVV
         WSQBaVA5oUcCVXvRvePHftZlhNnizBdeE9R4Tb39S7lpaCEepscMKQZhBQwKePfAEKV6
         FB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640615; x=1745245415;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F3dZ3hLtdrOuYWIrvH0DOfPMALIT7wBtRZFKoHIv64=;
        b=Hfv7/2AW7Q0wx4XE1QpwvFhgU5L7eUmnITWmkOEbMQ0Tlt4kxOUNN79OCqCCHP9d+L
         uX/mItntHZmUKmlxB5ITk/gOdxxfKjYx/zH4vBZBpf9deMcpixaroa6uOhJnLqLnW8zx
         cWHDMN+XmI4O9knz6LbhKrwn6F2tIpzImJxKL1Po1WuYT0rxbkzo/RKSCm5klZ+uglsR
         DacWPrzpVAsna3BOdBXPQHPek4Be2Qr8uX+vZ/kTTsh6+STH/z4ruc8u948z1oZ14MjX
         APXnb5RE9qrnDqoMiT3ius6ATjvvf4k+dCUyjwTtlMMUIuJ6qEPDhhlpdHaiSWmkY1UI
         sllg==
X-Gm-Message-State: AOJu0YyqKboA7BsefBl4K25bYjkZd7EmPjh+I+LBaT0sWrp+c2GATLq7
	KwlYRazaGkKFnWXScciCC2wS4cUQJ54ezaw1T17Sr8AL6OJfcf1WiKKW9SmGMdjPc698H4qLV/o
	=
X-Gm-Gg: ASbGncsR3eyaMPj8THKFGVcJdAIfURQ7I8JIfzUMpPHIMCQv1VH/5TLaKMKsmZEfMF1
	QVhjrEhJBmr+28t8lQbgse+DEj0xyVzooeEmPGkIlEpbj1z/naeLEONHEcbkf4BemrgLyUqgewa
	/ZASz6Bv90W/c6BYu0LG4BwVkAmoFwSueip23VATTS9HSAohwqCNG8WduQh2w+1nx0cGuAYeftX
	4LCXaj+41+fBQ9DTpdeXIZhD0edeWyEmZlLc/yVe4wmWcZTATz/V6tQc4Bds9JD1/ZbxQ6IXZbi
	TG+zmh8t/7PCmw5qb1N07W1vMEjdsTB4Mwm/vkt2ktZr1YCgyDhgPrFLY/0+SOPLzvBn17VTDY1
	tU2vl9nFmG6s7OYEUc+hj5FjSAA==
X-Google-Smtp-Source: AGHT+IEWoQsME/5G4pvikKkYaajHiXzdRiXdPMI80/GtBJM4cr8u34ugVeQmiBycIJcEfsBHsWCouw==
X-Received: by 2002:a05:600c:810b:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43f3a92877bmr92406855e9.7.1744640615303;
        Mon, 14 Apr 2025 07:23:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm174165305e9.31.2025.04.14.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:23:34 -0700 (PDT)
Message-ID: <10b1ebd8-5d32-41a2-9454-1b40e98d5187@suse.com>
Date: Mon, 14 Apr 2025 16:23:36 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] correct disabling of -Wshift-negative-value
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The warning is supported only from gcc6 onwards, hence its disabling
needs probing that the (positive) option is actually supported.

Fixes: 1344794a59db ("Kbuild: add -Wno-shift-negative-value where -Wextra is used")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -154,7 +154,7 @@ else
 # The following turn off the warnings enabled by -Wextra
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-type-limits
-KBUILD_CFLAGS += -Wno-shift-negative-value
+KBUILD_CFLAGS += $(call cc-disable-warning,shift-negative-value)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-enum-enum-conversion

