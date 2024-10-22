Return-Path: <linux-kbuild+bounces-4231-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B39AB103
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 16:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F2E5B21CB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 14:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F11F1A0B04;
	Tue, 22 Oct 2024 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OcD9pFRd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5B1A072C
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607944; cv=none; b=DKuK7oE+aRmtXMKYgiqhD205cbTCCPkRHW/bvuOfKSXNnEhZ2QMZiszcH0zE5qoDuEONq0evZZcCFfpZ5sBtt8lPMO8vCPXYEEhBE7O/y+Bqyr9CLgBIRX8YOE236AoR6BlVvlgpnTc0YEctYsRF4Wpc/m6f2QkAUYMPfANHWso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607944; c=relaxed/simple;
	bh=68UCYkWUQMmVaG42U1/+CzVPxiR8QXYP3+DHEY8cA7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyQUHPc7O0cfSGoNNPJeyv0ev1p3YTQRhYHFnsLOBa9k3cVtfeTwn49Ha5TtcTX9uNe82J4CE7MWi7KNiIN/DlvuA6GTkoB2Cg7VV2oBxr23rXVCbpL99obW/Tm/8JSUMazmbRYMZrG/rHsFvnEajAAqgKfGpBjcYD1BsDy/GGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OcD9pFRd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9aa8895facso190440666b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2024 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729607940; x=1730212740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sc1lIeXNH//kUHkkKt+El7eC/mXZA2G4MipRh/Xi0VY=;
        b=OcD9pFRdQHsLtrA+sIRIkRoRPL4u525XniPwDcYa/tf2eTo+daYpUvclRXd3A9gX2F
         dAihx8Kmts3N0KiKs6fHkR8SzgyAwZ887sgmsuOxb02JW3CWd3c901dbffSkuly4LVMM
         w6oTy7hTy9KmPMep9PeoovCNDscCq5yVD4fJnRMJ8bN8blNKPQYLFpqemZmglzxJ1X87
         TcSFH8Z7DQPOz8/os15qIkSnRaItYvjCManX2q8SPjn9sNwZd5g0TO/vtKMfilaBlQH8
         9uvf06hhlj5UNAIGzPd8X9CDwn55Nop6seMv9suevuujxZ0Vqgp+HElBawJzeGG0/816
         jSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607940; x=1730212740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sc1lIeXNH//kUHkkKt+El7eC/mXZA2G4MipRh/Xi0VY=;
        b=ZEQLAJlrT8FZdgu7XZnM789/ic5Fq/N9VTMusCR/wSX3sndWNNHlWUwtKhyj4mwaX+
         2frlSKbfJk6NAoJJdMLn2WSX/BVzugHxB4wsog8lJiaSriPaFFMQUPJAVihY949MtQlB
         RB+jADCvosEA8tssX9UTVAe4ECryoLMxonwhejq/7w6Fk5oxpAFIrSjSfUidDQZPfhjR
         A6tcHf9plBFt1HFX9QgtMEiNmfRlB44tVmFVlSqbNAST6SHyUZSNpkRy5lEERhWwWCag
         I3aqvX/1WiQdW4bTGrsbjol4nFuMRHXsJ4Hn1fS7xWJmwf+e9WiBzDSam6in5wE5U+Ma
         u2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKEyD63AW7mhclXoEm9C6KwTZkUeX1C1xUGygmJY0DDlG3TsJbL9DMdBjR/diVBCLpJKWaGFkBtBuWE58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1HJqDMCYIh4bO+dNjM2DUxtjyGhFH/QSheqr9yueX3t4sEdi7
	0PI2cqrBgTewnbEOyjodDMhnLcffr6FJiE6L76mWy/eEjWNELV1GpGjThWABMQg=
