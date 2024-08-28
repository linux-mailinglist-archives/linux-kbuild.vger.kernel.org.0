Return-Path: <linux-kbuild+bounces-3268-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46757962FA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 20:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCEE11F22D13
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED991AB53F;
	Wed, 28 Aug 2024 18:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLS/MNK/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD61AB536;
	Wed, 28 Aug 2024 18:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724869019; cv=none; b=StAdHKnbe2goKnAAiuhKOBG//4V4YPXHUmsjs6QWhqyj2ZxvrJZkYNcAIAsU4sPtMcWohNQZPTAUR5arMMPQgGNKZiWTsTrh/Vt1Gyqko5eAIFobjJWn2DsM/efwsfDOQb91cXBcggymyfIO6VNSwhjczFwdRKnviBY300UpMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724869019; c=relaxed/simple;
	bh=Y9f7KnAn4zlqxm0Tmrs7pfuu6VVjF1h+nt54v/DvoGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr0WNSBWQHPoEMiz7rpWdOBU7d0xsLh+tSUDfsTAbO1vWiqY45sc73MrFgRrwgjsvuiLB/kTUeRdgr0wk91zoFt8sdcjSvKCFiKk3OwnboLyAeXxV4UOHNM3Zmo0XyapaW7DFco857zxU78lUI4R0eiPvJo6hHDa4wLraYSHkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLS/MNK/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE28C4AF0E;
	Wed, 28 Aug 2024 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724869019;
	bh=Y9f7KnAn4zlqxm0Tmrs7pfuu6VVjF1h+nt54v/DvoGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pLS/MNK/Fh1uJKP5fldMUYF+Gh2Es7mE86GrSNuC0e82aSnEkNGK5x4Wu2MBV+DTY
	 iM6lcBW6KPPBCElS2kutXC9QY+8B9NVSLdSIvzuRRtjRP41L0Ho9VOPGuaCv3E2jsp
	 CuDdGRZM0U81SBMzPsiWVBke9DTzPPND0IMK8J6w4E+wAkyraKXpvlfytbxufothnO
	 jRlEwdmRPJVR8yK/tX8cGBF/xPQh9xXeuprnYf1KCX1+c66X85lWdlpO4fjh6JmehI
	 0UFehunlat20MKZhee/FMvAOJ121WzeJyK/Fu2JqW2Fl001rAqcHuOzz2oIpj/x529
	 prUdVCI/FHbEg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5353d0b7463so532983e87.3;
        Wed, 28 Aug 2024 11:16:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCWyWGFpi/qf+Af4vfvd18DwP6E4CvznRlUoKZ0CsMxQ5H4qPadudTlfV1TeuKG5Xm8rduZZwvFiD3iO4=@vger.kernel.org, AJvYcCVEcGvWUDNXVocH+0FrRdatKr/5dFVwuMMn4cWaEEUJWvtxG9Rh+obUbLIFMeSWxIpsUirX2VpzjHvWKvSZwUg=@vger.kernel.org, AJvYcCWier1LC/CBGV4RGHDusHqZx/tbfF5zk8c5YIi1xJpoDzyi4V6lbHSPt21wSZDmoXeQXKIfPHMfOiMDMAxa@vger.kernel.org, AJvYcCXzGD2iBBnVhCAew2/hmVYfPU+ERh5b7Fre9mygfDYzg/15uKorTcHV7w5pFR3cPs44SRUfuhtfKKY4NjFgqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxortie4dLfqw5INbb0vDNbp2Y8oWF6DCt+uik86uuk/woZ8WOt
	hr4J07o/uCejMHj80qX899HVi2MpcjdCR10bWNYPPG0HLxUIKfKapGgvq6V237jffDCLfKI8CFj
	VEY3EXtC2R/7CHFFXBP+96kgqTFQ=
