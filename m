Return-Path: <linux-kbuild+bounces-7106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB9AB6665
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 10:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CA74464B37
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 08:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C32C21B9C6;
	Wed, 14 May 2025 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W9tfoLf2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B056B81
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212492; cv=none; b=IWR75ZfqFqatcqhuQNldureKKKjrtJqEPTW14NDU7izL5zy2ceQ4GAMhUDgIMKRmLT9DnWge13AVYua+uxXVJYmlu9kKuyngkCNlKEvcqAu+L6zh80dUDIxqTLeKT5Xmp2tfQVMs9RN4dgKSLUrTBvaFLBTzVWaFtboddYHfstA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212492; c=relaxed/simple;
	bh=Ccun/NTDw+CoIytlHzHrLFFVWreSfKk2Ou4w0xRSMe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ApLVGN1sJIj12tk6yXHkulkcftK2gvPYCSYRbBEYf+yIB9lcHFctyDffXuw44R+Pjiz3UAkzD9iLnmQQR3XESYxTxWEJ8J60vYTRJta2cFiPSgb4LzcNhddppjhVHqz+jKpwqH7QODkdT4/xBYaftK4Q5hTk60w7e6oQWcypsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W9tfoLf2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b9625735so3506675f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747212488; x=1747817288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J11Tm9IxpteDcvYogIFayM49cQbKfAspMtr3deGbdkA=;
        b=W9tfoLf2xYNRKWZP1aNpy6x1Ak0IIVXZNp8OdSkUPnUAQ9cu3tBIIyXt6ZRbHQ4wCP
         guEKGSImsK0Ije+ViSzRdSrmNsATpQQNqXoPxs3beWfTn81F0vtNu1fapVT7ONLmVeXv
         Ux3064Ec4kccPCjNS6q4/YEgNHY0eGb8pL/A4qVm9MA99dLHaXbZ3GNSPZoxRuizOc7H
         CyM6uFPfQ68y9glgOo7d2dtBjbfZwGV5xwYAFPyihO5rdqeE0C8SRGzfV67LtjpFD8C4
         ZLGF7ZPhmeR2pVej5briPiQwV9/H8ayyiw2QMNqzQycQfVvvBtwNfZnDO/FW8gytQzSW
         um7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212488; x=1747817288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J11Tm9IxpteDcvYogIFayM49cQbKfAspMtr3deGbdkA=;
        b=f923Y7/Od8ynj36GX/43lyP9aPSZOhL3e8SxBaaLTr9PoTLBMVs1irYvVu6sBEYpK6
         Z7HxsRRCrLN2zdELGAGfj//T+8ibB10RR0PDKbiYeoTNDaUOP+VAETK/KJ6om0Iyg+PE
         YXDfOfH0hlFNfsfMyoXGSzR8QZw/K4PmOFAiNxSsczfX99sc9wZBKKEgjpFgNHenAIxh
         wA15Jh25MDZrvn5/g3gmC2foN8q8N9wrkrs6x7Jc0u/9Imvh17xTPYwfQG851tRWRZl8
         A9hIQ0QkmdSkVjgMLeQ4AW/2kZEzgf9BZ2QJ6t3+mXbHKHodP2K8z1A2bYtlSHvyIdLI
         FL0A==
X-Forwarded-Encrypted: i=1; AJvYcCVVo1aoSUC3AKh96CAHoL982S8JSoQQ8DYxWcHwuDt0Nzhcybm+Z24K/RdMTiiGJ3RlPxTis3p9NFlCsFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gmxNQ3NZN5vIDwsQK8+rB2AQkMl9Y18cESYqFvcLV0xWxibN
	20Hvp87uvRn7ilBgWRJLoPYFZr6Y9xr3mNRrMq6lgZocMLsH9f6SXycHYxSRckw=
X-Gm-Gg: ASbGncv26U3+AjMyHSCzbX3RpBCx5uqGFVROvq3w4hJ8f3fbeZEQr0U8nRZQcjtz+Q5
	rx0XawRhjqIppaQuk3Vc3UdiNZQwSSDPLkvAdUkCWXY6LWTUv1W7lpfUXzzW1/djzzZFoEqd4sy
	EGE6t4FiQOwYtHnYhayeZ/YhjaRcoAf85SSjbw0MB9LiU3JZ9pCQAld97yKtN5bP7wqjYJ3pKAI
	IDif64ynwlCOW5OW1qKDZ7hxDdJDxbhm0Rm5R851hGLCgDtDMYp4VWX3LiFzCtXP3L1h9vBuiyU
	EW7idbAKxsDmNkQjcVr3ObEicAdzAYIav6/iLr93QoBrlBs1xUE3OA==
X-Google-Smtp-Source: AGHT+IG6Ygt895dWK6xd2go5hH299uW3ziCrAKGblKyG0md7su1tSRFeV1oXO46fD6Q1GE1oUd21Ng==
X-Received: by 2002:a05:6000:2583:b0:3a0:b977:b6da with SMTP id ffacd0b85a97d-3a3496c36bfmr1777692f8f.24.1747212488190;
        Wed, 14 May 2025 01:48:08 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c63b717c5sm7334835e0c.9.2025.05.14.01.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:48:07 -0700 (PDT)
Message-ID: <49b63a7c-d323-4b13-8a1d-11ec8f0a3152@suse.com>
Date: Wed, 14 May 2025 10:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] module: Strict per-modname namespaces
To: masahiroy@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org,
 hpa@zytor.com, samitolvanen@google.com, da.gomez@samsung.com,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141204.500293812@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Hi!
> 
> Implement means for exports to be available to an explicit list of named
> modules. By explicitly limiting the usage of certain exports, the abuse
> potential/risk is greatly reduced.
> 
> Changes since v2:
> 
>  - switch to "module:" prefix (Masahiro)
>  - removed some patch noise (Masahiro)
>  - strstarts() and strlen() usage for prefixes (Masahiro)
>  - simpler ___EXPORT_SYMBOL() changes (Masahiro)
> 
> Not making using of glob_match() / fnmatch(); this would result in more
> complicated code for very little gain.

@Masahiro, please let me know if you're still reviewing the modpost or
other changes, or the series now looks good to you. I'd like to take it
for v6.16-rc1.

-- 
Thanks,
Petr