X-Google-Smtp-Source: AGHT+IHmHIMsKspWXQb2XPjlEai/hB2tbmMSPp8UuTXBuC9nc1lv7eih+y2tnbSzAXyR9zjKRDoQdg==
X-Received: by 2002:a17:907:86a3:b0:a9a:11cf:2a73 with SMTP id a640c23a62f3a-a9a69de75femr1404420766b.64.1729607939554;
        Tue, 22 Oct 2024 07:38:59 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159936dsm344691966b.201.2024.10.22.07.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:38:59 -0700 (PDT)
Message-ID: <bf2b3e3c-904b-43c9-a9eb-ab710ff6e7fc@suse.com>
Date: Tue, 22 Oct 2024 16:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/19] gendwarfksyms: Add support for kABI rules
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
 <20241008183823.36676-35-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-35-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Distributions that want to maintain a stable kABI need the ability
> to make ABI compatible changes to kernel without affecting symbol
> versions, either because of LTS updates or backports.
> 
> With genksyms, developers would typically hide these changes from
> version calculation with #ifndef __GENKSYMS__, which would result
> in the symbol version not changing even though the actual type has
> changed.  When we process precompiled object files, this isn't an
> option.
> 
> To support this use case, add a --stable command line flag that
> gates kABI stability features that are not needed in mainline
> kernels, but can be useful for distributions, and add support for
> kABI rules, which can be used to restrict gendwarfksyms output.
> 
> The rules are specified as a set of null-terminated strings stored
> in the .discard.gendwarfksyms.kabi_rules section. Each rule consists
> of four strings as follows:
> 
>   "version\0type\0target\0value"
> 
> The version string ensures the structure can be changed in a
> backwards compatible way. The type string indicates the type of the
> rule, and target and value strings contain rule-specific data.
> 
> Initially support two simple rules:
> 
>   1. Declaration-only structures
> 
>      A structure declaration can change into a full definition when
>      additional includes are pulled in to the TU, which changes the
>      versions of any symbol that references the struct. Add support
>      for defining declaration-only structs whose definition is not
>      expanded during versioning.
> 
>   2. Ignored enum fields
> 
>      It's possible to add new enum fields without changing the ABI,
>      but as the fields are included in symbol versioning, this would
>      change the versions. Add support for ignoring specific fields.
> 
> Add examples for using the rules under the examples/ directory.

Thanks for coming up with this approach. It makes sense to me.

> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  scripts/gendwarfksyms/Makefile              |   1 +
>  scripts/gendwarfksyms/dwarf.c               |  19 +-
>  scripts/gendwarfksyms/examples/kabi.h       |  61 ++++++
>  scripts/gendwarfksyms/examples/kabi_rules.c |  56 +++++
>  scripts/gendwarfksyms/gendwarfksyms.c       |  11 +-
>  scripts/gendwarfksyms/gendwarfksyms.h       |  57 ++++++
>  scripts/gendwarfksyms/kabi.c                | 214 ++++++++++++++++++++
>  7 files changed, 415 insertions(+), 4 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/examples/kabi.h
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_rules.c
>  create mode 100644 scripts/gendwarfksyms/kabi.c
> 
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> index 6540282dc746..27258c31e839 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -5,6 +5,7 @@ gendwarfksyms-objs += gendwarfksyms.o
>  gendwarfksyms-objs += cache.o
>  gendwarfksyms-objs += die.o
>  gendwarfksyms-objs += dwarf.o
> +gendwarfksyms-objs += kabi.o
>  gendwarfksyms-objs += symbols.o
>  gendwarfksyms-objs += types.o
>  
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index a47a3a0f7a69..b15f1a5db452 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -80,11 +80,12 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
>  	return !!state->sym;
>  }
>  
> -static bool is_declaration(Dwarf_Die *die)
> +static bool is_declaration(struct die *cache, Dwarf_Die *die)
>  {
>  	bool value;
>  
> -	return get_flag_attr(die, DW_AT_declaration, &value) && value;
> +	return (get_flag_attr(die, DW_AT_declaration, &value) && value) ||
> +	       kabi_is_struct_declonly(cache->fqn);
>  }
>  
>  /*
> @@ -472,10 +473,11 @@ static void __process_structure_type(struct state *state, struct die *cache,
>  	process(cache, " {");
>  	process_linebreak(cache, 1);
>  
> -	is_decl = is_declaration(die);
> +	is_decl = is_declaration(cache, die);
>  
>  	if (!is_decl && state->expand.expand) {
>  		cache_mark_expanded(&state->expansion_cache, die->addr);
> +		state->expand.current_fqn = cache->fqn;
>  		check(process_die_container(state, cache, die, process_func,
>  					    match_func));
>  	}
> @@ -508,6 +510,15 @@ static void process_enumerator_type(struct state *state, struct die *cache,
>  {
>  	Dwarf_Word value;
>  
> +	if (stable) {
> +		/* Get the fqn before we process anything */
> +		update_fqn(cache, die);
> +
> +		if (kabi_is_enumerator_ignored(state->expand.current_fqn,
> +					       cache->fqn))
> +			return;
> +	}
> +
>  	process_list_comma(state, cache);
>  	process(cache, "enumerator");
>  	process_fqn(cache, die);
> @@ -580,6 +591,7 @@ static void state_init(struct state *state)
>  	state->expand.expand = true;
>  	state->expand.ptr_depth = 0;
>  	state->expand.ptr_expansion_depth = 0;
> +	state->expand.current_fqn = NULL;
>  	hash_init(state->expansion_cache.cache);
>  }
>  
> @@ -589,6 +601,7 @@ static void expansion_state_restore(struct expansion_state *state,
>  	state->expand = saved->expand;
>  	state->ptr_depth = saved->ptr_depth;
>  	state->ptr_expansion_depth = saved->ptr_expansion_depth;
> +	state->current_fqn = saved->current_fqn;
>  }
>  
>  static void expansion_state_save(struct expansion_state *state,
> diff --git a/scripts/gendwarfksyms/examples/kabi.h b/scripts/gendwarfksyms/examples/kabi.h
> new file mode 100644
> index 000000000000..c53e8d4a7d2e
> --- /dev/null
> +++ b/scripts/gendwarfksyms/examples/kabi.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Google LLC
> + *
> + * Example macros for maintaining kABI stability.
> + *
> + * This file is based on android_kabi.h, which has the following notice:
> + *
> + * Heavily influenced by rh_kabi.h which came from the RHEL/CENTOS kernel
> + * and was:
> + *	Copyright (c) 2014 Don Zickus
> + *	Copyright (c) 2015-2018 Jiri Benc
> + *	Copyright (c) 2015 Sabrina Dubroca, Hannes Frederic Sowa
> + *	Copyright (c) 2016-2018 Prarit Bhargava
> + *	Copyright (c) 2017 Paolo Abeni, Larry Woodman
> + */
> +
> +#ifndef __KABI_H__
> +#define __KABI_H__
> +
> +/* Kernel macros for userspace testing. */
> +#ifndef __aligned
> +#define __aligned(x) __attribute__((__aligned__(x)))
> +#endif
> +#ifndef __used
> +#define __used __attribute__((__used__))
> +#endif
> +#ifndef __section
> +#define __section(section) __attribute__((__section__(section)))
> +#endif
> +#ifndef __PASTE
> +#define ___PASTE(a, b) a##b
> +#define __PASTE(a, b) ___PASTE(a, b)
> +#endif
> +#ifndef __stringify
> +#define __stringify_1(x...) #x
> +#define __stringify(x...) __stringify_1(x)
> +#endif
> +
> +#define __KABI_RULE(hint, target, value)                             \
> +	static const char __PASTE(__gendwarfksyms_rule_,             \
> +				  __COUNTER__)[] __used __aligned(1) \
> +		__section(".discard.gendwarfksyms.kabi_rules") =     \
> +			"1\0" #hint "\0" #target "\0" #value
> +
> +/*
> + * KABI_USE_ARRAY(fqn)
> + *   Treat the struct fqn as a declaration, i.e. even if a definition
> + *   is available, don't expand the contents.
> + */
> +#define KABI_STRUCT_DECLONLY(fqn) __KABI_RULE(struct_declonly, fqn, ;)

Nit: s/KABI_USE_ARRAY/KABI_STRUCT_DECLONLY/ in the preceding comment.

> +
> +/*
> + * KABI_ENUMERATOR_IGNORE(fqn, field)
> + *   When expanding enum fqn, skip the provided field. This makes it
> + *   possible to hide added enum fields from versioning.
> + */
> +#define KABI_ENUMERATOR_IGNORE(fqn, field) \
> +	__KABI_RULE(enumerator_ignore, fqn, field)
> +
> +#endif /* __KABI_H__ */
> diff --git a/scripts/gendwarfksyms/examples/kabi_rules.c b/scripts/gendwarfksyms/examples/kabi_rules.c
> new file mode 100644
> index 000000000000..446818e67d80
> --- /dev/null
> +++ b/scripts/gendwarfksyms/examples/kabi_rules.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + *
> + * Examples for kABI rules with --stable.
> + */
> +
> +/*
> + * The comments below each example contain the expected gendwarfksyms
> + * output which can be verified using LLVM's FileCheck tool:
> + *
> + * https://llvm.org/docs/CommandGuide/FileCheck.html
> + *
> + * RUN: gcc -g -c examples/kabi_rules.c -o examples/kabi_rules.o
> + *
> + * Verify --stable output:
> + *
> + * RUN: echo -e "ex0\nex1" | \
> + * RUN:   ./gendwarfksyms --stable --dump-dies \
> + * RUN:   	examples/kabi_rules.o 2>&1 >/dev/null | \
> + * RUN:   FileCheck examples/kabi_rules.c --check-prefix=STABLE
> + */

It would be useful to make this test automated. Overall, I believe
gendwarfksyms should have a set of automated tests to verify its
functionality. At a minimum, I think we would want to work out some
blueprint how to write them. Should they be added to kselftests, or
would something like kconfig/tests be more appropriate? How to write
tests with stable DWARF data that ideally work across all platforms?
More tests can be then added incrementally.

> +
> +#include "kabi.h"
> +
> +struct s {
> +	int a;
> +};
> +
> +KABI_STRUCT_DECLONLY(s);
> +
> +struct s e0;
> +
> +/*
> + * STABLE:      variable structure_type s {
> + * STABLE-NEXT: }
> + */
> +
> +enum e {
> +	A,
> +	B,
> +	C,
> +	D,
> +};
> +
> +KABI_ENUMERATOR_IGNORE(e, B);
> +KABI_ENUMERATOR_IGNORE(e, C);
> +
> +enum e e1;
> +
> +/*
> + * STABLE:      variable enumeration_type e {
> + * STABLE-NEXT:   enumerator A = 0 ,
> + * STABLE-NEXT:   enumerator D = 3
> + * STABLE-NEXT: } byte_size(4)
> + */
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index e90d909d259b..21abf1c98366 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -25,6 +25,8 @@ int dump_die_map;
>  int dump_types;
>  /* Print out expanded type strings used for symbol versions */
>  int dump_versions;
> +/* Support kABI stability features */
> +int stable;
>  /* Write a symtypes file */
>  int symtypes;
>  static const char *symtypes_file;
> @@ -38,6 +40,7 @@ static void usage(void)
>  	      "      --dump-die-map   Print debugging information about die_map changes\n"
>  	      "      --dump-types     Dump type strings\n"
>  	      "      --dump-versions  Dump expanded type strings used for symbol versions\n"
> +	      "  -s, --stable         Support kABI stability features\n"
>  	      "  -T, --symtypes file  Write a symtypes file\n"
>  	      "  -h, --help           Print this message\n"
>  	      "\n",
> @@ -97,17 +100,21 @@ int main(int argc, char **argv)
>  				 { "dump-die-map", 0, &dump_die_map, 1 },
>  				 { "dump-types", 0, &dump_types, 1 },
>  				 { "dump-versions", 0, &dump_versions, 1 },
> +				 { "stable", 0, NULL, 's' },
>  				 { "symtypes", 1, NULL, 'T' },
>  				 { "help", 0, NULL, 'h' },
>  				 { 0, 0, NULL, 0 } };
>  
> -	while ((opt = getopt_long(argc, argv, "dT:h", opts, NULL)) != EOF) {
> +	while ((opt = getopt_long(argc, argv, "dsT:h", opts, NULL)) != EOF) {
>  		switch (opt) {
>  		case 0:
>  			break;
>  		case 'd':
>  			debug = 1;
>  			break;
> +		case 's':
> +			stable = 1;
> +			break;
>  		case 'T':
>  			symtypes = 1;
>  			symtypes_file = optarg;
> @@ -151,6 +158,7 @@ int main(int argc, char **argv)
>  			      strerror(errno));
>  
>  		symbol_read_symtab(fd);
> +		kabi_read_rules(fd);
>  
>  		dwfl = dwfl_begin(&callbacks);
>  		if (!dwfl)
> @@ -167,6 +175,7 @@ int main(int argc, char **argv)
>  			error("dwfl_getmodules failed for '%s'", argv[n]);
>  
>  		dwfl_end(dwfl);
> +		kabi_free();
>  	}
>  
>  	if (symfile)
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 814f53ef799e..f32ad4389b58 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -27,6 +27,7 @@ extern int dump_dies;
>  extern int dump_die_map;
>  extern int dump_types;
>  extern int dump_versions;
> +extern int stable;
>  extern int symtypes;
>  
>  /*
> @@ -225,6 +226,7 @@ struct expansion_state {
>  	bool expand;
>  	unsigned int ptr_depth;
>  	unsigned int ptr_expansion_depth;
> +	const char *current_fqn;
>  };
>  
>  struct state {
> @@ -256,4 +258,59 @@ void process_cu(Dwarf_Die *cudie);
>  
>  void generate_symtypes_and_versions(FILE *file);
>  
> +/*
> + * kabi.c
> + */
> +
> +#define KABI_RULE_SECTION ".discard.gendwarfksyms.kabi_rules"
> +#define KABI_RULE_VERSION "1"
> +
> +/*
> + * The rule section consists of four null-terminated strings per
> + * entry:
> + *
> + *   1. version
> + *      Entry format version. Must match KABI_RULE_VERSION.
> + *
> + *   2. type
> + *      Type of the kABI rule. Must be one of the tags defined below.
> + *
> + *   3. target
> + *      Rule-dependent target, typically the fully qualified name of
> + *      the target DIE.
> + *
> + *   4. value
> + *      Rule-dependent value.
> + */
> +#define KABI_RULE_MIN_ENTRY_SIZE                                       \
> +	(/* version\0 */ 2 + /* type\0 */ 2 + /* target\0" */ 2 + \
> +	 /* value\0 */ 2)
> +#define KABI_RULE_EMPTY_VALUE ";"

Hmm, is there a reason why an empty value is ";" instead of just ""?

> +
> +/*
> + * Rule: struct_declonly
> + * - For the struct in the target field, treat it as a declaration
> + *   only even if a definition is available.
> + */
> +#define KABI_RULE_TAG_STRUCT_DECLONLY "struct_declonly"
> +
> +/*
> + * Rule: enumerator_ignore
> + * - For the enum in the target field, ignore the named enumerator
> + *   in the value field.
> + */
> +#define KABI_RULE_TAG_ENUMERATOR_IGNORE "enumerator_ignore"
> +
> +enum kabi_rule_type {
> +	KABI_RULE_TYPE_UNKNOWN,
> +	KABI_RULE_TYPE_STRUCT_DECLONLY,
> +	KABI_RULE_TYPE_ENUMERATOR_IGNORE,
> +};

Nit: All new KABI_* defines and the enum kabi_rule_type added in
gendwarfksyms.h are used only locally from kabi.c, so they could be
moved in that file.

> +
> +bool kabi_is_enumerator_ignored(const char *fqn, const char *field);
> +bool kabi_is_struct_declonly(const char *fqn);
> +
> +void kabi_read_rules(int fd);
> +void kabi_free(void);
> +
>  #endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
> new file mode 100644
> index 000000000000..a5414382782c
> --- /dev/null
> +++ b/scripts/gendwarfksyms/kabi.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +#define RULE_HASH_BITS 10
> +
> +struct rule {
> +	enum kabi_rule_type type;
> +	const char *target;
> +	const char *value;
> +	struct hlist_node hash;
> +};

What is the idea behind using 'const char *' instead of 'char *' for
owned strings in structures?

> +
> +/* { type, target, value } -> struct rule */
> +static HASHTABLE_DEFINE(rules, 1 << RULE_HASH_BITS);
> +
> +static inline unsigned int rule_hash(enum kabi_rule_type type,
> +				     const char *target, const char *value)
> +{
> +	return hash_32(type) ^ hash_str(target) ^ hash_str(value);
> +}
> +
> +static inline unsigned int __rule_hash(const struct rule *rule)
> +{
> +	return rule_hash(rule->type, rule->target, rule->value);
> +}

Nit: Perhaps call the two hash functions rule_values_hash() and
rule_hash() to avoid the "__" prefix?

As a general comment, I believe the gendwarfksyms code overuses the "__"
prefix. Similarly, I find harder to navigate its code when, in a few
instances, there is a function named <verb>_<object>() and another as
<object>_<verb>(). An example of both would be the functions
expand_type(), type_expand() and __type_expand().

> +
> +static inline const char *get_rule_field(const char **pos, ssize_t *left)
> +{
> +	const char *start = *pos;
> +	size_t len;
> +
> +	if (*left <= 1)
> +		error("unexpected end of kABI rules");
> +
> +	len = strnlen(start, *left);
> +	if (!len)
> +		error("empty kABI rule field");
> +
> +	len += 1;
> +	*pos += len;
> +	*left -= len;
> +
> +	return start;
> +}
> +
> +void kabi_read_rules(int fd)
> +{
> +	GElf_Shdr shdr_mem;
> +	GElf_Shdr *shdr;
> +	Elf_Data *rule_data = NULL;
> +	Elf_Scn *scn;
> +	Elf *elf;
> +	size_t shstrndx;
> +	const char *rule_str;
> +	ssize_t left;
> +	int i;
> +
> +	const struct {
> +		enum kabi_rule_type type;
> +		const char *tag;
> +	} rule_types[] = {
> +		{
> +			.type = KABI_RULE_TYPE_STRUCT_DECLONLY,
> +			.tag = KABI_RULE_TAG_STRUCT_DECLONLY,
> +		},
> +		{
> +			.type = KABI_RULE_TYPE_ENUMERATOR_IGNORE,
> +			.tag = KABI_RULE_TAG_ENUMERATOR_IGNORE,
> +		},
> +	};
> +
> +	if (!stable)
> +		return;
> +
> +	if (elf_version(EV_CURRENT) != EV_CURRENT)
> +		error("elf_version failed: %s", elf_errmsg(-1));
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> +	if (!elf)
> +		error("elf_begin failed: %s", elf_errmsg(-1));
> +
> +	if (elf_getshdrstrndx(elf, &shstrndx) < 0)
> +		error("elf_getshdrstrndx failed: %s", elf_errmsg(-1));
> +
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +		if (shdr) {

Isn't it an error when gelf_getshdr() returns NULL and as such it should
be reported with error()? If this makes sense then the same handling
should be implemented in symbols.c:elf_for_each_global().

> +			const char *sname =
> +				elf_strptr(elf, shstrndx, shdr->sh_name);
> +
> +			if (sname && !strcmp(sname, KABI_RULE_SECTION)) {
> +				rule_data = elf_getdata(scn, NULL);

Similarly here for elf_strptr() and elf_getdata().

> +				break;
> +			}
> +		}
> +
> +		scn = elf_nextscn(elf, scn);
> +	}
> +
> +	if (!rule_data) {
> +		debug("kABI rules not found");
> +		return;
> +	}
> +
> +	rule_str = rule_data->d_buf;
> +	left = shdr->sh_size;
> +
> +	if (left < KABI_RULE_MIN_ENTRY_SIZE)
> +		error("kABI rule section too small: %zd bytes", left);
> +
> +	if (rule_str[left - 1] != '\0')
> +		error("kABI rules are not null-terminated");
> +
> +	while (left > KABI_RULE_MIN_ENTRY_SIZE) {
> +		enum kabi_rule_type type = KABI_RULE_TYPE_UNKNOWN;
> +		const char *field;
> +		struct rule *rule;
> +
> +		/* version */
> +		field = get_rule_field(&rule_str, &left);
> +
> +		if (strcmp(field, KABI_RULE_VERSION))
> +			error("unsupported kABI rule version: '%s'", field);
> +
> +		/* type */
> +		field = get_rule_field(&rule_str, &left);
> +
> +		for (i = 0; i < ARRAY_SIZE(rule_types); i++) {
> +			if (!strcmp(field, rule_types[i].tag)) {
> +				type = rule_types[i].type;
> +				break;
> +			}
> +		}
> +
> +		if (type == KABI_RULE_TYPE_UNKNOWN)
> +			error("unsupported kABI rule type: '%s'", field);
> +
> +		rule = xmalloc(sizeof(struct rule));
> +
> +		rule->type = type;
> +		rule->target = xstrdup(get_rule_field(&rule_str, &left));
> +		rule->value = xstrdup(get_rule_field(&rule_str, &left));
> +
> +		hash_add(rules, &rule->hash, __rule_hash(rule));
> +
> +		debug("kABI rule: type: '%s', target: '%s', value: '%s'", field,
> +		      rule->target, rule->value);
> +	}
> +
> +	if (left > 0)
> +		warn("unexpected data at the end of the kABI rules section");
> +
> +	check(elf_end(elf));
> +}
> +
> +bool kabi_is_struct_declonly(const char *fqn)
> +{
> +	struct rule *rule;
> +
> +	if (!stable)
> +		return false;
> +	if (!fqn || !*fqn)
> +		return false;
> +
> +	hash_for_each_possible(rules, rule, hash,
> +			       rule_hash(KABI_RULE_TYPE_STRUCT_DECLONLY, fqn,
> +					 KABI_RULE_EMPTY_VALUE)) {
> +		if (rule->type == KABI_RULE_TYPE_STRUCT_DECLONLY &&
> +		    !strcmp(fqn, rule->target))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +bool kabi_is_enumerator_ignored(const char *fqn, const char *field)
> +{
> +	struct rule *rule;
> +
> +	if (!stable)
> +		return false;
> +	if (!fqn || !*fqn || !field || !*field)
> +		return false;
> +
> +	hash_for_each_possible(rules, rule, hash,
> +			       rule_hash(KABI_RULE_TYPE_ENUMERATOR_IGNORE, fqn,
> +					 field)) {
> +		if (rule->type == KABI_RULE_TYPE_ENUMERATOR_IGNORE &&
> +		    !strcmp(fqn, rule->target) && !strcmp(field, rule->value))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +void kabi_free(void)
> +{
> +	struct hlist_node *tmp;
> +	struct rule *rule;
> +
> +	hash_for_each_safe(rules, rule, tmp, hash) {
> +		free((void *)rule->target);
> +		free((void *)rule->value);
> +		free(rule);
> +	}
> +
> +	hash_init(rules);
> +}

-- 
Thanks,
Petr

