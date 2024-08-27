Return-Path: <linux-kbuild+bounces-3242-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868F960AAD
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 14:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA93B23AC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 12:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0871BB6A9;
	Tue, 27 Aug 2024 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q4nVfgRA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9F1BB687
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762436; cv=none; b=c1tJsxqzWuypLzgH02r1KggkTtjU80XxfhbPdvf/FNwbyylF2Q/TImbnQlKC/cac5ULUMoHuAK5iuYoVKRVsDzAdkLPyLinw2yRS5W6oIm3SCM2yXEuaiGETkBWLdJv2cvv3OItMBqTsrhMTOagXjNRSjthUXRwIKRaAYGd8y7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762436; c=relaxed/simple;
	bh=/PsGYidPx6+ERZmAziEKQOOY4l7eHfRbQ5ZJvgTJFS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmhpWsJMiOs8CZQhAKYPAqKLStNoRQWYYPP2qDle1qMLxvEhLbRXVW1jh5qYgh4EgToTMcFRpgB8F9VQ1zcYFgzBh19nyOA+th2i6oOxQF9NSnMa8kvZzquFmsmkW65EIvPA1UJSKpbxfkUuvngNGVwYUEeKXbJnEeBE17xlQi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q4nVfgRA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bf009cf4c0so5747531a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 05:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724762432; x=1725367232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zVOTmoRZ3AzmWugvFPF8grdlifA6e7LOITutJp+jd0=;
        b=Q4nVfgRAzI55Zy4CWaZEH1tCNburNPMn/l0ptbE6nVoq8Gfwo8fUB4q0S8oWiXJNew
         YYucGJNaw9MeM/ZlWaYFKVts+wQXhngvCGvIzn58Jsd5i+DkHEtUcd1EK1GCOugy9+JC
         28WZLvs8RCWw7gMOz5z3QooxwE/7HTXTiN6ZZ7Vby57s3CSc2/HoHmyPEnY8xp97ly0e
         vW/1X6nKPy6+dasu2fLULz5FK3aW+TyNJciUd1t1b22RsVoUErAYS8fBXatDlUQP+Bhj
         9IRKVnN7AAwx2omv6j9tbv58TV/ul4c6uneKzTo1Rff6fKmqhJ4HjuMuAOBEuYK8S6nN
         wh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724762432; x=1725367232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zVOTmoRZ3AzmWugvFPF8grdlifA6e7LOITutJp+jd0=;
        b=k2DKjQD+tF2r9Q+51TM98vsdm6zP7Y9iIyvcWQrDlAO86m/mcH9yqpm5cqnbo/HhCo
         tt0gkKwEgmctuLwpc11SnEJpCy9XkZ2z2akTaq0QP6dLAC7SJYVTkAR8wgPy2lTVPwW9
         3iphDHV3iFp+NyTlRNR0q3BVeJO8Y8Y0ytG6KFets6z99QVu9vi91JYB1M2MExHZnzdi
         qG4llwfoe21Lh/daVRzadcGjQpSHKnCzlQVYvepvCAwy3KMQ9hZD7WlSi2QTTHHlEb9m
         oNAyPporqgzxc+4GATU9B3qRqNf5+gKjajSEka6TJNID4ZjOmK16XJMhu2ZWeQqmqxAa
         549A==
X-Forwarded-Encrypted: i=1; AJvYcCX80+XaOel8XbP2ciFz6Nb52K4iH3KlKYIX1N4JTSETikeO+T27n04Cibjge+Hp8ip0oVpZhTGhaPg//0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNXskuBDVjdeII3DlyFCF3zLwHHKkKK1Xv8ajrooaHRuYlAgK
	vRQES0u6pXJbT6Sf37YMuO6+IGCNoxkS7rWWytr6Q+pGyjfJ9cGKlHudLUoFM2A=
X-Google-Smtp-Source: AGHT+IH6McW6hyGl6MR/gJhPXCODeA+z498UhPFdaJ7K9nt2nnEpjKiqvYziIFRATCpbd9fKRid2WA==
X-Received: by 2002:a17:906:6a23:b0:a7a:8e98:890d with SMTP id a640c23a62f3a-a86e39c9e11mr232226966b.16.1724762431563;
        Tue, 27 Aug 2024 05:40:31 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549cf94sm105628966b.80.2024.08.27.05.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 05:40:31 -0700 (PDT)
Message-ID: <d63ddefe-a6f6-4a5b-9330-11438fca8f9f@suse.com>
Date: Tue, 27 Aug 2024 14:40:30 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
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
 <20240815173903.4172139-24-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-24-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/gendwarfksyms.c |   2 +
