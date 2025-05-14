Return-Path: <linux-kbuild+bounces-7104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89DAB662C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 10:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A09864E48
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 08:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365AD3BBF2;
	Wed, 14 May 2025 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZhkZAO55"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7820FAB9
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211895; cv=none; b=T9wJoMmot/McFELEE5ft3ObA39npYOxlANwn8Pbq+c2vOpccPZWpRfSuIVZ3hbhmKXX0Fnrj7zzp7u7XqPzNTM4jXsJVLVMkhTRJwnpoKX+Oq0RRN3U3n3nM/zqskCwss7VOwlB7baaqknuzfDR0q4kFHT8InrpIWw+zh+h8DRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211895; c=relaxed/simple;
	bh=v3bAcO92mgzkH7OCDOt9w7M93EuoBxmV5z7loDAnBuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaIVkxVACAvTHO1DAIBvKdgBj11yf21Htn6H92fuKBy0ehRp9SCv/GDA9B8sf0s4LATzEBexJxWdO8oU+X8CqWNMNqFGRYEzfSRry908HC7rDDGTs6Gn8gXjzuoP1nqnuBwvKHoISiHu7pOf9H2bW2u4ZcTA5KsN+pZtbkE/ksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZhkZAO55; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso4573397f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747211891; x=1747816691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QuS3rpk01oe59tAY91l0mlGNbZV+w+wwZIkg9yAUzvM=;
        b=ZhkZAO55n0ryFMXrDFb5HKYgvgQrxFx08NgE0N9VgVSgn1fTXBJF49j7xxaxuvw0yR
         zmSxBFTZt5XBasUGK8+AiBC6RZjuFRJuMM7mhJOTRjyvWrP8qYYnrpWjv2Io9ZzZCYsv
         tyfvLjkIF6vH4DRrZQlKfivRVZ2Luxj1E91w8LboCLQ0XzJuUrk5rq/3DrIFsUiVa1xI
         6x5mtZTL/bRt/ZpJTP0js+3qw5cDujZQJeB6nRJ+qZG1W9d9C27ngzJd2pN8h/TfcuxG
         EvmrmPhE+NBdQ2eUM1EoHpWNCof2ntx9+gHv4nBndQBjzbflpsafmVOPaL7t9vF91S0t
         sUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211891; x=1747816691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuS3rpk01oe59tAY91l0mlGNbZV+w+wwZIkg9yAUzvM=;
        b=l44YUhapTghMgljxTgRKgdWKIquSBi39QKYbGDyGQn00Mv7WrRUoFpABWjl892HlmL
         G85OYuTDqFe5oPWuYTPe9R8TeOeFFRoL2lsfSfDTl7glXNnpjzyuWp8ZYlS8VZL+VDe+
         IX0AR7D1tP7lq0TOVJuAvcv4E56iZ3gzXAI7VU5UIJiuxF1efsdAjLV/2Pfq8Crnha73
         hg7NmS9E9JpXmUnifZrf1MiJWE71f7haGx/5kO8o+6yZ1eIbvwZXDteYAXripLc3/Tae
         2ymZSXcScGAWpqUwlg+lLbb1wuKMV47MYabZ3un40YOi9KLPQ7deHj+SSCLDjhVQmUGI
         copA==
X-Forwarded-Encrypted: i=1; AJvYcCVuZH9kr/Q07Mmqr/Bo2Qs2Lkf+as73NN0mkXpI3SlubG+if9k2EXRWUXeLJXYMPB2NYygjx3cYaDR12X4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzks0feqWi9O+xut5nP1BS6kiB44BoEajqHjrWrB+mE50jpYZf8
	5eCQcb8rZIIjAf6DxnNRSdxI+8iArShnt7LoswO1550CR+bo2mLqtoWR/S0UJGM=
X-Gm-Gg: ASbGncsS55WBy1ROJflkrFgQeHbWvDHUDdU0DofulA5nH0Mgl5OKj3rVun8y4n6rHfa
	OGF7xlcBlgJxPqO33l6Bq1/ChV6EVXiXaVGyyyZeG9fuDwSuFVBgaEfK7KzxZjICPXIfFA7lVVO
	DiGP/fCoPBhEwzmWJftJ6BW6bVBRyHj6ug7G98mRUAOSjjb4qpm8ZZJfNeCQpHccH93tOTa3PTd
	q/zwkd56Z1+/HLzO8p2ZwkaWWZWD+H8BUKlEHJNRdKqjl/TH9XfMCmDzhNhT+kcNEQ4IIGbyk3y
	4J0eBydO10kjhQm1qUqfUcLkETepV8FSbjCt8fLgl9unY104TVSa1Q==
X-Google-Smtp-Source: AGHT+IHyTzdduROE+Wg2w8XB61vo2bG33XhlahD4daZpMp6hYwmVe0Tbz/IVhZE17N/e//M2fErR6A==
X-Received: by 2002:a5d:64c6:0:b0:3a0:b84c:52b4 with SMTP id ffacd0b85a97d-3a349695581mr2013629f8f.10.1747211891494;
        Wed, 14 May 2025 01:38:11 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea8580188sm8048020137.4.2025.05.14.01.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:38:11 -0700 (PDT)
Message-ID: <0dff052c-3857-4af3-a809-30ba124c4686@suse.com>
Date: Wed, 14 May 2025 10:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] module: Account for the build time module name
 mangling
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com,
 samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk,
 Sean Christopherson <seanjc@google.com>
References: <20250502141204.500293812@infradead.org>
 <20250502141844.263611823@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141844.263611823@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Sean noted that scripts/Makefile.lib:name-fix-token rule will mangle
> the module name with s/-/_/g.
> 
> Since this happens late in the build, only the kernel needs to bother
> with this, the modpost tool still sees the original name.
> 
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: Sean Christopherson <seanjc@google.com>
> ---
>  kernel/module/main.c |   26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -170,6 +170,30 @@ static inline void add_taint_module(stru
>  }
>  
>  /*
> + * Like strncmp(), except s/-/_/g as per scripts/Makefile.lib:name-fix-token rule.
> + */
> +static int mod_strncmp(const char *str_a, const char *str_b, size_t n)
> +{
> +	for (int i = 0; i < n; i++) {

Nit: This could be 'size_t i' for consistency. I can adjust it when
picking up the series.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

> +		char a = str_a[i];
> +		char b = str_b[i];
> +		int d;
> +
> +		if (a == '-') a = '_';
> +		if (b == '-') b = '_';
> +
> +		d = a - b;
> +		if (d)
> +			return d;
> +
> +		if (!a)
> +			break;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> [...]

