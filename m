Return-Path: <linux-kbuild+bounces-4164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E769A24B0
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 16:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFA51C24C38
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 14:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB221DE4F5;
	Thu, 17 Oct 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J02klwwV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6961DE3CF
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174419; cv=none; b=JGeziuHKgYtgSSeVnxf3l8N/Rcvsb5zV9wAxeweRBQGImeilARIhCBzhLqonkDUZ9oFx1A4PbN6RaNRPOLli5Wu5GaHS9ZCRVmgbqlekxWWZ3mjTwFmUbEBE6wYA93qNzoagyNEEGamvLew1VCOHsVV8ynpif2b4ry8qL+WJsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174419; c=relaxed/simple;
	bh=nmADsLn/+GN6umNX9ncGqT7QegQlyxxhrctYU8oGfgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgrpWG/h0YRJUe3Fo/c4yeCduV38trIaLguZEaDA6zGtCzjWdiFjxG+0uexu4AYNVkzCgZNmhNBexm0CyTVnfoRjC0+3XuXKmh946TTwEuwxTP/119uscGCLnN7RG7i1yB30fS71mjrHRS2ritFPxmNROYJ7KLwYvUpLz706KHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J02klwwV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99eb8b607aso100966766b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729174411; x=1729779211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OyFfvDHWY+Fh8eBCA8mLWRpFou2kKjxiLYqIi/ivYA=;
        b=J02klwwVPUKuY6Sh5mWe93qxHehHBM7sQ7L8f628YqQDru7pHFsUg1ELPiPHNNSL/a
         VCItECgWTSBRl9GYoIfxq6ikvrQtK1e8rMmuN25V4zIa4e25Z/NlnzgMI/0iu0UVoI/P
         dskbzdOf37skgrXcRWknol+nJc5aQ07Gfa1gOM5ojHtIonmCxYjT2vDnXvQ0w+OF4BB3
         VHTnxa41zjJlc1apmJeTM9d0AZzcD+eZ5Gl80ZF3RLv8hMIOYks5CEsYknFfpp+ME6M4
         tSgNjO9zLx6Hb/6umlqVak2yLjyv5KQXO9NCiGqs/0mMAPRF9oZ/mi3nS3Tf1xsDNu4E
         0gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174411; x=1729779211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OyFfvDHWY+Fh8eBCA8mLWRpFou2kKjxiLYqIi/ivYA=;
        b=nvMPldiKkLuoRb5ELju9Ez7cvQv0C2nOOpC8nQOzRpVXaejGDgykbhLtBefwfHjQGP
         tZrnGBaf3wQm9ig2vr+RBeVAj0UHriI77CQVt9r+I6hzbWnXekqIOr9msEcONTyJqu+/
         DomTnJT5Jrn9oX1dRq6VB9PN+z5xQTvxGNsPffm3/O41aQ87pt3Sskb7onh2Xs3c0edA
         muhCCMD8QiPN8FK18NTIJLM39Y9MvCy3M+eScwzBZMCiVPfkahM/i4qG1yD1qsq28+U0
         wd5kkwNFAuk7MmUo/DogCJ9E7FyYHOVAP31BrrzOpr6R3Ef/bFC3hJbktMWZ7nLQChIP
         tZjw==
X-Forwarded-Encrypted: i=1; AJvYcCW/ifdDDSpH4IAupCPFufvYH+SCJK/Nm3Ud/eKUqwUsi+A+nysUGv+Ty5BAfkublHNCFLuaUYDrLa9O33E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwprHL5Cj1WROkvugv6EXqp4/l+GaXTIQ/KQysV7Z0BlT/y0dgZ
	Tsw/Z14U2PXjXd3ArHOg7f4jI6ZZ/mFgXlalfPijvgStQkE9/BR4cfe7CvJCz6k=
X-Google-Smtp-Source: AGHT+IEeEOS48uF0f2mLFVIzFdWTiQtuKETINBfk59n9V27E17fzR5943lrS+/1fnrK6btCldXmEnQ==
X-Received: by 2002:a17:907:d591:b0:a9a:296:b501 with SMTP id a640c23a62f3a-a9a34cfeb7bmr604067266b.26.1729174410767;
        Thu, 17 Oct 2024 07:13:30 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844fc4sm305740766b.175.2024.10.17.07.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:13:30 -0700 (PDT)
