Return-Path: <linux-kbuild+bounces-3336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2596A1C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 17:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB512873FE
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 15:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A80018592B;
	Tue,  3 Sep 2024 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IXOBeDS4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418817BED2
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Sep 2024 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376322; cv=none; b=gwPNjipfLUfOgqpbUmsmCtoP40L+Kg+VXZY/bPBjYTKAxYVM9ovciP0BPiH4tupf62vprh/Nf1CdgGecWUAoGTBlfuCCC8rD4eXYVcnLqq7vb3o0/Bh9TpSDzJ5y6D+McqbO06Hn61zEIB5QHZKoyuf68XY1l9LyRQOx1bV35jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376322; c=relaxed/simple;
	bh=HaQoSOeNV+l72P3AJuWZoCj9lxSZl2+1ZxYqkRtwfCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcKiLTaDKcGbtT2G20y7PsnuIWxoAGUYBw/6RNQXMnWTVR7ydmtzB+iibBRFcsj9wQMXNEIoqN2inC5PdZIgZH7Iwk0dZHTAQgzuTV0ihrHY0qBCiqgUHk5mF5sOx8160ZrWdcngw5a0eiq+Er9KbR0zrvNJq3UHRvBE74W1Icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IXOBeDS4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86b46c4831so609257666b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2024 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725376318; x=1725981118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WDyM7wA+4uXBEwvEfZ6K89F1ujUbboR8QatKwOx+kg=;
        b=IXOBeDS4oCGAf/Gz3mqX9hKKukL0qrRfs9tZPRq2GoV2182iaU/hC81nSQ8PtlLBmK
         sSy+rLMTANh6Z5+T9hJBZJSbFnU6cxwbCMuMN5eYJc/0ZI4ZPhX0662K/t4cpqIna708
         dPYLtqEvXgiAs8A8KXdS6ZVBNs4aH/Dx7Hmd+oHi29n+fFq2M2p2IrzTB0lINVY1mKKR
         lhHyUcGNwIBk9AsNXfnLo0cJXnYpPBo74M9qxrIiOKzL92ChsWBS7whKEx4mEcmsU/mt
         ipRkJ1oqW9XWEwyrqoUb5iKaQECVjUtvw1y522pnfHK/a5qHxCkzvQZMOVUUWLJHK5g8
         r6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376318; x=1725981118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WDyM7wA+4uXBEwvEfZ6K89F1ujUbboR8QatKwOx+kg=;
        b=sAXStyX+Ihq4TzHVqU2SHsnO54UWvKePry11WGP6gDgvFwEKm7xXVSNMALUzceTUTA
         1EpVNiGL/7MfgIrs2Sw7HR+Yqdi+/hKyjSOzFaQhlurS2b0raEbFtFCs5jWNnluNwPzk
         L/ogh+67ZtNDCo6TrnrcxZdudEWgXVEMMoSRH6Y2rWskQ9F8a8n8IQ32n3oVJ1v82EZV
         YWnqyPsxhniSUWpbdGVbiIW6+NkNxtHLqsNH/HpVKMiFbtNUrOg70PNH3OsBCnHOdAZ+
         WsyOt6ASS5cr+iWsXsPqyKZf/ZafnQVGAiYw63vMFqvhTU9GLaW2wyjB8I/1PsqdYG6U
         aXdg==
X-Forwarded-Encrypted: i=1; AJvYcCWcUaiBylwkc+F/AwKkf/wABsoozoetTOzYrRyFNVCOWkrFEPzGwU2anRbTtZGHEQdovLtRwpkNJQOmEyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmYDDLtrhJaiNl+Xlq/9DIyir+pAd6xgAOrs5i+sB03dZ+/36
	e0Pi6Cyp/nkrraLU0TIHXdD9xG0bdF3x4S+KbzTF5ja9NzD6/c2LCfIbhPb7Auw=
X-Google-Smtp-Source: AGHT+IFoUUFxcVhHxWppSsUC1TKbkdYIP8izH9TlTs0zzWQ7ixgWt0bHVTTPOJbkicRNtP6gPNtD2A==
X-Received: by 2002:a17:906:ef0d:b0:a80:f7db:3e7 with SMTP id a640c23a62f3a-a89d87216d1mr821251966b.5.1725376318249;
        Tue, 03 Sep 2024 08:11:58 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196500sm695054466b.138.2024.09.03.08.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 08:11:57 -0700 (PDT)
Message-ID: <9978884e-87c8-4c20-b9ff-b4571bce01ce@suse.com>
Date: Tue, 3 Sep 2024 17:11:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] gendwarfksyms: Expand subroutine_type
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
 <20240815173903.4172139-29-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-29-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Add support for expanding DW_TAG_subroutine_type and the parameters
> in DW_TAG_formal_parameter. Use this to also expand subprograms.
> 
> Example output with --debug:
> 
>   subprogram(
>     formal_parameter base_type usize byte_size(8),
>     formal_parameter base_type usize byte_size(8),
>   )
>   -> base_type void;
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/dwarf.c         | 57 ++++++++++++++++++++++++++-
>  scripts/gendwarfksyms/gendwarfksyms.h |  1 +
>  2 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 82185737fa2a..c81652426be8 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> [...]
>  
> +static int __process_subroutine_type(struct state *state, struct die *cache,
> +				     Dwarf_Die *die, const char *type)
> +{
> +	check(process(state, cache, type));
> +	check(process(state, cache, "("));
> +	check(process_linebreak(cache, 1));
> +	/* Parameters */
> +	check(process_die_container(state, cache, die, process_type,
> +				    match_formal_parameter_type));
> +	check(process_linebreak(cache, -1));
> +	check(process(state, cache, ")"));
> +	process_linebreak(cache, 0);
> +	/* Return type */
> +	check(process(state, cache, "-> "));
> +	return check(process_type_attr(state, cache, die));
> +}

If I understand correctly, this formatting logic also affects the
symtypes output. Looking at its format, I would like to propose a few
minor changes.

Example of the current symtypes output:
kprobe_event_cmd_init subprogram( formal_parameter pointer_type <unnamed> { s#dynevent_cmd } byte_size(8), formal_parameter pointer_type <unnamed> { base_type char byte_size(1) encoding(8) } byte_size(8), formal_parameter base_type int byte_size(4) encoding(5),  ) -> base_type void

Proposed changes:
kprobe_event_cmd_init subprogram ( formal_parameter pointer_type <unnamed> { s#dynevent_cmd } byte_size(8) , formal_parameter pointer_type <unnamed> { base_type char byte_size(1) encoding(8) } byte_size(8) , formal_parameter base_type int byte_size(4) encoding(5) ) -> base_type void
                                ^- (1)                                                                    ^- (2)                                                                                                                                                       ^- (3)

(1) "subprogram(" is split to "subprogram (".
(2) A space is added prior to ",".
(3) String ", " is removed after the last parameter.

Separating each token with a whitespace matches the current genksyms
format, makes the data trivially parsable and easy to pretty-print by
additional tools. If some tokens are merged, as in "subprogram(", then
such a tool needs to have extra logic to parse each word and split it
into tokens.

For attributes with one value, such as "byte_size(4)", I think the
current format is probably ok.

-- 
Thanks,
Petr

