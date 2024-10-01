Return-Path: <linux-kbuild+bounces-3858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC198BF72
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 16:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30B6F1F245AD
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 14:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69F41C9B91;
	Tue,  1 Oct 2024 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QNze8MPg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EE1C9B71
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Oct 2024 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791905; cv=none; b=UoFwbsUFug7Fgcc9rI9vs9kH7AF9leNBYUaLUhB2y/N6jpdT2IJz9TiEI/ZI/q29ISabLdcwaNgEO6lr65aYRGzyRF8ICBV265MOxjMWi/89ppLgCbAz+ZaYBVcR5eyxhcWlswM6K5g81Req/UviEvjpciOQhZClZ/gaAeSZl/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791905; c=relaxed/simple;
	bh=VdlVC8iJpt4iKblG4aq8arzEwH4jK+WQJcBtAtuQ4nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFrHHBkZ7+v8O5TULOYE3svPOvrVLh2uf2a+gyB+lruBqXdrWB8TqIT31sSTOKpuISgAAV+akgAaadTMfPwsnHZZNVwlTH/GmR4LOXarHZ+y4n5aSRQn2POJVUDHHepX54pK3f7oml9827zCDdO5NRgk46tQT0dE6bMpOQ33fGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QNze8MPg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d24f98215so53343766b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2024 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791901; x=1728396701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOjUVaBpjp8ksO44qoSMn8G1zrkoXgW5qFaOpNFpNPw=;
        b=QNze8MPg0ydn8WmFUnGx4roCh8Hh9oZk+2F46NczeD5dbaio4q3ydr5ALbDKC8XEWw
         Ak8TTKXfrW7hGTJ3Y9G3ytV6FER9D1nHYhPN/2+PEfKj1BqPO+AgWkUCvKxW4kCO/A5F
         /E/FGv5s/m20G7gRE82AfnQ6jTMQZzoKi5/ngoUeLczD3dt7Cn9ZUSQu/gL1oYve8yCG
         hlgpQAXwKU/kONcTY66hX40FnFtjd9v6L667fh03S1XeNNEHOsbWg2PiSeqaVOVPYdbv
         S5myAZy23KkKqlXkZFMA7GCB3q05qHtwgXQzEvlpe1sOtxv8jBqwxt0zzEcdA2BlcZmo
         m2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791901; x=1728396701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOjUVaBpjp8ksO44qoSMn8G1zrkoXgW5qFaOpNFpNPw=;
        b=XkJmck1RxXu5OWS6STrMBHOgJkIsF7dZUhSC5eLQ0peT/Y3qyq+rKL001kEcjiYe+r
         YHWnqGKxW7YaytJqwk5E7VCpZkh91M9ZbFAGFg7qbkb8KNQhS4QPuZCWPqQDgDXNZYdu
         DWVf29vCUzHRI4ecKiO9PoTjicV/pU6U6ghfPhMNaajYDJfBu35L2CQd8cWuNNHlq0+z
         mB+R0TeFd3iVSOg774heKdPKJL5ZUkmjo6/thAhkP5ZeNZOiRiAgnOlP2FbEJ3+iQGix
         QM/7+SaZMoPkVnRve4LQgRw974YD4cVnR8CIeyR7ZIa4mEF6l6catYrn54Ffha4LRaY8
         gV9w==
X-Forwarded-Encrypted: i=1; AJvYcCUPGN1OyZ+NYDHStdnfDlRia9+1xhBXV+GAx4Rup7XxOGso79jLjrEdAmSJwIvAZiHE4xPEXqP2Q/2MLpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxbaAPg9BoxWbdqL7LT+8WvwucfUa5v9E1/xVSqc0Ss7O4h/k+
	i4ERkRqRkKPZ0uk1lJnHMBE3ZBVfidK9OW2DCnNXT7S18sSLU+r5XTRTmaAAcGU=
X-Google-Smtp-Source: AGHT+IFZe2WXQ1gN6enIFV3oFO5bE5V7+nXKC3Q4fwOM7pCdPvYuTE0iA4osOJNRHsOSK/gRq1zsrg==
X-Received: by 2002:a17:907:1c17:b0:a86:95ff:f3a0 with SMTP id a640c23a62f3a-a93c48e8ecamr1799486366b.3.1727791901559;
        Tue, 01 Oct 2024 07:11:41 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bb8fsm729191766b.176.2024.10.01.07.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:11:40 -0700 (PDT)
Message-ID: <64221b94-b081-436d-9ad1-ceaa70a6a960@suse.com>
Date: Tue, 1 Oct 2024 16:11:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/20] gendwarfksyms: Expand type modifiers and
 typedefs
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-29-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-29-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add support for expanding DWARF type modifiers, such as pointers,
> const values etc., and typedefs. These types all have DW_AT_type
> attribute pointing to the underlying type, and thus produce similar
> output.
> 
> Also add linebreaks and indentation to debugging output to make it
> more readable.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

