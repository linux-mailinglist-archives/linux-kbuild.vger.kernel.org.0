Return-Path: <linux-kbuild+bounces-9049-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B532BC52E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Oct 2025 15:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D08189FCCA
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 13:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284DC283CAF;
	Wed,  8 Oct 2025 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WA3uLfNt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400928489E
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Oct 2025 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929880; cv=none; b=ZhfUgg6WcIk6U5efzoROyssSonZxDcg9lXx/HMYZJK9lhCsIyZi29d1GXupF8mpG9xGfGvgDqvsYq+v7e1haG6j0zMeyZ5kQ4VCjP14P26Xi/UyEnVLqxciPsYOnVJtuoOeP/uAr5UNgYi7tRsNd4OdTCXnn0encsdpJz8kl/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929880; c=relaxed/simple;
	bh=fHRL68xgbrs4S5d+Rk03mc7ClH8sihNkbqrGqaL31yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5pt2/PqaDZ+uxsxAhL/Hm0BUBLqnGcs+f9jA5//BaMXBXCKKCLNvW8AjsJdbm10DQ2j2HM2/PbggHYPc5rIA4hTLLq9YrjU8NFNU7whsAG9zT5Fi0QiNfqjR13zYL8qxw3BPOgdHjr+aPTyqibl7RlHnpdd/rj8bJgmasMQSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WA3uLfNt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so44809455e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Oct 2025 06:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759929876; x=1760534676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ai9bodin2zTCE30sm2MezQ75jr/Y4H7WdWVegLgSDKU=;
        b=WA3uLfNtZKVV9l37I3e/ToYZya1MGuHLUToON1sDJ/mLNk46sz/nZGuPgKgrnftm0t
         HjTiJHGd+b8TbTp8eU2AQrbPTpifE+cM4okUjyzbzXtjNNkWm6TiDG2fgLsoUvQ/543K
         broEnKIROX30s0w4pdscVGlZYdYRs1ZSg0ALpZFhRbFMD5pBMpXgG2xDETEN3s9rO52P
         ayBhwuPWIMGvmWTxzTuBPYmkuQ2YObGPFr4YCWt9S8aNBtJidU7quF6COOIeSrPQJL+4
         GPMcCr1hYobFqLfwpJzqZgyj7dW9HM4M0VnjpYnYXk0fMfT7zTnKLKA8qQhdicB8t71T
         gNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759929876; x=1760534676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ai9bodin2zTCE30sm2MezQ75jr/Y4H7WdWVegLgSDKU=;
        b=khvK6736J1cp1uEmhG1L5ZqMsevIuxHG4gWMpUMwX268BEwnA+1L3I0p2ubRwSK6Tp
         UH99TP6XOY3XVbBq8rglWpdGd8TxQYsQCr5uiLZgkR0C7BbrS4ONYg7v9T6ZZ84+q0Qd
         uIyIa8luRPcDJZo2BrzwqltffBNePkZ+JOE1FEh4shxg0YINS5V4v4JbPxcMojhabEdL
         w0E5piXAdmehk3wBrgClqnaPvMirbyMBFV2JkRWgp9Jj5wjtts0y2jLe3BSYDIJbR6ck
         BcI6u9CMFSppChKUD5AOHYxX6mGha8u7gf1tbcr9AV7VgXL5oDy1K9C/GcDZYmYlY56N
         ZJRw==
X-Forwarded-Encrypted: i=1; AJvYcCV+D1/GDwu6k/7dq7Vr69ttlNJXYTitPgHfngHyZqU96g0Q/y7977HscodmXJuXd1KG6/9oQ79CgcvXHpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTgR+6uI12BjtQhFocWnKQgqhf8WKEkc4CQ8iUlmdTNc5lXw2
	8A5vNWRokGLudsFpJnnHm2cd6EeTyfZoyAvFP7cX+FSs0Qq5pVsbv2/2xoea49rCgl0=
X-Gm-Gg: ASbGncvpIEEh5Hf8UCbnwrsEQeDU+erteL5kJjOOGxAIiuEr71XCJnvOnsJ+F6Kl3IZ
	zf10LhWYX1BH5z5TRTyVt0q0g3sm4MW75zJPtc9UOynJ5PopfK50qkm6eMYB8nwRJNH097T0SN1
	JbcRM79Xak8+tX6Hlnh3oRZoHQZOB39JsEbgvoTalaQIzJ/FfnH0ZlXNh7iVLaSHFsdAtYOlrSi
	EFnV5qaY9h4+neLhXhIT/X7xR5dy/0MtoWVA/fgXhStbiyMgm2tB/TVmi2Nvw62Y42hA0dJLirt
	JFrQ7HhMoYjGAY6c9Knjos+1tbjXAbuARYEJak4NBsJ1E4rkKkNz4hJNADRHSaOUn/xhXRWUAty
	6aKZBfaLkbVM0eUpiNiYx9Jp+w0B495h5dKpjIeBnYr6Lm1t1mEo6oKbooNQAdfWu
X-Google-Smtp-Source: AGHT+IHuhMKyjw9ZbS23OBrv8VA5JUlHXtFCz8Wrw4kfUqnmq3pfnc8RuPQ01+3mL+le3/TLouPIeg==
X-Received: by 2002:a05:6000:22c7:b0:3ec:6259:5079 with SMTP id ffacd0b85a97d-42666ab1b7fmr2477434f8f.11.1759929876072;
        Wed, 08 Oct 2025 06:24:36 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8b0sm29892836f8f.18.2025.10.08.06.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 06:24:35 -0700 (PDT)
Message-ID: <b394956c-5973-438b-9e43-f7081a89fa97@suse.com>
Date: Wed, 8 Oct 2025 15:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] remove references to *_gpl sections in
 documentation
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Nicolas Schier <nicolas.schier@linux.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250829105418.3053274-1-sidnayyar@google.com>
 <20250829105418.3053274-9-sidnayyar@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250829105418.3053274-9-sidnayyar@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 12:54 PM, Siddharth Nayyar wrote:
> Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
> ---
>  Documentation/kbuild/modules.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index d0703605bfa4..f2022fa2342f 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -426,11 +426,11 @@ Symbols From the Kernel (vmlinux + modules)
>  Version Information Formats
>  ---------------------------
>  
> -	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
> -	sections. Symbol names and namespaces are stored in __ksymtab_strings,
> +	Exported symbols have information stored in the __ksymtab section.
> +	Symbol names and namespaces are stored in __ksymtab_strings section,
>  	using a format similar to the string table used for ELF. If
>  	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
> -	symbols will be added to the __kcrctab or __kcrctab_gpl.
> +	symbols will be added to the __kcrctab section.
>  
>  	If CONFIG_BASIC_MODVERSIONS is enabled (default with
>  	CONFIG_MODVERSIONS), imported symbols will have their symbol name and

Nit: I realize this part of the document primarily discusses sections
related to modversions, but I think it would be good to briefly mention
also the existence of the __kflagstab section. The first sentence could
say:

Exported symbols have information stored in the __ksymtab and
__kflagstab sections.

-- 
Thanks,
Petr

