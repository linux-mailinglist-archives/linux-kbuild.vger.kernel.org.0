Return-Path: <linux-kbuild+bounces-4162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F59A248A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 16:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F25A71C26848
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36F81DE3A6;
	Thu, 17 Oct 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eYSF/2Rv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF41DDC17
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174132; cv=none; b=jZmPBxE/+RCjpsZqhTc8EdrxwlXZEDjLHoU8sBpAzzTxv1HwWUuB3CnNjOJ7LvoLUmJgI0H9ytGJWsnjv59104tsVjZ7HeOOU9YZrAutbY4MY8PhgyIYcpyng5RV/QLNC5aFyLuhosh17LcKE9HL0aztgsaAxVyVYhO0XUgRA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174132; c=relaxed/simple;
	bh=l0NsmYgkaQLaTjYdBXqJw5xZOdd2f3pd3mREd4Ix4AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khm4kurO2uluXx1Iqm+oW/l7zpwpHlG6TgTA8JTJObDUq+VWOVsRRVfa4lSI5Plk3HhJk0s4BL6Fh9Zgatt2WRpSbb/XeF1cC9n+4H7ucq8vKVLlziF/FWIYb33xU81oc32haOspyYld2sKoxIMEsi/32oPi9FwIIhLZ5XcGXt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eYSF/2Rv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso117139866b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729174125; x=1729778925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxqmzyeuFlO3l4tRAe1C7/koqses/L5E0Mtm51tHiq8=;
        b=eYSF/2RvSacpZ4+2+3Hk+6qSzUOK/PTjqbvcF3EgMQYbfGvwHNPgJEBgtdvr4bRPsF
         hHdj+jilKhn0jwJQqOHsaXXW3FGxOWgdYl8m6oy2SIq58LhXdWWGLCkjDGFvaEK1/4Fc
         AWGXxhGgWhlFBBlzwO2wlxCpuKTakK1YZwWNds6g+gIHhriDWIqJCon4MkMqztUVmYKH
         QV7jV+n/trD+ADwIJJtYe94tVUrM/G6/j4MP8ODJN5c/9CLCLN45JtMmjsIhtdhjNki1
         FHTnAgXpMNxVXkAShhwQaKsWgVNlmQroJ2fsEVRh88Tn5IE6qlmgOXtXQiuTuU/zJRmQ
         Lvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174125; x=1729778925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxqmzyeuFlO3l4tRAe1C7/koqses/L5E0Mtm51tHiq8=;
        b=eyXKPQZTlrQw7izycHM21ZUe6bXPUpkrTCGiPTCs1eJlOfjQtuHwYx6u3Rg/zvQ/bl
         s4blRwr75+/z3fHytXWYfP8Q4/AdXc1I0thumMgj+xB/dL78i6t0DPcJP55/ZC72BkQI
         nLo2zRG4yvbOqdTGNS3FeVI5ezpB8kFuKYix1z2ZXyouLhMvmAL8eOrHsnvDl7lMnhWL
         QccZyIfxrgCifrvz5E/+58KXerChuxcmeR1qBKhi+K8cRv4h67TaAic/VheUQwtikgUm
         qtb4bOzWuT6z17WVlsHXQd28UPbJo5y33lrfFMKhLwCM5zbu3LYRtVCYXEozZK9GTr4K
         xkSw==
X-Forwarded-Encrypted: i=1; AJvYcCUR9zR9RI5r8RsTMaCQOm6EZ/6ju5Wl6mbHyGkE4jIHj5alfcLfiJbxgZN/RjNLhx0VrNJIi7RQCzSZ4s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBiZLl6PV7XsAY+1Yyax+dPEMI4zYHcyI8WLrL8kf20PuNRSvY
	Y0Puf15ym50YJdjPBLNSAHU2Y8X2q2TwoDfelZ5GixiCzo+tE0v0CmYC3YPNVjs=