Message-ID: <13be9260-1799-4255-89d4-65d56358e348@suse.com>
Date: Thu, 17 Oct 2024 16:13:27 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/19] gendwarfksyms: Add symtypes output
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
 <20241008183823.36676-33-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-33-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Add support for producing genksyms-style symtypes files. Process
> die_map to find the longest expansions for each type, and use symtypes
> references in type definitions. The basic file format is similar to
> genksyms, with two notable exceptions:
> 
>   1. Type names with spaces (common with Rust) in references are
>      wrapped in single quotes. E.g.:
> 
>      s#'core::result::Result<u8, core::num::error::ParseIntError>'
> 
>   2. The actual type definition is the simple parsed DWARF format we
>      output with --dump-dies, not the preprocessed C-style format
>      genksyms produces.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  scripts/gendwarfksyms/Makefile        |   1 +
>  scripts/gendwarfksyms/die.c           |  11 +
>  scripts/gendwarfksyms/dwarf.c         |   1 +
>  scripts/gendwarfksyms/gendwarfksyms.c |  36 ++-
>  scripts/gendwarfksyms/gendwarfksyms.h |  19 ++
>  scripts/gendwarfksyms/symbols.c       |   4 +-
>  scripts/gendwarfksyms/types.c         | 359 ++++++++++++++++++++++++++
>  7 files changed, 428 insertions(+), 3 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/types.c
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index c06145d84df8..6540282dc746 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -6,5 +6,6 @@ gendwarfksyms-objs += cache.o
>  gendwarfksyms-objs += die.o
>  gendwarfksyms-objs += dwarf.o
>  gendwarfksyms-objs += symbols.o
> +gendwarfksyms-objs += types.o
>  
>  HOSTLDLIBS_gendwarfksyms := -ldw -lelf
> diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
> index 2829387fd815..df1ca3a032bb 100644
> --- a/scripts/gendwarfksyms/die.c
> +++ b/scripts/gendwarfksyms/die.c
> @@ -22,6 +22,7 @@ static inline unsigned int die_hash(uintptr_t addr, enum die_state state)
>  static void init_die(struct die *cd)
>  {
>  	cd->state = DIE_INCOMPLETE;
> +	cd->mapped = false;
>  	cd->fqn = NULL;
>  	cd->tag = -1;
>  	cd->addr = 0;
> @@ -83,6 +84,16 @@ static void reset_die(struct die *cd)
>  	init_die(cd);
>  }
>  
> +void die_map_for_each(die_map_callback_t func, void *arg)
> +{
> +	struct hlist_node *tmp;
> +	struct die *cd;
> +
> +	hash_for_each_safe(die_map, cd, tmp, hash) {
> +		func(cd, arg);
> +	}
> +}
> +
>  void die_map_free(void)
>  {
>  	struct hlist_node *tmp;
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index d67cac16f8fb..e1a9e9061b1d 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -728,6 +728,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
>  {
>  	debug("%s", state->sym->name);
>  	check(process_func(state, NULL, die));
> +	state->sym->state = SYMBOL_MAPPED;
>  	if (dump_dies)
>  		fputs("\n", stderr);
>  }
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index d40692a703bb..24c87523fc3a 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -21,6 +21,11 @@ int debug;
>  int dump_dies;
>  /* Print debugging information about die_map changes */
>  int dump_die_map;
> +/* Print out type strings (i.e. type_map) */
> +int dump_types;
> +/* Write a symtypes file */
> +int symtypes;
> +static const char *symtypes_file;
>  
>  static void usage(void)
>  {
> @@ -29,6 +34,8 @@ static void usage(void)
>  	      "  -d, --debug          Print debugging information\n"
>  	      "      --dump-dies      Dump DWARF DIE contents\n"
>  	      "      --dump-die-map   Print debugging information about die_map changes\n"
> +	      "      --dump-types     Dump type strings\n"
> +	      "  -T, --symtypes file  Write a symtypes file\n"
>  	      "  -h, --help           Print this message\n"
>  	      "\n",
>  	      stderr);
> @@ -41,6 +48,7 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
>  	Dwarf_Die cudie;
>  	Dwarf_CU *cu = NULL;
>  	Dwarf *dbg;
> +	FILE *symfile = arg;
>  	int res;
>  
>  	debug("%s", name);
> @@ -60,6 +68,10 @@ static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
>  		process_cu(&cudie);
>  	} while (cu);
>  
> +	/*
> +	 * Use die_map to expand type strings and write them to `symfile`.
> +	 */
> +	generate_symtypes(symfile);
>  	die_map_free();
>  
>  	return DWARF_CB_OK;
> @@ -72,22 +84,29 @@ static const Dwfl_Callbacks callbacks = {
>  
>  int main(int argc, char **argv)
>  {
> +	FILE *symfile = NULL;
>  	unsigned int n;
>  	int opt;
>  
>  	struct option opts[] = { { "debug", 0, NULL, 'd' },
>  				 { "dump-dies", 0, &dump_dies, 1 },
>  				 { "dump-die-map", 0, &dump_die_map, 1 },
> +				 { "dump-types", 0, &dump_types, 1 },
> +				 { "symtypes", 1, NULL, 'T' },
>  				 { "help", 0, NULL, 'h' },
>  				 { 0, 0, NULL, 0 } };
>  
> -	while ((opt = getopt_long(argc, argv, "dh", opts, NULL)) != EOF) {
> +	while ((opt = getopt_long(argc, argv, "dT:h", opts, NULL)) != EOF) {
>  		switch (opt) {
>  		case 0:
>  			break;
>  		case 'd':
>  			debug = 1;
>  			break;
> +		case 'T':
> +			symtypes = 1;
> +			symtypes_file = optarg;
> +			break;
>  		case 'h':
>  			usage();
>  			return 0;
> @@ -107,6 +126,16 @@ int main(int argc, char **argv)
>  
>  	symbol_read_exports(stdin);
>  
> +	if (symtypes_file) {
> +		symfile = fopen(symtypes_file, "w");
> +
> +		if (!symfile) {
> +			error("fopen failed for '%s': %s", symtypes_file,
> +			      strerror(errno));
> +			return -1;

Nit: The 'return -1;' statement is not needed since error() doesn't
return.

> +		}
> +	}
> +
>  	for (n = optind; n < argc; n++) {
>  		Dwfl *dwfl;
>  		int fd;
> @@ -129,11 +158,14 @@ int main(int argc, char **argv)
>  
>  		dwfl_report_end(dwfl, NULL, NULL);
>  
> -		if (dwfl_getmodules(dwfl, &process_module, NULL, 0))
> +		if (dwfl_getmodules(dwfl, &process_module, symfile, 0))
>  			error("dwfl_getmodules failed for '%s'", argv[n]);
>  
>  		dwfl_end(dwfl);
>  	}
>  
> +	if (symfile)
> +		check(fclose(symfile));
> +
>  	return 0;
>  }
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 126916e85ee0..e47b5e967520 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -25,6 +25,8 @@
>  extern int debug;
>  extern int dump_dies;
>  extern int dump_die_map;
> +extern int dump_types;
> +extern int symtypes;
>  
>  /*
>   * Output helpers
> @@ -93,6 +95,11 @@ static inline unsigned int addr_hash(uintptr_t addr)
>  	return hash_ptr((const void *)addr);
>  }
>  
> +enum symbol_state {
> +	SYMBOL_UNPROCESSED,
> +	SYMBOL_MAPPED,
> +};
> +
>  struct symbol_addr {
>  	uint32_t section;
>  	Elf64_Addr address;
> @@ -103,6 +110,8 @@ struct symbol {
>  	struct symbol_addr addr;
>  	struct hlist_node addr_hash;
>  	struct hlist_node name_hash;
> +	enum symbol_state state;
> +	uintptr_t die_addr;
>  };
>  
>  typedef void (*symbol_callback_t)(struct symbol *, void *arg);
> @@ -156,6 +165,7 @@ static inline const char *die_state_name(enum die_state state)
>  
>  struct die {
>  	enum die_state state;
> +	bool mapped;
>  	char *fqn;
>  	int tag;
>  	uintptr_t addr;
> @@ -163,10 +173,13 @@ struct die {
>  	struct hlist_node hash;
>  };
>  
> +typedef void (*die_map_callback_t)(struct die *, void *arg);
> +
>  int __die_map_get(uintptr_t addr, enum die_state state, struct die **res);
>  struct die *die_map_get(Dwarf_Die *die, enum die_state state);
>  void die_map_add_string(struct die *pd, const char *str);
>  void die_map_add_linebreak(struct die *pd, int linebreak);
> +void die_map_for_each(die_map_callback_t func, void *arg);
>  void die_map_add_die(struct die *pd, struct die *child);
>  void die_map_free(void);
>  
> @@ -228,4 +241,10 @@ int process_die_container(struct state *state, struct die *cache,
>  
>  void process_cu(Dwarf_Die *cudie);
>  
> +/*
> + * types.c
> + */
> +
> +void generate_symtypes(FILE *file);
> +
>  #endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index 6cb99b8769ea..e414257333e5 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -92,6 +92,7 @@ void symbol_read_exports(FILE *file)
>  		sym = xcalloc(1, sizeof(struct symbol));
>  		sym->name = name;
>  		sym->addr.section = SHN_UNDEF;
> +		sym->state = SYMBOL_UNPROCESSED;
>  
>  		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
>  		++nsym;
> @@ -107,7 +108,8 @@ static void get_symbol(struct symbol *sym, void *arg)
>  {
>  	struct symbol **res = arg;
>  
> -	*res = sym;
> +	if (sym->state == SYMBOL_UNPROCESSED)
> +		*res = sym;
>  }

What is the reason to check that the symbol is in the unprocessed state
here?

>  
>  struct symbol *symbol_get(const char *name)
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
> new file mode 100644
> index 000000000000..c05811299eba
> --- /dev/null
> +++ b/scripts/gendwarfksyms/types.c
> @@ -0,0 +1,359 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +static struct expansion_cache expansion_cache;
> +
> +/*
> + * A simple linked list of shared or owned strings to avoid copying strings
> + * around when not necessary.
> + */
> +struct type_list_entry {
> +	const char *str;
> +	void *owned;
> +	struct list_head list;
> +};
> +
> +static void type_list_free(struct list_head *list)
> +{
> +	struct type_list_entry *entry;
> +	struct type_list_entry *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, list, list) {
> +		if (entry->owned)
> +			free(entry->owned);
> +		free(entry);
> +	}
> +
> +	INIT_LIST_HEAD(list);
> +}
> +
> +static int type_list_append(struct list_head *list, const char *s, void *owned)
> +{
> +	struct type_list_entry *entry;
> +
> +	if (!s)
> +		return 0;
> +
> +	entry = xmalloc(sizeof(struct type_list_entry));
> +	entry->str = s;
> +	entry->owned = owned;
> +	list_add_tail(&entry->list, list);
> +
> +	return strlen(entry->str);
> +}
> +
> +static void type_list_write(struct list_head *list, FILE *file)
> +{
> +	struct type_list_entry *entry;
> +
> +	list_for_each_entry(entry, list, list) {
> +		if (entry->str)
> +			checkp(fputs(entry->str, file));
> +	}
> +}
> +
> +/*
> + * An expanded type string in symtypes format.
> + */
> +struct type_expansion {
> +	char *name;
> +	size_t len;
> +	struct list_head expanded;
> +	struct hlist_node hash;
> +};
> +
> +static void type_expansion_init(struct type_expansion *type)
> +{
> +	type->name = NULL;
> +	type->len = 0;
> +	INIT_LIST_HEAD(&type->expanded);
> +}
> +
> +static inline void type_expansion_free(struct type_expansion *type)
> +{
> +	free(type->name);
> +	type->name = NULL;
> +	type->len = 0;
> +	type_list_free(&type->expanded);
> +}
> +
> +static void type_expansion_append(struct type_expansion *type, const char *s,
> +				  void *owned)
> +{
> +	type->len += type_list_append(&type->expanded, s, owned);
> +}
> +
> +/*
> + * type_map -- the longest expansions for each type.
> + *
> + * const char *name -> struct type_expansion *
> + */
> +#define TYPE_HASH_BITS 16
> +static HASHTABLE_DEFINE(type_map, 1 << TYPE_HASH_BITS);
> +
> +static int type_map_get(const char *name, struct type_expansion **res)
> +{
> +	struct type_expansion *e;
> +
> +	hash_for_each_possible(type_map, e, hash, hash_str(name)) {
> +		if (!strcmp(name, e->name)) {
> +			*res = e;
> +			return 0;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void type_map_add(const char *name, struct type_expansion *type)
> +{
> +	struct type_expansion *e;
> +
> +	if (type_map_get(name, &e)) {
> +		e = xmalloc(sizeof(struct type_expansion));
> +		type_expansion_init(e);
> +		e->name = xstrdup(name);
> +
> +		hash_add(type_map, &e->hash, hash_str(e->name));
> +
> +		if (dump_types)
> +			debug("adding %s", e->name);
> +	} else {
> +		/* Use the longest available expansion */
> +		if (type->len <= e->len)
> +			return;
> +
> +		type_list_free(&e->expanded);
> +
> +		if (dump_types)
> +			debug("replacing %s", e->name);
> +	}
> +
> +	/* Take ownership of type->expanded */
> +	list_replace_init(&type->expanded, &e->expanded);
> +	e->len = type->len;
> +
> +	if (dump_types) {
> +		checkp(fputs(e->name, stderr));
> +		checkp(fputs(" ", stderr));
> +		type_list_write(&e->expanded, stderr);
> +		checkp(fputs("\n", stderr));
> +	}
> +}
> +
> +static void type_map_write(FILE *file)
> +{
> +	struct type_expansion *e;
> +	struct hlist_node *tmp;
> +
> +	if (!file)
> +		return;
> +
> +	hash_for_each_safe(type_map, e, tmp, hash) {
> +		checkp(fputs(e->name, file));
> +		checkp(fputs(" ", file));
> +		type_list_write(&e->expanded, file);
> +		checkp(fputs("\n", file));
> +	}
> +}
> +
> +static void type_map_free(void)
> +{
> +	struct type_expansion *e;
> +	struct hlist_node *tmp;
> +
> +	hash_for_each_safe(type_map, e, tmp, hash) {
> +		type_expansion_free(e);
> +		free(e);
> +	}
> +
> +	hash_init(type_map);
> +}
> +
> +/*
> + * Type reference format: <prefix>#<name>, where prefix:
> + * 	s -> structure
> + * 	u -> union
> + * 	e -> enum
> + * 	t -> typedef
> + *
> + * Names with spaces are additionally wrapped in single quotes.
> + */
> +static char get_type_prefix(int tag)
> +{
> +	switch (tag) {
> +	case DW_TAG_class_type:
> +	case DW_TAG_structure_type:
> +		return 's';
> +	case DW_TAG_union_type:
> +		return 'u';
> +	case DW_TAG_enumeration_type:
> +		return 'e';
> +	case DW_TAG_typedef_type:
> +		return 't';
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static char *get_type_name(struct die *cache)
> +{
> +	const char *quote;
> +	char prefix;
> +	char *name;
> +
> +	if (cache->state == DIE_INCOMPLETE) {
> +		warn("found incomplete cache entry: %p", cache);
> +		return NULL;
> +	}
> +	if (!cache->fqn || !*cache->fqn)
> +		return NULL;
> +
> +	prefix = get_type_prefix(cache->tag);
> +	if (!prefix)
> +		return NULL;
> +
> +	/* Wrap names with spaces in single quotes */
> +	quote = strstr(cache->fqn, " ") ? "'" : "";
> +
> +	/* <prefix>#<type_name>\0 */
> +	if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, quote) < 0)
> +		error("asprintf failed for '%s'", cache->fqn);
> +
> +	return name;
> +}
> +
> +static void __type_expand(struct die *cache, struct type_expansion *type,
> +			  bool recursive);
> +
> +static void type_expand_child(struct die *cache, struct type_expansion *type,
> +			      bool recursive)
> +{
> +	struct type_expansion child;
> +	char *name;
> +
> +	name = get_type_name(cache);
> +	if (!name) {
> +		__type_expand(cache, type, recursive);
> +		return;
> +	}
> +
> +	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
> +		__cache_mark_expanded(&expansion_cache, cache->addr);
> +		type_expansion_init(&child);
> +		__type_expand(cache, &child, true);
> +		type_map_add(name, &child);
> +		type_expansion_free(&child);
> +	}
> +
> +	type_expansion_append(type, name, name);
> +}
> +
> +static void __type_expand(struct die *cache, struct type_expansion *type,
> +			  bool recursive)
> +{
> +	struct die_fragment *df;
> +	struct die *child;
> +
> +	list_for_each_entry(df, &cache->fragments, list) {
> +		switch (df->type) {
> +		case FRAGMENT_STRING:
> +			type_expansion_append(type, df->data.str, NULL);
> +			break;
> +		case FRAGMENT_DIE:
> +			/* Use a complete die_map expansion if available */
> +			if (__die_map_get(df->data.addr, DIE_COMPLETE,
> +					  &child) &&
> +			    __die_map_get(df->data.addr, DIE_UNEXPANDED,
> +					  &child))
> +				error("unknown child: %" PRIxPTR,
> +				      df->data.addr);
> +
> +			type_expand_child(child, type, recursive);
> +			break;
> +		case FRAGMENT_LINEBREAK:
> +			/*
> +			 * Keep whitespace in the symtypes format, but avoid
> +			 * repeated spaces.
> +			 */
> +			if (list_is_last(&df->list, &cache->fragments) ||
> +			    list_next_entry(df, list)->type !=
> +				    FRAGMENT_LINEBREAK)
> +				type_expansion_append(type, " ", NULL);
> +			break;
> +		default:
> +			error("empty die_fragment in %p", cache);
> +		}
> +	}
> +}
> +
> +static void type_expand(struct die *cache, struct type_expansion *type,
> +			bool recursive)
> +{
> +	type_expansion_init(type);
> +	__type_expand(cache, type, recursive);
> +	cache_clear_expanded(&expansion_cache);
> +}
> +
> +static void expand_type(struct die *cache, void *arg)
> +{
> +	struct type_expansion type;
> +	char *name;
> +
> +	if (cache->mapped)
> +		return;
> +
> +	cache->mapped = true;
> +
> +	/*
> +	 * Skip unexpanded die_map entries if there's a complete
> +	 * expansion available for this DIE.
> +	 */
> +	if (cache->state == DIE_UNEXPANDED &&
> +	    !__die_map_get(cache->addr, DIE_COMPLETE, &cache)) {
> +		if (cache->mapped)
> +			return;
> +
> +		cache->mapped = true;
> +	}
> +
> +	name = get_type_name(cache);
> +	if (!name)
> +		return;
> +
> +	debug("%s", name);
> +	type_expand(cache, &type, true);
> +	type_map_add(name, &type);
> +
> +	type_expansion_free(&type);
> +	free(name);
> +}
> +
> +void generate_symtypes(FILE *file)
> +{
> +	hash_init(expansion_cache.cache);
> +
> +	/*
> +	 * die_map processing:
> +	 *
> +	 *   1. die_map contains all types referenced in exported symbol
> +	 *      signatures, but can contain duplicates just like the original
> +	 *      DWARF, and some references may not be fully expanded depending
> +	 *      on how far we processed the DIE tree for that specific symbol.
> +	 *
> +	 *      For each die_map entry, find the longest available expansion,
> +	 *      and add it to type_map.
> +	 */
> +	die_map_for_each(expand_type, NULL);
> +
> +	/*
> +	 *   2. If a symtypes file is requested, write type_map contents to
> +	 *      the file.
> +	 */
> +	type_map_write(file);
> +	type_map_free();
> +}

-- 
Thanks,
Petr

