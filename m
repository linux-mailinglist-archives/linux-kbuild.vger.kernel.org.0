Return-Path: <linux-kbuild+bounces-4230-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7749AA158
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 13:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAD8E1C21568
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 11:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E004219D078;
	Tue, 22 Oct 2024 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gm0MBwpd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1D19D06D
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597700; cv=none; b=kuUaIkHxK9ZQYt4Msc6Q5xjEki5Qlcrsi+MXJjn0oxnmDls4MNoJWRFsn8ATSoh5Q/q8wCqhM8ov697TjrTe7Hp73b4LLCDW6q/uLNPR37UfbkDAWWH6M+2WaooCGVJncg/6MrINa8/9iJsOOrv4WopOiblLLaUhy29Z/9cMqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597700; c=relaxed/simple;
	bh=ZuDh7T7vqb/uJ2Oh6TRsNbWExWPRw6celRvdfqKZJE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHBZ2odzlPJ8VKTQ6ND139DgeHpWHiDGCxWAerI6FWKunQUKyX6TmVs26nq9JX2jL1BlGMnUmmh6Ufwgi/4421lLer1SXe8cO/tFmNn937gSPX/7sDvVa7+nPL0BYfusczv632nSN4X6uyrEWwlyiYA+aWGx9oqxolwNyGBgK+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gm0MBwpd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a628b68a7so717614466b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729597696; x=1730202496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJFTWiRH4O8HY/U6C1bLi9fAv/VSueOH/7iJiF8HHhM=;
        b=gm0MBwpdQ3CJ4xWRVtEV8HmXqAkAx8cQBGeh7W2iZ391eP8DKHAZucHIrnto6xm3CG
         yWmnY6d1Ju3qQgG4yUmcDuqNkvx2b/r7tUVLWUWMUgeQwaPHTGIPavxx/zdwye5oGzDf
         Hbq8pnA7+QYYDrdc1jjQ3kubvlsAgp0uv0x34N0NT+qfwsP4fpoe8C/CU7pZT2lJ3e2A
         dG6ao6rcJSsp6Ab9ob8TA22PSB4CGzvpbEF6Y1aS7nqmmGtOmblm81YTzcw+9ODqEy0a
         NYhntunA3sJwOmV/Y/AXIDxg6NyZL4e7aiuMH4PcjiyzINxgxHJPpoe+/sDPoxMBPGtV
         ogzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597696; x=1730202496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJFTWiRH4O8HY/U6C1bLi9fAv/VSueOH/7iJiF8HHhM=;
        b=TAsGxPpBO4aDy2AtK+F4pP1yCDq7HqmNFY36HI21FxeYawHfF3pTLnHuj75BZpjyno
         MAuPg6ghoPzznkVQKZq2mgomzYofLd593M6VWgpdL29N6qN7rZM5b07wb69J6hV53hzm
         GGbRuYhSWB9t6K+/SuDyk5p2gD8OqAIVRBcBLtFzArXWqDiWMAafIsHSCt7ApeRbZg+W
         aIsUgt+Xh63X5yX4kSsrZJhDNFvFq9i2RphAaMCWUg0sOT3Zyegsju9LluLonpLfdJEx
         dhX3s6HdRnG02ovgRPHbVHKsJdstD78NmlwftMsHVHlifn9/IErHUQjb938bzo+m4Blg
         ofrw==
X-Forwarded-Encrypted: i=1; AJvYcCXb2+sE/BBEkS6oUq7wg8WN25oQB7xoYdPYdgdIt2QRMAOpC+Ot8aL6Sxu5MqQryOiKOhzTAb7PddDp4O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuRE3c5SvfAOkg+C/o1SzUYGhpHAsb0+V7AXIF2hGZwODg4DhG
	chw8j8BccNCPB3y10iUJGDHufZjH9L3BgnnHZ8mOJnJsOW3qsgXxGQsqO6wwJMU=
X-Google-Smtp-Source: AGHT+IGirT1OYLdQdwRgbtzBYUPa7HMsmRQgF+L+andwnPHiKz4xoSVTAFzmWrtDqIA/pp1+hj4X3Q==
X-Received: by 2002:a17:906:c14a:b0:a99:40e6:157c with SMTP id a640c23a62f3a-a9a6995e2a4mr1455707166b.4.1729597696091;
        Tue, 22 Oct 2024 04:48:16 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912ee10bsm328222566b.51.2024.10.22.04.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:48:15 -0700 (PDT)
Message-ID: <8fa10131-fae2-4052-b541-e4a6ef570d63@suse.com>
Date: Tue, 22 Oct 2024 13:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/19] gendwarfksyms: Add symbol versioning
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
 <20241008183823.36676-34-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-34-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Calculate symbol versions from the fully expanded type strings in
