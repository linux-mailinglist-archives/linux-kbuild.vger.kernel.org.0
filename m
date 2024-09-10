Return-Path: <linux-kbuild+bounces-3500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D8973ABE
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 16:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515911F25A28
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 14:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACFA1925B4;
	Tue, 10 Sep 2024 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="deskwkG4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E05195B1A
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980337; cv=none; b=sjPwWI/wpQ1KzH6BWiw/uEmev0JDEXLUlaOQ5e8AvqWhK/cQXlddM5mo5GzX5uwFWR/Pt0YGeLWeDZ8c6druOBE8/3FQLJ35YIYGLxmMR5ifL9OBryw96zu2eN8kU8pW/pqqU+klXSh4xth4kwrL76BA8opfvdqy3naNHykoiwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980337; c=relaxed/simple;
	bh=/GV/Uec9sr9xNFODUvqnlSmSNWsgJ/UZoKai+ORkUeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7EcwLVa1qhGegXHAFKLRQeW1XqX91bAtq8JAu4eiX/eMxNlHqIK4yQ12ndoJ0DDHCBvLE9mLkyLp694+wrLh3EAHtgnJ0bl8OMXQEKQnVFWvGJL2Q/TM6GVwKgOJATjGfhUgGoa6nM/KhxLuINJDZfIcnSrbgreIyh4W3OxePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=deskwkG4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so4416515f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725980332; x=1726585132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sp3MXFDZlt6vbQiM7vaO5SxTVHpWpvwPNLHOgMjEHbA=;
        b=deskwkG4V+WiSkCoNFXMGW1ZFm24W7D4gzxeDCy5nWse0CZ7nf0eRN3ksmHdDhjFkk
         G4gsZjvIFXx+MbE/7BSblJUuUKHr/cxJWW+aeYbS3Ak9RIzF1o61Q3LXAB5dTZKLpZty
         MLwUZXGSYe5nr0gqkiKZ9lc8M7nKvbG/jBTKBDY+FrZnyZSZ9qtKBw0lKveUgr4gS+ys
         hK/DxBXEN5yuV92K9o9AqmlM1jBwQwjCJzLbKMxGh7FDyfxta2teMgEYzbELj7NKlH7T
         izBJSfbJpFe7ZGXIK9ht0qbo5fRCXelRjcJfJb40zjH/8IpQuR4dOgjNJhMFhUt0GxWP
         dyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980332; x=1726585132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sp3MXFDZlt6vbQiM7vaO5SxTVHpWpvwPNLHOgMjEHbA=;
        b=YEysCtB3NrAAMuppF1LrlnUFU8J+Mi7TtCS+tFr1JR7s/Q9vtkZ8Kx+X60gu3mTG9O
         JuoFoGUHWUhnwnnjOImrKtyGwBgKUqAPxK9YJchnLRKRMZ7LtF742G3P0dFMOqcVkpTk
         qTxSbeaABi2CkhqCjUNMBSyy+ci0zTL6Unu7AanfYCDRyertsTLeHyPhLVyift/Fy/oV
         zU/Ed3MoD4JGYgAIOIvm+96n6ZtZ1naamq3kUNNkjIR5A/laBMYoE5Zu+L7emERXegme
         Z1rxgRxHkD/Q3g1sr9+Qv5ZHB+aEjAFV37TfDutLDPMKY8xnVkcZ6iHQLQ/tQgPZJLp2
         BsdA==
X-Forwarded-Encrypted: i=1; AJvYcCXLbjyWqZGrOTKWciCQOoZJ/j8uBcZ6+NQEkT3y9/CFDw1eVaT5US8rETlRquhYLzqhjBx+wO3hg0Nz3lA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vJfb0omzrC5ZY71uqj546Vk4W6br7AaH1C24sZ0BXi9MF8q2
	4NV0BW899aBzKpBSy1cdVYPgIB5/LGxFS1w/bElXb363YsCKpM7TriDfVehdlb8=
X-Google-Smtp-Source: AGHT+IEmfFg6texT+yrc1F3GDCS7YwM8VAQtthZq4sQQe3XEOVoBuXGof1o5/Ugbns2jMFbkTVM5vQ==
X-Received: by 2002:a5d:64ce:0:b0:374:c71c:3dc0 with SMTP id ffacd0b85a97d-37892466d5bmr10062878f8f.52.1725980330901;
        Tue, 10 Sep 2024 07:58:50 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895665babsm9234638f8f.47.2024.09.10.07.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:58:49 -0700 (PDT)