X-Google-Smtp-Source: AGHT+IG0NU0vhANmGa1Kjz/85c/FgvYoGqONdwHPArHyiTdXZY6lMp91iqqNtCPKcJ6fGYgrihLonoRQpRJ/ip9X8PM=
X-Received: by 2002:a05:6512:3e1b:b0:532:fb9e:a175 with SMTP id
 2adb3069b0e04-5353e54320emr156127e87.6.1724869017917; Wed, 28 Aug 2024
 11:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-23-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-23-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 29 Aug 2024 03:16:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=8uU-FUpVqh-z-=7LOfXxYcDQExKLvB+6qe8Fdq_51Q@mail.gmail.com>
Message-ID: <CAK7LNAS=8uU-FUpVqh-z-=7LOfXxYcDQExKLvB+6qe8Fdq_51Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
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
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makef=
ile
> index c1389c161f9c..623f8fc975ea 100644
> --- a/scripts/gendwarfksyms/Makefile
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -2,6 +2,7 @@ hostprogs-always-y +=3D gendwarfksyms
>
>  gendwarfksyms-objs +=3D gendwarfksyms.o
>  gendwarfksyms-objs +=3D dwarf.o
> +gendwarfksyms-objs +=3D symbols.o
>
>  HOST_EXTRACFLAGS :=3D -I $(srctree)/tools/include
>  HOSTLDLIBS_gendwarfksyms :=3D -ldw -lelf
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.=
c
> index 65a29d0bd8f4..71cfab0553da 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -5,6 +5,48 @@
>
>  #include "gendwarfksyms.h"
>
> +static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die =
*value)
> +{
> +       Dwarf_Attribute da;
> +
> +       /* dwarf_formref_die returns a pointer instead of an error value.=
 */
> +       return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
> +}
> +
> +static const char *get_name(Dwarf_Die *die)
> +{
> +       Dwarf_Attribute attr;
> +
> +       /* rustc uses DW_AT_linkage_name for exported symbols */
> +       if (dwarf_attr(die, DW_AT_linkage_name, &attr) ||
> +           dwarf_attr(die, DW_AT_name, &attr)) {
> +               return dwarf_formstring(&attr);
> +       }
> +
> +       return NULL;
> +}
> +
> +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> +{
> +       Dwarf_Die *source =3D die;
> +       Dwarf_Die origin;
> +
> +       state->sym =3D NULL;
> +
> +       /* If the DIE has an abstract origin, use it for type information=
. */
> +       if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> +               source =3D &origin;
> +
> +       state->sym =3D symbol_get(get_name(die));
> +
> +       /* Look up using the origin name if there are no matches. */
> +       if (!state->sym && source !=3D die)
> +               state->sym =3D symbol_get(get_name(source));
> +
> +       state->die =3D *source;
> +       return !!state->sym;
> +}
> +
>  /*
>   * Type string processing
>   */
> @@ -40,7 +82,7 @@ int process_die_container(struct state *state, Dwarf_Di=
e *die,
>  }
>
>  /*
> - * Symbol processing
> + * Exported symbol processing
>   */
>  static int process_subprogram(struct state *state, Dwarf_Die *die)
>  {
> @@ -67,10 +109,15 @@ static int process_exported_symbols(struct state *st=
ate, Dwarf_Die *die)
>         /* Possible exported symbols */
>         case DW_TAG_subprogram:
>         case DW_TAG_variable:
> +               if (!is_export_symbol(state, die))
> +                       return 0;
> +
> +               debug("%s", state->sym->name);
> +
>                 if (tag =3D=3D DW_TAG_subprogram)
> -                       check(process_subprogram(state, die));
> +                       check(process_subprogram(state, &state->die));
>                 else
> -                       check(process_variable(state, die));
> +                       check(process_variable(state, &state->die));
>
>                 return 0;
>         default:
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksym=
s/gendwarfksyms.c
> index 27f2d6423c45..d209b237766b 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -27,7 +27,7 @@ static const struct {
>
>  static int usage(void)
>  {
> -       error("usage: gendwarfksyms [options] elf-object-file ...");
> +       error("usage: gendwarfksyms [options] elf-object-file ... < symbo=
l-list");
>         return -1;
>  }
>
> @@ -105,6 +105,8 @@ int main(int argc, const char **argv)
>         if (parse_options(argc, argv) < 0)
>                 return usage();
>
> +       check(symbol_read_exports(stdin));



symbol_read_exports() is only called from main().

Do you need to make symbol_read_exports() return
the error code all the way back to the main()
function?

Personally, I'd like to make the program bail out as early as
possible if there is no point in continuing running.

See also this patchset.

https://lore.kernel.org/linux-kbuild/20240812124858.2107328-1-masahiroy@ker=
nel.org/T/#m5c0f795b57588a2c313cd2cc6e24ac95169fd225







> +
>         for (n =3D 0; n < object_count; n++) {
>                 Dwfl *dwfl;
>                 int fd;
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksym=
s/gendwarfksyms.h
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
>  /* Error =3D=3D negative values */
>  #define checkp(expr) __check(expr, __res < 0, __res)
>
> +/*
> + * symbols.c
> + */
> +
> +static inline u32 name_hash(const char *name)
> +{
> +       return jhash(name, strlen(name), 0);
> +}
> +
> +struct symbol {
> +       const char *name;
> +       struct hlist_node name_hash;
> +};
> +
> +extern int symbol_read_exports(FILE *file);
> +extern struct symbol *symbol_get(const char *name);
> +
>  /*
>   * dwarf.c
>   */
> @@ -63,6 +82,8 @@ extern bool debug;
>  struct state {
>         Dwfl_Module *mod;
>         Dwarf *dbg;
> +       struct symbol *sym;
> +       Dwarf_Die die;
>  };
>
>  typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symb=
ols.c
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
> +static int for_each(const char *name, symbol_callback_t func, void *data=
)
> +{
> +       struct hlist_node *tmp;
> +       struct symbol *match;
> +
> +       if (!name || !*name)
> +               return 0;
> +
> +       hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
> +                                   name_hash(name)) {
> +               if (strcmp(match->name, name))
> +                       continue;
> +
> +               if (func)
> +                       check(func(match, data));
> +
> +               return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static bool is_exported(const char *name)
> +{
> +       return checkp(for_each(name, NULL, NULL)) > 0;
> +}
> +
> +int symbol_read_exports(FILE *file)
> +{
> +       struct symbol *sym;
> +       char *line =3D NULL;
> +       char *name =3D NULL;
> +       size_t size =3D 0;
> +       int nsym =3D 0;
> +
> +       while (getline(&line, &size, file) > 0) {
> +               if (sscanf(line, "%ms\n", &name) !=3D 1) {
> +                       error("malformed input line: %s", line);
> +                       return -1;
> +               }
> +
> +               free(line);
> +               line =3D NULL;
> +
> +               if (is_exported(name))
> +                       continue; /* Ignore duplicates */
> +
> +               sym =3D malloc(sizeof(struct symbol));
> +               if (!sym) {
> +                       error("malloc failed");
> +                       return -1;
> +               }
> +
> +               sym->name =3D name;
> +               name =3D NULL;

Is this necessary?




> +
> +               hash_add(symbol_names, &sym->name_hash, name_hash(sym->na=
me));
> +               ++nsym;
> +
> +               debug("%s", sym->name);
> +       }
> +
> +       if (line)
> +               free(line);
> +
> +       debug("%d exported symbols", nsym);
> +       return 0;
> +}
> +
> +static int get_symbol(struct symbol *sym, void *arg)
> +{
> +       struct symbol **res =3D arg;
> +
> +       *res =3D sym;
> +       return 0;
> +}
> +
> +struct symbol *symbol_get(const char *name)
> +{
> +       struct symbol *sym =3D NULL;
> +
> +       for_each(name, get_symbol, &sym);
> +       return sym;
> +}
> --
> 2.46.0.184.g6999bdac58-goog
>


--
Best Regards



Masahiro Yamada

