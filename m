Return-Path: <linux-kbuild+bounces-3232-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379A960550
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 11:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E61C9B209BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 09:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC748198E83;
	Tue, 27 Aug 2024 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UiPkUZKr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765EA17279C
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724750166; cv=none; b=YxYkO0IDXl50aTQeHdxuSqC4V/1WBWX82NgvT3UwXwI01caMFg+3Gd1FODeA/NOn9pulbpGqTGrO9wgK+MA/HYodb7u01RUNIhjDkYR1c59KW99N7R2wSmkKLO2Uba7lAf/eIN0bFpPLCaZUprA64rt1rwtu4hosyEYFCRoU/N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724750166; c=relaxed/simple;
	bh=mYZfKJwwXU9PlXfA2vvpZBqIvWD72dwMGqdQABPcgQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyL/gQkf/kCGm32EsoVdgexu1max3KvLeygpNiOtjwVn5IFYwLM1e1ZtQbI8bW49FaEDl9ztkp66yC9eGbsyBQT+f8w8KBsslFQ3jx+7PASK2NHYFhESHMWzXSaDF+V4debjz4+2JiRVqjRVO55ywY210Vv/nRO8a/y9nCO9LYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UiPkUZKr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so73314301fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724750163; x=1725354963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcvIyUySIodcGwxZCkT6885+KUVYMpw/seQfD4H/otI=;
        b=UiPkUZKrWmV57H4KYp5tBarcTp7A6is6F7z+pMqtrv8+px553Fr0YGjs0sQckmTOSH
         k+Z4K6kIrkvQ+y3WXPJOCao4yZBgyA7yLKAY1tYYpoxXDJqCWB1b5qmxcXMyTl1ks+SO
         +oz0h36L3gtxCvy7h+xB7EjQJIV2VXVH5zUyHJSkk01xtDq7c1JryE1i1qn3TW2M4K4b
         R9n0NOsLrqn/8YZskDCBDa3YQy/6j7ut4uXYX5xVVpoNMuXshDpkzNk86RLmAUkLR3kQ
         tl+nAlUp4UsNeXGKsf9lJS7IhTOPNB9eC0DsgZ831Low9/vilB4aueySbydj7A8EUpT2
         VHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724750163; x=1725354963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcvIyUySIodcGwxZCkT6885+KUVYMpw/seQfD4H/otI=;
        b=SBS32sz5cYdVeRhtty+g/Wh0VYjkksJK+0wq6vXtMFNmYCLa7z2twi5XXSLiqW8+C/
         p5NhVASxHO6meCPj+U8om9bXg9dIeqRvlWaL4H9tb+l250p+YeqyHtIwy7+ZC4bGJmUy
         aRt+oV3H2dp5g7qu8f2+Szyq2U8I+KsDNFMD+KqKSKsPTnR+SHH5UVCNN8YgjQOFv1E9
         s7UOinSPEOMX8QcBTOxi8szEMBDFtz4xudCD/KKdSku4kEHYcpgkLED2P2jHlxvlEwJs
         PlGOd7M9ai+KgbHE4lu1mHDIQemUH54wmpbwKjH8s1qnp5kjLIktqe/0Cg3p+mRL+G4e
         39Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVi5VVo1cD+926y8a1BwTkGvcHMpmjY0sM09j2zOq9OlLtZpILu6efSPEXKThcezaexKnLnZQGDS+EDW5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AwpdQWIXRjOmpJVfdwZBNJh5UPC/gKuzXWYQgIHsNwttNxuk
	2REzE5t9VxsEsS9LaK3/4eJTnS8Sa+cQ4HeDsnrlVePjgY98oATwyKaVCIw0VY8=
X-Google-Smtp-Source: AGHT+IFkHHuUfK3bVAtCIG4+VKPtZuhnSOCs7mTieWXWH6lFNyZOshNCB2EaFBANrCnw+ganumxv8Q==
X-Received: by 2002:a2e:5149:0:b0:2f3:ee58:eaf with SMTP id 38308e7fff4ca-2f4f5764388mr97114901fa.23.1724750162315;
        Tue, 27 Aug 2024 02:16:02 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582dcfesm83337866b.121.2024.08.27.02.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 02:16:01 -0700 (PDT)
