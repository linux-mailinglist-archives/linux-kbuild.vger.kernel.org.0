Return-Path: <linux-kbuild+bounces-3315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A71968413
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 12:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E88131C227CD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 10:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE78213CF8E;
	Mon,  2 Sep 2024 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ajnmYcVV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90852C6AF
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Sep 2024 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271549; cv=none; b=rFXHYGljnF1FR0zvZCG89IrgcbuBlFYjgdwvf0jlsnbnUN1u2vrvZ0livWPrKJIQ1bdTn1rEPFHQYw4jUM77/JeY2qxh5Sjvo4IgqlhXUtHRCTtuUu7bb9IsIAzEvR5J+8EzFnR0G1Ut6nr06Fnbv5XM8BiONlxaAB41sEkQBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271549; c=relaxed/simple;
	bh=sMDZ484R7nQFo7p7r21PwlEwA/PIorGcQ+R5cFkmMvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3EroiPQfwPPRVBNKJwhhLjaC3IS6cs/FIYIdG8OVIvc2FSsO6710jS/Hc4H9ji30U7xZ+zFaVdzNkuOhXpVJfxRVkk51lT2m3kBEp/ie2fiJuzIhAfsyfDF5cMkieLQLRvKtqpHYNixPEYGwiKOYos/bCjokM481B1y+3PwfvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ajnmYcVV; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so41358531fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Sep 2024 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725271544; x=1725876344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DH3biX+SZ0myEJyVNtPopZ8rBBdR/Xj3W7VU/LlSK/8=;
        b=ajnmYcVVs4y9Z5f2PhUM5fp+0CDXBLhiiOQt67Q7CCS7KoOcQpStzHPrwvkW4wPHRw
         F7ap5tpoTQX97Fy0kvjNCmSMxfx/axIh6PvIzQE6a37tlXIv/fhS4SqDI9Yr7aMZAUro
         qwG8nEQA6VQkOfnBS5KmaDQA2hzONyPTfKpVDltA9UTXpMSJXdzPqoHp6+FI03vJI/VM
         wWAXHOmNzaKfbEYndR20g2uuc8Skg+QTwNoQvPt4BKMRxnPFOgKJiZk+H760k4+ptpM1
         o+bBWI1F+k9cFwhhS17iw/gNM3Z3qK9XiX+07u0SCD88v+8wD1buM65fz3UH/FE+vBf+
         NYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271544; x=1725876344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DH3biX+SZ0myEJyVNtPopZ8rBBdR/Xj3W7VU/LlSK/8=;
        b=BLr4e2sWrgbMmlBpTha4FsK94n+t7a1dAI1I2xjmvTinBUUpzPE3X/otckBsx1tO+B
         HJ/a7Cc1qT7VLI3OiOhRmqs5PLdHcGmNYcm9eQ8RH0rQYHso8yYaJ5rPiA8amY3oK6bP
         /UogytrbU+4GWdtOx645V+I+xacPwHrBYnpI+mPSoh/POAtVsxn1bm1BM3wgRsTvuNo4
         3sc0sVLiUM+/mga3ZRpuEZgy9sj6mx8ycU6ww4lsfZ/cPM1K8RkvLp4J1841HvxAkMFX
         dTgB3JuPRVcNMJSvVWaGz8lzp9201aJla77wjYPRFAwTRfW8tNJ1iL3OkTU7TobkKEez
         qmSA==
X-Forwarded-Encrypted: i=1; AJvYcCXkJ1m81puncyc8vRSNtgAKp3EN/rU5lZrp0ahcizfjUPoUp6MCd78yCXmq1ROWFVWlutkSKbcE3cZPl7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWBagEEdHKUOicBmJ/re5TYzHSQ4ZLf0YYdzrsj+TT3Iri91j
	7vJjmOyfKiJlaHQtHNSYR+dsEeitW6cxHDfaCY063+wh5WG32KIvr33xyhXcePg=
X-Google-Smtp-Source: AGHT+IF9Wt05QaUduXeEWLjxWbyGd8ETPS0+tfQA6pTajFeh/OViUU510sEDdUjK2B1+/4dFHTes4w==
X-Received: by 2002:a05:6512:39d4:b0:530:e228:7799 with SMTP id 2adb3069b0e04-53546bab2e9mr7273945e87.58.1725271543734;
        Mon, 02 Sep 2024 03:05:43 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24435fcacsm2896355a12.53.2024.09.02.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:05:43 -0700 (PDT)