X-Google-Smtp-Source: AGHT+IEvABkPNy7vk52SMCsHIro6voveAG7rnRjF16+dlvWWg2PQOIEn/QYTj3ofuof+xuyLhHJkNg==
X-Received: by 2002:a17:907:e25c:b0:a99:46aa:69d3 with SMTP id a640c23a62f3a-a9a34f0dd07mr735175766b.53.1729174125102;
        Thu, 17 Oct 2024 07:08:45 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971ab14sm300538066b.21.2024.10.17.07.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:08:44 -0700 (PDT)
Message-ID: <9a3c1b7e-6cd3-45ea-9be1-13a5b436cacd@suse.com>
Date: Thu, 17 Oct 2024 16:08:42 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/19] gendwarfksyms: Add address matching
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-24-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-24-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  scripts/gendwarfksyms/gendwarfksyms.c |   2 +
>  scripts/gendwarfksyms/gendwarfksyms.h |  13 +++
>  scripts/gendwarfksyms/symbols.c       | 148 ++++++++++++++++++++++++++
>  3 files changed, 163 insertions(+)
> 
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index 1a9be8fa18c8..6fb12f9f6023 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -103,6 +103,8 @@ int main(int argc, char **argv)
>  			error("open failed for '%s': %s", argv[n],
>  			      strerror(errno));
>  
> +		symbol_read_symtab(fd);
> +
>  		dwfl = dwfl_begin(&callbacks);
>  		if (!dwfl)
>  			error("dwfl_begin failed for '%s': %s", argv[n],
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 1a10d18f178e..a058647e2361 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -66,14 +66,27 @@ extern int dump_dies;
>   * symbols.c
>   */
>  
> +static inline unsigned int addr_hash(uintptr_t addr)
> +{
> +	return hash_ptr((const void *)addr);
> +}
> +
> +struct symbol_addr {
> +	uint32_t section;
> +	Elf64_Addr address;
> +};
> +
>  struct symbol {
>  	const char *name;
> +	struct symbol_addr addr;
> +	struct hlist_node addr_hash;
>  	struct hlist_node name_hash;
>  };
>  
>  typedef void (*symbol_callback_t)(struct symbol *, void *arg);
>  
>  void symbol_read_exports(FILE *file);
> +void symbol_read_symtab(int fd);
>  struct symbol *symbol_get(const char *name);
>  
>  /*
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index 4df685deb9e0..6cb99b8769ea 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -6,8 +6,39 @@
>  #include "gendwarfksyms.h"
>  
>  #define SYMBOL_HASH_BITS 15
> +
> +/* struct symbol_addr -> struct symbol */
> +static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
> +/* name -> struct symbol */
>  static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
>  
> +static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
> +{
> +	return hash_32(addr->section ^ addr_hash(addr->address));
> +}
> +
> +static unsigned int __for_each_addr(struct symbol *sym, symbol_callback_t func,
> +				    void *data)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *match = NULL;
> +	unsigned int processed = 0;
> +
> +	hash_for_each_possible_safe(symbol_addrs, match, tmp, addr_hash,
> +				    symbol_addr_hash(&sym->addr)) {
> +		if (match == sym)
> +			continue; /* Already processed */
> +
> +		if (match->addr.section == sym->addr.section &&
> +		    match->addr.address == sym->addr.address) {
> +			func(match, data);
> +			++processed;
> +		}
> +	}
> +
> +	return processed;
> +}
> +
>  static unsigned int for_each(const char *name, symbol_callback_t func,
>  			     void *data)
>  {
> @@ -22,9 +53,13 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
>  		if (strcmp(match->name, name))
>  			continue;
>  
> +		/* Call func for the match, and all address matches */
>  		if (func)
>  			func(match, data);
>  
> +		if (match->addr.section != SHN_UNDEF)
> +			return __for_each_addr(match, func, data) + 1;
> +
>  		return 1;
>  	}

This change means that symbol_get() doesn't return the first matching
symbol but the last one matched by an address.

For instance:
void foo(int a1) {}
void bar(int a1) __attribute__((alias("foo")));

The compiler produces the debug information only for foo() but
gendwarfksyms would instead report that it processed bar() when reading
this data, which is misleading. On the other hand, I don't immediately
see that it would result in an incorrect CRC or symtypes output, because
the symbols with the same address are effectively treated as one group,
so I'm not sure if this is important or not.

-- 
Thanks,
Petr

