Return-Path: <linux-kbuild+bounces-6610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DADA89386
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 07:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBFDA1894FB4
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 05:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A96244E8C;
	Tue, 15 Apr 2025 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dps6E1ff"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF4D1F4611
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2025 05:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696397; cv=none; b=smhu+gdW6bO1MaSVd58Iuvcn4Lmzh1u5clVntW6Yf7f49f17lnQwSMWiIsOqYWKimWgOz6pWZ7wwXxKSRuHyxUiG4zPvVU9/uSt1/TjtGdjbn1zUTT8c1QeHkhb1F6QH5SwDOrnHBOJTviineY6qCxhZFOpUMVFxgUyLsZ38VV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696397; c=relaxed/simple;
	bh=kHVkVSV5M5rYlv2jVqjUdq7Li866b963pUCxB8lSU+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WR0ODDGusQT17MPbetij40WACuUkvPjMMKtwG3efs8MOZ1cF7DXKSGKChE6GLe6zM13k+iSUzX34NbBHRs02DHzu48i/+XsY2vdZTb8TfEwYNBl0MR/ahrZTVvw9kNAETP5aR9phbKTDSQPY96ZhVysi1HFurSji1SNaxsm7E/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dps6E1ff; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso34086765e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2025 22:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744696393; x=1745301193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ/0kOGdPxiQviF9fW0D71XeIfHyvC0p8qYAE+WzMnA=;
        b=Dps6E1ffxDj8JeP4jiEHT2zYUxH4KdmQx2tJOvrltqAGCvVfvwacj6j2SvoWcacW3x
         HmkAgbbNCxCoGZHo+PZcq1H+VMegHOUAOYSPaTnFQvDxEKqdlJ2sRfzI9tq9Q4oBDCL7
         YGFUiF6p5UGAgh8XgBwGxbmoCm7z3XgzQvx4sJok3b6RMF97YS/9spn6VM3Q6poVdvXG
         dOSjZ9V/SMgETONaKPrenAySsm8SZyv728j+GRXQapZaPku9pF/vGC9ruAfs0LN+XNfU
         tyzQwL/mYMyqxm1xmz4HZT91ZugLwclOXl7ujT3qOmDWI1+SP1xHncJGHw9R7rMIUSs/
         HuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696393; x=1745301193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ/0kOGdPxiQviF9fW0D71XeIfHyvC0p8qYAE+WzMnA=;
        b=QqBW+M47t+huUxpRpaVBWgnJppRCV25PMmJORC5c1/BMvRGs7Nky6qPpLnHskr1anI
         qzDlqpg9+yC7BzhmOu3SDGjSLoRT7ig9ACKMT9Nm2L3WBzIITI4uPCCUKqkhV1eF50hb
         brtv70GFryamjUAIAYc1TM117JXcxKSMNC1EjIMLVKwWB/40Y5vVSTioIA0JNNMeOt0m
         fGXDKn6sNr0MVjDScUyFYdsAaxfe+Nuy9AVZwN70hcn6T6JrZs8rWfRYmIAJK4WjUVMI
         BXCXXO5zjoIm/NeTlsiSQCbFmksHm3gzWv144lA5HkNIoC9c03IrqNbbmwJsmbZuO8PH
         m6Eg==
X-Gm-Message-State: AOJu0Yz3K9Jpbc/ESylmYIlZXOYTKwLetDugtGQywda6CAZdC7NK206x
	Iy7ATAocCBuzxwQO4Ix0DqfFIVuQqPmOKGL0TtMj5vZEuVs7kCG1WuVNWBpKuN/d7MF5akjlxrc
	=
X-Gm-Gg: ASbGnctemOB5UJwu8wltVctuRbAFUG3BJ9sgzc9gMnGAVCPKglr6ZBcv8r6FkcMohZl
	YJfmUFSncGTiDlheSX+Z8aB5kvut2OBtZ76eS2BSvB4hwFqlo106X11xiMMJ22K3pFDJZxmNYY8
	oG363yPg4FhtSBZm6/RZ2d541FoYjC4tamARWCi1QeRmB6ZcLMC/ED3ZFN9af2aPnU8kLW3p1X3
	JmtjCQSOq86G+v+yNO4tGxNpsZlSH1kD3/AAJBY8Gy2878lgY/WQ/5qmafnav8k3x+rCMqsMCSL
	Q5/CHrq2LCYKP1FxpO2k+Bfnhu4y8M9Xbx9TXzCls8vqKBGA+Z8oB7+Pjpf5xDuUiU75QTRcnlR
	XZJdAZvHS3VNb8cTL2avmjfej5w==
X-Google-Smtp-Source: AGHT+IHWBcAx4rXIsUeLqGQNtzFcKXB8gEgMJ73LTXBPISCyJ7qDHCuTGErB/JrQH9fYKhGOTy2wMw==
X-Received: by 2002:a05:600c:58d7:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43f9988a8b5mr11985305e9.5.1744696393102;
        Mon, 14 Apr 2025 22:53:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d57sm199530865e9.34.2025.04.14.22.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 22:53:12 -0700 (PDT)
Message-ID: <26dcdba6-1aae-4a5c-bd64-78406b7f39b9@suse.com>
Date: Tue, 15 Apr 2025 07:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] correct disabling of -Wshift-negative-value
To: Nathan Chancellor <nathan@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Arnd Bergmann <arnd@arndb.de>
References: <10b1ebd8-5d32-41a2-9454-1b40e98d5187@suse.com>
 <20250414193836.GA107755@ax162>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250414193836.GA107755@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 21:38, Nathan Chancellor wrote:
> On Mon, Apr 14, 2025 at 04:23:36PM +0200, Jan Beulich wrote:
>> The warning is supported only from gcc6 onwards, hence its disabling
>> needs probing that the (positive) option is actually supported.
>>
>> Fixes: 1344794a59db ("Kbuild: add -Wno-shift-negative-value where -Wextra is used")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The patch itself seems fine (I might add "scripts/Makefile.extrawarn: "
> to the title) but if I understand correctly, this is only to support GCC
> 5? Would this be necessary if GCC 8.1 becomes the minimum supported
> version of GCC for building the kernel?
> 
> https://lore.kernel.org/20250407094116.1339199-2-arnd@kernel.org/
> 
> If people are actively noticing this, perhaps we should send this to
> Linus's tree for backports then Arnd could revert it in his series?

Actually, aiui that work was meanwhile merged. Hence the patch here is
indeed only applicable to stable trees. No idea how such a situation
is to be handled. (Apparently the same is true for "correct disabling
of -Wstringop-overflow": That option was introduced in gcc7.)

Jan

