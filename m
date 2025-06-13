Return-Path: <linux-kbuild+bounces-7496-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A602FAD8C89
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 14:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57123178E76
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 12:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D7217BA3;
	Fri, 13 Jun 2025 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="foZmG2HJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61063125B9
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819142; cv=none; b=ZqWXmnbBMz7/FyMMwcwx+LrW1g8YYsHM7msLMwtmnukA+udHKtDsnHfBNI4+hFASFytNVTkiCOTjI/anXqd35fouy3TNYS9oKvVDOaX5465ZCBWx5DddM1bNmvgsTv67haDWuNxcDZSQRl90Prlp9ratUhVz6PTEX24ybK/YXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819142; c=relaxed/simple;
	bh=j2eNAg/KKupvhWIs/0ZWEEs8ZqDjFSlRxkV8RviBrNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/K6rdLain1NJp3ZpTpONK+qm4Klzi4rssBmwUrKZWsPrxC4w+IFJgPI1fRJ1ukfGmwrn7pHwPqG9y/qJ+r4BX83dtPAymcG9FKZwX1ULAntTaoS2yReoPEZK4EYi8ztl0TF5GYMQ8fzb6tx/xlAG5xfRW3D7o/G3Gs0q2pMv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=foZmG2HJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so24624435e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749819139; x=1750423939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrJkTNDbBY1CY8qB60D865Ino0tRu90cuf/TAUpIk8k=;
        b=foZmG2HJ0TNRzuCUY2lheH9xw0l4FEOeulIqnn2JVHExb5wtt1GhwcAyYC1JGH5gxO
         jZBSvNN6hG0uiY/IMwK9xcBmew26VM2vQk5zaQcojgHw5+1wLC32A6JKzzZBiF+Op8+a
         SQrPXVWwi0HjSFsd5fxqA4N99x5P3lmml9oP0jUThYAm+ksSd8QCksdS4Cpim97xRRPU
         OO15YjuxvGRjji5kFqhpkmrjibjyH52Ymj/28Khrs2FryORE5+xUtU/pzDM3WdZnEfha
         6kPojs56HlgGH+JKhgrWI7YsmgMSmISzJTfh4/8LR28666cXbwM/P0qAHYy3cJygtowH
         2kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819139; x=1750423939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrJkTNDbBY1CY8qB60D865Ino0tRu90cuf/TAUpIk8k=;
        b=M6pWuGCFGB19HQmv/jNBSssFCXDow+PvYG1911nZBR+yLHCjubDfH8gEZ6/10aMHeX
         8viygvKfW0XXMZhEvJQzfTZ1QazzbbjHUlMIRK8UNOXb0HXzbW7Gq9kDH1OJ4QBzRNwS
         QbVdcw7B3/YowQ8I3JMqAlu7kNag6beZyPRzHQm5lxqs3ZKTB/jYRwcthHWvf//czzvN
         oBZtr2YtiEhT5ZOEPaf0sVKQxIk7DmkthGiJeKKlZKxoNYrQOis0lzikG/LpNYP5nF8G
         F0wX11VWWmCAARNwA9fcgQQ7mfiu+8CWBkfLcoqdSHPuHK2OQiN0IUHj1lHzcwPEU40A
         8eJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7EuI1DqIVrJT2RL6ZckL2+bzeKkgDl1hUN7aOuOEd75mLWqzOEZhDuM5cXMV23CwsInmTu3NFH2EbNaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyp+DRMkSLwELRUNUNHZ2fCzgFoj2RqAhUOPvleIXc157CcmN0
	Wa6CvylidYRrhJZmgByjmGeLa0IOemDmOKf46O17Pgf8v2AvLzPukpnSh9UUxmcY+20=
X-Gm-Gg: ASbGncu+u1ONHatKr49aiK369mtpnD1QOmlO19QqWevi7TtpYnFnX8Pxe2/SYhxLjxl
	UxPn9EePZobj6rlqwGmJ6kO0eKSYxXOxTRjkDRwGBW6ZGoAv5wRLVU3ytU30atNfZc5LcQwuuEl
	YmHwCTE1zfxIPqWipkQ8Uqd9ypH27o0To6ZpmmR9XhF51a+r6O5D7q6xCZQVcowbb22LIT4vC+6
	Spa5+rDEj8QQaOubEaDJg4Vjph2mJnEFLr9xWTcJYe1DRnOB67SaPDzeZ9O5GCF+6cx/YLbPUs0
	5g/rxJ2WfB1jbuPpTU6wQ+7yczT4ilUy6Wo8teBW/nhYXMHN+FXngkUP5jvbXNAC3IG7OenqqEA
	P+1ZZ
X-Google-Smtp-Source: AGHT+IHQ2NQzOPgLkiPUpNpn+2/VtnhtsQcsmzmuKewN6Uk7edLiZlgT0mpZTOGS3DIaKX8XMtsddA==
X-Received: by 2002:a05:600c:621b:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-45334aaf04dmr28628475e9.6.1749819138637;
        Fri, 13 Jun 2025 05:52:18 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7fa9dsm2287386f8f.44.2025.06.13.05.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:52:18 -0700 (PDT)
Message-ID: <dec42b04-b76f-4a2e-b060-9ac999fe1462@suse.com>
Date: Fri, 13 Jun 2025 14:52:17 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gendwarfksyms: Fix structure type overrides
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Giuliano Procida <gprocida@google.com>
References: <20250609154926.1237033-2-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250609154926.1237033-2-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/25 5:49 PM, Sami Tolvanen wrote:
> As we always iterate through the entire die_map when expanding
> type strings, recursively processing referenced types in
> type_expand_child() is not actually necessary. Furthermore,
> the type_string kABI rule added in commit c9083467f7b9
> ("gendwarfksyms: Add a kABI rule to override type strings") can
> fail to override type strings for structures due to a missing
> kabi_get_type_string() check in this function.
> 
> Fix the issue by dropping the unnecessary recursion and moving
> the override check to type_expand(). Note that symbol versions
> are otherwise unchanged with this patch.
> 
> Fixes: c9083467f7b9 ("gendwarfksyms: Add a kABI rule to override type strings")
> Reported-by: Giuliano Procida <gprocida@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/types.c | 65 ++++++++++-------------------------
>  1 file changed, 19 insertions(+), 46 deletions(-)
> 
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
> index 39ce1770e463..7bd459ea6c59 100644
> --- a/scripts/gendwarfksyms/types.c
> +++ b/scripts/gendwarfksyms/types.c
> @@ -333,37 +333,11 @@ static void calculate_version(struct version *version,
>  	cache_free(&expansion_cache);
>  }
>  
> -static void __type_expand(struct die *cache, struct type_expansion *type,
> -			  bool recursive);
> -
> -static void type_expand_child(struct die *cache, struct type_expansion *type,
> -			      bool recursive)
> -{
> -	struct type_expansion child;
> -	char *name;
> -
> -	name = get_type_name(cache);
> -	if (!name) {
> -		__type_expand(cache, type, recursive);
> -		return;
> -	}
> -
> -	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
> -		__cache_mark_expanded(&expansion_cache, cache->addr);
> -		type_expansion_init(&child);
> -		__type_expand(cache, &child, true);
> -		type_map_add(name, &child);
> -		type_expansion_free(&child);
> -	}

Nit: This code was the only user of __cache_was_expanded() and
__cache_mark_expanded(). It is now possible to merge
__cache_was_expanded() into cache_was_expanded() and
__cache_mark_expanded() into cache_mark_expanded().

Looks ok to me otherwise, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

