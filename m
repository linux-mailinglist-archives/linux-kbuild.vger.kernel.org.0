Return-Path: <linux-kbuild+bounces-3388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F396CCAA
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 04:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD177B240F1
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 02:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEFF26AFA;
	Thu,  5 Sep 2024 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQqCL2Sb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BD1FDA;
	Thu,  5 Sep 2024 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725503438; cv=none; b=rwcNhJSTSwIhxw/ilaDkVT6rlQLqeiqkxCRCrpvSWz0pD7uxwxT1Z9U+d4eeWLmoYLviLcrFGU1yyLkAHAP/5TBCB8/A6cX3a/MM0SshJrhdfC9NSOvBCK5A0o4+hJQjbVZPb7efK4ML74frHnGgLeszVjYdWxNPSsxuwkl2pP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725503438; c=relaxed/simple;
	bh=vu+8gF50aThdnonmfLLwf0kczJi2q256qpphqhqZ5pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtnacAUJjf9heVA6jmk7HxUGFyDksoqfp7JOXE4XyIhm47kPzGrLotdu5Qet+k7q9aUGru/rj1AYqNynDEYVcDviPoGjjrZHQmDc5bXf/T10vO2uwtLbWrJ4zrD7jIHA7swHuFoBlEJihW9DILGeBoFAKSJ9XzhZvAZU4nuw/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQqCL2Sb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC3DC4AF09;
	Thu,  5 Sep 2024 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725503436;
	bh=vu+8gF50aThdnonmfLLwf0kczJi2q256qpphqhqZ5pg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UQqCL2Sb5IVNhMLghhQdYUlk29RF9gDGR1jN28rJG2AMOAP3v0ciTv9ksEvIpGbOI
	 1yj79cltIdJW7BpXzrk0woWOSSLEY7pzcmvRHi8KjV8oWoDD3au01v6LWqNURNu1aZ
	 I3JGGs9k+bvzB0ZMdPW+96PDTCF2WDrrx82iIfTZUViKsPDD0rLG73mztdWhMzYN1n
	 Cd0Wjv9/sTRD5Ve9a87BEjuLxlTpJTMujOMb0sK69IxO+YM8m00fmxD+fpEUU16ezN
	 2ZMSxL6K44u/6BvtDMBea0Z54z+JJ37X5b1S/FX3AQtHsYSudRw+f63iqBYGLwUYtz
	 k0XURQ5/Bc9Hg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343617fdddso353683e87.0;
        Wed, 04 Sep 2024 19:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWX5efW0FjhYufAAuJONVhFxIt1eHgDpfTtVxt/BC6wrPKq3D2jr3ttUkFp0bv+qWgzL7n13lo3XPEJKQA@vger.kernel.org, AJvYcCW+q72L5PxjgqdtjiE0FHtdULkRbWI/wPa3BXqdJFpIU8mhgY1pYG6X4+8q4tY1ywSRTItWm3ppyIGF7nwOckc=@vger.kernel.org, AJvYcCWO/oalPh/fw4qWahu/WAOD8dHh6DmHKmXWKs3VExyO4LmALNGOjym2BB8cyy20m2XPZtIvF81RoxtEfCklcg==@vger.kernel.org, AJvYcCX2mK27YmrueiLjWBh65b43Y/HWOitGBJhfNpRZgyIIq6HLRrTX6BGkHoacl/SsBFIdq9ODKwtliIo21RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcjNKWOMQJ4RISaNktDr21YtFwuSS7q7caWxcyLH7CrPQbuvu
	ZTufm42oe8lzOvrsSLgWETsYro2g0nOKPfkct/OhdXWvOIeZqQ6/dfY7EPgkZr3Zea6Vd805HRR
	LhE/YVuN21dbXl+7+4bmnWEoFgyE=
X-Google-Smtp-Source: AGHT+IH48gq1HYG69IuX0xJHVqkrcQ8u+RTiH+KH3YHrAcGEGaGTq/fJpb1r27eh7rzL9QlEkr+nEaiKs6h+DoPT9hY=
X-Received: by 2002:a05:6512:108f:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-53546b223d3mr15665603e87.1.1725503435348; Wed, 04 Sep 2024
 19:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-22-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-22-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Sep 2024 11:29:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
