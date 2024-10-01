Return-Path: <linux-kbuild+bounces-3854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8898BEEC
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 16:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6F631F211FE
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 14:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD66E1C3F33;
	Tue,  1 Oct 2024 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WWYwBdIi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6021C5789
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Oct 2024 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791486; cv=none; b=rqnTgBEiRf5rEoqLEatXyvHKgJEoHIebruqUF3IZFCxUVO0kNUIe0/0wHEy3f/eQ9198IzPqJ+dfxutzL+rgQ0q7BB8vhVCwDKDbfYmKO0Bx7WRArAEsuk+ZFSj/ik4gjPiDUouyeZ2XuzVd+ZTfJC15uRP9uv4Pc61DqG0Jlpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791486; c=relaxed/simple;
	bh=JvTFRpsXlIJj1KFFQ+YT40z3WJTnDDQq27JgSq9aMWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RthrUxEzdiEdMCFF4/2K+q9SYRHfi5Pu3+bqW5k3Hz+w1MkVc1ONL51lJvp5nahcVy0gqJ2FiWTJFnadTdy/Uxo0Kf2KmejQgL+gFabG8clSucUzqvmO21F6hlzuN6030nbdDZvqS8Xyq3zioixp+a+Pgeud7nQDnhZb6pw9eso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WWYwBdIi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c89f3f28b6so2071391a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2024 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791481; x=1728396281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3XYu88U9PFb1nert7I9sYZPgTqM+Nuf/0CSZGAVcxk=;
        b=WWYwBdIikrggf6eVCeDuPsRKdsZLaV/pW7g1F2Qf2+DwqOEUwHgwm9ZZDhqNtMIjxd
         LWFhnOpjOJoHQ7700DHu6XofIB0ja0njBYllYLdFtGt1LOh/amihRznj45OwsAREAgRn
         TWvi4OCrO9mn1mONJrUMp5HcuoQhcBkQt0UNuGhPgq6xIkXR/cS39a2fIWWbSnSHETE7
         obxB+Rz99GWegwU2xv03LkYihe/zeyYwI69DfaQc6dIQ7b02ISJyTX6xtScBvvEShILi
         Asy11pdvIpeJKJg31gn/MBdrt2getKOKRSibdSsuaW1T1udmKAUojP2irmSwQ5QCzp91
         2/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791481; x=1728396281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3XYu88U9PFb1nert7I9sYZPgTqM+Nuf/0CSZGAVcxk=;
        b=hjUlCMQKNNDiHqm4oBLQBcAvZ70jTC/TkQYssgGOorgY6O4mgXPpWBQ9R/0QlKNoxt
         toiVImnJqlrUenCK8njzYRnUoVjcElK8m99eWD/2Y+XTLe8LE5ayP1Nh8C2FRKNRm5KU
         lV62FA4yjbRJWWhkUS3BUJLw189XucHUygU8+TYyqZBkcB88aOggtDsglm6yA+wslI38
         0yKLRegHUv5/XzHzp0CJLvEdBCHTRHjV3+2m/W2+zqTilmzYpSg9EPSZx/0XnCyLQ+B+
         +USPhyuLyFrWYpHcyTNqEWsZbXZmyf1dfAqIBdjLbUO3iGQE22zm2JBfG1SX+Ov8BTfO
         hftQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcwMxTrfswviEabEItp20chJYHkVESmUMw0cUiZbYQpso+V1swbburXlME665OtvUDVBiLAK7U6hbOs10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxojamSGsce4xqAtmtj8hhkYE+S1kaf+/PWs94xRzHdLPjLUCGO
	F/PLx1xWxQG0eUd7FP4TJfxgpe0gZJRC3Z3bgCTeQ1usWLvtv96QMwTmwMmYkqI=
