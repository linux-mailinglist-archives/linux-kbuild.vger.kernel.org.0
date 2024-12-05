Return-Path: <linux-kbuild+bounces-5004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D852D9E4CA4
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 04:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 588151881495
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 03:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F08F18FC72;
	Thu,  5 Dec 2024 03:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgbeonh4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D8383A2;
	Thu,  5 Dec 2024 03:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733369327; cv=none; b=b2NOqazIzGvQoYM7Z8HN6jHv0XclWGBJzwOYJvbPh+J69gxlUZpXRTGnEXXaJ1AaqjHFlQKVb18J3gSXpPWaEVtDd4Xqz4szDdxP0PTRqEZZugO675biH/CG3rQVMcwEp+Jx9/uLLPG/I5C3xVoJfCy+aycxXBHJDURMZwoG1bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733369327; c=relaxed/simple;
	bh=dQfviD8uzcdULhtFY1gIruW001nGEeYJMZLF1POWlOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIlCfvjdKD+FQmd3KW6WntMdLhEdidWsrfChIqs8u6K50CYQJtlatRdEugMOJMxWngFntHb97V/01uMsb+JyT7Vie2Bgss5fDXq82e1+sCxFlPLxD0mAUeI626mXFdHWKqH8qIxLS0jHO1p0w79bZbZqg6dJVR8wuyOFG5yKUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgbeonh4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4395C4CEDD;
	Thu,  5 Dec 2024 03:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733369326;
	bh=dQfviD8uzcdULhtFY1gIruW001nGEeYJMZLF1POWlOI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hgbeonh4cqey7ay/FdbeNk+EJoTPsaCcihegDw2YuafxrCpP14qyvdmoHZJmmVjtU
	 0djWEz+GxrEAYY0dgiK59k7SCBGNEeYM1YZMO92ubAgqrdbB9Nm5ir4wayOO5O+9Ps
	 GYmPshJWFDr+n2FMkwwjLud+jycuOQKLvWmnmX12VIfQ96qh50DzjVcbtkeagMn+Wq
	 oCzNReLsAS6PKLYZFGkAucQgwSkqZdTrmykD+LVOV28NEXQRjFOCd9V9ir97NKRIQK
	 Bfbe3VwKeMfz49AqUo58p0MSSMo+p8Ll1RGIC+ni/nkq9Mf6jT4j4J79QI4J4MRZXS
	 eTuMLzodhpVNw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e1c3e1c50so437511e87.1;
        Wed, 04 Dec 2024 19:28:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3z5iB4yrlctkqKN98vNsmejT+xfhcV6pzvwicPeD4JGDcqlLcK/DTtqPev0X8B48b0bWmQcZl5Te0YPVuaQ==@vger.kernel.org, AJvYcCUyIoL10YTOtrjVAMthRJ/IfTnCeVH+r23qfdB62pSACHy0q1yBBwVZo+08eIc6NJG/GXTScx7c1JY1Q3x/1Gw=@vger.kernel.org, AJvYcCV5ITrijPl7CRmNecD7xAGq0Qh0WUYJmjDg9CcddTvaddyJWIF8ogRLn//xWar9ZWW56It0thUQBA0Fh3Vc@vger.kernel.org, AJvYcCWXeMymzxJhsf0LZDct26bY8n+LSxR6DsqgOCmC4aU6o1I81SPtNmh5opyHc5dvCPJOlM0k/CPdF9IE4Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRJhxbvKSyXfJ5sdOivqRTIoYJpTNTFSxsrHDbUfvlI4qLqpE
	23i0RHyO2Uh7UYte6eG8hE7utHAgOrrKXS2YDXDJOcWs5OrRszj7kl6xOAlVsOj4fZ19cZzYHkz
	uAbR36LJMgmgRo3QEWqg+nw9nzQo=
