Return-Path: <linux-kbuild+bounces-4149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630F9A0C5C
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 16:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1552F1F244AB
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9739820E007;
	Wed, 16 Oct 2024 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eeDkXWjJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7120C492
	for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2024 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088189; cv=none; b=aWnvopwY5noZQ4gv0ZoFnAbSHDqUd8A1UPd/6k+5blW0l6Gzn/vd5a9lUBDFebdQHmadLj9dya8Zfhw0x1Kky3o3RenBrrFmJUfQSRicrwHCxWSFNsunCRlB8ewC5XQ9I4i4Cx+cLcRGQaDoqPP4PvpgFcQSPyAFw1I1LIJlxD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088189; c=relaxed/simple;
	bh=QxI//qy6SRimH6DFsKj/5JqUXhaavgW4VHaRE77rsA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxBBJEERf9zEuhF3u/RQvWQ57u/IEg7+STyVwwreOO8xbZqRdS0vtA45Pc9CN9eXJqrXC7cor8KK3/XcyCPU2NBppxo/PPghywTXY4VTmN8Bj/noiDNzmBPBfrYB/BBPxPKaHqWnIvy/f4jZrv6GR7rwC89N6CyzgsQnTTWb7MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eeDkXWjJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso5453913a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2024 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729088184; x=1729692984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkitLVdUIfBswSecoH4/yMlvF1d7Jl0pwk3xAI1xCeg=;
        b=eeDkXWjJXKFdSKZrd6IVNRdk/aaN/Qw138wR8N7hdI3DAXo9x6I+fK2kMiSCcEL2w1
         yLXe+yiITwnUHYOSkdpb5rrcUqCEW4cKpSlpK3ymeJJGZiX/kob7ojFAJe8AjB/9S2ja
         xvnWbZ160GVuffaMjdMQkc2IBRw9p+lCTdh7Ye25l9RKyyjZgIzpKafL+mYLf/sNelPy
         U4TMWuvTNhZCJqOIYaiwlzfJnVDSxkGltrc+BEYyWUNh1lE6jlf3/lxFouTxx1Tb7gXP
         t2zwtgHREztv0k/JivwHGS5pjQQTJScHpebBUBCshAtQ7/oSyj7eIb7iEUYQmstqGsqU
         rv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088184; x=1729692984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkitLVdUIfBswSecoH4/yMlvF1d7Jl0pwk3xAI1xCeg=;
        b=No7z3ijCSOuAtVEw5LqS2EdJpsLoz2zWf48fB6WHaluEv777RpSrLRp8qGKYujXAde
         2Nlu8l/vuwX6JCLRrzSHVQbMuidOzcZN7fXPGaDfYwdirVRRSSGYAGTiC5tAQo/AXRXD
         9Tcq4OUoVhQnSUiEfFSqx59xL6O76Iu6IV0DrTsBKPHzUW7m9qE1nq6D57xcqGBMPG6A
         HLRarkgubxWgWbXW9j9ShnXnBO0zRrO4P1JzF61Y39J3im/+BF7Y35WmJG4O2VCe+nEY
         n2XTM3yWuzpe6I5lkwmPAcdUTYbeLqNPBE4icB1hO2uXX/WtFSS15xPv2pqvtsx9BGkb
         Zwlw==
X-Forwarded-Encrypted: i=1; AJvYcCUHznqq6HcYEfg0PJKZf1tctgzGLLoiBKGI32HG9/4103Vu4Ectj23dQH1vT7grrbji08i7ba/ExQrPUdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRd6u/3uX6j/JS4npcY5KWjmro9CXtVYMmH8DfaCSfu2iJ/k1W
	XDSICal97GNL7SCw2i3HbxRWtqd6NcfWv4+r89vbp9diug99cFh7pVuon+Ds+GU=
