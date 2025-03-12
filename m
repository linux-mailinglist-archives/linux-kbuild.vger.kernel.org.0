Return-Path: <linux-kbuild+bounces-6079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FFA5DCC4
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF13189AACE
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 12:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C74224293B;
	Wed, 12 Mar 2025 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KOODt/VI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B523F36C
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Mar 2025 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741782965; cv=none; b=WwXHs/Cnf/JVL1axBH3djXe3OO6eeT1Gz8Dl1doWFe6TyI4NQM8MBzM8+YKvup18tuq+ZROvk/Wu4xfyktJPswAjluB3uLT9VJdowCcBsi8KC2Yt0jDTlfi1gpIq5yONdMBAfDjz7gAYw38JfxYtgleAEtMWyJHro7tdkrDBowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741782965; c=relaxed/simple;
	bh=jzP9Aq0KIRIM15I9iHhIMVyyNBjhpDHKZwBXWLV00d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZtLeYKleCK2Gn4UK1Yl+w6TyCJEqvbXcTrcuYZEnc1vcepJl5BS+36afYhB5xXXk8GzDAVETp3e5a4iWTujUVSfDEWrJHseGYUmlX8JcX76Aa5gY1Db/Y3JyVWSbDJvCA6uyOng1bZbatq+BRLvtttV8qwxNlALBC7uFitSxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KOODt/VI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912baafc58so5012526f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Mar 2025 05:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741782960; x=1742387760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUaq01K0C1+/je1dmxCrLE4FQv+H1WtvZD4zSTTvpMs=;
        b=KOODt/VIhtxOS9IVgs7PdYITCgVjuTWw8f5jLnUh43UyUCX6Rm+leuOhYhk8jHdiza
         AJm3XLiR6x7EGm2PrnozkX8kYVJD+fW2XsMdwVe3UMMDsata5Ntz/071qF/cExeDp+Rz
         vfdM226ww+lUUFQ4aKxpYjeFNlmXHpVH2HGITr8PA1/zlwnq1Q9b34h+JpScxSkcJaxR
         CIveM1LKf3kIi1bH5lKE9KpLSGJ4OZsqy+z1SoUKoKIYEL3qVskUeiW2qfBEdB6zWIkm
         EJ84hyO4RBTMgaklIvLRmm9rKkn9eD+djmZnrty5we3+SYajnF78zDDG9sr7io+MbJMu
         2Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741782960; x=1742387760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUaq01K0C1+/je1dmxCrLE4FQv+H1WtvZD4zSTTvpMs=;
        b=Z5zWSZrj1inoi0HGkh8JdT/INGflvnar3sHHmc1GSfpTSGMTCsGXhIx+kyjSSHOn7j
         /LVgBqz80cxTTnEi0jeqgNp5xdx+llsHynNysBZ8+vpcvWGJtvDSEyTI92HVkgztVfZW
         o01R64KckhJoidSjHBXo9ozrAq+Ng+1HKP5iHDVx2TtHuk+ueZGOUqroY8z8rL5RHwTE
         SqBh2/ci4FpN90dSTW+zsvcWEUJr9Y5zbzXbBI59yV6wZxayInW9H+3w4++/vEsXmxzf
         1NU0NZl+lj0xynW6dnoZTn3g0uWBVr5bpZqYGqEDwIRjNzYeKS04euo2GADP6fxN/Gbf
         mMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXizi9HbmTdxmRP2d75gBqvmVhursoKtJVzxpqdEa6VFSs5rKqUzy99GsbfiTvhjjE+OXbfIyyw/5Puw/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3k4XDJo++kEwhBlgdjmc/FFkbkwLb39YloVdXOhjU1pURKuUo
	Th2/MaQ5pFoj5PIGyw/7A4R1h0ilRCM1Ah1nzclSJKmoqq2LM2yETlN38hW3s8w=
X-Gm-Gg: ASbGncstS6oc2oEhiT30FnnblsVCXaf6ROVGGW6kKA3e4hbxC+NxuDb3ZP/bc9r3PSu
	Xq4roDW2PZTb92cuiosVhxYKI9uWLTZOcBiVuNp6Kv3UL6/VbAPB6yIet2a0BY/xSkK9TJL8YqT
	xoTe8FzLRDVqObSoX0FdeU8DHwLgvV0MJVHIhVh/91TjtncIUMHWHmMamHSqIAaglkCvdGBYgSb
	NglK/nVfX7xrHF6/EvENmLG/p01mv1HXI7dX9Cv3DGmrU9aJzuUypgKJCICQfc1j75o9g0M9vJk
	5/xIU7tdtLvO3pI2LuLvQ4a6U118B2vuoENrbHmO5GcHrKi88I4LOQOXenE=
X-Google-Smtp-Source: AGHT+IFrA6tfodlHT/i+OhShiNyminNv57BdVgInFHmYLhpZouf0CKqE982VoKWLQju/Sa45z4pOqQ==
X-Received: by 2002:a05:6000:1fa4:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39132dbb4fbmr16745859f8f.42.1741782959853;
        Wed, 12 Mar 2025 05:35:59 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm20862095f8f.0.2025.03.12.05.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 05:35:59 -0700 (PDT)
Message-ID: <f17b5886-8b46-4edb-9f61-7ff9b60d1b5e@suse.com>
Date: Wed, 12 Mar 2025 13:35:58 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86: Get rid of Makefile.postlink
To: Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
References: <20250311110616.148682-6-ardb+git@google.com>
 <20250311110616.148682-10-ardb+git@google.com>
 <20250311111745.GDZ9Ab2f6-iHLXmRra@fat_crate.local>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250311111745.GDZ9Ab2f6-iHLXmRra@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/25 12:17, Borislav Petkov wrote:
> + Petr for 9d9173e9ceb6
> 
> @Petr, you can find the whole thread on lore.
> 
> On Tue, Mar 11, 2025 at 12:06:21PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Instead of generating the vmlinux.relocs file (needed by the
>> decompressor build to construct the KASLR relocation tables) as a
>> vmlinux postlink step, which is dubious because it depends on data that
>> is stripped from vmlinux before the build completes, generate it from
>> vmlinux.unstripped, which has been introduced specifically for this
>> purpose.
>>
>> This ensures that each artifact is rebuilt as needed, rather than as a
>> side effect of another build rule.
>>
>> This effectively reverts commit
>>
>>   9d9173e9ceb6 ("x86/build: Avoid relocation information in final vmlinux")
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

For what it's worth, the changes look to me as an improvement over the
previous implementation.

-- 
Thanks,
Petr