Message-ID: <f9ad5fdd-25d4-4d98-84d0-84dfba2a75f2@suse.com>
Date: Tue, 27 Aug 2024 11:16:01 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-23-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Add support for passing a list of exported symbols to gendwarfksyms
> via stdin and filter out non-exported symbols from the output.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/Makefile        |  1 +
>  scripts/gendwarfksyms/dwarf.c         | 53 ++++++++++++++-
>  scripts/gendwarfksyms/gendwarfksyms.c |  4 +-
>  scripts/gendwarfksyms/gendwarfksyms.h | 21 ++++++
>  scripts/gendwarfksyms/symbols.c       | 96 +++++++++++++++++++++++++++
>  5 files changed, 171 insertions(+), 4 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/symbols.c
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index c1389c161f9c..623f8fc975ea 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -2,6 +2,7 @@ hostprogs-always-y += gendwarfksyms
>  
>  gendwarfksyms-objs += gendwarfksyms.o
>  gendwarfksyms-objs += dwarf.o
> +gendwarfksyms-objs += symbols.o
>  
>  HOST_EXTRACFLAGS := -I $(srctree)/tools/include
>  HOSTLDLIBS_gendwarfksyms := -ldw -lelf
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 65a29d0bd8f4..71cfab0553da 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -5,6 +5,48 @@
>  
>  #include "gendwarfksyms.h"
>  
> +static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
> +{
> +	Dwarf_Attribute da;
> +
> +	/* dwarf_formref_die returns a pointer instead of an error value. */
> +	return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
> +}
> +
> +static const char *get_name(Dwarf_Die *die)
> +{
> +	Dwarf_Attribute attr;
> +
> +	/* rustc uses DW_AT_linkage_name for exported symbols */
> +	if (dwarf_attr(die, DW_AT_linkage_name, &attr) ||
> +	    dwarf_attr(die, DW_AT_name, &attr)) {
> +		return dwarf_formstring(&attr);
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> +{
> +	Dwarf_Die *source = die;
> +	Dwarf_Die origin;
> +
> +	state->sym = NULL;

Nit: This assignment isn't strictly necessary, the value is overwritten
a few lines below and isn't used in between.

> +
> +	/* If the DIE has an abstract origin, use it for type information. */
> +	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> +		source = &origin;
> +
> +	state->sym = symbol_get(get_name(die));
> +
> +	/* Look up using the origin name if there are no matches. */
> +	if (!state->sym && source != die)
> +		state->sym = symbol_get(get_name(source));
> +
> +	state->die = *source;
> +	return !!state->sym;
> +}
> +
>  /*
>   * Type string processing
>   */
> @@ -40,7 +82,7 @@ int process_die_container(struct state *state, Dwarf_Die *die,
>  }
>  
>  /*
> - * Symbol processing
> + * Exported symbol processing
>   */
>  static int process_subprogram(struct state *state, Dwarf_Die *die)
>  {
> @@ -67,10 +109,15 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
>  	/* Possible exported symbols */
>  	case DW_TAG_subprogram:
>  	case DW_TAG_variable:
> +		if (!is_export_symbol(state, die))
> +			return 0;
> +
> +		debug("%s", state->sym->name);
> +
>  		if (tag == DW_TAG_subprogram)
> -			check(process_subprogram(state, die));
> +			check(process_subprogram(state, &state->die));
>  		else
> -			check(process_variable(state, die));
> +			check(process_variable(state, &state->die));
>  
>  		return 0;
>  	default:
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index 27f2d6423c45..d209b237766b 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -27,7 +27,7 @@ static const struct {
>  
>  static int usage(void)
>  {
> -	error("usage: gendwarfksyms [options] elf-object-file ...");
> +	error("usage: gendwarfksyms [options] elf-object-file ... < symbol-list");
>  	return -1;
>  }
>  
> @@ -105,6 +105,8 @@ int main(int argc, const char **argv)
>  	if (parse_options(argc, argv) < 0)
>  		return usage();
>  
> +	check(symbol_read_exports(stdin));
> +
>  	for (n = 0; n < object_count; n++) {
>  		Dwfl *dwfl;
>  		int fd;
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 5ab7ce7d4efb..03f3e408a839 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -7,9 +7,11 @@
>  #include <elfutils/libdw.h>
>  #include <elfutils/libdwfl.h>
>  #include <linux/hashtable.h>
> +#include <linux/jhash.h>
>  #include <inttypes.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> +#include <string.h>
>  
>  #ifndef __GENDWARFKSYMS_H
>  #define __GENDWARFKSYMS_H
> @@ -56,6 +58,23 @@ extern bool debug;
>  /* Error == negative values */
>  #define checkp(expr) __check(expr, __res < 0, __res)
>  
> +/*
> + * symbols.c
> + */
> +
> +static inline u32 name_hash(const char *name)
> +{
> +	return jhash(name, strlen(name), 0);
> +}
> +
> +struct symbol {
> +	const char *name;
> +	struct hlist_node name_hash;
> +};
> +
> +extern int symbol_read_exports(FILE *file);
> +extern struct symbol *symbol_get(const char *name);

Nit: extern isn't necessary here and in other similar cases throughout
the series. It should be removed per
Documentation/process/coding-style.rst, 6.1) Function prototypes.

> +
>  /*
>   * dwarf.c
>   */
> @@ -63,6 +82,8 @@ extern bool debug;
>  struct state {
>  	Dwfl_Module *mod;
>  	Dwarf *dbg;
> +	struct symbol *sym;
> +	Dwarf_Die die;
>  };
>  
>  typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> new file mode 100644
> index 000000000000..673ad9cf9e77
> --- /dev/null
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +#define SYMBOL_HASH_BITS 15
> +static DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
> +
> +typedef int (*symbol_callback_t)(struct symbol *, void *arg);
> +
> +static int for_each(const char *name, symbol_callback_t func, void *data)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *match;
> +
> +	if (!name || !*name)
> +		return 0;
> +
> +	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
> +				    name_hash(name)) {
> +		if (strcmp(match->name, name))
> +			continue;
> +
> +		if (func)
> +			check(func(match, data));
> +
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool is_exported(const char *name)
> +{
> +	return checkp(for_each(name, NULL, NULL)) > 0;
> +}
> +
> +int symbol_read_exports(FILE *file)
> +{
> +	struct symbol *sym;
> +	char *line = NULL;
> +	char *name = NULL;
> +	size_t size = 0;
> +	int nsym = 0;
> +
> +	while (getline(&line, &size, file) > 0) {
> +		if (sscanf(line, "%ms\n", &name) != 1) {
> +			error("malformed input line: %s", line);
> +			return -1;
> +		}
> +
> +		free(line);
> +		line = NULL;
> +
> +		if (is_exported(name))
> +			continue; /* Ignore duplicates */
> +
> +		sym = malloc(sizeof(struct symbol));
> +		if (!sym) {
> +			error("malloc failed");
> +			return -1;
> +		}
> +
> +		sym->name = name;
> +		name = NULL;
> +
> +		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
> +		++nsym;
> +
> +		debug("%s", sym->name);
> +	}
> +
> +	if (line)
> +		free(line);

The loop leaks line on a potential sscanf() error and name if the symbol
is a duplicate or malloc(sizeof(struct symbol)) fails. Additionally, it
should be possible to avoid allocating line by getline() on each
iteration.

I would change it to something like this (not tested):

int symbol_read_exports(FILE *file)
{
	struct symbol *sym;
	char *line = NULL;
	char *name = NULL;
	size_t size = 0;
	int nsym = 0;
	int ret = -1;

	while (getline(&line, &size, file) > 0) {
		if (sscanf(line, "%ms\n", &name) != 1) {
			error("malformed input line: %s", line);
			goto out;
		}

		if (is_exported(name)) {
			/* Ignore duplicates */
			free(name);
			name = NULL;
			continue;
		}

		sym = malloc(sizeof(struct symbol));
		if (!sym) {
			error("malloc failed");
			goto out;
		}

		sym->name = name;
		name = NULL;

		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
		++nsym;

		debug("%s", sym->name);
	}

	debug("%d exported symbols", nsym);
	ret = 0;

out:
	free(line);
	free(name);
	return ret;
}

> +
> +	debug("%d exported symbols", nsym);
> +	return 0;
> +}
> +
> +static int get_symbol(struct symbol *sym, void *arg)
> +{
> +	struct symbol **res = arg;
> +
> +	*res = sym;
> +	return 0;
> +}
> +
> +struct symbol *symbol_get(const char *name)
> +{
> +	struct symbol *sym = NULL;
> +
> +	for_each(name, get_symbol, &sym);
> +	return sym;
> +}

-- 
Thanks,
Petr