X-Google-Smtp-Source: AGHT+IF/jHLtlOnJ03hZGYKyu2uazu1k6TC8QznAT+IJJPrAXp2dr5BVCStw4SXjYZcJ93PZUijGyw==
X-Received: by 2002:a17:907:3ea0:b0:a9a:2a56:91e with SMTP id a640c23a62f3a-a9a2a560a3emr471017466b.6.1729088183771;
        Wed, 16 Oct 2024 07:16:23 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844cc9sm186696466b.182.2024.10.16.07.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 07:16:23 -0700 (PDT)
Message-ID: <f60bf3b2-6e3a-4382-93d1-1eca521e4ebd@suse.com>
Date: Wed, 16 Oct 2024 16:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/19] gendwarfksyms: Limit structure expansion
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
 <20241008183823.36676-31-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-31-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Expand each structure type only once per exported symbol. This
> is necessary to support self-referential structures, which would
> otherwise result in infinite recursion, but is still sufficient for
> catching ABI changes.
> 
> For pointers, limit structure expansion after the first pointer
> in the symbol type. This should be plenty for detecting ABI
> differences, but it stops us from pulling in half the kernel for
> types that contain pointers to large kernel data structures, like
> task_struct, for example.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  scripts/gendwarfksyms/Makefile        |   1 +
>  scripts/gendwarfksyms/cache.c         |  44 +++++++++++
>  scripts/gendwarfksyms/dwarf.c         | 109 +++++++++++++++++++++++---
>  scripts/gendwarfksyms/gendwarfksyms.h |  37 +++++++++
>  4 files changed, 182 insertions(+), 9 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/cache.c
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index c0d4ce50fc27..c06145d84df8 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -2,6 +2,7 @@
>  hostprogs-always-y += gendwarfksyms
>  
>  gendwarfksyms-objs += gendwarfksyms.o
> +gendwarfksyms-objs += cache.o
>  gendwarfksyms-objs += die.o
>  gendwarfksyms-objs += dwarf.o
>  gendwarfksyms-objs += symbols.o
> diff --git a/scripts/gendwarfksyms/cache.c b/scripts/gendwarfksyms/cache.c
> new file mode 100644
> index 000000000000..2f1517133a20
> --- /dev/null
> +++ b/scripts/gendwarfksyms/cache.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +struct expanded {
> +	uintptr_t addr;
> +	struct hlist_node hash;
> +};
> +
> +void __cache_mark_expanded(struct expansion_cache *ec, uintptr_t addr)
> +{
> +	struct expanded *es;
> +
> +	es = xmalloc(sizeof(struct expanded));
> +	es->addr = addr;
> +	hash_add(ec->cache, &es->hash, addr_hash(addr));
> +}
> +
> +bool __cache_was_expanded(struct expansion_cache *ec, uintptr_t addr)
> +{
> +	struct expanded *es;
> +
> +	hash_for_each_possible(ec->cache, es, hash, addr_hash(addr)) {
> +		if (es->addr == addr)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +void cache_clear_expanded(struct expansion_cache *ec)
> +{
> +	struct hlist_node *tmp;
> +	struct expanded *es;
> +
> +	hash_for_each_safe(ec->cache, es, tmp, hash) {
> +		free(es);
> +	}
> +
> +	hash_init(ec->cache);
> +}
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index f5cebbdcc212..51dd8e82f9e7 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -26,6 +26,7 @@ static void process_linebreak(struct die *cache, int n)
>  		       !dwarf_form##attr(&da, value);                  \
>  	}
>  
> +DEFINE_GET_ATTR(flag, bool)
>  DEFINE_GET_ATTR(udata, Dwarf_Word)
>  
>  static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
> @@ -79,6 +80,13 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
>  	return !!state->sym;
>  }
>  
> +static bool is_declaration(Dwarf_Die *die)
> +{
> +	bool value;
> +
> +	return get_flag_attr(die, DW_AT_declaration, &value) && value;
> +}
> +
>  /*
>   * Type string processing
>   */
> @@ -455,19 +463,28 @@ static void __process_structure_type(struct state *state, struct die *cache,
>  				     die_callback_t process_func,
>  				     die_match_callback_t match_func)
>  {
> +	bool is_decl;
> +
>  	process(cache, type);
>  	process_fqn(cache, die);
>  	process(cache, " {");
>  	process_linebreak(cache, 1);
>  
> -	check(process_die_container(state, cache, die, process_func,
> -				    match_func));
> +	is_decl = is_declaration(die);
> +
> +	if (!is_decl && state->expand.expand) {
> +		cache_mark_expanded(&state->expansion_cache, die->addr);
> +		check(process_die_container(state, cache, die, process_func,
> +					    match_func));
> +	}
>  
>  	process_linebreak(cache, -1);
>  	process(cache, "}");
>  
> -	process_byte_size_attr(cache, die);
> -	process_alignment_attr(cache, die);
> +	if (!is_decl && state->expand.expand) {
> +		process_byte_size_attr(cache, die);
> +		process_alignment_attr(cache, die);
> +	}
>  }
>  
>  #define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                        \
> @@ -520,7 +537,7 @@ static void process_unspecified_type(struct state *state, struct die *cache,
>  				     Dwarf_Die *die)
>  {
>  	/*
> -	 * These can be emitted for stand-elone assembly code, which means we
> +	 * These can be emitted for stand-alone assembly code, which means we
>  	 * might run into them in vmlinux.o.
>  	 */
>  	process(cache, "unspecified_type");

Nit: This hunk should be folded into patch #9 ("gendwarfksyms: Expand
structure types").

> @@ -552,6 +569,42 @@ static void process_cached(struct state *state, struct die *cache,
>  	}
>  }
>  
> +static void state_init(struct state *state)
> +{
> +	state->expand.expand = true;
> +	state->expand.ptr_depth = 0;
> +	state->expand.ptr_expansion_depth = 0;
> +	hash_init(state->expansion_cache.cache);
> +}
> +
> +static void expansion_state_restore(struct expansion_state *state,
> +				    struct expansion_state *saved)
> +{
> +	state->expand = saved->expand;
> +	state->ptr_depth = saved->ptr_depth;
> +	state->ptr_expansion_depth = saved->ptr_expansion_depth;
> +}
> +
> +static void expansion_state_save(struct expansion_state *state,
> +				 struct expansion_state *saved)
> +{
> +	expansion_state_restore(saved, state);
> +}
> +
> +static bool is_pointer_type(int tag)
> +{
> +	return tag == DW_TAG_pointer_type || tag == DW_TAG_reference_type;
> +}
> +
> +static bool is_expanded_type(int tag)
> +{
> +	return tag == DW_TAG_class_type || tag == DW_TAG_structure_type ||
> +	       tag == DW_TAG_union_type || tag == DW_TAG_enumeration_type;
> +}
> +
> +/* The maximum depth for expanding structures in pointers */
> +#define MAX_POINTER_EXPANSION_DEPTH 2
> +
>  #define PROCESS_TYPE(type)                                \
>  	case DW_TAG_##type##_type:                        \
>  		process_##type##_type(state, cache, die); \
> @@ -559,18 +612,52 @@ static void process_cached(struct state *state, struct die *cache,
>  
>  static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
>  {
> +	enum die_state want_state = DIE_COMPLETE;
>  	struct die *cache;
> +	struct expansion_state saved;
>  	int tag = dwarf_tag(die);
>  
> +	expansion_state_save(&state->expand, &saved);
> +
> +	/*
> +	 * Structures and enumeration types are expanded only once per
> +	 * exported symbol. This is sufficient for detecting ABI changes
> +	 * within the structure.
> +	 *
> +	 * We fully expand the first pointer reference in the exported
> +	 * symbol, but limit the expansion of further pointer references
> +	 * to at most MAX_POINTER_EXPANSION_DEPTH levels.
> +	 */
> +	if (is_pointer_type(tag))
> +		state->expand.ptr_depth++;
> +
> +	if (state->expand.ptr_depth > 0 && is_expanded_type(tag)) {
> +		if (state->expand.ptr_expansion_depth >=
> +			    MAX_POINTER_EXPANSION_DEPTH ||
> +		    cache_was_expanded(&state->expansion_cache, die->addr))
> +			state->expand.expand = false;
> +
> +		if (state->expand.expand)
> +			state->expand.ptr_expansion_depth++;
> +	}
> +
>  	/*
> -	 * If we have the DIE already cached, use it instead of walking
> +	 * If we have want_state already cached, use it instead of walking
>  	 * through DWARF.
>  	 */
> -	cache = die_map_get(die, DIE_COMPLETE);
> +	if (!state->expand.expand && is_expanded_type(tag))
> +		want_state = DIE_UNEXPANDED;
> +
> +	cache = die_map_get(die, want_state);
> +
> +	if (cache->state == want_state) {
> +		if (want_state == DIE_COMPLETE && is_expanded_type(tag))
> +			cache_mark_expanded(&state->expansion_cache, die->addr);
>  
> -	if (cache->state == DIE_COMPLETE) {
>  		process_cached(state, cache, die);
>  		die_map_add_die(parent, cache);
> +
> +		expansion_state_restore(&state->expand, &saved);
>  		return 0;
>  	}
>  

The commit message and the comment in process_type() describe that each
structure type should be expanded only once per symbol, but that doesn't
seem to be the case?

Consider the following example:

struct A { int m; };
void foo(struct A a1, struct A a2) {}

Running gendwarfksyms on the compiled file shows the following debug
output:

$ echo foo | ./build/scripts/gendwarfksyms/gendwarfksyms --debug --dump-types --dump-versions --dump-dies test.o
[...]
gendwarfksyms: process_symbol: foo
subprogram (
  formal_parameter structure_type A {
    member base_type int byte_size(4) encoding(5) m data_member_location(0)
  } byte_size(4) a1 ,
  formal_parameter structure_type A {
    member base_type int byte_size(4) encoding(5) m data_member_location(0)
  } byte_size(4) a2
)
-> base_type void

I think it indicates that struct A was expanded twice. My expectation
would be to see:

gendwarfksyms: process_symbol: foo
subprogram (
  formal_parameter structure_type A {
    member base_type int byte_size(4) encoding(5) m data_member_location(0)
  } byte_size(4) a1 ,
  formal_parameter structure_type A {
  } a2
)
-> base_type void

If I follow correctly, the type_expand() logic on the output eventually
performs only the first expansion for the CRC calculation. However, it
looks this process_type() code should do the same, if only to be a bit
faster. Or did I misunderstand anything how this should work?

I played with the following (applies on the top of the series), which
matches my understanding of what should happen:

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 0112b5e8fbf5..1cc39be02b80 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -661,7 +661,6 @@ static void __process_structure_type(struct state *state, struct die *cache,
 	is_decl = is_declaration(cache, die);
 
 	if (!is_decl && state->expand.expand) {
-		cache_mark_expanded(&state->expansion_cache, die->addr);
 		state->expand.current_fqn = cache->fqn;
 		check(process_die_container(state, cache, die, process_func,
 					    match_func));
@@ -850,32 +849,35 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	if (is_pointer_type(tag))
 		state->expand.ptr_depth++;
 
-	if (state->expand.ptr_depth > 0 && is_expanded_type(tag)) {
-		if (state->expand.ptr_expansion_depth >=
-			    MAX_POINTER_EXPANSION_DEPTH ||
-		    cache_was_expanded(&state->expansion_cache, die->addr))
+	if (is_expanded_type(tag)) {
+		if (cache_was_expanded(&state->expansion_cache, die->addr))
 			state->expand.expand = false;
 
+		if (state->expand.ptr_depth > 0) {
+			if (state->expand.ptr_expansion_depth >=
+			    MAX_POINTER_EXPANSION_DEPTH)
+				state->expand.expand = false;
+
+			if (state->expand.expand)
+				state->expand.ptr_expansion_depth++;
+		}
+
 		if (state->expand.expand)
-			state->expand.ptr_expansion_depth++;
+			cache_mark_expanded(&state->expansion_cache, die->addr);
+		else
+			want_state = DIE_UNEXPANDED;
 	}
 
 	/*
 	 * If we have want_state already cached, use it instead of walking
 	 * through DWARF.
 	 */
-	if (!state->expand.expand && is_expanded_type(tag))
-		want_state = DIE_UNEXPANDED;
-
 	cache = die_map_get(die, want_state);
 
 	if (cache->state == want_state) {
 		die_debug_g("cached addr %p tag %x -- %s", die->addr, tag,
 			    die_state_name(cache->state));
 
-		if (want_state == DIE_COMPLETE && is_expanded_type(tag))
-			cache_mark_expanded(&state->expansion_cache, die->addr);
-
 		process_cached(state, cache, die);
 		die_map_add_die(parent, cache);
 

> @@ -611,9 +698,10 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
>  
>  	/* Update cache state and append to the parent (if any) */
>  	cache->tag = tag;
> -	cache->state = DIE_COMPLETE;
> +	cache->state = want_state;
>  	die_map_add_die(parent, cache);
>  
> +	expansion_state_restore(&state->expand, &saved);
>  	return 0;
>  }
>  
> @@ -675,11 +763,14 @@ static int process_exported_symbols(struct state *unused, struct die *cache,
>  		if (!match_export_symbol(&state, die))
>  			return 0;
>  
> +		state_init(&state);
> +
>  		if (tag == DW_TAG_subprogram)
>  			process_subprogram(&state, &state.die);
>  		else
>  			process_variable(&state, &state.die);
>  
> +		cache_clear_expanded(&state.expansion_cache);
>  		return 0;
>  	}
>  	default:
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index f317de5b0653..6147859ae2af 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -104,6 +104,7 @@ struct symbol *symbol_get(const char *name);
>  
>  enum die_state {
>  	DIE_INCOMPLETE,
> +	DIE_UNEXPANDED,
>  	DIE_COMPLETE,
>  	DIE_LAST = DIE_COMPLETE
>  };
> @@ -133,6 +134,7 @@ static inline const char *die_state_name(enum die_state state)
>  {
>  	switch (state) {
>  	CASE_CONST_TO_STR(DIE_INCOMPLETE)
> +	CASE_CONST_TO_STR(DIE_UNEXPANDED)
>  	CASE_CONST_TO_STR(DIE_COMPLETE)
>  	}
>  
> @@ -155,9 +157,40 @@ void die_map_add_linebreak(struct die *pd, int linebreak);
>  void die_map_add_die(struct die *pd, struct die *child);
>  void die_map_free(void);
>  
> +/*
> + * cache.c
> + */
> +
> +#define EXPANSION_CACHE_HASH_BITS 11
> +
> +/* A cache for addresses we've already seen. */
> +struct expansion_cache {
> +	HASHTABLE_DECLARE(cache, 1 << EXPANSION_CACHE_HASH_BITS);
> +};
> +
> +void __cache_mark_expanded(struct expansion_cache *ec, uintptr_t addr);
> +bool __cache_was_expanded(struct expansion_cache *ec, uintptr_t addr);
> +
> +static inline void cache_mark_expanded(struct expansion_cache *ec, void *addr)
> +{
> +	__cache_mark_expanded(ec, (uintptr_t)addr);
> +}
> +
> +static inline bool cache_was_expanded(struct expansion_cache *ec, void *addr)
> +{
> +	return __cache_was_expanded(ec, (uintptr_t)addr);
> +}
> +
> +void cache_clear_expanded(struct expansion_cache *ec);
> +
>  /*
>   * dwarf.c
>   */
> +struct expansion_state {
> +	bool expand;
> +	unsigned int ptr_depth;
> +	unsigned int ptr_expansion_depth;
> +};
>  
>  struct state {
>  	struct symbol *sym;
> @@ -165,6 +198,10 @@ struct state {
>  
>  	/* List expansion */
>  	bool first_list_item;
> +
> +	/* Structure expansion */
> +	struct expansion_state expand;
> +	struct expansion_cache expansion_cache;
>  };
>  
>  typedef int (*die_callback_t)(struct state *state, struct die *cache,

-- 
Thanks,
Petr