Message-ID: <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
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
>  scripts/gendwarfksyms/Makefile        |   7 ++
>  scripts/gendwarfksyms/dwarf.c         |  87 +++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.c | 146 ++++++++++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.h |  78 ++++++++++++++
>  7 files changed, 329 insertions(+)
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 4047b6d48255..a506d4ac660f 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -168,6 +168,14 @@ config MODVERSIONS
>           make them incompatible with the kernel you are running.  If
>           unsure, say N.
>
> +config GENDWARFKSYMS
> +       bool
> +       depends on DEBUG_INFO
> +       # Requires full debugging information, split DWARF not supported.
> +       depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
> +       # Requires ELF object files.
> +       depends on !LTO
> +
>  config ASM_MODVERSIONS
>         bool
>         default HAVE_ASM_MODVERSIONS && MODVERSIONS
> diff --git a/scripts/Makefile b/scripts/Makefile
> index dccef663ca82..2fd0199662e9 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -54,6 +54,7 @@ targets +=3D module.lds
>
>  subdir-$(CONFIG_GCC_PLUGINS) +=3D gcc-plugins
>  subdir-$(CONFIG_MODVERSIONS) +=3D genksyms
> +subdir-$(CONFIG_GENDWARFKSYMS) +=3D gendwarfksyms
>  subdir-$(CONFIG_SECURITY_SELINUX) +=3D selinux
>
>  # Let clean descend into subdirs
> diff --git a/scripts/gendwarfksyms/.gitignore b/scripts/gendwarfksyms/.gi=
tignore
> new file mode 100644
> index 000000000000..ab8c763b3afe
> --- /dev/null
> +++ b/scripts/gendwarfksyms/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +/gendwarfksyms
> diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makef=
ile
> new file mode 100644
> index 000000000000..c1389c161f9c
> --- /dev/null
> +++ b/scripts/gendwarfksyms/Makefile
> @@ -0,0 +1,7 @@
> +hostprogs-always-y +=3D gendwarfksyms
> +
> +gendwarfksyms-objs +=3D gendwarfksyms.o
> +gendwarfksyms-objs +=3D dwarf.o
> +
> +HOST_EXTRACFLAGS :=3D -I $(srctree)/tools/include
> +HOSTLDLIBS_gendwarfksyms :=3D -ldw -lelf
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.=
c
> new file mode 100644
> index 000000000000..65a29d0bd8f4
> --- /dev/null
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include "gendwarfksyms.h"
> +
> +/*
> + * Type string processing
> + */
> +static int process(struct state *state, const char *s)
> +{
> +       s =3D s ?: "<null>";
> +
> +       if (debug)
> +               fputs(s, stderr);
> +
> +       return 0;
> +}
> +
> +bool match_all(Dwarf_Die *die)
> +{
> +       return true;
> +}
> +
> +int process_die_container(struct state *state, Dwarf_Die *die,
> +                         die_callback_t func, die_match_callback_t match=
)
> +{
> +       Dwarf_Die current;
> +       int res;
> +
> +       res =3D checkp(dwarf_child(die, &current));
> +       while (!res) {
> +               if (match(&current))
> +                       check(func(state, &current));
> +               res =3D checkp(dwarf_siblingof(&current, &current));
> +       }
> +
> +       return 0;
> +}
> +
> +/*
> + * Symbol processing
> + */
> +static int process_subprogram(struct state *state, Dwarf_Die *die)
> +{
> +       return check(process(state, "subprogram;\n"));
> +}
> +
> +static int process_variable(struct state *state, Dwarf_Die *die)
> +{
> +       return check(process(state, "variable;\n"));
> +}
> +
> +static int process_exported_symbols(struct state *state, Dwarf_Die *die)
> +{
> +       int tag =3D dwarf_tag(die);
> +
> +       switch (tag) {
> +       /* Possible containers of exported symbols */
> +       case DW_TAG_namespace:
> +       case DW_TAG_class_type:
> +       case DW_TAG_structure_type:
> +               return check(process_die_container(
> +                       state, die, process_exported_symbols, match_all))=
;
> +
> +       /* Possible exported symbols */
> +       case DW_TAG_subprogram:
> +       case DW_TAG_variable:
> +               if (tag =3D=3D DW_TAG_subprogram)
> +                       check(process_subprogram(state, die));
> +               else
> +                       check(process_variable(state, die));
> +
> +               return 0;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
> +{
> +       struct state state =3D { .mod =3D mod, .dbg =3D dbg };
> +
> +       return check(process_die_container(
> +               &state, cudie, process_exported_symbols, match_all));
> +}
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksym=
s/gendwarfksyms.c
> new file mode 100644
> index 000000000000..27f2d6423c45
> --- /dev/null
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <fcntl.h>
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
> +/* Print out debugging information to stderr */
> +bool debug;
> +
> +static const struct {
> +       const char *arg;
> +       bool *flag;
> +       const char **param;
> +} options[] =3D {
> +       { "--debug", &debug, NULL },
> +};
> +
> +static int usage(void)
> +{
> +       error("usage: gendwarfksyms [options] elf-object-file ...");
> +       return -1;
> +}
> +
> +static const char *object_files[MAX_INPUT_FILES];
> +static unsigned int object_count;
> +
> +static int parse_options(int argc, const char **argv)
> +{
> +       for (int i =3D 1; i < argc; i++) {
> +               bool flag =3D false;
> +
> +               for (int j =3D 0; j < ARRAY_SIZE(options); j++) {
> +                       if (strcmp(argv[i], options[j].arg))
> +                               continue;
> +
> +                       *options[j].flag =3D true;
> +
> +                       if (options[j].param) {
> +                               if (++i >=3D argc) {
> +                                       error("%s needs an argument",
> +                                             options[j].arg);
> +                                       return -1;
> +                               }
> +
> +                               *options[j].param =3D argv[i];
> +                       }
> +
> +                       flag =3D true;
> +                       break;
> +               }
> +
> +               if (!flag)
> +                       object_files[object_count++] =3D argv[i];
> +       }
> +
> +       return object_count ? 0 : -1;
> +}
> +
> +static int process_modules(Dwfl_Module *mod, void **userdata, const char=
 *name,
> +                          Dwarf_Addr base, void *arg)
> +{
> +       Dwarf_Addr dwbias;
> +       Dwarf_Die cudie;
> +       Dwarf_CU *cu =3D NULL;
> +       Dwarf *dbg;
> +       int res;
> +
> +       debug("%s", name);
> +       dbg =3D dwfl_module_getdwarf(mod, &dwbias);
> +
> +       do {
> +               res =3D dwarf_get_units(dbg, cu, &cu, NULL, NULL, &cudie,=
 NULL);
> +               if (res < 0) {
> +                       error("dwarf_get_units failed: no debugging infor=
mation?");
> +                       return -1;
> +               } else if (res =3D=3D 1) {
> +                       break; /* No more units */
> +               }
> +
> +               check(process_module(mod, dbg, &cudie));
> +       } while (cu);
> +
> +       return DWARF_CB_OK;
> +}
> +
> +static const Dwfl_Callbacks callbacks =3D {
> +       .section_address =3D dwfl_offline_section_address,
> +       .find_debuginfo =3D dwfl_standard_find_debuginfo,
> +};
> +
> +int main(int argc, const char **argv)
> +{
> +       unsigned int n;
> +
> +       if (parse_options(argc, argv) < 0)
> +               return usage();
> +
> +       for (n =3D 0; n < object_count; n++) {
> +               Dwfl *dwfl;
> +               int fd;
> +
> +               fd =3D open(object_files[n], O_RDONLY);
> +               if (fd =3D=3D -1) {
> +                       error("open failed for '%s': %s", object_files[n]=
,
> +                             strerror(errno));
> +                       return -1;
> +               }
> +
> +               dwfl =3D dwfl_begin(&callbacks);
> +               if (!dwfl) {
> +                       error("dwfl_begin failed for '%s': %s", object_fi=
les[n],
> +                             dwarf_errmsg(-1));
> +                       return -1;
> +               }
> +
> +               if (!dwfl_report_offline(dwfl, object_files[n], object_fi=
les[n],
> +                                        fd)) {
> +                       error("dwfl_report_offline failed for '%s': %s",
> +                             object_files[n], dwarf_errmsg(-1));
> +                       return -1;
> +               }
> +
> +               dwfl_report_end(dwfl, NULL, NULL);
> +
> +               if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
> +                       error("dwfl_getmodules failed for '%s'",
> +                             object_files[n]);
> +                       return -1;
> +               }
> +
> +               dwfl_end(dwfl);
> +               close(fd);
> +       }
> +
> +       return 0;
> +}
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksym=
s/gendwarfksyms.h
> new file mode 100644
> index 000000000000..5ab7ce7d4efb
> --- /dev/null
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2024 Google LLC
> + */
> +
> +#include <dwarf.h>
> +#include <elfutils/libdw.h>
> +#include <elfutils/libdwfl.h>
> +#include <linux/hashtable.h>
> +#include <inttypes.h>
> +#include <stdlib.h>
> +#include <stdio.h>


Could you include external headers first,
then in-tree headers?
(and one blank line in-between).



Also, please consider using scripts/include/hashtable.h



How about this?


#include <dwarf.h>
#include <elfutils/libdw.h>
#include <elfutils/libdwfl.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>

#include <hashtable.h>






If necessary, you can use this patch too:
https://lore.kernel.org/linux-kbuild/20240904235500.700432-1-masahiroy@kern=
el.org/T/#u





--=20
Best Regards
Masahiro Yamada