X-Google-Smtp-Source: AGHT+IHIsP57MVylo5BpUboAyfeP+5j2CJ0YDvV4woFHFdWG6e+Hjw4RZIfwl806kk6sXEwfrrjGh2abXqgjaH6Bz3s=
X-Received: by 2002:a05:6512:3b9e:b0:53e:135a:e1cd with SMTP id
 2adb3069b0e04-53e135ae27amr5309553e87.11.1733369325359; Wed, 04 Dec 2024
 19:28:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CGME20241121204243eucas1p191055690457a8f56962315c32df2558d@eucas1p1.samsung.com>
 <20241121204220.2378181-21-samitolvanen@google.com> <a8f28e4b-5319-4b99-9882-645057f92b95@samsung.com>
In-Reply-To: <a8f28e4b-5319-4b99-9882-645057f92b95@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Dec 2024 12:28:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATax0AjuTRoKmcNrc_c-A5AqfKuHwSDgKZOa-z7kUYuEA@mail.gmail.com>
Message-ID: <CAK7LNATax0AjuTRoKmcNrc_c-A5AqfKuHwSDgKZOa-z7kUYuEA@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 11:14=E2=80=AFPM Daniel Gomez <da.gomez@samsung.com>=
 wrote:
>
> On 11/21/2024 9:42 PM, Sami Tolvanen wrote:
> > Add a basic DWARF parser, which uses libdw to traverse the debugging
> > information in an object file and looks for functions and variables.
> > In follow-up patches, this will be expanded to produce symbol versions
> > for CONFIG_MODVERSIONS from DWARF.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > ---
> >   kernel/module/Kconfig                 |   8 ++
> >   scripts/Makefile                      |   1 +
> >   scripts/gendwarfksyms/.gitignore      |   2 +
> >   scripts/gendwarfksyms/Makefile        |   8 ++
> >   scripts/gendwarfksyms/dwarf.c         | 166 +++++++++++++++++++++++++=
+
> >   scripts/gendwarfksyms/gendwarfksyms.c | 126 +++++++++++++++++++
> >   scripts/gendwarfksyms/gendwarfksyms.h | 100 ++++++++++++++++
> >   scripts/gendwarfksyms/symbols.c       |  96 +++++++++++++++
> >   8 files changed, 507 insertions(+)
> >   create mode 100644 scripts/gendwarfksyms/.gitignore
> >   create mode 100644 scripts/gendwarfksyms/Makefile
> >   create mode 100644 scripts/gendwarfksyms/dwarf.c
> >   create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
> >   create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
> >   create mode 100644 scripts/gendwarfksyms/symbols.c
> >
> > diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> > index 7c6588148d42..f9e5f82fa88b 100644
> > --- a/kernel/module/Kconfig
> > +++ b/kernel/module/Kconfig
> > @@ -169,6 +169,14 @@ config MODVERSIONS
> >         make them incompatible with the kernel you are running.  If
> >         unsure, say N.
> >
> > +config GENDWARFKSYMS
> > +     bool
> > +     depends on DEBUG_INFO
> > +     # Requires full debugging information, split DWARF not supported.
> > +     depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
> > +     # Requires ELF object files.
> > +     depends on !LTO
> > +
> >   config ASM_MODVERSIONS
> >       bool
> >       default HAVE_ASM_MODVERSIONS && MODVERSIONS
> > diff --git a/scripts/Makefile b/scripts/Makefile
> > index 6bcda4b9d054..d7fec46d38c0 100644
> > --- a/scripts/Makefile
> > +++ b/scripts/Makefile
> > @@ -54,6 +54,7 @@ targets +=3D module.lds
> >
> >   subdir-$(CONFIG_GCC_PLUGINS) +=3D gcc-plugins
> >   subdir-$(CONFIG_MODVERSIONS) +=3D genksyms
> > +subdir-$(CONFIG_GENDWARFKSYMS) +=3D gendwarfksyms
> >   subdir-$(CONFIG_SECURITY_SELINUX) +=3D selinux
> >   subdir-$(CONFIG_SECURITY_IPE) +=3D ipe
> >
> > diff --git a/scripts/gendwarfksyms/.gitignore b/scripts/gendwarfksyms/.=
gitignore
> > new file mode 100644
> > index 000000000000..0927f8d3cd96
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/.gitignore
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +/gendwarfksyms
> > diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Mak=
efile
> > new file mode 100644
> > index 000000000000..9f8fec4fd39b
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/Makefile
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +hostprogs-always-y +=3D gendwarfksyms
> > +
> > +gendwarfksyms-objs +=3D gendwarfksyms.o
> > +gendwarfksyms-objs +=3D dwarf.o
> > +gendwarfksyms-objs +=3D symbols.o
> > +
> > +HOSTLDLIBS_gendwarfksyms :=3D -ldw -lelf
> > diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwar=
f.c
> > new file mode 100644
> > index 000000000000..81df3e2ad3ae
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > @@ -0,0 +1,166 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#include "gendwarfksyms.h"
> > +
> > +static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Di=
e *value)
> > +{
> > +     Dwarf_Attribute da;
> > +
> > +     /* dwarf_formref_die returns a pointer instead of an error value.=
 */
> > +     return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
> > +}
> > +
> > +#define DEFINE_GET_STRING_ATTR(attr)                         \
> > +     static const char *get_##attr##_attr(Dwarf_Die *die) \
> > +     {                                                    \
> > +             Dwarf_Attribute da;                          \
> > +             if (dwarf_attr(die, DW_AT_##attr, &da))      \
> > +                     return dwarf_formstring(&da);        \
> > +             return NULL;                                 \
> > +     }
> > +
> > +DEFINE_GET_STRING_ATTR(name)
> > +DEFINE_GET_STRING_ATTR(linkage_name)
> > +
> > +static const char *get_symbol_name(Dwarf_Die *die)
> > +{
> > +     const char *name;
> > +
> > +     /* rustc uses DW_AT_linkage_name for exported symbols */
> > +     name =3D get_linkage_name_attr(die);
> > +     if (!name)
> > +             name =3D get_name_attr(die);
> > +
> > +     return name;
> > +}
> > +
> > +static bool match_export_symbol(struct state *state, Dwarf_Die *die)
> > +{
> > +     Dwarf_Die *source =3D die;
> > +     Dwarf_Die origin;
> > +
> > +     /* If the DIE has an abstract origin, use it for type information=
. */
> > +     if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> > +             source =3D &origin;
> > +
> > +     state->sym =3D symbol_get(get_symbol_name(die));
> > +
> > +     /* Look up using the origin name if there are no matches. */
> > +     if (!state->sym && source !=3D die)
> > +             state->sym =3D symbol_get(get_symbol_name(source));
> > +
> > +     state->die =3D *source;
> > +     return !!state->sym;
> > +}
> > +
> > +/*
> > + * Type string processing
> > + */
> > +static void process(const char *s)
> > +{
> > +     s =3D s ?: "<null>";
> > +
> > +     if (dump_dies)
> > +             fputs(s, stderr);
> > +}
> > +
> > +bool match_all(Dwarf_Die *die)
> > +{
> > +     return true;
> > +}
> > +
> > +int process_die_container(struct state *state, Dwarf_Die *die,
> > +                       die_callback_t func, die_match_callback_t match=
)
> > +{
> > +     Dwarf_Die current;
> > +     int res;
> > +
> > +     res =3D checkp(dwarf_child(die, &current));
> > +     while (!res) {
> > +             if (match(&current)) {
> > +                     /* <0 =3D error, 0 =3D continue, >0 =3D stop */
> > +                     res =3D checkp(func(state, &current));
> > +                     if (res)
> > +                             return res;
> > +             }
> > +
> > +             res =3D checkp(dwarf_siblingof(&current, &current));
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Exported symbol processing
> > + */
> > +static void process_symbol(struct state *state, Dwarf_Die *die,
> > +                        die_callback_t process_func)
> > +{
> > +     debug("%s", state->sym->name);
> > +     check(process_func(state, die));
> > +     if (dump_dies)
> > +             fputs("\n", stderr);
> > +}
> > +
> > +static int __process_subprogram(struct state *state, Dwarf_Die *die)
> > +{
> > +     process("subprogram");
> > +     return 0;
> > +}
> > +
> > +static void process_subprogram(struct state *state, Dwarf_Die *die)
> > +{
> > +     process_symbol(state, die, __process_subprogram);
> > +}
> > +
> > +static int __process_variable(struct state *state, Dwarf_Die *die)
> > +{
> > +     process("variable ");
> > +     return 0;
> > +}
> > +
> > +static void process_variable(struct state *state, Dwarf_Die *die)
> > +{
> > +     process_symbol(state, die, __process_variable);
> > +}
> > +
> > +static int process_exported_symbols(struct state *unused, Dwarf_Die *d=
ie)
> > +{
> > +     int tag =3D dwarf_tag(die);
> > +
> > +     switch (tag) {
> > +     /* Possible containers of exported symbols */
> > +     case DW_TAG_namespace:
> > +     case DW_TAG_class_type:
> > +     case DW_TAG_structure_type:
> > +             return check(process_die_container(
> > +                     NULL, die, process_exported_symbols, match_all));
> > +
> > +     /* Possible exported symbols */
> > +     case DW_TAG_subprogram:
> > +     case DW_TAG_variable: {
> > +             struct state state;
> > +
> > +             if (!match_export_symbol(&state, die))
> > +                     return 0;
> > +
> > +             if (tag =3D=3D DW_TAG_subprogram)
> > +                     process_subprogram(&state, &state.die);
> > +             else
> > +                     process_variable(&state, &state.die);
> > +
> > +             return 0;
> > +     }
> > +     default:
> > +             return 0;
> > +     }
> > +}
> > +
> > +void process_cu(Dwarf_Die *cudie)
> > +{
> > +     check(process_die_container(NULL, cudie, process_exported_symbols=
,
> > +                                 match_all));
> > +}
> > diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfks=
yms/gendwarfksyms.c
> > new file mode 100644
> > index 000000000000..f84fa98fcbdb
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#include <fcntl.h>
> > +#include <getopt.h>
> > +#include <errno.h>
> > +#include <stdarg.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include "gendwarfksyms.h"
> > +
> > +/*
> > + * Options
> > + */
> > +
> > +/* Print debugging information to stderr */
> > +int debug;
> > +/* Dump DIE contents */
> > +int dump_dies;
> > +
> > +static void usage(void)
> > +{
> > +     fputs("Usage: gendwarfksyms [options] elf-object-file ... < symbo=
l-list\n\n"
> > +           "Options:\n"
> > +           "  -d, --debug          Print debugging information\n"
> > +           "      --dump-dies      Dump DWARF DIE contents\n"
> > +           "  -h, --help           Print this message\n"
> > +           "\n",
> > +           stderr);
> > +}
> > +
> > +static int process_module(Dwfl_Module *mod, void **userdata, const cha=
r *name,
> > +                       Dwarf_Addr base, void *arg)
> > +{
> > +     Dwarf_Addr dwbias;
> > +     Dwarf_Die cudie;
> > +     Dwarf_CU *cu =3D NULL;
> > +     Dwarf *dbg;
> > +     int res;
> > +
> > +     debug("%s", name);
> > +     dbg =3D dwfl_module_getdwarf(mod, &dwbias);
> > +
> > +     do {
> > +             res =3D dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie,=
 NULL);
> > +             if (res < 0)
> > +                     error("dwarf_get_units failed: no debugging infor=
mation?");
> > +             if (res =3D=3D 1)
> > +                     break; /* No more units */
> > +
> > +             process_cu(&cudie);
> > +     } while (cu);
> > +
> > +     return DWARF_CB_OK;
> > +}
> > +
> > +static const Dwfl_Callbacks callbacks =3D {
> > +     .section_address =3D dwfl_offline_section_address,
> > +     .find_debuginfo =3D dwfl_standard_find_debuginfo,
> > +};
> > +
> > +int main(int argc, char **argv)
> > +{
> > +     unsigned int n;
> > +     int opt;
> > +
> > +     struct option opts[] =3D { { "debug", 0, NULL, 'd' },
> > +                              { "dump-dies", 0, &dump_dies, 1 },
> > +                              { "help", 0, NULL, 'h' },
> > +                              { 0, 0, NULL, 0 } };
> > +
> > +     while ((opt =3D getopt_long(argc, argv, "dh", opts, NULL)) !=3D E=
OF) {
> > +             switch (opt) {
> > +             case 0:
> > +                     break;
> > +             case 'd':
> > +                     debug =3D 1;
> > +                     break;
> > +             case 'h':
> > +                     usage();
> > +                     return 0;
> > +             default:
> > +                     usage();
> > +                     return 1;
> > +             }
> > +     }
> > +
> > +     if (optind >=3D argc) {
> > +             usage();
> > +             error("no input files?");
> > +     }
> > +
> > +     symbol_read_exports(stdin);
> > +
> > +     for (n =3D optind; n < argc; n++) {
> > +             Dwfl *dwfl;
> > +             int fd;
> > +
> > +             fd =3D open(argv[n], O_RDONLY);
> > +             if (fd =3D=3D -1)
> > +                     error("open failed for '%s': %s", argv[n],
> > +                           strerror(errno));
> > +
> > +             dwfl =3D dwfl_begin(&callbacks);
> > +             if (!dwfl)
> > +                     error("dwfl_begin failed for '%s': %s", argv[n],
> > +                           dwarf_errmsg(-1));
> > +
> > +             if (!dwfl_report_offline(dwfl, argv[n], argv[n], fd))
> > +                     error("dwfl_report_offline failed for '%s': %s",
> > +                           argv[n], dwarf_errmsg(-1));
> > +
> > +             dwfl_report_end(dwfl, NULL, NULL);
> > +
> > +             if (dwfl_getmodules(dwfl, &process_module, NULL, 0))
> > +                     error("dwfl_getmodules failed for '%s'", argv[n])=
;
> > +
> > +             dwfl_end(dwfl);
> > +     }
> > +
> > +     symbol_free();
> > +
> > +     return 0;
> > +}
> > diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfks=
yms/gendwarfksyms.h
> > new file mode 100644
> > index 000000000000..23e484af5d22
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> > @@ -0,0 +1,100 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#define _GNU_SOURCE
>
>
> I'm getting these warnings:
>
> scripts/gendwarfksyms/kabi.c:245:6: warning: implicit declaration of
> function 'asprintf' is invalid in C99 [-Wimplicit-function-declaration]
>          if (asprintf(&target, "%s %s", fqn, field) < 0)
>              ^
> 1 warning generated.
>    HOSTCC  scripts/gendwarfksyms/symbols.o
>    HOSTCC  scripts/gendwarfksyms/types.o
> scripts/gendwarfksyms/types.c:260:6: warning: implicit declaration of
> function 'asprintf' is invalid in C99 [-Wimplicit-function-declaration]
>          if (asprintf(&name, "%c#%s%s%s", prefix, quote, cache->fqn,
> quote) < 0)
>              ^
> 1 warning generated.
>
>
> I think it may be cleaner to define _GNU_SOURCE in the CFLAGS instead.

I do not think so.

I believe the standard approach would be to define the necessary
macros and  include headers where they are used.


diff --git a/scripts/gendwarfksyms/gendwarfksyms.h
b/scripts/gendwarfksyms/gendwarfksyms.h
index 86b3a3f2f558..127dceaf838d 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -3,8 +3,6 @@
  * Copyright (C) 2024 Google LLC
  */

-#define _GNU_SOURCE
-
 #include <dwarf.h>
 #include <elfutils/libdw.h>
 #include <elfutils/libdwfl.h>
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index 2c6670ff1ac9..a3b5bb9e5487 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -3,7 +3,10 @@
  * Copyright (C) 2024 Google LLC
  */

+#define _GNU_SOURCE
 #include <errno.h>
+#include <stdio.h>
+
 #include "gendwarfksyms.h"

 #define KABI_RULE_SECTION ".discard.gendwarfksyms.kabi_rules"
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index f4dbd21b83e6..c37afdb90fe9 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -3,7 +3,10 @@
  * Copyright (C) 2024 Google LLC
  */

+#define _GNU_SOURCE
+#include <stdio.h>
 #include <zlib.h>
+
 #include "gendwarfksyms.h"

 static struct cache expansion_cache;






The current code adopts:
  - Collect all library header includes to gendwarfksyms.h
  - All C files include "gendwarfksyms.h" but nothing else.


This smells like "please include <windows.h> from every file
when you program in Visual C++".


Personally I do not do that, but others may think differently.



--=20
Best Regards
Masahiro Yamada