> type_map, and output the versions in a genksyms-compatible format.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  scripts/gendwarfksyms/dwarf.c         |  25 +++++-
>  scripts/gendwarfksyms/gendwarfksyms.c |  11 ++-
>  scripts/gendwarfksyms/gendwarfksyms.h |  13 ++-
>  scripts/gendwarfksyms/symbols.c       |  59 +++++++++++++
>  scripts/gendwarfksyms/types.c         | 122 +++++++++++++++++++++++++-
>  5 files changed, 222 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index e1a9e9061b1d..a47a3a0f7a69 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -723,12 +723,33 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
>  /*
>   * Exported symbol processing
>   */
> +static struct die *get_symbol_cache(struct state *state, Dwarf_Die *die)
> +{
> +	struct die *cache;
> +
> +	cache = die_map_get(die, DIE_SYMBOL);
> +
> +	if (cache->state != DIE_INCOMPLETE)
> +		return NULL; /* We already processed a symbol for this DIE */
> +
> +	cache->tag = dwarf_tag(die);
> +	return cache;
> +}
> +
>  static void process_symbol(struct state *state, Dwarf_Die *die,
>  			   die_callback_t process_func)
>  {
> +	struct die *cache;
> +
> +	symbol_set_die(state->sym, die);
> +
> +	cache = get_symbol_cache(state, die);
> +	if (!cache)
> +		return;
> +
>  	debug("%s", state->sym->name);
> -	check(process_func(state, NULL, die));
> -	state->sym->state = SYMBOL_MAPPED;
> +	check(process_func(state, cache, die));
> +	cache->state = DIE_SYMBOL;
>  	if (dump_dies)
>  		fputs("\n", stderr);
>  }
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index 24c87523fc3a..e90d909d259b 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -23,6 +23,8 @@ int dump_dies;
>  int dump_die_map;
>  /* Print out type strings (i.e. type_map) */
>  int dump_types;
> +/* Print out expanded type strings used for symbol versions */
> +int dump_versions;
>  /* Write a symtypes file */
>  int symtypes;
>  static const char *symtypes_file;
> @@ -35,6 +37,7 @@ static void usage(void)
>  	      "      --dump-dies      Dump DWARF DIE contents\n"
>  	      "      --dump-die-map   Print debugging information about die_map changes\n"
>  	      "      --dump-types     Dump type strings\n"
> +	      "      --dump-versions  Dump expanded type strings used for symbol versions\n"
>  	      "  -T, --symtypes file  Write a symtypes file\n"
>  	      "  -h, --help           Print this message\n"
>  	      "\n",
> @@ -69,9 +72,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
>  	} while (cu);
>  
>  	/*
> -	 * Use die_map to expand type strings and write them to `symfile`.
> +	 * Use die_map to expand type strings, write them to `symfile`, and
> +	 * calculate symbol versions.
>  	 */
> -	generate_symtypes(symfile);
> +	generate_symtypes_and_versions(symfile);
>  	die_map_free();
>  
>  	return DWARF_CB_OK;
> @@ -92,6 +96,7 @@ int main(int argc, char **argv)
>  				 { "dump-dies", 0, &dump_dies, 1 },
>  				 { "dump-die-map", 0, &dump_die_map, 1 },
>  				 { "dump-types", 0, &dump_types, 1 },
> +				 { "dump-versions", 0, &dump_versions, 1 },
>  				 { "symtypes", 1, NULL, 'T' },
>  				 { "help", 0, NULL, 'h' },
>  				 { 0, 0, NULL, 0 } };
> @@ -167,5 +172,7 @@ int main(int argc, char **argv)
>  	if (symfile)
>  		check(fclose(symfile));
>  
> +	symbol_print_versions();
> +
>  	return 0;
>  }
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index e47b5e967520..814f53ef799e 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -26,6 +26,7 @@ extern int debug;
>  extern int dump_dies;
>  extern int dump_die_map;
>  extern int dump_types;
> +extern int dump_versions;
>  extern int symtypes;
>  
>  /*
> @@ -98,6 +99,7 @@ static inline unsigned int addr_hash(uintptr_t addr)
>  enum symbol_state {
>  	SYMBOL_UNPROCESSED,
>  	SYMBOL_MAPPED,
> +	SYMBOL_PROCESSED
>  };
>  
>  struct symbol_addr {
> @@ -112,6 +114,7 @@ struct symbol {
>  	struct hlist_node name_hash;
>  	enum symbol_state state;
>  	uintptr_t die_addr;
> +	unsigned long crc;
>  };
>  
>  typedef void (*symbol_callback_t)(struct symbol *, void *arg);
> @@ -119,6 +122,10 @@ typedef void (*symbol_callback_t)(struct symbol *, void *arg);
>  void symbol_read_exports(FILE *file);
>  void symbol_read_symtab(int fd);
>  struct symbol *symbol_get(const char *name);
> +void symbol_set_die(struct symbol *sym, Dwarf_Die *die);
> +void symbol_set_crc(struct symbol *sym, unsigned long crc);
> +void symbol_for_each(symbol_callback_t func, void *arg);
> +void symbol_print_versions(void);
>  
>  /*
>   * die.c
> @@ -128,7 +135,8 @@ enum die_state {
>  	DIE_INCOMPLETE,
>  	DIE_UNEXPANDED,
>  	DIE_COMPLETE,
> -	DIE_LAST = DIE_COMPLETE
> +	DIE_SYMBOL,
> +	DIE_LAST = DIE_SYMBOL
>  };
>  
>  enum die_fragment_type {
> @@ -158,6 +166,7 @@ static inline const char *die_state_name(enum die_state state)
>  	CASE_CONST_TO_STR(DIE_INCOMPLETE)
>  	CASE_CONST_TO_STR(DIE_UNEXPANDED)
>  	CASE_CONST_TO_STR(DIE_COMPLETE)
> +	CASE_CONST_TO_STR(DIE_SYMBOL)
>  	}
>  
>  	error("unexpected die_state: %d", state);
> @@ -245,6 +254,6 @@ void process_cu(Dwarf_Die *cudie);
>   * types.c
>   */
>  
> -void generate_symtypes(FILE *file);
> +void generate_symtypes_and_versions(FILE *file);
>  
>  #endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index e414257333e5..e17f11a02f6e 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -66,6 +66,36 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
>  	return 0;
>  }
>  
> +static void set_crc(struct symbol *sym, void *data)
> +{
> +	unsigned long *crc = data;
> +
> +	if (sym->state == SYMBOL_PROCESSED && sym->crc != *crc)
> +		warn("overriding version for symbol %s (crc %lx vs. %lx)",
> +		     sym->name, sym->crc, *crc);
> +
> +	sym->state = SYMBOL_PROCESSED;
> +	sym->crc = *crc;
> +}
> +
> +void symbol_set_crc(struct symbol *sym, unsigned long crc)
> +{
> +	if (for_each(sym->name, set_crc, &crc) == 0)
> +		error("no matching symbols: '%s'", sym->name);
> +}
> +
> +static void set_die(struct symbol *sym, void *data)
> +{
> +	sym->die_addr = (uintptr_t)((Dwarf_Die *)data)->addr;
> +	sym->state = SYMBOL_MAPPED;
> +}
> +
> +void symbol_set_die(struct symbol *sym, Dwarf_Die *die)
> +{
> +	if (for_each(sym->name, set_die, die) == 0)
> +		error("no matching symbols: '%s'", sym->name);
> +}
> +
>  static bool is_exported(const char *name)
>  {
>  	return for_each(name, NULL, NULL) > 0;
> @@ -120,6 +150,16 @@ struct symbol *symbol_get(const char *name)
>  	return sym;
>  }
>  
> +void symbol_for_each(symbol_callback_t func, void *arg)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *sym;
> +
> +	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
> +		func(sym, arg);
> +	}
> +}
> +
>  typedef void (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
>  				      Elf32_Word xndx, void *arg);
>  
> @@ -231,3 +271,22 @@ void symbol_read_symtab(int fd)
>  {
>  	elf_for_each_global(fd, elf_set_symbol_addr, NULL);
>  }
> +
> +void symbol_print_versions(void)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *sym;
> +
> +	hash_for_each_safe(symbol_names, sym, tmp, name_hash) {
> +		if (sym->state != SYMBOL_PROCESSED)
> +			warn("no information for symbol %s", sym->name);
> +
> +		printf("#SYMVER %s 0x%08lx\n", sym->name, sym->crc);
> +
> +		free((void *)sym->name);
> +		free(sym);
> +	}
> +
> +	hash_init(symbol_addrs);
> +	hash_init(symbol_names);
> +}

I had some minor comment about adjusting the name of function
symbol_print_versions() and possibly changing sym->name to 'char *' on
the v2 of the patch:
https://lore.kernel.org/all/286b1cc5-1757-4f0a-bb66-0875f4608c7e@suse.com/
Please have a look, it seems it felt through the cracks.

In any case, the patch looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