Message-ID: <1e6cd0ad-48bb-4dd7-8cd7-4e94d0cd7cf5@suse.com>
Date: Mon, 2 Sep 2024 12:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/19] gendwarfksyms: Add a cache for processed DIEs
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
 <20240815173903.4172139-27-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-27-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Basic types in DWARF repeat frequently and traversing the DIEs using
> libdw is relatively slow. Add a simple hashtable based cache for the
> processed DIEs.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/Makefile        |   1 +
>  scripts/gendwarfksyms/die.c           | 170 +++++++++++++++++++++++
>  scripts/gendwarfksyms/dwarf.c         | 192 ++++++++++++++++++++------
>  scripts/gendwarfksyms/gendwarfksyms.c |   6 +
>  scripts/gendwarfksyms/gendwarfksyms.h |  58 +++++++-
>  5 files changed, 382 insertions(+), 45 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/die.c
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index 623f8fc975ea..fcbac52ca00a 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -1,6 +1,7 @@
>  hostprogs-always-y += gendwarfksyms
>  
>  gendwarfksyms-objs += gendwarfksyms.o
> +gendwarfksyms-objs += die.o
>  gendwarfksyms-objs += dwarf.o
>  gendwarfksyms-objs += symbols.o
>  
> diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
> new file mode 100644
> index 000000000000..ad6ba435d9dd
> --- /dev/null
> +++ b/scripts/gendwarfksyms/die.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <string.h>
> +#include "gendwarfksyms.h"
> +
> +#define DIE_HASH_BITS 20
> +
> +/* uintptr_t die->addr -> struct die * */
> +static DEFINE_HASHTABLE(die_map, DIE_HASH_BITS);
> +
> +static unsigned int map_hits;
> +static unsigned int map_misses;
> +
> +static int create_die(Dwarf_Die *die, struct die **res)
> +{
> +	struct die *cd;
> +
> +	cd = malloc(sizeof(struct die));
> +	if (!cd) {
> +		error("malloc failed");
> +		return -1;
> +	}
> +
> +	cd->state = INCOMPLETE;
> +	cd->mapped = false;
> +	cd->fqn = NULL;
> +	cd->tag = -1;
> +	cd->addr = (uintptr_t)die->addr;
> +	cd->list = NULL;
> +
> +	hash_add(die_map, &cd->hash, addr_hash(cd->addr));
> +	*res = cd;
> +	return 0;
> +}
> +
> +int __die_map_get(uintptr_t addr, enum die_state state, struct die **res)
> +{
> +	struct die *cd;
> +
> +	hash_for_each_possible(die_map, cd, hash, addr_hash(addr)) {
> +		if (cd->addr == addr && cd->state == state) {
> +			*res = cd;
> +			return 0;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res)
> +{
> +	if (__die_map_get((uintptr_t)die->addr, state, res) == 0) {
> +		map_hits++;
> +		return 0;
> +	}
> +
> +	map_misses++;
> +	return check(create_die(die, res));
> +}
> +
> +static void reset_die(struct die *cd)
> +{
> +	struct die_fragment *tmp;
> +	struct die_fragment *df = cd->list;
> +
> +	while (df) {
> +		if (df->type == STRING)
> +			free(df->data.str);
> +
> +		tmp = df->next;
> +		free(df);
> +		df = tmp;
> +	}
> +
> +	cd->state = INCOMPLETE;
> +	cd->mapped = false;
> +	if (cd->fqn)
> +		free(cd->fqn);
> +	cd->fqn = NULL;
> +	cd->tag = -1;
> +	cd->addr = 0;
> +	cd->list = NULL;
> +}
> +
> +void die_map_free(void)
> +{
> +	struct hlist_node *tmp;
> +	unsigned int stats[LAST + 1];
> +	struct die *cd;
> +	int i;
> +
> +	memset(stats, 0, sizeof(stats));
> +
> +	hash_for_each_safe(die_map, i, tmp, cd, hash) {
> +		stats[cd->state]++;
> +		reset_die(cd);
> +		free(cd);
> +	}
> +	hash_init(die_map);
> +
> +	if ((map_hits + map_misses > 0))

Nit: Extra parentheses can be dropped.

> +		debug("hits %u, misses %u (hit rate %.02f%%)", map_hits,
> +		      map_misses,
> +		      (100.0f * map_hits) / (map_hits + map_misses));
> +
> +	for (i = 0; i <= LAST; i++)
> +		debug("%s: %u entries", die_state_name(i), stats[i]);
> +}
> +
> +static int append_item(struct die *cd, struct die_fragment **res)
> +{
> +	struct die_fragment *prev;
> +	struct die_fragment *df;
> +
> +	df = malloc(sizeof(struct die_fragment));
> +	if (!df) {
> +		error("malloc failed");
> +		return -1;
> +	}
> +
> +	df->type = EMPTY;
> +	df->next = NULL;
> +
> +	prev = cd->list;
> +	while (prev && prev->next)
> +		prev = prev->next;
> +
> +	if (prev)
> +		prev->next = df;
> +	else
> +		cd->list = df;
> +
> +	*res = df;
> +	return 0;
> +}
> +
> +int die_map_add_string(struct die *cd, const char *str)
> +{
> +	struct die_fragment *df;
> +
> +	if (!cd)
> +		return 0;
> +
> +	check(append_item(cd, &df));
> +
> +	df->data.str = strdup(str);
> +	if (!df->data.str) {
> +		error("strdup failed");
> +		return -1;
> +	}
> +
> +	df->type = STRING;
> +	return 0;
> +}
> +
> +int die_map_add_die(struct die *cd, struct die *child)
> +{
> +	struct die_fragment *df;
> +
> +	if (!cd)
> +		return 0;
> +
> +	check(append_item(cd, &df));
> +	df->data.addr = child->addr;
> +	df->type = DIE;
> +	return 0;
> +}
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index a37c9049d18e..82b966269acd 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -61,19 +61,20 @@ static bool is_export_symbol(struct state *state, Dwarf_Die *die)
>  /*
>   * Type string processing
>   */
> -static int process(struct state *state, const char *s)
> +static int process(struct state *state, struct die *cache, const char *s)
>  {
>  	s = s ?: "<null>";
>  
>  	if (debug)
>  		fputs(s, stderr);
>  
> -	return 0;
> +	return check(die_map_add_string(cache, s));
>  }
>  
>  #define MAX_FMT_BUFFER_SIZE 128
>  
> -static int process_fmt(struct state *state, const char *fmt, ...)
> +static int process_fmt(struct state *state, struct die *cache, const char *fmt,
> +		       ...)
>  {
>  	char buf[MAX_FMT_BUFFER_SIZE];
>  	va_list args;
> @@ -86,50 +87,103 @@ static int process_fmt(struct state *state, const char *fmt, ...)
>  		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
>  		res = -1;
>  	} else {
> -		res = check(process(state, buf));
> +		res = check(process(state, cache, buf));
>  	}
>  
>  	va_end(args);
>  	return res;
>  }
>  
> -/* Process a fully qualified name from DWARF scopes */
> -static int process_fqn(struct state *state, Dwarf_Die *die)
> +#define MAX_FQN_SIZE 64
> +
> +/* Get a fully qualified name from DWARF scopes */
> +static int get_fqn(struct state *state, Dwarf_Die *die, char **fqn)
>  {
> +	const char *list[MAX_FQN_SIZE];
>  	Dwarf_Die *scopes = NULL;
> -	const char *name;
> +	int count = 0;
> +	int len = 0;
>  	int res;
>  	int i;
>  
> +	*fqn = NULL;
> +
>  	res = checkp(dwarf_getscopes_die(die, &scopes));
>  	if (!res) {
> -		name = get_name(die);
> -		name = name ?: "<unnamed>";
> -		return check(process(state, name));
> +		list[count] = get_name(die);
> +
> +		if (!list[count])
> +			return 0;
> +
> +		len += strlen(list[count]);
> +		count++;
> +
> +		goto done;
>  	}
>  
> -	for (i = res - 1; i >= 0; i--) {
> +	for (i = res - 1; i >= 0 && count < MAX_FQN_SIZE; i--) {
>  		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
>  			continue;
>  
> -		name = get_name(&scopes[i]);
> -		name = name ?: "<unnamed>";
> -		check(process(state, name));
> -		if (i > 0)
> -			check(process(state, "::"));
> +		/*
> +		 * If any of the DIEs in the scope is missing a name, consider
> +		 * the DIE to be unnamed.
> +		 */
> +		list[count] = get_name(&scopes[i]);
> +
> +		if (!list[count]) {
> +			free(scopes);
> +			return 0;
> +		}

This slightly changes how scopes with no name are processed which is
unrelated to the added caching. The previous logic used "<unnamed>" for
individual unnamed scopes. The new code in such a case returns an empty
FQN which is turned in process_fqn() into "<unnamed>".

This is likely ok in practice for this particular tool. In general,
I think "<unnamed>" should be returned when the initial DIE is missing
a name and something like "<anonymous>::foo" when an outer scope has no
name.

More importantly, using "<unnamed>" when a type has no name looks to me
overly verbose, in particular, when it comes to the symtypes output. For
instance, the current output for a 'const char *' parameter is:
formal_parameter pointer_type <unnamed> { const_type <unnamed> { base_type char byte_size(1) encoding(8) } } byte_size(8)

.. while the following should be sufficient and easier to grasp:
formal_parameter pointer_type { const_type { base_type char byte_size(1) encoding(8) } } byte_size(8)

> +
> +		len += strlen(list[count]);
> +		count++;
> +
> +		if (i > 0) {
> +			list[count++] = "::";
> +			len += 2;
> +		}
>  	}
>  
> +	if (count == MAX_FQN_SIZE)
> +		warn("increase MAX_FQN_SIZE: reached the maximum");
> +
>  	free(scopes);
> +
> +done:
> +	*fqn = malloc(len + 1);
> +	if (!*fqn) {
> +		error("malloc failed");
> +		return -1;
> +	}
> +
> +	**fqn = '\0';
> +
> +	for (i = 0; i < count; i++)
> +		strcat(*fqn, list[i]);

Small optimization: This loop could be written as follows to avoid
repeatedly searching the end of fqn:

char *p = *fqn;
for (i = 0; i < count; i++)
	p = stpcpy(p, list[i]);

> +
>  	return 0;
>  }
>  
> +static int process_fqn(struct state *state, struct die *cache, Dwarf_Die *die)
> +{
> +	const char *fqn;
> +
> +	if (!cache->fqn)
> +		check(get_fqn(state, die, &cache->fqn));
> +
> +	fqn = cache->fqn;
> +	fqn = fqn ?: "<unnamed>";

As a small optimization and for consistency, I would recommended to also
cache the "<unnamed>" name to avoid repeatedly calling get_fqn() for
such DIEs.

> +	return check(process(state, cache, fqn));
> +}
> +
>  #define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                         \
> -	static int process_##attribute##_attr(struct state *state,        \
> -					      Dwarf_Die *die)             \
> +	static int process_##attribute##_attr(                            \
> +		struct state *state, struct die *cache, Dwarf_Die *die)   \
>  	{                                                                 \
>  		Dwarf_Word value;                                         \
>  		if (get_udata_attr(die, DW_AT_##attribute, &value))       \
> -			check(process_fmt(state,                          \
> +			check(process_fmt(state, cache,                   \
>  					  " " #attribute "(%" PRIu64 ")", \
>  					  value));                        \
>  		return 0;                                                 \
> @@ -144,8 +198,9 @@ bool match_all(Dwarf_Die *die)
>  	return true;
>  }
>  
> -int process_die_container(struct state *state, Dwarf_Die *die,
> -			  die_callback_t func, die_match_callback_t match)
> +int process_die_container(struct state *state, struct die *cache,
> +			  Dwarf_Die *die, die_callback_t func,
> +			  die_match_callback_t match)
>  {
>  	Dwarf_Die current;
>  	int res;
> @@ -153,48 +208,99 @@ int process_die_container(struct state *state, Dwarf_Die *die,
>  	res = checkp(dwarf_child(die, &current));
>  	while (!res) {
>  		if (match(&current))
> -			check(func(state, &current));
> +			check(func(state, cache, &current));
>  		res = checkp(dwarf_siblingof(&current, &current));
>  	}
>  
>  	return 0;
>  }
>  
> -static int process_type(struct state *state, Dwarf_Die *die);
> +static int process_type(struct state *state, struct die *parent,
> +			Dwarf_Die *die);
>  
> -static int process_type_attr(struct state *state, Dwarf_Die *die)
> +static int process_type_attr(struct state *state, struct die *cache,
> +			     Dwarf_Die *die)
>  {
>  	Dwarf_Die type;
>  
>  	if (get_ref_die_attr(die, DW_AT_type, &type))
> -		return check(process_type(state, &type));
> +		return check(process_type(state, cache, &type));
>  
>  	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
> -	return check(process(state, "base_type void"));
> +	return check(process(state, cache, "base_type void"));
>  }
>  
> -static int process_base_type(struct state *state, Dwarf_Die *die)
> +static int process_base_type(struct state *state, struct die *cache,
> +			     Dwarf_Die *die)
>  {
> -	check(process(state, "base_type "));
> -	check(process_fqn(state, die));
> -	check(process_byte_size_attr(state, die));
> -	check(process_encoding_attr(state, die));
> -	return check(process_alignment_attr(state, die));
> +	check(process(state, cache, "base_type "));
> +	check(process_fqn(state, cache, die));
> +	check(process_byte_size_attr(state, cache, die));
> +	check(process_encoding_attr(state, cache, die));
> +	return check(process_alignment_attr(state, cache, die));
>  }
>  
> -static int process_type(struct state *state, Dwarf_Die *die)
> +static int process_cached(struct state *state, struct die *cache,
> +			  Dwarf_Die *die)
>  {
> +	struct die_fragment *df = cache->list;
> +	Dwarf_Die child;
> +
> +	while (df) {
> +		switch (df->type) {
> +		case STRING:
> +			check(process(state, NULL, df->data.str));
> +			break;
> +		case DIE:
> +			if (!dwarf_die_addr_die(state->dbg,
> +						(void *)df->data.addr,
> +						&child)) {
> +				error("dwarf_die_addr_die failed");
> +				return -1;
> +			}
> +			check(process_type(state, NULL, &child));
> +			break;
> +		default:
> +			error("empty die_fragment");
> +			return -1;
> +		}
> +		df = df->next;
> +	}
> +
> +	return 0;
> +}
> +
> +static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
> +{
> +	struct die *cache = NULL;
>  	int tag = dwarf_tag(die);
>  
> +	/*
> +	 * If we have the DIE already cached, use it instead of walking
> +	 * through DWARF.
> +	 */
> +	check(die_map_get(die, COMPLETE, &cache));
> +
> +	if (cache->state == COMPLETE) {
> +		check(process_cached(state, cache, die));
> +		check(die_map_add_die(parent, cache));
> +		return 0;
> +	}
> +
>  	switch (tag) {
>  	case DW_TAG_base_type:
> -		check(process_base_type(state, die));
> +		check(process_base_type(state, cache, die));
>  		break;
>  	default:
>  		debug("unimplemented type: %x", tag);
>  		break;
>  	}
>  
> +	/* Update cache state and append to the parent (if any) */
> +	cache->tag = tag;
> +	cache->state = COMPLETE;
> +	check(die_map_add_die(parent, cache));
> +
>  	return 0;
>  }
>  
> @@ -203,14 +309,14 @@ static int process_type(struct state *state, Dwarf_Die *die)
>   */
>  static int process_subprogram(struct state *state, Dwarf_Die *die)
>  {
> -	return check(process(state, "subprogram;\n"));
> +	return check(process(state, NULL, "subprogram;\n"));
>  }
>  
>  static int process_variable(struct state *state, Dwarf_Die *die)
>  {
> -	check(process(state, "variable "));
> -	check(process_type_attr(state, die));
> -	return check(process(state, ";\n"));
> +	check(process(state, NULL, "variable "));
> +	check(process_type_attr(state, NULL, die));
> +	return check(process(state, NULL, ";\n"));
>  }
>  
>  static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
> @@ -235,7 +341,8 @@ static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
>  		return check(process_variable(state, &ptr_type));
>  }
>  
> -static int process_exported_symbols(struct state *state, Dwarf_Die *die)
> +static int process_exported_symbols(struct state *state, struct die *cache,
> +				    Dwarf_Die *die)
>  {
>  	int tag = dwarf_tag(die);
>  
> @@ -244,8 +351,9 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
>  	case DW_TAG_namespace:
>  	case DW_TAG_class_type:
>  	case DW_TAG_structure_type:
> -		return check(process_die_container(
> -			state, die, process_exported_symbols, match_all));
> +		return check(process_die_container(state, cache, die,
> +						   process_exported_symbols,
> +						   match_all));
>  
>  	/* Possible exported symbols */
>  	case DW_TAG_subprogram:
> @@ -273,5 +381,5 @@ int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
>  	struct state state = { .mod = mod, .dbg = dbg };
>  
>  	return check(process_die_container(
> -		&state, cudie, process_exported_symbols, match_all));
> +		&state, NULL, cudie, process_exported_symbols, match_all));
>  }
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index e2f8ee5a4bf3..55a7fc902bf4 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -78,6 +78,10 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
>  	debug("%s", name);
>  	dbg = dwfl_module_getdwarf(mod, &dwbias);
>  
> +	/*
> +	 * Look for exported symbols in each CU, follow the DIE tree, and add
> +	 * the entries to die_map.
> +	 */
>  	do {
>  		res = dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie, NULL);
>  		if (res < 0) {
> @@ -90,6 +94,8 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
>  		check(process_module(mod, dbg, &cudie));
>  	} while (cu);
>  
> +	die_map_free();
> +
>  	return DWARF_CB_OK;
>  }
>  
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 8f6acd1b8f8f..b280acceb114 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -76,6 +76,11 @@ static inline u32 name_hash(const char *name)
>  	return jhash(name, strlen(name), 0);
>  }
>  
> +static inline u32 addr_hash(uintptr_t addr)
> +{
> +	return jhash(&addr, sizeof(addr), 0);
> +}
> +
>  struct symbol {
>  	const char *name;
>  	struct symbol_addr addr;
> @@ -88,6 +93,52 @@ extern int symbol_read_exports(FILE *file);
>  extern int symbol_read_symtab(int fd);
>  extern struct symbol *symbol_get(const char *name);
>  
> +/*
> + * die.c
> + */
> +
> +enum die_state { INCOMPLETE, COMPLETE, LAST = COMPLETE };
> +enum die_fragment_type { EMPTY, STRING, DIE };

Nit: I would suggest to prefix the enum values, for example,
STATE_INCOMPLETE, ... and FRAGMENT_EMPTY, ...

> +
> +struct die_fragment {
> +	enum die_fragment_type type;
> +	union {
> +		char *str;
> +		uintptr_t addr;
> +	} data;
> +	struct die_fragment *next;
> +};
> +
> +#define CASE_CONST_TO_STR(name) \
> +	case name:              \
> +		return #name;
> +
> +static inline const char *die_state_name(enum die_state state)
> +{
> +	switch (state) {
> +	default:
> +	CASE_CONST_TO_STR(INCOMPLETE)
> +	CASE_CONST_TO_STR(COMPLETE)
> +	}
> +}
> +
> +struct die {
> +	enum die_state state;
> +	bool mapped;
> +	char *fqn;
> +	int tag;
> +	uintptr_t addr;
> +	struct die_fragment *list;
> +	struct hlist_node hash;
> +};
> +
> +extern int __die_map_get(uintptr_t addr, enum die_state state,
> +			 struct die **res);
> +extern int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res);
> +extern int die_map_add_string(struct die *pd, const char *str);
> +extern int die_map_add_die(struct die *pd, struct die *child);
> +extern void die_map_free(void);
> +
>  /*
>   * dwarf.c
>   */
> @@ -99,12 +150,13 @@ struct state {
>  	Dwarf_Die die;
>  };
>  
> -typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
> +typedef int (*die_callback_t)(struct state *state, struct die *cache,
> +			      Dwarf_Die *die);
>  typedef bool (*die_match_callback_t)(Dwarf_Die *die);
>  extern bool match_all(Dwarf_Die *die);
>  
> -extern int process_die_container(struct state *state, Dwarf_Die *die,
> -				 die_callback_t func,
> +extern int process_die_container(struct state *state, struct die *cache,
> +				 Dwarf_Die *die, die_callback_t func,
>  				 die_match_callback_t match);
>  
>  extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);

-- 
Thanks,
Petr