X-Google-Smtp-Source: AGHT+IEz8GpQbs4kBKj/7dbQlSt20wmBkIzaMqIyvliKOX5eLMkqp8iitkNgsFDNCJ/Nm+3aG5+cmw==
X-Received: by 2002:a05:6402:520e:b0:5c8:8610:98b0 with SMTP id 4fb4d7f45d1cf-5c886109966mr10773691a12.27.1727791480713;
        Tue, 01 Oct 2024 07:04:40 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea1dsm6225512a12.53.2024.10.01.07.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:04:40 -0700 (PDT)
Message-ID: <03d36fac-a808-4794-a442-11fa6fa18ad8@suse.com>
Date: Tue, 1 Oct 2024 16:04:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] tools: Add gendwarfksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-25-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-25-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add a basic DWARF parser, which uses libdw to traverse the debugging
> information in an object file and looks for functions and variables.
> In follow-up patches, this will be expanded to produce symbol versions
> for CONFIG_MODVERSIONS from DWARF.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  kernel/module/Kconfig                 |   8 ++
>  scripts/Makefile                      |   1 +
>  scripts/gendwarfksyms/.gitignore      |   2 +
>  scripts/gendwarfksyms/Makefile        |   8 ++
>  scripts/gendwarfksyms/dwarf.c         | 166 ++++++++++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.c | 132 ++++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.h |  97 +++++++++++++++
>  scripts/gendwarfksyms/symbols.c       |  82 +++++++++++++
>  8 files changed, 496 insertions(+)
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>  create mode 100644 scripts/gendwarfksyms/symbols.c
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index ccdbd1bc12aa..c3a0172a909f 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -168,6 +168,14 @@ config MODVERSIONS
>  	  make them incompatible with the kernel you are running.  If
>  	  unsure, say N.
>  
> +config GENDWARFKSYMS
> +	bool
> +	depends on DEBUG_INFO
> +	# Requires full debugging information, split DWARF not supported.
> +	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
> +	# Requires ELF object files.
> +	depends on !LTO
> +
>  config ASM_MODVERSIONS
>  	bool
>  	default HAVE_ASM_MODVERSIONS && MODVERSIONS
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 6bcda4b9d054..d7fec46d38c0 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -54,6 +54,7 @@ targets += module.lds
>  
>  subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
>  subdir-$(CONFIG_MODVERSIONS) += genksyms
> +subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
>  subdir-$(CONFIG_SECURITY_SELINUX) += selinux
>  subdir-$(CONFIG_SECURITY_IPE) += ipe
>  
> diff --git a/scripts/gendwarfksyms/.gitignore b/scripts/gendwarfksyms/.gitignore
> new file mode 100644
> index 000000000000..0927f8d3cd96
> --- /dev/null
> +++ b/scripts/gendwarfksyms/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +/gendwarfksyms
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
> new file mode 100644
> index 000000000000..9f8fec4fd39b
> --- /dev/null
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +hostprogs-always-y += gendwarfksyms
> +
> +gendwarfksyms-objs += gendwarfksyms.o
> +gendwarfksyms-objs += dwarf.o
> +gendwarfksyms-objs += symbols.o
> +
> +HOSTLDLIBS_gendwarfksyms := -ldw -lelf
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> new file mode 100644
> index 000000000000..81df3e2ad3ae
> --- /dev/null
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
> +{
> +	Dwarf_Attribute da;
> +
> +	/* dwarf_formref_die returns a pointer instead of an error value. */
> +	return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
> +}
> +
> +#define DEFINE_GET_STRING_ATTR(attr)                         \
> +	static const char *get_##attr##_attr(Dwarf_Die *die) \
> +	{                                                    \
> +		Dwarf_Attribute da;                          \
> +		if (dwarf_attr(die, DW_AT_##attr, &da))      \
> +			return dwarf_formstring(&da);        \
> +		return NULL;                                 \
> +	}
> +
> +DEFINE_GET_STRING_ATTR(name)
> +DEFINE_GET_STRING_ATTR(linkage_name)
> +
> +static const char *get_symbol_name(Dwarf_Die *die)
> +{
> +	const char *name;
> +
> +	/* rustc uses DW_AT_linkage_name for exported symbols */
> +	name = get_linkage_name_attr(die);
> +	if (!name)
> +		name = get_name_attr(die);
> +
> +	return name;
> +}
> +
> +static bool match_export_symbol(struct state *state, Dwarf_Die *die)
> +{
> +	Dwarf_Die *source = die;
> +	Dwarf_Die origin;
> +
> +	/* If the DIE has an abstract origin, use it for type information. */
> +	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> +		source = &origin;
> +
> +	state->sym = symbol_get(get_symbol_name(die));
> +
> +	/* Look up using the origin name if there are no matches. */
> +	if (!state->sym && source != die)
> +		state->sym = symbol_get(get_symbol_name(source));
> +
> +	state->die = *source;
> +	return !!state->sym;
> +}
> +
> +/*
> + * Type string processing
> + */
> +static void process(const char *s)
> +{
> +	s = s ?: "<null>";
> +
> +	if (dump_dies)
> +		fputs(s, stderr);
> +}
> +
> +bool match_all(Dwarf_Die *die)
> +{
> +	return true;
> +}
> +
> +int process_die_container(struct state *state, Dwarf_Die *die,
> +			  die_callback_t func, die_match_callback_t match)
> +{
> +	Dwarf_Die current;
> +	int res;
> +
> +	res = checkp(dwarf_child(die, &current));
> +	while (!res) {
> +		if (match(&current)) {
> +			/* <0 = error, 0 = continue, >0 = stop */
> +			res = checkp(func(state, &current));
> +			if (res)
> +				return res;
> +		}
> +
> +		res = checkp(dwarf_siblingof(&current, &current));
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Exported symbol processing
> + */
> +static void process_symbol(struct state *state, Dwarf_Die *die,
> +			   die_callback_t process_func)
> +{
> +	debug("%s", state->sym->name);
> +	check(process_func(state, die));
> +	if (dump_dies)
> +		fputs("\n", stderr);
> +}
> +
> +static int __process_subprogram(struct state *state, Dwarf_Die *die)
> +{
> +	process("subprogram");
> +	return 0;
> +}
> +
> +static void process_subprogram(struct state *state, Dwarf_Die *die)
> +{
> +	process_symbol(state, die, __process_subprogram);
> +}
> +
> +static int __process_variable(struct state *state, Dwarf_Die *die)
> +{
> +	process("variable ");
> +	return 0;
> +}
> +
> +static void process_variable(struct state *state, Dwarf_Die *die)
> +{
> +	process_symbol(state, die, __process_variable);
> +}
> +
> +static int process_exported_symbols(struct state *unused, Dwarf_Die *die)
> +{
> +	int tag = dwarf_tag(die);
> +
> +	switch (tag) {
> +	/* Possible containers of exported symbols */
> +	case DW_TAG_namespace:
> +	case DW_TAG_class_type:
> +	case DW_TAG_structure_type:
> +		return check(process_die_container(
> +			NULL, die, process_exported_symbols, match_all));
> +
> +	/* Possible exported symbols */
> +	case DW_TAG_subprogram:
> +	case DW_TAG_variable: {
> +		struct state state;
> +
> +		if (!match_export_symbol(&state, die))
> +			return 0;
> +
> +		if (tag == DW_TAG_subprogram)
> +			process_subprogram(&state, &state.die);
> +		else
> +			process_variable(&state, &state.die);
> +
> +		return 0;
> +	}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +void process_cu(Dwarf_Die *cudie)
> +{
> +	check(process_die_container(NULL, cudie, process_exported_symbols,
> +				    match_all));
> +}
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> new file mode 100644
> index 000000000000..096a334fa5b3
> --- /dev/null
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <errno.h>
> +#include <stdarg.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include "gendwarfksyms.h"
> +
> +/*
> + * Options
> + */
> +
> +/* Print debugging information to stderr */
> +int debug;
> +/* Dump DIE contents */
> +int dump_dies;
> +
> +static void usage(void)
> +{
> +	fputs("Usage: gendwarfksyms [options] elf-object-file ... < symbol-list\n\n"
> +	      "Options:\n"
> +	      "  -d, --debug          Print debugging information\n"
> +	      "      --dump-dies      Dump DWARF DIE contents\n"
> +	      "  -h, --help           Print this message\n"
> +	      "\n",
> +	      stderr);
> +}
> +
> +static int process_module(Dwfl_Module *mod, void **userdata, const char *name,
> +			  Dwarf_Addr base, void *arg)
> +{
> +	Dwarf_Addr dwbias;
> +	Dwarf_Die cudie;
> +	Dwarf_CU *cu = NULL;
> +	Dwarf *dbg;
> +	int res;
> +
> +	debug("%s", name);
> +	dbg = dwfl_module_getdwarf(mod, &dwbias);
> +
> +	do {
> +		res = dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie, NULL);
> +		if (res < 0)
> +			error("dwarf_get_units failed: no debugging information?");
> +		if (res == 1)
> +			break; /* No more units */
> +
> +		process_cu(&cudie);
> +	} while (cu);
> +
> +	return DWARF_CB_OK;
> +}
> +
> +static const Dwfl_Callbacks callbacks = {
> +	.section_address = dwfl_offline_section_address,
> +	.find_debuginfo = dwfl_standard_find_debuginfo,
> +};
> +
> +int main(int argc, char **argv)
> +{
> +	unsigned int n;
> +	int opt;
> +
> +	struct option opts[] = { { "debug", 0, NULL, 'd' },
> +				 { "dump-dies", 0, &dump_dies, 1 },
> +				 { "help", 0, NULL, 'h' },
> +				 { 0, 0, NULL, 0 } };
> +
> +	while ((opt = getopt_long(argc, argv, "dh", opts, NULL)) != EOF) {
> +		switch (opt) {
> +		case 0:
> +			break;
> +		case 'd':
> +			debug = 1;
> +			break;
> +		case 'h':
> +			usage();
> +			return 0;
> +		default:
> +			usage();
> +			return 1;
> +		}
> +	}
> +
> +	if (optind >= argc) {
> +		usage();
> +		error("no input files?");
> +	}
> +
> +	symbol_read_exports(stdin);
> +
> +	for (n = optind; n < argc; n++) {
> +		Dwfl *dwfl;
> +		int fd;
> +
> +		fd = open(argv[n], O_RDONLY);
> +		if (fd == -1) {
> +			error("open failed for '%s': %s", argv[n],
> +			      strerror(errno));
> +			return -1;
> +		}
> +
> +		dwfl = dwfl_begin(&callbacks);
> +		if (!dwfl) {
> +			error("dwfl_begin failed for '%s': %s", argv[n],
> +			      dwarf_errmsg(-1));
> +			return -1;
> +		}
> +
> +		if (!dwfl_report_offline(dwfl, argv[n], argv[n], fd)) {
> +			error("dwfl_report_offline failed for '%s': %s",
> +			      argv[n], dwarf_errmsg(-1));
> +			return -1;
> +		}
> +
> +		dwfl_report_end(dwfl, NULL, NULL);
> +
> +		if (dwfl_getmodules(dwfl, &process_module, NULL, 0)) {
> +			error("dwfl_getmodules failed for '%s'", argv[n]);
> +			return -1;
> +		}

Nit: The four error() calls don't need to be followed by 'return -1;'
since the function now calls exit(1).

> +
> +		dwfl_end(dwfl);
> +	}
> +
> +	return 0;
> +}
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> new file mode 100644
> index 000000000000..1a10d18f178e
> --- /dev/null
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <dwarf.h>
> +#include <elfutils/libdw.h>
> +#include <elfutils/libdwfl.h>
> +#include <inttypes.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include <hash.h>
> +#include <hashtable.h>
> +#include <list.h>
> +#include <xalloc.h>
> +
> +#ifndef __GENDWARFKSYMS_H
> +#define __GENDWARFKSYMS_H
> +
> +/*
> + * Options -- in gendwarfksyms.c
> + */
> +extern int debug;
> +extern int dump_dies;
> +
> +/*
> + * Output helpers
> + */
> +#define __PREFIX "gendwarfksyms: "
> +#define __println(prefix, format, ...)                                \
> +	fprintf(stderr, prefix __PREFIX "%s: " format "\n", __func__, \
> +		##__VA_ARGS__)
> +
> +#define debug(format, ...)                                    \
> +	do {                                                  \
> +		if (debug)                                    \
> +			__println("", format, ##__VA_ARGS__); \
> +	} while (0)
> +
> +#define warn(format, ...) __println("warning: ", format, ##__VA_ARGS__)
> +#define error(format, ...)                                   \
> +	do {                                                 \
> +		__println("error: ", format, ##__VA_ARGS__); \
> +		exit(1);                                     \
> +	} while (0)
> +
> +/*
> + * Error handling helpers
> + */
> +#define __check(expr, test)                                     \
> +	({                                                      \
> +		int __res = expr;                               \
> +		if (test)                                       \
> +			error("`%s` failed: %d", #expr, __res); \
> +		__res;                                          \
> +	})
> +
> +/* Error == non-zero values */
> +#define check(expr) __check(expr, __res)
> +/* Error == negative values */
> +#define checkp(expr) __check(expr, __res < 0)
> +
> +/*
> + * symbols.c
> + */
> +
> +struct symbol {
> +	const char *name;
> +	struct hlist_node name_hash;
> +};
> +
> +typedef void (*symbol_callback_t)(struct symbol *, void *arg);
> +
> +void symbol_read_exports(FILE *file);
> +struct symbol *symbol_get(const char *name);
> +
> +/*
> + * dwarf.c
> + */
> +
> +struct state {
> +	struct symbol *sym;
> +	Dwarf_Die die;
> +};
> +
> +typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
> +typedef bool (*die_match_callback_t)(Dwarf_Die *die);
> +bool match_all(Dwarf_Die *die);
> +
> +int process_die_container(struct state *state, Dwarf_Die *die,
> +			  die_callback_t func, die_match_callback_t match);
> +
> +void process_cu(Dwarf_Die *cudie);
> +
> +#endif /* __GENDWARFKSYMS_H */
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> new file mode 100644
> index 000000000000..1809be93d18c
> --- /dev/null
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +#define SYMBOL_HASH_BITS 15
> +static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
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
> +				    hash_str(name)) {
> +		if (strcmp(match->name, name))
> +			continue;
> +
> +		if (func)
> +			func(match, data);
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
> +void symbol_read_exports(FILE *file)
> +{
> +	struct symbol *sym;
> +	char *line = NULL;
> +	char *name = NULL;
> +	size_t size = 0;
> +	int nsym = 0;
> +
> +	while (getline(&line, &size, file) > 0) {
> +		if (sscanf(line, "%ms\n", &name) != 1)
> +			error("malformed input line: %s", line);
> +
> +		if (is_exported(name)) {
> +			/* Ignore duplicates */
> +			free(name);
> +			continue;
> +		}
> +
> +		sym = xcalloc(1, sizeof(struct symbol));
> +		sym->name = name;
> +
> +		hash_add(symbol_names, &sym->name_hash, hash_str(sym->name));
> +		++nsym;
> +
> +		debug("%s", sym->name);
> +	}
> +
> +	free(line);
> +	debug("%d exported symbols", nsym);
> +}
> +
> +static void get_symbol(struct symbol *sym, void *arg)
> +{
> +	struct symbol **res = arg;
> +
> +	*res = sym;
> +}
> +
> +struct symbol *symbol_get(const char *name)
> +{
> +	struct symbol *sym = NULL;
> +
> +	for_each(name, get_symbol, &sym);
> +	return sym;
> +}

Nit: The code inconsistently checks for a potential error from the
function for_each(). Looking at the whole series, the value is checked
using checkp() in functions symbol_set_crc(), symbol_set_ptr(),
symbol_set_die(), is_exported(), but not in symbol_get() and
elf_set_symbol_addr(). It would be good to unify this, or perhaps even
make for_each() return an unsigned int to indicate it never fails?

Looks otherwise ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