Message-ID: <ac7f8644-453a-4156-b357-ba266a7a0ca6@suse.com>
Date: Tue, 10 Sep 2024 16:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/19] gendwarfksyms: Add symtypes output
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
 <20240815173903.4172139-34-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-34-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
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

Thank you for adding this output to the tool.

> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/Makefile        |   1 +
>  scripts/gendwarfksyms/die.c           |  13 +
>  scripts/gendwarfksyms/dwarf.c         |  14 +-
>  scripts/gendwarfksyms/gendwarfksyms.c |  28 +-
>  scripts/gendwarfksyms/gendwarfksyms.h |  21 +-
>  scripts/gendwarfksyms/symbols.c       |  11 +-
>  scripts/gendwarfksyms/types.c         | 439 ++++++++++++++++++++++++++
>  7 files changed, 517 insertions(+), 10 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/types.c
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index 681b42441840..4866a2fd0e46 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -5,6 +5,7 @@ gendwarfksyms-objs += cache.o
>  gendwarfksyms-objs += die.o
>  gendwarfksyms-objs += dwarf.o
>  gendwarfksyms-objs += symbols.o
> +gendwarfksyms-objs += types.o
>  
>  HOST_EXTRACFLAGS := -I $(srctree)/tools/include
>  HOSTLDLIBS_gendwarfksyms := -ldw -lelf
> diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
> index fdd52df88fdd..e40f04b70f7f 100644
> --- a/scripts/gendwarfksyms/die.c
> +++ b/scripts/gendwarfksyms/die.c
> @@ -85,6 +85,19 @@ static void reset_die(struct die *cd)
>  	cd->list = NULL;
>  }
>  
> +int die_map_for_each(die_map_callback_t func, void *arg)
> +{
> +	struct die *cd;
> +	struct hlist_node *tmp;
> +	int i;
> +
> +	hash_for_each_safe(die_map, i, tmp, cd, hash) {
> +		check(func(cd, arg));
> +	}
> +
> +	return 0;
> +}
> +
>  void die_map_free(void)
>  {
>  	struct hlist_node *tmp;
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 9bca21a71639..62241cc97a76 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -60,11 +60,11 @@ static bool is_export_symbol(struct state *state, Dwarf_Die *die)
>  	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
>  		source = &origin;
>  
> -	state->sym = symbol_get(get_name(die));
> +	state->sym = symbol_get_unprocessed(get_name(die));
>  
>  	/* Look up using the origin name if there are no matches. */
>  	if (!state->sym && source != die)
> -		state->sym = symbol_get(get_name(source));
> +		state->sym = symbol_get_unprocessed(get_name(source));
>  
>  	state->die = *source;
>  	return !!state->sym;
> @@ -384,6 +384,7 @@ static int process_subroutine_type(struct state *state, struct die *cache,
>  	return check(__process_subroutine_type(state, cache, die,
>  					       "subroutine_type"));
>  }
> +
>  static int process_variant_type(struct state *state, struct die *cache,
>  				Dwarf_Die *die)
>  {
> @@ -695,14 +696,16 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
>  static int process_subprogram(struct state *state, Dwarf_Die *die)
>  {
>  	check(__process_subroutine_type(state, NULL, die, "subprogram"));
> -	return check(process(state, NULL, ";\n"));
> +	state->sym->state = MAPPED;
> +	return 0;
>  }
>  
>  static int process_variable(struct state *state, Dwarf_Die *die)
>  {
>  	check(process(state, NULL, "variable "));
>  	check(process_type_attr(state, NULL, die));
> -	return check(process(state, NULL, ";\n"));
> +	state->sym->state = MAPPED;
> +	return 0;
>  }
>  
>  static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
> @@ -757,6 +760,9 @@ static int process_exported_symbols(struct state *state, struct die *cache,
>  		else
>  			check(process_variable(state, &state->die));
>  
> +		if (dump_dies)
> +			fputs("\n", stderr);
> +
>  		cache_clear_expanded(&state->expansion_cache);
>  		return 0;
>  	default:
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index 1349e592783b..6a219a54c342 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -20,6 +20,11 @@ bool debug;
>  bool dump_dies;
>  /* Print out inline debugging information about die_map changes */
>  bool dump_die_map;
> +/* Print out type_map contents */
> +bool dump_types;
> +/* Produce a symtypes file */
> +bool symtypes;
> +static const char *symtypes_file;
>  
>  static const struct {
>  	const char *arg;
> @@ -29,6 +34,8 @@ static const struct {
>  	{ "--debug", &debug, NULL },
>  	{ "--dump-dies", &dump_dies, NULL },
>  	{ "--dump-die-map", &dump_die_map, NULL },
> +	{ "--dump-types", &dump_types, NULL },
> +	{ "--symtypes", &symtypes, &symtypes_file },
>  };
>  
>  static int usage(void)
> @@ -79,6 +86,7 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
>  	Dwarf_Die cudie;
>  	Dwarf_CU *cu = NULL;
>  	Dwarf *dbg;
> +	FILE *symfile = arg;
>  	int res;
>  
>  	debug("%s", name);
> @@ -100,6 +108,10 @@ static int process_modules(Dwfl_Module *mod, void **userdata, const char *name,
>  		check(process_module(mod, dbg, &cudie));
>  	} while (cu);
>  
> +	/*
> +	 * Use die_map to expand type strings and write them to `symfile`.
> +	 */
> +	check(generate_symtypes(symfile));
>  	die_map_free();
>  
>  	return DWARF_CB_OK;
> @@ -112,6 +124,7 @@ static const Dwfl_Callbacks callbacks = {
>  
>  int main(int argc, const char **argv)
>  {
> +	FILE *symfile = NULL;
>  	unsigned int n;
>  
>  	if (parse_options(argc, argv) < 0)
> @@ -122,6 +135,16 @@ int main(int argc, const char **argv)
>  
>  	check(symbol_read_exports(stdin));
>  
> +	if (symtypes_file) {
> +		symfile = fopen(symtypes_file, "w+");

The file is sufficient to open only for writing.

> +
> +		if (!symfile) {
> +			error("fopen failed for '%s': %s", symtypes_file,
> +			      strerror(errno));
> +			return -1;
> +		}
> +	}
> +
>  	for (n = 0; n < object_count; n++) {
>  		Dwfl *dwfl;
>  		int fd;
> @@ -151,7 +174,7 @@ int main(int argc, const char **argv)
>  
>  		dwfl_report_end(dwfl, NULL, NULL);
>  
> -		if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
> +		if (dwfl_getmodules(dwfl, &process_modules, symfile, 0)) {
>  			error("dwfl_getmodules failed for '%s'",
>  			      object_files[n]);
>  			return -1;
> @@ -161,5 +184,8 @@ int main(int argc, const char **argv)
>  		close(fd);
>  	}
>  
> +	if (symfile)
> +		fclose(symfile);
> +
>  	return 0;
>  }

The fclose() call should be wrapped in check() to catch a situation when
flushing the stream potentially failed.

> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 7cd907e3d5e3..6edbd6478e0f 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -22,6 +22,8 @@
>  extern bool debug;
>  extern bool dump_dies;
>  extern bool dump_die_map;
> +extern bool dump_types;
> +extern bool symtypes;
>  
>  #define MAX_INPUT_FILES 128
>  
> @@ -89,6 +91,12 @@ extern bool dump_die_map;
>  #define SYMBOL_PTR_PREFIX "__gendwarfksyms_ptr_"
>  #define SYMBOL_PTR_PREFIX_LEN (sizeof(SYMBOL_PTR_PREFIX) - 1)
>  
> +/* See dwarf.c:is_declaration */
> +#define SYMBOL_DECLONLY_PREFIX "__gendwarfksyms_declonly_"
> +#define SYMBOL_DECLONLY_PREFIX_LEN (sizeof(SYMBOL_DECLONLY_PREFIX) - 1)

Nit: These defines should go into the patch 15/19 "gendwarfksyms: Add
support for declaration-only data structures".

> +
> +enum symbol_state { UNPROCESSED, MAPPED };
> +
>  struct symbol_addr {
>  	uint32_t section;
>  	Elf64_Addr address;
> @@ -109,12 +117,14 @@ struct symbol {
>  	struct symbol_addr addr;
>  	struct hlist_node addr_hash;
>  	struct hlist_node name_hash;
> +	enum symbol_state state;
> +	uintptr_t die_addr;
>  };
>  
>  extern bool is_symbol_ptr(const char *name);
>  extern int symbol_read_exports(FILE *file);
>  extern int symbol_read_symtab(int fd);
> -extern struct symbol *symbol_get(const char *name);
> +extern struct symbol *symbol_get_unprocessed(const char *name);
>  
>  /*
>   * die.c
> @@ -157,12 +167,15 @@ struct die {
>  	struct hlist_node hash;
>  };
>  
> +typedef int (*die_map_callback_t)(struct die *, void *arg);
> +
>  extern int __die_map_get(uintptr_t addr, enum die_state state,
>  			 struct die **res);
>  extern int die_map_get(Dwarf_Die *die, enum die_state state, struct die **res);
>  extern int die_map_add_string(struct die *pd, const char *str);
>  extern int die_map_add_linebreak(struct die *pd, int linebreak);
>  extern int die_map_add_die(struct die *pd, struct die *child);
> +extern int die_map_for_each(die_map_callback_t func, void *arg);
>  extern void die_map_free(void);
>  
>  /*
> @@ -222,4 +235,10 @@ extern int process_die_container(struct state *state, struct die *cache,
>  
>  extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);
>  
> +/*
> + * types.c
> + */
> +
> +extern int generate_symtypes(FILE *file);
> +
>  #endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index d6d016458ae1..8cc04e6295a7 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -117,6 +117,7 @@ int symbol_read_exports(FILE *file)
>  
>  		sym->name = name;
>  		sym->addr.section = SHN_UNDEF;
> +		sym->state = UNPROCESSED;
>  		name = NULL;
>  
>  		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
> @@ -132,19 +133,21 @@ int symbol_read_exports(FILE *file)
>  	return 0;
>  }
>  
> -static int get_symbol(struct symbol *sym, void *arg)
> +static int get_unprocessed(struct symbol *sym, void *arg)
>  {
>  	struct symbol **res = arg;
>  
> -	*res = sym;
> +	if (sym->state == UNPROCESSED)
> +		*res = sym;
> +
>  	return 0;
>  }
>  
> -struct symbol *symbol_get(const char *name)
> +struct symbol *symbol_get_unprocessed(const char *name)
>  {
>  	struct symbol *sym = NULL;
>  
> -	for_each(name, false, get_symbol, &sym);
> +	for_each(name, false, get_unprocessed, &sym);
>  	return sym;
>  }
>  
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
> new file mode 100644
> index 000000000000..7b9997d8322d
> --- /dev/null
> +++ b/scripts/gendwarfksyms/types.c
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +#include "crc32.h"
> +
> +static struct expansion_cache expansion_cache;
> +
> +/*
> + * A simple linked list of shared or owned strings to avoid copying strings
> + * around when not necessary.
> + */
> +struct type_list {
> +	const char *str;
> +	void *owned;
> +	struct type_list *next;
> +};
> +
> +static struct type_list *type_list_alloc(void)
> +{
> +	struct type_list *list;
> +
> +	list = calloc(1, sizeof(struct type_list));
> +	if (!list)
> +		error("calloc failed");
> +
> +	return list;
> +}
> +
> +static void type_list_free(struct type_list *list)
> +{
> +	struct type_list *tmp;
> +
> +	while (list) {
> +		if (list->owned)
> +			free(list->owned);
> +
> +		tmp = list;
> +		list = list->next;
> +		free(tmp);
> +	}
> +}
> +
> +static int type_list_append(struct type_list *list, const char *s, void *owned)
> +{
> +	if (!list || !s)
> +		return 0;
> +
> +	while (list->next)
> +		list = list->next;
> +
> +	if (list->str) {
> +		list->next = type_list_alloc();
> +
> +		if (!list->next) {
> +			error("type_list_alloc failed");
> +			return -1;
> +		}
> +
> +		list = list->next;
> +	}
> +
> +	list->str = s;
> +	list->owned = owned;
> +
> +	return strlen(list->str);
> +}
> +
> +static int type_list_write(struct type_list *list, FILE *file)
> +{
> +	while (list) {
> +		if (list->str)
> +			checkp(fputs(list->str, file));
> +		list = list->next;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * An expanded type string in symtypes format.
> + */
> +struct type_expansion {
> +	char *name;
> +	struct type_list *expanded;
> +	struct type_list *last;
> +	size_t len;
> +	struct hlist_node hash;
> +};

I found the manipulation of type_expansion.expanded and
type_expansion.last somewhat strange.

The list starts already with one element in type_expansion_init(). This
is apparently to make the last pointer valid. This element is however
empty and gets only assigned on the first call to type_list_append().
Other elements are then added normally, always assigned.

Perhaps consider using a regular list implementation, similarly to what
was discussed under the patch 06/19 "gendwarfksyms: Add a cache for
processed DIEs".

> +
> +static int type_expansion_init(struct type_expansion *type, bool alloc)
> +{
> +	memset(type, 0, sizeof(struct type_expansion));
> +	if (alloc) {
> +		type->expanded = type_list_alloc();
> +		if (!type->expanded)
> +			return -1;
> +
> +		type->last = type->expanded;
> +	}
> +	return 0;
> +}
> +
> +static inline void type_expansion_free(struct type_expansion *type)
> +{
> +	free(type->name);
> +	type_list_free(type->expanded);
> +	type_expansion_init(type, false);
> +}
> +
> +static int type_expansion_append(struct type_expansion *type, const char *s,
> +				 void *owned)
> +{
> +	type->len += checkp(type_list_append(type->last, s, owned));
> +
> +	if (type->last->next)
> +		type->last = type->last->next;
> +
> +	return 0;
> +}
> +
> +/*
> + * type_map -- the longest expansions for each type.
> + *
> + * const char *name -> struct type_expansion *
> + */
> +#define TYPE_HASH_BITS 16
> +static DEFINE_HASHTABLE(type_map, TYPE_HASH_BITS);
> +
> +static int type_map_get(const char *name, struct type_expansion **res)
> +{
> +	struct type_expansion *e;
> +
> +	hash_for_each_possible(type_map, e, hash, name_hash(name)) {
> +		if (!strcmp(name, e->name)) {
> +			*res = e;
> +			return 0;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static int type_map_add(const char *name, struct type_expansion *type)
> +{
> +	struct type_expansion *e;
> +
> +	if (type_map_get(name, &e)) {
> +		e = malloc(sizeof(struct type_expansion));
> +		if (!e) {
> +			error("malloc failed");
> +			return -1;
> +		}
> +
> +		type_expansion_init(e, false);
> +
> +		e->name = strdup(name);
> +		if (!e->name) {
> +			error("strdup failed");
> +			return -1;
> +		}
> +
> +		hash_add(type_map, &e->hash, name_hash(e->name));
> +
> +		if (dump_types)
> +			debug("adding %s", e->name);
> +	} else {
> +		/* Use the longest available expansion */
> +		if (type->len <= e->len)
> +			return 0;
> +
> +		type_list_free(e->expanded);
> +
> +		if (dump_types)
> +			debug("replacing %s", e->name);
> +	}
> +
> +	/* Take ownership of type->expanded */
> +	e->expanded = type->expanded;
> +	e->last = type->last;
> +	e->len = type->len;
> +	type->expanded = NULL;
> +	type->last = NULL;
> +	type->len = 0;
> +
> +	if (dump_types) {
> +		fputs(e->name, stderr);
> +		fputs(" ", stderr);
> +		type_list_write(e->expanded, stderr);
> +		fputs("\n", stderr);
> +	}
> +
> +	return 0;
> +}
> +
> +static int type_map_write(FILE *file)
> +{
> +	struct type_expansion *e;
> +	struct hlist_node *tmp;
> +	int i;
> +
> +	if (!file)
> +		return 0;
> +
> +	hash_for_each_safe(type_map, i, tmp, e, hash) {
> +		checkp(fputs(e->name, file));
> +		checkp(fputs(" ", file));
> +		type_list_write(e->expanded, file);
> +		checkp(fputs("\n", file));
> +	}
> +
> +	return 0;
> +}
> +
> +static void type_map_free(void)
> +{
> +	struct type_expansion *e;
> +	struct hlist_node *tmp;
> +	int i;
> +
> +	hash_for_each_safe(type_map, i, tmp, e, hash) {
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
> +static inline bool is_type_prefix(const char *s)
> +{
> +	return (s[0] == 's' || s[0] == 'u' || s[0] == 'e' || s[0] == 't') &&
> +	       s[1] == '#';
> +}
> +
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
> +	const char *format;
> +	char prefix;
> +	char *name;
> +	size_t len;
> +
> +	if (cache->state == INCOMPLETE) {
> +		warn("found incomplete cache entry: %p", cache);
> +		return NULL;
> +	}
> +	if (!cache->fqn)
> +		return NULL;
> +
> +	prefix = get_type_prefix(cache->tag);
> +	if (!prefix)
> +		return NULL;
> +
> +	/* <prefix>#<type_name>\0 */
> +	len = 2 + strlen(cache->fqn) + 1;
> +
> +	/* Wrap names with spaces in single quotes */
> +	if (strstr(cache->fqn, " ")) {
> +		format = "%c#'%s'";
> +		len += 2;
> +	} else {
> +		format = "%c#%s";
> +	}
> +
> +	name = malloc(len);
> +	if (!name) {
> +		error("malloc failed");
> +		return NULL;
> +	}
> +
> +	if (snprintf(name, len, format, prefix, cache->fqn) >= len) {
> +		error("snprintf failed for '%s' (length %zu)", cache->fqn,
> +		      len);
> +		free(name);
> +		return NULL;
> +	}

This could be quite simplified:

const char *quote = strstr(cache->fqn, " ") != NULL ? "'" : "";
if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn, quote) < 0)
	[...]

> +
> +	return name;
> +}
> +
> +static int __type_expand(struct die *cache, struct type_expansion *type,
> +			 bool recursive);
> +
> +static int type_expand_child(struct die *cache, struct type_expansion *type,
> +			     bool recursive)
> +{
> +	struct type_expansion child;
> +	char *name;
> +
> +	name = get_type_name(cache);
> +	if (!name)
> +		return check(__type_expand(cache, type, recursive));
> +
> +	if (recursive && !__cache_was_expanded(&expansion_cache, cache->addr)) {
> +		check(__cache_mark_expanded(&expansion_cache, cache->addr));
> +		check(type_expansion_init(&child, true));
> +		check(__type_expand(cache, &child, true));
> +		check(type_map_add(name, &child));
> +		type_expansion_free(&child);
> +	}
> +
> +	check(type_expansion_append(type, name, name));
> +	return 0;
> +}
> +
> +static int __type_expand(struct die *cache, struct type_expansion *type,
> +			 bool recursive)
> +{
> +	struct die_fragment *df = cache->list;
> +	struct die *child;
> +
> +	while (df) {
> +		switch (df->type) {
> +		case STRING:
> +			check(type_expansion_append(type, df->data.str, NULL));
> +			break;
> +		case DIE:
> +			/* Use a complete die_map expansion if available */
> +			if (__die_map_get(df->data.addr, COMPLETE, &child) &&
> +			    __die_map_get(df->data.addr, UNEXPANDED, &child)) {
> +				error("unknown child: %" PRIxPTR,
> +				      df->data.addr);
> +				return -1;
> +			}
> +
> +			check(type_expand_child(child, type, recursive));
> +			break;
> +		case LINEBREAK:
> +			/*
> +			 * Keep whitespace in the symtypes format, but avoid
> +			 * repeated spaces.
> +			 */
> +			if (!df->next || df->next->type != LINEBREAK)
> +				check(type_expansion_append(type, " ", NULL));
> +			break;
> +		default:
> +			error("empty die_fragment in %p", cache);
> +			return -1;
> +		}
> +
> +		df = df->next;
> +	}
> +
> +	return 0;
> +}
> +
> +static int type_expand(struct die *cache, struct type_expansion *type,
> +		       bool recursive)
> +{
> +	check(type_expansion_init(type, true));
> +	check(__type_expand(cache, type, recursive));
> +	cache_clear_expanded(&expansion_cache);
> +	return 0;
> +}
> +
> +static int expand_type(struct die *cache, void *arg)
> +{
> +	struct type_expansion type;
> +	char *name;
> +
> +	/*
> +	 * Skip unexpanded die_map entries if there's a complete
> +	 * expansion available for this DIE.
> +	 */
> +	if (cache->state == UNEXPANDED)
> +		__die_map_get(cache->addr, COMPLETE, &cache);
> +
> +	if (cache->mapped)
> +		return 0;
> +
> +	cache->mapped = true;
> +
> +	name = get_type_name(cache);
> +	if (!name)
> +		return 0;
> +
> +	debug("%s", name);
> +	check(type_expand(cache, &type, true));
> +	check(type_map_add(name, &type));
> +
> +	type_expansion_free(&type);
> +	free(name);
> +
> +	return 0;
> +}
> +
> +int generate_symtypes(FILE *file)
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
> +	check(die_map_for_each(expand_type, NULL));
> +
> +	/*
> +	 *   2. If a symtypes file is requested, write type_map contents to
> +	 *      the file.
> +	 */
> +	check(type_map_write(file));
> +	type_map_free();
> +
> +	return 0;
> +}

-- 
Thanks,
Petr