>  scripts/gendwarfksyms/gendwarfksyms.h |   7 ++
>  scripts/gendwarfksyms/symbols.c       | 161 +++++++++++++++++++++++++-
>  3 files changed, 165 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index d209b237766b..e2f8ee5a4bf3 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -118,6 +118,8 @@ int main(int argc, const char **argv)
>  			return -1;
>  		}
>  
> +		check(symbol_read_symtab(fd));
> +
>  		dwfl = dwfl_begin(&callbacks);
>  		if (!dwfl) {
>  			error("dwfl_begin failed for '%s': %s", object_files[n],
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 03f3e408a839..cb9106dfddb9 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -61,6 +61,10 @@ extern bool debug;
>  /*
>   * symbols.c
>   */
> +struct symbol_addr {
> +	uint32_t section;
> +	Elf64_Addr address;
> +};
>  
>  static inline u32 name_hash(const char *name)
>  {
> @@ -69,10 +73,13 @@ static inline u32 name_hash(const char *name)
>  
>  struct symbol {
>  	const char *name;
> +	struct symbol_addr addr;
> +	struct hlist_node addr_hash;
>  	struct hlist_node name_hash;
>  };
>  
>  extern int symbol_read_exports(FILE *file);
> +extern int symbol_read_symtab(int fd);
>  extern struct symbol *symbol_get(const char *name);
>  
>  /*
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index 673ad9cf9e77..f96acb941196 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -6,11 +6,43 @@
>  #include "gendwarfksyms.h"
>  
>  #define SYMBOL_HASH_BITS 15
> +
> +/* struct symbol_addr -> struct symbol */
> +static DEFINE_HASHTABLE(symbol_addrs, SYMBOL_HASH_BITS);
> +/* name -> struct symbol */
>  static DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
>  
> +static inline u32 symbol_addr_hash(const struct symbol_addr *addr)
> +{
> +	return jhash(addr, sizeof(struct symbol_addr), 0);

I would be careful and avoid including the padding between
symbol_addr.section and symbol_addr.address in the hash calculation.

> +}
> +
>  typedef int (*symbol_callback_t)(struct symbol *, void *arg);
>  
> -static int for_each(const char *name, symbol_callback_t func, void *data)
> +static int __for_each_addr(struct symbol *sym, symbol_callback_t func,
> +			   void *data)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *match = NULL;
> +	int processed = 0;
> +
> +	hash_for_each_possible_safe(symbol_addrs, match, tmp, addr_hash,
> +				    symbol_addr_hash(&sym->addr)) {
> +		if (match == sym)
> +			continue; /* Already processed */
> +
> +		if (match->addr.section == sym->addr.section &&
> +		    match->addr.address == sym->addr.address) {
> +			check(func(match, data));
> +			++processed;
> +		}
> +	}
> +
> +	return processed;
> +}
> +
> +static int for_each(const char *name, bool name_only, symbol_callback_t func,
> +		    void *data)
>  {
>  	struct hlist_node *tmp;
>  	struct symbol *match;
> @@ -23,9 +55,13 @@ static int for_each(const char *name, symbol_callback_t func, void *data)
>  		if (strcmp(match->name, name))
>  			continue;
>  
> +		/* Call func for the match, and all address matches */
>  		if (func)
>  			check(func(match, data));
>  
> +		if (!name_only && match->addr.section != SHN_UNDEF)
> +			return checkp(__for_each_addr(match, func, data)) + 1;
> +
>  		return 1;
>  	}
>  
> @@ -34,7 +70,7 @@ static int for_each(const char *name, symbol_callback_t func, void *data)
>  
>  static bool is_exported(const char *name)
>  {
> -	return checkp(for_each(name, NULL, NULL)) > 0;
> +	return checkp(for_each(name, true, NULL, NULL)) > 0;
>  }
>  
>  int symbol_read_exports(FILE *file)
> @@ -57,13 +93,14 @@ int symbol_read_exports(FILE *file)
>  		if (is_exported(name))
>  			continue; /* Ignore duplicates */
>  
> -		sym = malloc(sizeof(struct symbol));
> +		sym = calloc(1, sizeof(struct symbol));
>  		if (!sym) {
> -			error("malloc failed");
> +			error("calloc failed");
>  			return -1;
>  		}
>  
>  		sym->name = name;
> +		sym->addr.section = SHN_UNDEF;
>  		name = NULL;
>  
>  		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
> @@ -91,6 +128,120 @@ struct symbol *symbol_get(const char *name)
>  {
>  	struct symbol *sym = NULL;
>  
> -	for_each(name, get_symbol, &sym);
> +	for_each(name, false, get_symbol, &sym);
>  	return sym;
>  }
> +
> +typedef int (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
> +				     Elf32_Word xndx, void *arg);
> +
> +static int elf_for_each_symbol(int fd, elf_symbol_callback_t func, void *arg)
> +{
> +	size_t sym_size;
> +	GElf_Shdr shdr_mem;
> +	GElf_Shdr *shdr;
> +	Elf_Data *xndx_data = NULL;
> +	Elf_Scn *scn;
> +	Elf *elf;
> +
> +	if (elf_version(EV_CURRENT) != EV_CURRENT) {
> +		error("elf_version failed: %s", elf_errmsg(-1));
> +		return -1;
> +	}
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> +	if (!elf) {
> +		error("elf_begin failed: %s", elf_errmsg(-1));
> +		return -1;
> +	}
> +
> +	sym_size = gelf_getclass(elf) == ELFCLASS32 ? sizeof(Elf32_Sym) :
> +						      sizeof(Elf64_Sym);
> +
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +
> +		if (shdr && shdr->sh_type == SHT_SYMTAB_SHNDX) {
> +			xndx_data = elf_getdata(scn, NULL);
> +			break;
> +		}
> +
> +		scn = elf_nextscn(elf, scn);
> +	}
> +
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +
> +		if (shdr && shdr->sh_type == SHT_SYMTAB) {
> +			Elf_Data *data = elf_getdata(scn, NULL);
> +			unsigned int nsyms = data->d_size / sym_size;

I think strictly speaking this should be:
size_t nsyms = shdr->sh_size / shdr->sh_entsize;
.. and the code could check that shdr->sh_entsize is same as what
gelf_fsize(elf, ELF_T_SYM, 1, EV_CURRENT) returns.

> +			unsigned int n;
> +
> +			for (n = 0; n < nsyms; ++n) {

The first symbol in the symbol table is always undefined, the loop can
start from 1.

Alternatively, since elf_for_each_symbol() ends up in the entire series
being used only with process_symbol() which skips symbols with the local
binding, the function could be renamed to elf_for_each_global_symbol()
and start the loop from shdr->sh_info.

> +				const char *name = NULL;
> +				Elf32_Word xndx = 0;
> +				GElf_Sym sym_mem;
> +				GElf_Sym *sym;
> +
> +				sym = gelf_getsymshndx(data, xndx_data, n,
> +						       &sym_mem, &xndx);
> +
> +				if (sym->st_shndx != SHN_XINDEX)
> +					xndx = sym->st_shndx;
> +
> +				name = elf_strptr(elf, shdr->sh_link,
> +						  sym->st_name);
> +
> +				/* Skip empty symbol names */
> +				if (name && *name &&
> +				    checkp(func(name, sym, xndx, arg)) > 0)
> +					break;
> +			}
> +		}
> +
> +		scn = elf_nextscn(elf, scn);
> +	}
> +
> +	return check(elf_end(elf));
> +}
> +
> +static int set_symbol_addr(struct symbol *sym, void *arg)
> +{
> +	struct symbol_addr *addr = arg;
> +
> +	if (sym->addr.section == SHN_UNDEF) {
> +		sym->addr.section = addr->section;
> +		sym->addr.address = addr->address;
> +		hash_add(symbol_addrs, &sym->addr_hash,
> +			 symbol_addr_hash(&sym->addr));
> +
> +		debug("%s -> { %u, %lx }", sym->name, sym->addr.section,
> +		      sym->addr.address);
> +	} else {
> +		warn("multiple addresses for symbol %s?", sym->name);
> +	}
> +
> +	return 0;
> +}
> +
> +static int process_symbol(const char *name, GElf_Sym *sym, Elf32_Word xndx,
> +			  void *arg)
> +{
> +	struct symbol_addr addr = { .section = xndx, .address = sym->st_value };
> +
> +	/* Set addresses for exported symbols */
> +	if (GELF_ST_BIND(sym->st_info) != STB_LOCAL &&
> +	    addr.section != SHN_UNDEF)
> +		checkp(for_each(name, true, set_symbol_addr, &addr));
> +
> +	return 0;
> +}
> +
> +int symbol_read_symtab(int fd)
> +{
> +	return elf_for_each_symbol(fd, process_symbol, NULL);
> +}

-- 
Thanks,
Petr

