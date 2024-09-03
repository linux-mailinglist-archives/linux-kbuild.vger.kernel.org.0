Return-Path: <linux-kbuild+bounces-3337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8303796A1EF
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 17:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 265DE1F26DB7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 15:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2265518C92D;
	Tue,  3 Sep 2024 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WULXNsMF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A518891A
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Sep 2024 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376542; cv=none; b=r52ICSgZowHnRHYB4n+if/6QrfLZKkntUyLU8aDzIFPEablO1/qoul7JGlsYXVt0ofajRa0LuqOwpucXiFEPcRJaO9Y9FQF9kXLUGdjXXBqrmkxDlNFCJ9ZdGClyFeaP/lwA2/bIbQ/CUm0vQ0E9gYd4Itr6x98KTHaAJu3klCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376542; c=relaxed/simple;
	bh=VQoch2Jnk1OtZ5AtE+c96J0cQy86KkHUvIBG+sr4F1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSOpf558YEP7wA7+xQ1T8xeAEHkxHS6a2TvBcWiUK5eFravtYjBJsET6nOY/a4NJewHHjjdwNIb0V1iLzTOeOhLsS9nQMbU/Waisy5Tskm/FBu1EgYE49TbGwszp6ZBvywUqBWHsH0jIUZdgm4fD6bi7CdfWqt7fG8iDtJs3Tx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WULXNsMF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53438aa64a4so6641253e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2024 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725376538; x=1725981338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+e0U/aRCvU8DuFYoeV8O/KmFptz8b7Txjch+YXTIjA=;
        b=WULXNsMFwBairxyGwUrNlaDT+LuyCLt4ia6PJNtRKhbDZfTcfO8L3m2HiHfk3cDrX7
         +DjCPhtyfHVECGC0+DkgAMq75e6ZgJXAlNykaS7KVzBehf/tZG5cxmGlLA30bq4eSUgF
         MgHMXRUKF8QNAzHAtaLKW1/qrv8VJqnzzzGalq8BxhYWfHG+ESNn7ZnYme/vPuZJ6VQr
         f6ALrlWHrQa9RXeo/Rm6s771mFMl0Q9y/rO9Y59ZJ6JgQ3KU8Lu6UwBjZzr/C2NF9nbR
         jEDJxh/RVmMCTO1Y8hYk6mqebkmxZ5q5LHveKKI9pTBo+MkrefIpG2WH7AGnZWnkcDv/
         bZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376538; x=1725981338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+e0U/aRCvU8DuFYoeV8O/KmFptz8b7Txjch+YXTIjA=;
        b=UE5cULKE0eRp2jM84b9RqTibb/z9yvzQ5PEaozDJg9n+ONpbNFIeiWJ/tmpG6jbSPE
         GAFF5whjBYbRyr9WOU9RX5UrM0jLQsHp6Yne8SUJ3u+cBgJguKRQ+mTic7VQnctr4lnQ
         k5Ulk0/qSQ+0LYhTv7XvPMvIejBJkEC5PFpNrGT+7KTb/U9bh+SMjFBpMk6cR3Lh+eAu
         enr2Y7oIYvAamerbhQA3SKGvSJUPU8+6Gu5BInt2nqZ597VqSQAlBCXxYv8KaDMjOAsX
         XI0kfLER3gu6L37KSFM7B7+fWk2SBXIFafxSJv9nb2KcoX10QD3Yj4zi2ORx19N3SHU8
         saRw==
X-Forwarded-Encrypted: i=1; AJvYcCV96RUG5KXyQVB8nenQAk2sVuabS5KTiY3zF0ekMSEyaWotxzYG9dGEzzZMBDOOwB3X/CH2j6RPmYTjs7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3IGMfiV/nu4XtrSAAh1jC1pJmqcY4rfqwxA6fymvzs0P3UQn
	rCMZw4X3O9etzebjstY2UJ+iB7kfcjAtog7O49xnAAq5bRcAdhP2qQSEHcWlciI=
X-Google-Smtp-Source: AGHT+IGdZTw/KUyMiDlZSkuc9mANPu7vBYcf24gYwin1fZw518o/l8XDosnXT/1xrZtFfnHMtfr7sg==
X-Received: by 2002:a05:6512:2383:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-53546b03ffamr9361946e87.14.1725376537413;
        Tue, 03 Sep 2024 08:15:37 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a2fdsm6520881a12.13.2024.09.03.08.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 08:15:37 -0700 (PDT)
Message-ID: <47bc562d-b9c7-464b-a2e2-dbb8c14d146b@suse.com>
Date: Tue, 3 Sep 2024 17:15:36 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/19] gendwarfksyms: Limit structure expansion
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Expand each structure type only once per exported symbol. This
> is necessary to support self-referential structures, which would
> otherwise result in infinite recursion, but is still sufficient for
> catching ABI changes.
> 
> For pointers to structure types, limit type expansion inside the
> pointer to two levels. This should be plenty for detecting ABI
> differences, but it stops us from pulling in half the kernel for
> types that contain pointers to large kernel data structures, like
> task_struct, for example.

I'm quite worried about this optimization for pointer types. It could
result in some kABI changes not being recognized.

I assume the goal of the optimization is to speed up the tool's runtime.
How much does it improve the processing time and is there any other way
how it could be done?

> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 92b6ca4c5c91..2f1601015c4e 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> [...]
> @@ -651,6 +742,7 @@ static int process_exported_symbols(struct state *state, struct die *cache,
>  		else
>  			check(process_variable(state, &state->die));
>  
> +		cache_clear_expanded(&state->expansion_cache);
>  		return 0;
>  	default:
>  		return 0;

I wonder if it would make sense to share the cache between processing
individual exported symbols.

The hard case looks to be the following:
s#A struct A { int ; }
s#B struct B { s#A ; }
foo void foo ( s#B )
bar void bar ( s#A , s#B )

When processing foo, the code would cache s#B with expanded s#A.
However, when processing bar and reaching s#B, the cache should report
a miss because s#B with unexpanded s#A is required.

So the code would need to track which types were already expanded and
have each cache entry accordingly tagged with similar data.

Hm, it might be that doing all this additional tracking would then be
actually slower than processing the types repeatedly for each symbol.
I'm not sure.

-- 
Thanks,
Petr

